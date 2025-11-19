import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/logging.dart';

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
          .eq('category.creationDate', request.category.creationDate);

  static SelectorBuilder selectPhoto(String firmId, PhotoRequest request) =>
      where
          .eq('firmId', firmId)
          .eq('chainId', request.chainId)
          .eq('calibreId', request.photo.calibreId);
}

class ArticleService extends ArticleServiceBase {
  final MongoDbPoolService _poolService;
  final WeebiLogger _logger = WeebiLogger.forService('article_service');
  // for unit tests only
  final bool isTest;
  final UserPermissions? userPermissionIfTest;

  static const String collectionArticleName = 'article';
  static const String collectionPhotoName = 'article_photo';
  static const String collectionCategoryName = 'category';

  ArticleService(
    this._poolService, {
    this.isTest = false,
    this.userPermissionIfTest,
  });

  @override
  Future<StatusResponse> createOne(
      ServiceCall? call, CalibreRequest request) async {
    _logger.logRpcEntry('createOne', call, requestData: {
      'chainId': request.chainId,
      'calibreId': request.calibre.id,
    });
    
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

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final collectionArticle = db.collection(collectionArticleName);

      try {
        final snapshot = await collectionArticle
            .findOne(_Helpers.select(userPermission.firmId, request));
        if (snapshot != null) {
          throw GrpcError.alreadyExists();
        }

        final calibreMongo = CalibreMongo.create()
          ..calibre = request.calibre
          ..creationDate = request.calibre.creationDate
          ..calibreId = request.calibre.id
          ..chainId = request.chainId
          ..firmId = userPermission.firmId
          ..userId = userPermission.userId
          ..lastTouchTimestampUTC = DateTime.now().toUtc().timestampProto;

        final result = await collectionArticle
            .insertOne(calibreMongo.toProto3Json() as Map<String, dynamic>);
        if (result.hasWriteErrors) {
          throw GrpcError.unknown(
              'hasWriteErrors ${result.writeError!.errmsg}');
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
        _logger.logRpcError('createOne', call, e);
        rethrow;
      } catch (e, stacktrace) {
        _logger.logRpcError('createOne', call, e, stackTrace: stacktrace);
        throw GrpcError.unknown('$e');
      }
    });
  }

  @override
  Future<StatusResponse> updateOne(
      ServiceCall? call, CalibreRequest request) async {
    _logger.logRpcEntry('updateOne', call, requestData: {
      'chainId': request.chainId,
      'calibreId': request.calibre.id,
    });
    
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    if (userPermission.articleRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update articles');
    }

    return databaseMiddleware<StatusResponse>(
      _poolService,
      (db) async {
        final collectionArticle = db.collection(collectionArticleName);
        try {
          final calibreMongo = CalibreMongo.create()
            ..calibre = request.calibre
            ..creationDate = request.calibre.creationDate
            ..calibreId = request.calibre.id
            ..chainId = request.chainId
            ..firmId = userPermission.firmId
            ..userId = userPermission.userId
            ..lastTouchTimestampUTC = DateTime.now().toUtc().timestampProto;

          final result = await collectionArticle.replaceOne(
              _Helpers.select(userPermission.firmId, request),
              calibreMongo.toProto3Json() as Map<String, dynamic>,
              upsert: true);
          if (result.hasWriteErrors) {
            throw GrpcError.internal(
                'hasWriteErrors ${result.writeError!.errmsg}');
          }
          if (result.failure) {
            throw GrpcError.unknown(
                'update != 1 ${result.document} ${result.serverResponses}');
          }
          return StatusResponse()
            ..type = StatusResponse_Type.UPDATED
            ..timestamp = DateTime.now().timestampProto;
        } on GrpcError catch (e) {
          _logger.logRpcError('updateOneCategory', call, e);
          rethrow;
        } catch (e, stacktrace) {
          _logger.logRpcError('updateOneCategory', call, e, stackTrace: stacktrace);
          throw GrpcError.unknown('$e');
        }
      },
    );
  }

  @override
  Future<StatusResponse> deleteOne(
      ServiceCall? call, CalibreRequest request) async {
    _logger.logRpcEntry('deleteOne', call, requestData: {
      'chainId': request.chainId,
      'calibreId': request.calibre.id,
    });
    
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
    return databaseMiddleware<StatusResponse>(
      _poolService,
      (db) async {
        try {
          final collectionArticle = db.collection(collectionArticleName);

          await collectionArticle
              .deleteOne(_Helpers.select(userPermission.firmId, request));
          return StatusResponse()
            ..type = StatusResponse_Type.DELETED
            ..timestamp = DateTime.now().timestampProto;
        } on GrpcError catch (e) {
          _logger.logRpcError('deleteOne', call, e);
          rethrow;
        }
      },
    );
  }

  @override
  Future<CalibresResponse> readAll(
      ServiceCall? call, ReadAllRequest request) async {
    _logger.logRpcEntry('readAll', call, requestData: {
      'chainId': request.chainId,
    });
    
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

    return databaseMiddleware<CalibresResponse>(
      _poolService,
      (db) async {
        try {
          final selector = SelectorBuilder()
              .eq('firmId', userPermission.firmId)
              .eq('chainId', request.chainId);

          final bool isDeviceResync = request.lastFetchTimestampUTC.isNotEmpty;
          final idsSet = <int>{};
          final collectionArticle = db.collection(collectionArticleName);

          if (isDeviceResync) {
            final documents = await collectionArticle.find(selector).toList();
            for (final doc in documents) {
              idsSet.add(doc['calibreId']);
            }

            selector.and(where.gte('lastTouchTimestampUTC',
                request.lastFetchTimestampUTC.toDateTime().toIso8601String()));
          }
          final list = await collectionArticle.find(selector).toList();
          if (list.isEmpty) {
            return CalibresResponse();
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
          _logger.logRpcError('readAll', call, e);
          rethrow;
        }
      },
    );
  }

  @override
  Future<CalibresIdsResponse> readAllIds(
      ServiceCall? call, ReadIdsRequest request) async {
    _logger.logRpcEntry('readAllIds', call, requestData: {
      'chainId': request.chainId,
    });
    
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

    return databaseMiddleware<CalibresIdsResponse>(
      _poolService,
      (db) async {
        try {
          final collectionArticle = db.collection(collectionArticleName);

          final selector = SelectorBuilder()
              .eq('firmId', userPermission.firmId)
              .eq('chainId', request.chainId);

          final idsSet = <int>{};
          final documents = await collectionArticle.find(selector).toList();
          for (final doc in documents) {
            idsSet.add(doc['calibreId']);
          }
          return CalibresIdsResponse.create()..ids.addAll(idsSet);
        } on GrpcError catch (e) {
          _logger.logRpcError('readAll', call, e);
          rethrow;
        }
      },
    );
  }

  @override
  Future<CalibrePb> readOne(
      ServiceCall? call, ReadCalibreRequest request) async {
    _logger.logRpcEntry('readOne', call, requestData: {
      'chainId': request.chainId,
      'calibreId': request.calibreId,
    });
    
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

    return databaseMiddleware<CalibrePb>(
      _poolService,
      (db) async {
        final collectionArticle = db.collection(collectionArticleName);
        try {
          final selector = where
              .eq('firmId', userPermission.firmId)
              .eq('chainId', request.chainId);
          if (request.calibreId != 0) {
            selector.eq('calibreId', request.calibreId);
          }
          if (request.title.isNotEmpty) {
            selector.eq('calibre.title', request.title);
          }
          final calibre = await collectionArticle.findOne(selector);
          if (calibre != null) {
            final calibreMongo = CalibreMongo.create()
              ..mergeFromProto3Json(calibre, ignoreUnknownFields: true);
            return calibreMongo.calibre;
          } else {
            return CalibrePb.getDefault();
          }
        } on GrpcError catch (e) {
          _logger.logRpcError('readOne', call, e);
          rethrow;
        }
      },
    );
  }

  /// CATEGORY
  ///

  @override
  Future<StatusResponse> createOneCategory(
      ServiceCall? call, CategoryRequest request) async {
    _logger.logRpcEntry('createOneCategory', call, requestData: {
      'chainId': request.chainId,
    });
    
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

    return databaseMiddleware<StatusResponse>(
      _poolService,
      (db) async {
        final collectionCategory = db.collection(collectionCategoryName);
        try {
          final snapshot = await collectionCategory
              .findOne(_Helpers.selectCategory(userPermission.firmId, request));
          if (snapshot != null) {
            throw GrpcError.alreadyExists();
          }
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
            throw GrpcError.unknown(
                'hasWriteErrors ${result.writeError!.errmsg}');
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
          _logger.logRpcError('createOneCategory', call, e);
          rethrow;
        } catch (e, stacktrace) {
          _logger.logRpcError('createOneCategory', call, e, stackTrace: stacktrace);
          throw GrpcError.unknown('$e');
        }
      },
    );
  }

  @override
  Future<StatusResponse> updateOneCategory(
      ServiceCall? call, CategoryRequest request) async {
    _logger.logRpcEntry('updateOneCategory', call, requestData: {
      'chainId': request.chainId,
    });
    
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

    return databaseMiddleware<StatusResponse>(
      _poolService,
      (db) async {
        final collectionCategory = db.collection(collectionCategoryName);

        try {
          final categoryMongo = CategoryMongo.create()
            ..category = request.category
            ..title = request.category.title
            ..chainId = request.chainId
            ..firmId = userPermission.firmId
            ..userId = userPermission.userId
            ..lastTouchTimestampUTC = DateTime.now().toUtc().timestampProto;

//      final resultFindOne = await collectionCategory.findOne(_Helpers.selectCategory(userPermission.firmId, request));

          final result = await collectionCategory.replaceOne(
              _Helpers.selectCategory(userPermission.firmId, request),
              categoryMongo.toProto3Json() as Map<String, dynamic>,
              upsert: true);
          if (result.hasWriteErrors) {
            throw GrpcError.internal(
                'hasWriteErrors ${result.writeError!.errmsg}');
          }
          if (result.failure) {
            throw GrpcError.unknown(
                'update != 1 ${result.document} ${result.serverResponses}');
          }
          return StatusResponse()
            ..type = StatusResponse_Type.UPDATED
            ..timestamp = DateTime.now().timestampProto;
        } on GrpcError catch (e) {
          _logger.logRpcError('updateOneCategory', call, e);
          rethrow;
        } catch (e, stacktrace) {
          _logger.logRpcError('updateOneCategory', call, e, stackTrace: stacktrace);
          throw GrpcError.unknown('$e');
        }
      },
    );
  }

  @override
  Future<StatusResponse> deleteOneCategory(
      ServiceCall? call, CategoryRequest request) async {
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

    return databaseMiddleware<StatusResponse>(
      _poolService,
      (db) async {
        final collectionCategory = db.collection(collectionCategoryName);

        try {
          await collectionCategory.deleteOne(
              _Helpers.selectCategory(userPermission.firmId, request));
          return StatusResponse()
            ..type = StatusResponse_Type.DELETED
            ..timestamp = DateTime.now().timestampProto;
        } on GrpcError catch (e) {
          _logger.logRpcError('deleteOne', call, e);
          rethrow;
        }
      },
    );
  }

  @override
  Future<CategoriesResponse> readAllCategories(
      ServiceCall? call, ReadCategoriesRequest request) async {
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

    return databaseMiddleware<CategoriesResponse>(
      _poolService,
      (db) async {
        final collectionCategory = db.collection(collectionCategoryName);

        try {
          final selector = SelectorBuilder()
              .eq('firmId', userPermission.firmId)
              .eq('chainId', request.chainId);

          final list = await collectionCategory.find(selector).toList();
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
          _logger.logRpcError('readAllCategories', call, e);
          rethrow;
        }
      },
    );
  }

  @override
  Future<CategoryPb> readOneCategory(
      ServiceCall? call, FindCategoryRequest request) async {
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

    return databaseMiddleware<CategoryPb>(
      _poolService,
      (db) async {
        final collectionCategory = db.collection(collectionCategoryName);

        try {
          final selector = SelectorBuilder()
              .eq('firmId', userPermission.firmId)
              .eq('chainId', request.chainId);

          if (request.title.isNotEmpty) {
            selector.match('title', '^${RegExp.escape(request.title)}*');
          }

          // pipeline is a work in progress

          final category = await collectionCategory.findOne(selector);
          if (category != null) {
            final categoryMongo = CategoryMongo.create()
              ..mergeFromProto3Json(category, ignoreUnknownFields: true);
            return categoryMongo.category;
          } else {
            return CategoryPb.getDefault();
          }
        } on GrpcError catch (e) {
          _logger.logRpcError('deleteOne', call, e);
          rethrow;
        }
      },
    );
  }

  @override
  Future<StatusResponse> createMany(
      ServiceCall? call, CalibresRequest request) async {
    _logger.logRpcEntry('createMany', call, requestData: {
      'chainId': request.chainId,
      'count': request.calibres.length,
    });
    
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

    return databaseMiddleware<StatusResponse>(
      _poolService,
      (db) async {
        final collectionArticle = db.collection(collectionArticleName);

        final calibresMap = <Map<String, dynamic>>[];
        final now = DateTime.now().toUtc().timestampProto;
        int dups = 0;
        for (final calibre in request.calibres) {
          final select = _Helpers.select(
            userPermission.firmId,
            CalibreRequest(chainId: request.chainId, calibre: calibre),
          );
          final snapshot = await collectionArticle.findOne(select);
          if (snapshot != null) {
            dups += 1;
            continue;
          }
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
        if (request.calibres.length == dups) {
          throw GrpcError.alreadyExists();
        }

        try {
          final result = await collectionArticle.insertMany(calibresMap);
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
              ..timestamp = DateTime.now().timestampProto
              ..message = dups > 0
                  ? 'dups ignored: $dups/${request.calibres.length}'
                  : '';
          } else {
            return StatusResponse.create()
              ..type = StatusResponse_Type.ERROR
              ..message = 'result.failure but no writeErrorsMessages'
              ..timestamp = DateTime.now().timestampProto;
          }
        } on GrpcError catch (e) {
          _logger.logRpcError('createOneCategory', call, e);
          rethrow;
        } catch (e, stacktrace) {
          _logger.logRpcError('createOneCategory', call, e, stackTrace: stacktrace);
          throw GrpcError.unknown('$e');
        }
      },
    );
  }

  ///
  /// PHOTOS
  ///
  @override
  Future<StatusResponse> createManyPhotos(
      ServiceCall call, PhotosRequest request) async {
    _logger.logRpcEntry('createManyPhotos', call, requestData: {
      'chainId': request.chainId,
      'count': request.photos.length,
    });
    
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

    return databaseMiddleware<StatusResponse>(
      _poolService,
      (db) async {
        final collectionPhoto = db.collection(collectionPhotoName);
        final map = <Map<String, dynamic>>[];
        final now = DateTime.now().toUtc().timestampProto;
        int dups = 0;
        for (final photo in request.photos) {
          final select = _Helpers.selectPhoto(
            userPermission.firmId,
            PhotoRequest(chainId: request.chainId, photo: photo),
          );
          final snapshot = await collectionPhoto.findOne(select);
          if (snapshot != null) {
            dups += 1;
            continue;
          }
          final photoMongo = ArticlePhotoMongo.create()
            ..photo = photo
            ..calibreId = photo.calibreId
            ..chainId = request.chainId
            ..firmId = userPermission.firmId
            ..userId = userPermission.userId
            ..lastTouchTimestampUTC = now;
          map.add(photoMongo.toProto3Json() as Map<String, dynamic>);
        }
        if (request.photos.length == dups) {
          throw GrpcError.alreadyExists();
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
              ..timestamp = DateTime.now().timestampProto
              ..message = dups > 0
                  ? 'dups ignored: $dups/${request.photos.length}'
                  : '';
          } else {
            return StatusResponse.create()
              ..type = StatusResponse_Type.ERROR
              ..message = 'result.failure but no writeErrorsMessages'
              ..timestamp = DateTime.now().timestampProto;
          }
        } on GrpcError catch (e) {
          _logger.logRpcError('createOneCategory', call, e);
          rethrow;
        } catch (e, stacktrace) {
          _logger.logRpcError('createOneCategory', call, e, stackTrace: stacktrace);
          throw GrpcError.unknown('$e');
        }
      },
    );
  }

  @override
  Future<StatusResponse> createOnePhoto(
      ServiceCall call, PhotoRequest request) async {
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
    return databaseMiddleware<StatusResponse>(
      _poolService,
      (db) async {
        final collectionPhoto = db.collection(collectionPhotoName);
        try {
          final snapshot = await collectionPhoto
              .findOne(_Helpers.selectPhoto(userPermission.firmId, request));
          if (snapshot != null) {
            throw GrpcError.alreadyExists();
          }
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
            throw GrpcError.unknown(
                'hasWriteErrors ${result.writeError!.errmsg}');
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
          _logger.logRpcError('createOneCategory', call, e);
          rethrow;
        } catch (e, stacktrace) {
          _logger.logRpcError('createOneCategory', call, e, stackTrace: stacktrace);
          throw GrpcError.unknown('$e');
        }
      },
    );
  }

  @override
  Future<StatusResponse> deleteOnePhoto(
      ServiceCall call, PhotoRequest request) async {
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

    return databaseMiddleware<StatusResponse>(
      _poolService,
      (db) async {
        final collectionPhoto = db.collection(collectionPhotoName);
        try {
          await collectionPhoto
              .deleteOne(_Helpers.selectPhoto(userPermission.firmId, request));
          return StatusResponse()
            ..type = StatusResponse_Type.DELETED
            ..timestamp = DateTime.now().timestampProto;
        } on GrpcError catch (e) {
          _logger.logRpcError('deleteOne', call, e);
          rethrow;
        }
      },
    );
  }

  @override
  Future<PhotosResponse> readAllPhotos(
      ServiceCall call, ReadPhotosRequest request) async {
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
    return databaseMiddleware<PhotosResponse>(
      _poolService,
      (db) async {
        final collectionPhoto = db.collection(collectionPhotoName);
        try {
          final selector = SelectorBuilder()
              .eq('firmId', userPermission.firmId)
              .eq('chainId', request.chainId);
          if (request.lastFetchTimestampUTC.isNotEmpty) {
            selector.and(where.gte('lastTouchTimestampUTC',
                request.lastFetchTimestampUTC.toDateTime().toIso8601String()));
          }

          // 1. GET TOTAL COUNT FIRST (fast operation)
          final totalCount = await collectionPhoto.count(selector);

          // 2. DETERMINE OFFSET AND LIMIT
          final maxAllowedLimit = 100;
          final limit = request.limit > maxAllowedLimit ? maxAllowedLimit : request.limit;

          // 3. FETCH BATCH WITH LIMIT
          final list = await collectionPhoto
              .find(selector)
              .skip(request.offset)
              .take(limit)
              .toList();

          if (list.isEmpty) {
            return PhotosResponse.create()
              ..total = totalCount
              ..offset = request.offset
              ..hasMore = false;
          }

          final photos = <ArticlePhotoPb>[];
          for (final e in list) {
            final articlePhotoMongo = ArticlePhotoMongo.create()
              ..mergeFromProto3Json(e, ignoreUnknownFields: true);
            photos.add(articlePhotoMongo.photo);
          }
          final response = PhotosResponse();
          response.photos
            ..clear()
            ..addAll(photos);

          // 4. ADD PAGINATION METADATA
          response.total = totalCount;
          response.offset = request.offset;
          response.hasMore = (request.offset + photos.length) < totalCount;
          response.batchSize = photos.length;

          return response;
        } on GrpcError catch (e) {
          _logger.logRpcError('readAll', call, e);
          rethrow;
        }
      },
    );
  }

  @override
  Future<ArticlePhotoPb> readOnePhoto(
      ServiceCall call, FindPhotoRequest request) async {
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
    return databaseMiddleware<ArticlePhotoPb>(
      _poolService,
      (db) async {
        final collectionPhoto = db.collection(collectionPhotoName);
        try {
          final selector = where
              .eq('firmId', userPermission.firmId)
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
          _logger.logRpcError('deleteOne', call, e);
          rethrow;
        }
      },
    );
  }

  @override
  Future<StatusResponse> updateOnePhoto(
      ServiceCall call, PhotoRequest request) async {
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
    return databaseMiddleware<StatusResponse>(
      _poolService,
      (db) async {
        final collectionPhoto = db.collection(collectionPhotoName);
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
            throw GrpcError.internal(
                'hasWriteErrors ${result.writeError!.errmsg}');
          }
          if (result.failure) {
            throw GrpcError.unknown(
                'update != 1 ${result.document} ${result.serverResponses}');
          }
          return StatusResponse()
            ..type = StatusResponse_Type.UPDATED
            ..timestamp = DateTime.now().timestampProto;
        } on GrpcError catch (e) {
          _logger.logRpcError('updateOneCategory', call, e);
          rethrow;
        } catch (e, stacktrace) {
          _logger.logRpcError('updateOneCategory', call, e, stackTrace: stacktrace);
          throw GrpcError.unknown('$e');
        }
      },
    );
  }
}
