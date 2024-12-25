import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/protos_weebi.dart';

abstract class _Helpers {
  static SelectorBuilder select(String firmId, CalibreRequest request) => where
      .eq('firmId', firmId)
      .eq('chainId', request.chainId)
      .eq('calibreId', request.calibre.id)
      .eq('creationDate', request.calibre.creationDate);

  static SelectorBuilder selectCategory(
          String firmId, CategoryRequest request) =>
      where
          .eq('firmId', firmId)
          .eq('chainId', request.chainId)
          .eq('creationDate', request.category.creationDate);

  static SelectorBuilder selectPhoto(String firmId, PhotoRequest request) =>
      where
          .eq('firmId', firmId)
          .eq('chainId', request.chainId)
          .eq('calibreId', request.photo.calibreId);
}

class ArticleService extends ArticleServiceBase {
  final Db _db;
  // for unit tests only
  final bool isTest;
  final UserPermissions? userPermissionIfTest;

  final DbCollection collection;
  static const String collectionName = 'article';
  final DbCollection collectionPhoto;
  static const String collectionPhotoName = 'article_photo';
  final DbCollection collectionCategory;
  static const String collectionCategoryName = 'category';

  ArticleService(
    this._db, {
    this.isTest = false,
    this.userPermissionIfTest,
  })  : collection = _db.collection(collectionName),
        collectionCategory = _db.collection(collectionCategoryName),
        collectionPhoto = _db.collection(collectionPhotoName);

