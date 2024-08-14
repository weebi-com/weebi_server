import 'package:mongo_dart/mongo_dart.dart' hide Timestamp;

import 'package:protos_weebi/grpc.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:user_service/user_service.dart';

class BoutiqueService extends BoutiqueServiceBase {
  final Db _db;
  final DbCollection collection;

  // for unit tests only
  final bool isTest;
  UserPermissions? userPermissionIfTest;
  static const String collectionName = 'boutique';

  BoutiqueService(this._db, {this.isTest = false, this.userPermissionIfTest})
      : collection = _db.collection(collectionName);

  /// only one firm per 'company' using weebi
  /// 1. user signup and get a userId
  /// 2. user create a firm, firmId == userId for simplicity
  @override
  Future<StatusResponse> createOneFirm(ServiceCall? call, Firm request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    if (userPermission.firmRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create firm');
    }
    // ? should we check that no other firm exist for this accouunt ?
    try {
      final firmMongo =
          await collection.findOne(where.eq('firmId', (userPermission.firmId)));
      if (firmMongo != null) {
        throw GrpcError.notFound('already such a firm');
      }
    } on GrpcError catch (e) {
      return StatusResponse.create()
        ..type = StatusResponse_Type.ERROR
        ..message = 'firm already exists'
        ..timestamp = DateTime.now().timestampProto;
      ;
    } catch (e) {
      rethrow;
    }
    // set the appropriate ids
    request.firmId = userPermission.firmId;
    request.chains.first
      ..firmId = ObjectId.createId(DateTime.now().toUtc().second).hexString
      ..firmId = userPermission.firmId;
    request.chains.first.boutiques.first
      ..firmId = ObjectId.createId(DateTime.now().toUtc().second).hexString
      ..chainId = request.chains.first.chainId
      ..firmId = userPermission.firmId;
    try {
      final result = await collection
          .insertOne(request.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        //print(result.document);
        final mongoId = result.document!['_id'];

        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..id = mongoId
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
      rethrow;
    }
  }

  @override
  Future<Firm> readOneFirm(ServiceCall? call, Empty request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.firmRights.rights.any((e) => e == Right.read) == false) {
      throw GrpcError.permissionDenied('user does not have right to read firm');
    }
    try {
      final firmMongo =
          await collection.findOne(where.eq('firmId', userPermission.firmId));
      if (firmMongo == null) {
        throw GrpcError.notFound('firm not found');
      }
      final firm = Firm()
        ..mergeFromProto3Json(firmMongo, ignoreUnknownFields: true);
      return firm;
    } on GrpcError catch (e) {
      print('readFirm error $e');
      rethrow;
    }
  }

  Future<Firm> _checkFirmAndProtoIt(UserPermissions userPermissions) async {
    final firmMongo =
        await collection.findOne(where.eq('firmId', (userPermissions.firmId)));
    if (firmMongo == null) {
      throw GrpcError.notFound('firm not found');
    }
    return Firm.create()
      ..mergeFromProto3Json(firmMongo, ignoreUnknownFields: true);
  }

