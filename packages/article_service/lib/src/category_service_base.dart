import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/protos_weebi.dart';

abstract class _Helpers {
  static SelectorBuilder select(String firmId, CategoryRequest request) => where
      .eq('firmId', firmId)
      .eq('chainId', request.chainId)
      .eq('title', request.category.title);
}

class CategoryService extends CategoryServiceBase {
  final Db _db;
  final DbCollection collection;
  // for unit tests only
  final bool isTest;
  final UserPermissions? userPermissionIfTest;
  static const String collectionName = 'category';

  CategoryService(
    this._db, {
    this.isTest = false,
    this.userPermissionIfTest,
  }) : collection = _db.collection(collectionName);

  @override
  Future<StatusResponse> createOne(
      ServiceCall? call, CategoryRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
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
        ..firmId = userPermission.firmId;

      final result = await collection
          .insertOne(calibreMongo.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        final title = result.document!['title'] as String;
        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..id = title
          ..timestamp = DateTime.now().timestampProto;
      } else {
        return StatusResponse.create()
          ..type = StatusResponse_Type.ERROR
          ..message = 'result.ok != 1 || result.document == null'
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
  Future<StatusResponse> replaceOne(
      ServiceCall? call, CategoryRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
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
      final calibreMongo = CategoryMongo.create()
        ..category = request.category
        ..title = request.category.title
        ..chainId = request.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId;

      final result = await collection.replaceOne(
          _Helpers.select(userPermission.firmId, request),
          calibreMongo.toProto3Json() as Map<String, dynamic>,
          upsert: true);
      if (result.hasWriteErrors) {
        throw GrpcError.internal('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok != 1) {
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
      ServiceCall? call, CategoryRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
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
  Future<CategoriesResponse> readAll(
      ServiceCall? call, ReadCategoriesRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
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
      final list = await collection.find().toList();
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
  Future<CategoryPb> readOne(
      ServiceCall call, FindCategoryRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
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
      final category = await collection.findOne(selector);
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
}