  @override
  Future<StatusResponse> createOne(
      ServiceCall? call, CalibreRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    if (userPermission.articleRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create article');
    }
    try {
      final calibreMongo = CalibreMongo.create()
        ..calibre = request.calibre
        ..creationDate = request.calibre.creationDate
        ..calibreId = request.calibre.id
        ..chainId = request.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId
        ..lastTouchTimestampUTC = DateTime.now().toUtc().timestampProto;

      final result = await collection
          .insertOne(calibreMongo.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.success && result.document != null) {
        final calibreId = result.document!['calibreId'] as int;
        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..id = calibreId.toString()
          ..timestamp = DateTime.now().timestampProto;
      } else {
        return StatusResponse.create()
          ..type = StatusResponse_Type.ERROR
          ..message = 'result.failure || result.document == null'
          ..timestamp = DateTime.now().timestampProto;
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }

  @override
  Future<StatusResponse> updateOne(
      ServiceCall? call, CalibreRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.articleRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update articles');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      final calibreMongo = CalibreMongo.create()
        ..calibre = request.calibre
        ..creationDate = request.calibre.creationDate
        ..calibreId = request.calibre.id
        ..chainId = request.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId
        ..lastTouchTimestampUTC = DateTime.now().toUtc().timestampProto;

      final result = await collection.replaceOne(
          _Helpers.select(userPermission.firmId, request),
          calibreMongo.toProto3Json() as Map<String, dynamic>,
          upsert: true);
      if (result.hasWriteErrors) {
        throw GrpcError.internal('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.failure) {
        throw GrpcError.unknown(
            'update != 1 ${result.document} ${result.serverResponses}');
      }
      return StatusResponse()
        ..type = StatusResponse_Type.UPDATED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    } catch (e, stacktrace) {
      // the whole stacktrace is heavy
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }

  @override
  Future<StatusResponse> deleteOne(
      ServiceCall? call, CalibreRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.articleRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete article');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      await collection
          .deleteOne(_Helpers.select(userPermission.firmId, request));
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<CalibresResponse> readAll(
      ServiceCall? call, ReadAllRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.articleRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read articles');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    //

    try {
      var selector = SelectorBuilder();
      if (request.lastFetchTimestampUTC.hasSeconds()) {
        selector = where.gte('lastTouchTimestampUTC.seconds',
            request.lastFetchTimestampUTC.seconds);
      }
      final list = await collection.find(selector).toList();
      if (list.isEmpty) {
        return CalibresResponse.create();
      }
      final calibres = <CalibrePb>[];
      for (final e in list) {
        final calibreMongo = CalibreMongo.create()
          ..mergeFromProto3Json(e, ignoreUnknownFields: true);
        calibres.add(calibreMongo.calibre);
      }
      final calibresBis = CalibresResponse();
      calibresBis.calibres
        ..clear()
        ..addAll(calibres);
      return calibresBis;
    } on GrpcError catch (e) {
      print('readAll articles error $e');
      rethrow;
    }
  }

  @override
  Future<CalibrePb> readOne(
      ServiceCall call, FindCalibreRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.articleRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read article');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      final selector =
          where.eq('chainId', request.chainId).eq('title', request.title);
      final calibre = await collection.findOne(selector);
      if (calibre != null) {
        final calibreMongo = CalibreMongo.create()
          ..mergeFromProto3Json(calibre, ignoreUnknownFields: true);
        return calibreMongo.calibre;
      } else {
        return CalibrePb.getDefault();
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  /// CATEGORY
  ///

  @override
  Future<StatusResponse> createOneCategory(
      ServiceCall? call, CategoryRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    if (userPermission.articleRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create category');
    }
    try {
      final calibreMongo = CategoryMongo.create()
        ..title = request.category.title
        ..category = request.category
        ..userId = userPermission.userId
        ..chainId = request.chainId
        ..firmId = userPermission.firmId
        ..lastTouchTimestampUTC = DateTime.now().toUtc().timestampProto;

      final result = await collectionCategory
          .insertOne(calibreMongo.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.success && result.document != null) {
        final title = result.document!['title'] as String;
        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..id = title
          ..timestamp = DateTime.now().timestampProto;
      } else {
        return StatusResponse.create()
          ..type = StatusResponse_Type.ERROR
          ..message = 'result.failure || result.document == null'
          ..timestamp = DateTime.now().timestampProto;
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }

  @override
  Future<StatusResponse> updateOneCategory(
      ServiceCall? call, CategoryRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.articleRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update categories');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      final categoryMongo = CategoryMongo.create()
        ..category = request.category
        ..title = request.category.title
        ..chainId = request.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId
        ..lastTouchTimestampUTC = DateTime.now().toUtc().timestampProto;

      final result = await collectionCategory.replaceOne(
          _Helpers.selectCategory(userPermission.firmId, request),
          categoryMongo.toProto3Json() as Map<String, dynamic>,
          upsert: true);
      if (result.hasWriteErrors) {
        throw GrpcError.internal('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.failure) {
        throw GrpcError.unknown(
            'update != 1 ${result.document} ${result.serverResponses}');
      }
      return StatusResponse()
        ..type = StatusResponse_Type.UPDATED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    } catch (e, stacktrace) {
      // the whole stacktrace is heavy
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }

  @override
  Future<StatusResponse> deleteOneCategory(
      ServiceCall? call, CategoryRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.articleRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete categories');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      await collectionCategory
          .deleteOne(_Helpers.selectCategory(userPermission.firmId, request));
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<CategoriesResponse> readAllCategories(
      ServiceCall? call, ReadCategoriesRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.articleRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read categories');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    //
    try {
      final list = await collectionCategory.find().toList();
      final categories = <CategoryPb>[];
      for (final e in list) {
        final categoryMongo = CategoryMongo.create()
          ..mergeFromProto3Json(e, ignoreUnknownFields: true);
        categories.add(categoryMongo.category);
      }

      final categoriesBis = CategoriesResponse();
      categoriesBis.categories
        ..clear()
        ..addAll(categories);
      return categoriesBis;
    } on GrpcError catch (e) {
      print('readAll article error $e');
      rethrow;
    }
  }

  @override
  Future<CategoryPb> readOneCategory(
      ServiceCall call, FindCategoryRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.articleRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read category');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      final selector =
          where.eq('chainId', request.chainId).eq('title', request.title);
      final category = await collectionCategory.findOne(selector);
      if (category != null) {
        final categoryMongo = CategoryMongo.create()
          ..mergeFromProto3Json(category, ignoreUnknownFields: true);
        return categoryMongo.category;
      } else {
        return CategoryPb.getDefault();
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<StatusResponse> createMany(
      ServiceCall? call, CalibresRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    if (userPermission.articleRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create articles');
    }

    final calibresMap = <Map<String, dynamic>>[];
    final now = DateTime.now().toUtc().timestampProto;
    for (final calibre in request.calibres) {
      final calibreMongo = CalibreMongo.create()
        ..calibre = calibre
        ..creationDate = calibre.creationDate
        ..calibreId = calibre.id
        ..chainId = request.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId
        ..lastTouchTimestampUTC = now;
      calibresMap.add(calibreMongo.toProto3Json() as Map<String, dynamic>);
    }

    try {
      final result = await collection.insertMany(calibresMap);
      if (result.hasWriteErrors) {
        final writeErrorsMessages = <String>[];
        for (final error in result.writeErrors) {
          writeErrorsMessages.add(error.toString());
        }
        throw GrpcError.unknown(
            'hasWriteErrors ${writeErrorsMessages.join("\n")}');
      }
      if (result.success) {
        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..timestamp = DateTime.now().timestampProto;
      } else {
        return StatusResponse.create()
          ..type = StatusResponse_Type.ERROR
          ..message = 'result.failure but no writeErrorsMessages'
          ..timestamp = DateTime.now().timestampProto;
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }

  ///
  /// PHOTOS
  ///
  @override
  Future<StatusResponse> createManyPhotos(
      ServiceCall call, PhotosRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    if (userPermission.articleRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create articles photos');
    }

    final map = <Map<String, dynamic>>[];
    final now = DateTime.now().toUtc().timestampProto;
    for (final photo in request.photos) {
      final photoMongo = ArticlePhotoMongo.create()
        ..photo = photo
        ..calibreId = photo.calibreId
        ..chainId = request.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId
        ..lastTouchTimestampUTC = now;
      map.add(photoMongo.toProto3Json() as Map<String, dynamic>);
    }

    try {
      final result = await collectionPhoto.insertMany(map);
      if (result.hasWriteErrors) {
        final writeErrorsMessages = <String>[];
        for (final error in result.writeErrors) {
          writeErrorsMessages.add(error.toString());
        }
        throw GrpcError.unknown(
            'hasWriteErrors ${writeErrorsMessages.join("\n")}');
      }
      if (result.success) {
        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..timestamp = DateTime.now().timestampProto;
      } else {
        return StatusResponse.create()
          ..type = StatusResponse_Type.ERROR
          ..message = 'result.failure but no writeErrorsMessages'
          ..timestamp = DateTime.now().timestampProto;
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }

  @override
  Future<StatusResponse> createOnePhoto(
      ServiceCall call, PhotoRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    if (userPermission.articleRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create article photo');
    }
    try {
      final photoMongo = ArticlePhotoMongo.create()
        ..photo = request.photo
        ..calibreId = request.photo.calibreId
        ..chainId = request.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId
        ..lastTouchTimestampUTC = DateTime.now().toUtc().timestampProto;

      final result = await collectionPhoto
          .insertOne(photoMongo.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.success && result.document != null) {
        final calibreId = result.document!['calibreId'] as int;
        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..id = calibreId.toString()
          ..timestamp = DateTime.now().timestampProto;
      } else {
        return StatusResponse.create()
          ..type = StatusResponse_Type.ERROR
          ..message = 'result.failure || result.document == null'
          ..timestamp = DateTime.now().timestampProto;
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }

  @override
  Future<StatusResponse> deleteOnePhoto(
      ServiceCall call, PhotoRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.articleRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete article photo');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      await collectionPhoto
          .deleteOne(_Helpers.selectPhoto(userPermission.firmId, request));
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<PhotosResponse> readAllPhotos(
      ServiceCall call, ReadPhotosRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.articleRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read articles photos');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    //

    try {
      var selector = SelectorBuilder();
      if (request.lastFetchTimestampUTC.hasSeconds()) {
        selector = where.gte('lastTouchTimestampUTC.seconds',
            request.lastFetchTimestampUTC.seconds);
      }
      final list = await collectionPhoto.find(selector).toList();
      if (list.isEmpty) {
        return PhotosResponse.create();
      }
      final photos = <ArticlePhotoPb>[];
      for (final e in list) {
        final articlePhotoMongo = ArticlePhotoMongo.create()
          ..mergeFromProto3Json(e, ignoreUnknownFields: true);
        photos.add(articlePhotoMongo.photo);
      }
      final bis = PhotosResponse();
      bis.photos
        ..clear()
        ..addAll(photos);
      return bis;
    } on GrpcError catch (e) {
      print('readAll articles error $e');
      rethrow;
    }
  }

  @override
  Future<ArticlePhotoPb> readOnePhoto(
      ServiceCall call, FindPhotoRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.articleRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read article photo');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      final selector = where
          .eq('chainId', request.chainId)
          .eq('calibreId', request.calibreId);
      final photoMap = await collectionPhoto.findOne(selector);
      if (photoMap != null) {
        final photoMongo = ArticlePhotoMongo.create()
          ..mergeFromProto3Json(photoMap, ignoreUnknownFields: true);
        return photoMongo.photo;
      } else {
        return ArticlePhotoPb.getDefault();
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<StatusResponse> updateOnePhoto(
      ServiceCall call, PhotoRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.articleRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update article photo');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      final photoMongo = ArticlePhotoMongo.create()
        ..photo = request.photo
        ..calibreId = request.photo.calibreId
        ..chainId = request.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId
        ..lastTouchTimestampUTC = DateTime.now().toUtc().timestampProto;

      final result = await collectionPhoto.replaceOne(
          _Helpers.selectPhoto(userPermission.firmId, request),
          photoMongo.toProto3Json() as Map<String, dynamic>,
          upsert: true);
      if (result.hasWriteErrors) {
        throw GrpcError.internal('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.failure) {
        throw GrpcError.unknown(
            'update != 1 ${result.document} ${result.serverResponses}');
      }
      return StatusResponse()
        ..type = StatusResponse_Type.UPDATED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    } catch (e, stacktrace) {
      // the whole stacktrace is heavy
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }
}
