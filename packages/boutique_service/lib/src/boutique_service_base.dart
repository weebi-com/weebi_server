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

    //TODO here and on all creates, do clear the id just in case someone fancies messing with it
    // what about chain and boutique ids ?
    request.clearId();
    try {
      final result = await collection
          .insertOne(request.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        //print(result.document);
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
      final firmMongo = await collection
          .findOne(where.id(ObjectId.fromHexString(userPermission.firmOid)));
      if (firmMongo == null) {
        throw GrpcError.notFound('firm not found');
      }
      final firm = Firm()
        ..mergeFromProto3Json(firmMongo.properOid, ignoreUnknownFields: true);
      return firm;
    } on GrpcError catch (e) {
      print('readFirm error $e');
      rethrow;
    }
  }

  Future<Firm> _checkFirmAndProtoIt(UserPermissions userPermissions) async {
    final firmMongo = await collection
        .findOne(where.id(ObjectId.fromHexString(userPermissions.firmOid)));
    if (firmMongo == null) {
      throw GrpcError.notFound('firm not found');
    }
    return Firm.create()
      ..mergeFromProto3Json(firmMongo.properOid, ignoreUnknownFields: true);
  }

  /// used to find user access levels called by UserService
  Future<List<String>> readAllBoutiquesInUserChains(UserPrivate user) async {
    _db.isConnected ? null : await _db.open();
    try {
      final firmMongo = await collection
          .findOne(where.id(ObjectId.fromHexString(user.firmOid)));

      if (firmMongo == null) {
        throw GrpcError.notFound('firm not found');
      }
      final firm = Firm()
        ..mergeFromProto3Json(firmMongo.properOid, ignoreUnknownFields: true);

      final boutiques = <Boutique>[];
      for (final requestChainOid in user.chainOids.oids) {
        for (final chain in firm.chains) {
          if (user.firmOid == chain.firmOid) {
            if (requestChainOid == chain.id.oid) {
              for (final boutique in chain.boutiques) {
                if (boutique.firmOid == user.firmOid &&
                    boutique.chainOid == requestChainOid) {
                  boutiques.add(boutique);
                }
              }
            }
          }
        }
      }
      return boutiques.map((e) => e.id.oid).toList();
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

    if (request.chainOid.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.name} ${request.id.oid}');
    }

    if (userPermission.boutiqueRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create boutique');
    }

    try {
      final firm = await _checkFirmAndProtoIt(userPermission);

      final chainIndex =
          firm.chains.indexWhere((e) => e.id.oid == request.chainOid);
      if (chainIndex == -1) {
        throw GrpcError.notFound('boutique chain not found');
      }
      firm.chains[chainIndex].boutiques.add(request);

      // _id clearing just in case
      firm.clearId();
      request.clearId();
      final result = await collection.replaceOne(
        where.id(ObjectId.fromHexString(userPermission.firmOid)),
        firm.toProto3Json() as Map<String, dynamic>,
        upsert: true,
      );
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        print(result.document.toString());
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
      rethrow;
    }
  }

  /// the client will need to provide firmOid
  @override
  Future<StatusResponse> createOneChain(
      ServiceCall? call, Chain request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    // TODO check request.firmOid is not empty
    // TODO check user.firmOid match request.firmOid
    if (userPermission.chainRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create chain');
    }

    try {
      final firm = await _checkFirmAndProtoIt(userPermission);
      firm.chains.add(request);

      // _id clearing just in case
      request.clearId();
      request.boutiques.forEach((e) => e.clearId);
      request.devices.forEach((e) => e.clearId);

      final result = await collection.replaceOne(
        where.id(ObjectId.fromHexString(userPermission.firmOid)),
        firm.toProto3Json() as Map<String, dynamic>,
        upsert: true,
      );
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
      rethrow;
    }
  }

  @override
  Future<StatusResponse> updateOneBoutique(
      ServiceCall? call, Boutique request) async {
    _db.isConnected ? null : await _db.open();
    if (request.id.oid.isEmpty) {
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
    if (request.chainOid.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainOid}');
    }

    try {
      final firm = await _checkFirmAndProtoIt(userPermission);
      final chainIndex =
          firm.chains.indexWhere((e) => e.id.oid == request.chainOid);
      if (chainIndex == -1) {
        throw GrpcError.notFound('boutique chain not found');
      }
      final boutiqueIndex = firm.chains[chainIndex].boutiques
          .indexWhere((e) => e.id.oid == request.id.oid);
      if (boutiqueIndex == -1) {
        throw GrpcError.notFound('boutique not found');
      }
      firm.chains[chainIndex].boutiques[boutiqueIndex] = request;

      firm.clearId(); // do not interfere with mongo object id management
      final result = await collection.replaceOne(
        where.id(ObjectId.fromHexString(userPermission.firmOid)),
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
    if (request.id.oid.isEmpty) {
      throw GrpcError.failedPrecondition('chain id cannot be empty');
    }
    if (userPermission.chainRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update chain');
    }
    if (request.id.oid.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.name} ${request.id.oid}');
    }

    try {
      final firm = await _checkFirmAndProtoIt(userPermission);
      final index = firm.chains.indexWhere((e) => e.id.oid == request.id.oid);
      if (index == -1) {
        throw GrpcError.notFound('chain not found');
      } else {
        firm.chains[index] = request;
      }
      firm.clearId();
      final result = await collection.replaceOne(
        where.id(ObjectId.fromHexString(userPermission.firmOid)),
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
    if (request.chainOid.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainOid}');
    }
    try {
      final firm = await _checkFirmAndProtoIt(userPermission);
      final index = firm.chains.indexWhere((e) => e.id.oid == request.chainOid);
      if (index == -1) {
        throw GrpcError.notFound();
      }

// ** .oid would be safer, but not sure it is populated properly
      final deviceIndex = firm.chains[index].devices.indexWhere((d) =>
          d.serialNumber == request.device.serialNumber &&
          d.boutiqueOid == request.device.boutiqueOid);
      if (deviceIndex == -1) {
        throw GrpcError.unavailable('no device found');
      }
      firm.chains[index].devices.removeAt(deviceIndex);
      final result = await collection.replaceOne(
        where.id(ObjectId.fromHexString(userPermission.firmOid)),
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
    if (request.chainOid.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainOid}');
    }
    try {
      final firmMongo = await collection
          .findOne(where.id(ObjectId.fromHexString(userPermission.firmOid)));

      if (firmMongo == null) {
        throw GrpcError.unknown('firm not found ${userPermission.firmOid}');
      }
      final firm = Firm.create()
        ..mergeFromProto3Json(firmMongo.properOid, ignoreUnknownFields: true);

      final index = firm.chains.indexWhere((e) => e.id.oid == request.chainOid);
      if (index == -1) {
        throw GrpcError.unknown('mall ${request.chainOid}');
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