  /// used to find user access levels called by UserService
  /// consider making this a "public" gRPC
  Future<List<String>> readAllBoutiquesInChains(
      String firmId, List<String> chainIds) async {
    _db.isConnected ? null : await _db.open();
    try {
      final firmMongo = await collection.findOne(where.eq('firmId', firmId));

      if (firmMongo == null) {
        throw GrpcError.notFound('firm not found');
      }
      final firm = Firm()
        ..mergeFromProto3Json(firmMongo, ignoreUnknownFields: true);

      final boutiques = <Boutique>[];
      for (final requestchainId in chainIds) {
        for (final chain in firm.chains) {
          if (firmId == chain.firmId) {
            if (requestchainId == chain.chainId) {
              for (final boutique in chain.boutiques) {
                if (boutique.firmId == firmId &&
                    boutique.chainId == requestchainId) {
                  boutiques.add(boutique);
                }
              }
            }
          }
        }
      }
      return boutiques.map((e) => e.boutiqueId).toList();
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  /// used to find user access levels called by UserService
  Future<List<String>> readAllBoutiquesInChain(UserPrivate user) async {
    _db.isConnected ? null : await _db.open();
    try {
      final firmMongo =
          await collection.findOne(where.eq('firmId', user.firmId));

      if (firmMongo == null) {
        throw GrpcError.notFound('firm not found');
      }
      final firm = Firm()
        ..mergeFromProto3Json(firmMongo, ignoreUnknownFields: true);

      final boutiques = <Boutique>[];
      for (final requestchainId in user.chainIds.ids) {
        for (final chain in firm.chains) {
          if (user.firmId == chain.firmId) {
            if (requestchainId == chain.chainId) {
              for (final boutique in chain.boutiques) {
                if (boutique.firmId == user.firmId &&
                    boutique.chainId == requestchainId) {
                  boutiques.add(boutique);
                }
              }
            }
          }
        }
      }
      return boutiques.map((e) => e.boutiqueId).toList();
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<StatusResponse> createOneBoutique(
      ServiceCall? call, Boutique request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    if (request.chainId.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.name} ${request.boutiqueId}');
    }

    if (userPermission.boutiqueRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create boutique');
    }

    try {
      final firm = await _checkFirmAndProtoIt(userPermission);

      final chainIndex =
          firm.chains.indexWhere((e) => e.chainId == request.chainId);
      if (chainIndex == -1) {
        throw GrpcError.notFound('boutique chain not found');
      }
      firm.chains[chainIndex].boutiques.add(request);

      final result = await collection.replaceOne(
        where.eq('firmId', userPermission.firmId),
        firm.toProto3Json() as Map<String, dynamic>,
        upsert: true,
      );
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        print(result.document.toString());
        final mongoId = result.document!['_id'];

        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..id = mongoId
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
      rethrow;
    }
  }

  /// the client will need to provide firmId
  @override
  Future<StatusResponse> createOneChain(
      ServiceCall? call, Chain request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    // TODO check request.firmId is not empty
    // TODO check user.firmId match request.firmId
    if (userPermission.chainRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create chain');
    }

    try {
      final firm = await _checkFirmAndProtoIt(userPermission);
      firm.chains.add(request);

      final result = await collection.replaceOne(
        where.eq('firmId', userPermission.firmId),
        firm.toProto3Json() as Map<String, dynamic>,
        upsert: true,
      );
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        final mongoId = result.document!['_id'];
        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..id = mongoId
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
      rethrow;
    }
  }

  @override
  Future<StatusResponse> updateOneBoutique(
      ServiceCall? call, Boutique request) async {
    _db.isConnected ? null : await _db.open();
    if (request.boutiqueId.isEmpty) {
      throw GrpcError.failedPrecondition('boutique id cannot be empty');
    }
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.boutiqueRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update boutique');
    }
    if (request.chainId.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }

    try {
      final firm = await _checkFirmAndProtoIt(userPermission);
      final chainIndex =
          firm.chains.indexWhere((e) => e.chainId == request.chainId);
      if (chainIndex == -1) {
        throw GrpcError.notFound('boutique chain not found');
      }
      final boutiqueIndex = firm.chains[chainIndex].boutiques
          .indexWhere((e) => e.boutiqueId == request.boutiqueId);
      if (boutiqueIndex == -1) {
        throw GrpcError.notFound('boutique not found');
      }
      firm.chains[chainIndex].boutiques[boutiqueIndex] = request;

      final result = await collection.replaceOne(
        where.eq('firmId', userPermission.firmId),
        firm.toProto3Json() as Map<String, dynamic>,
        upsert: true,
      );
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
      rethrow;
    }
  }

  @override
  Future<StatusResponse> updateOneChain(
      ServiceCall? call, Chain request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (request.chainId.isEmpty) {
      throw GrpcError.failedPrecondition('chain id cannot be empty');
    }
    if (userPermission.chainRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update chain');
    }
    if (request.chainId.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.name} ${request.chainId}');
    }

    try {
      final firm = await _checkFirmAndProtoIt(userPermission);
      final index = firm.chains.indexWhere((e) => e.chainId == request.chainId);
      if (index == -1) {
        throw GrpcError.notFound('chain not found');
      } else {
        firm.chains[index] = request;
      }
      final result = await collection.replaceOne(
        where.eq('firmId', userPermission.firmId),
        firm.toProto3Json() as Map<String, dynamic>,
        upsert: true,
      );
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
      rethrow;
    }
  }

  @override
  Future<StatusResponse> deleteDevice(
      ServiceCall? call, DeleteDeviceRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    // chain rights encompass device pairing
    if (userPermission.chainRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete device');
    }
    if (request.chainId.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      final firm = await _checkFirmAndProtoIt(userPermission);
      final index = firm.chains.indexWhere((e) => e.chainId == request.chainId);
      if (index == -1) {
        throw GrpcError.notFound();
      }

// ** .oid would be safer, but not sure it is populated properly
      final deviceIndex = firm.chains[index].devices.indexWhere((d) =>
          d.serialNumber == request.device.serialNumber &&
          d.boutiqueId == request.device.boutiqueId);
      if (deviceIndex == -1) {
        throw GrpcError.unavailable('no device found');
      }
      firm.chains[index].devices.removeAt(deviceIndex);
      final result = await collection.replaceOne(
        where.eq('firmId', userPermission.firmId),
        firm.toProto3Json() as Map<String, dynamic>,
        upsert: true,
      );
      if (result.hasWriteErrors) {
        throw GrpcError.internal('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok != 1) {
        throw GrpcError.unknown(
            'update != 1 ${result.document} ${result.serverResponses}');
      }
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print('delete OneDevice error $e');
      rethrow;
    }
  }

  @override
  Future<Devices> readDevices(ServiceCall? call, ReadRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.chainRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read devices');
    }
    if (request.chainId.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      final firmMongo =
          await collection.findOne(where.eq('firmId', userPermission.firmId));

      if (firmMongo == null) {
        throw GrpcError.unknown('firm not found ${userPermission.firmId}');
      }
      final firm = Firm.create()
        ..mergeFromProto3Json(firmMongo, ignoreUnknownFields: true);

      final index = firm.chains.indexWhere((e) => e.chainId == request.chainId);
      if (index == -1) {
        throw GrpcError.unknown('mall ${request.chainId}');
      }

      final devices = <Device>[];
      for (final device in firm.chains[index].devices) {
        devices.add(device);
      }
      return Devices(devices: devices);
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }
}
