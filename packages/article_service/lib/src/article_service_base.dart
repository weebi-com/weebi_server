import 'package:mongo_dart/mongo_dart.dart' hide Timestamp;
import 'package:user_service/user_service.dart';
import 'package:protos_weebi/grpc.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

abstract class _Helpers {
  static SelectorBuilder select(String firmOid, ArticleRequest request) => where
      .eq('firmOid', firmOid)
      .eq('chainOid', request.chainOid)
      .eq('calibreId', request.calibre.id);
}

class ArticleService extends ArticleServiceBase {
  final Db _db;
  final DbCollection collection;
  // for unit tests only
  final bool isTest;
  final UserPermissions? userPermissionIfTest;
  static const String collectionName = 'article';

  ArticleService(
    this._db, {
    this.isTest = false,
    this.userPermissionIfTest,
  }) : collection = _db.collection(collectionName);

  @override
  Future<StatusResponse> createOne(
      ServiceCall? call, ArticleRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (request.chainOid.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainOid}');
    }
    if (userPermission.articleRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create article');
    }
    try {
      final calibreMongo = CalibreMongo.create()
        ..calibre = request.calibre
        ..calibreId = request.calibre.id
        ..chainOid = request.chainOid
        ..firmOid = userPermission.firmOid
        ..userOid = userPermission.userOid;

      final result = await collection
          .insertOne(calibreMongo.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        final mongoId = result.document!['_id'] as ObjectId;

        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..message = mongoId.oid
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
      ServiceCall? call, ArticleRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.articleRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update articles');
    }
    if (request.chainOid.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainOid}');
    }
    try {
      final calibreMongo = CalibreMongo.create()
        ..calibre = request.calibre
        ..calibreId = request.calibre.id
        ..chainOid = request.chainOid
        ..firmOid = userPermission.firmOid
        ..userOid = userPermission.userOid;

      final result = await collection.replaceOne(
          _Helpers.select(userPermission.firmOid, request),
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
      ServiceCall? call, ArticleRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.articleRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete article');
    }
    if (request.chainOid.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainOid}');
    }
    try {
      await collection
          .deleteOne(_Helpers.select(userPermission.firmOid, request));
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<ArticlesResponse> readAll(
      ServiceCall? call, ReadAllRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.articleRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read articles');
    }
    if (request.chainOid.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainOid}');
    }
    //
    try {
      final list = await collection.find().toList();
      final calibres = <CalibrePb>[];
      for (final e in list) {
        final calibreMongo = CalibreMongo.create()
          ..mergeFromProto3Json(e, ignoreUnknownFields: true);
        calibres.add(calibreMongo.calibre);
      }
      final calibresBis = ArticlesResponse();
      calibresBis.calibres
        ..clear()
        ..addAll(calibres);
      return calibresBis;
    } on GrpcError catch (e) {
      print('readAll article error $e');
      rethrow;
    }
  }

  @override
  Future<CalibrePb> readOne(
      ServiceCall call, FindArticleRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.articleRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read article');
    }
    if (request.chainOid.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainOid}');
    }
    try {
      final selector =
          where.eq('chainOid', request.chainOid).eq('title', request.title);
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
}
