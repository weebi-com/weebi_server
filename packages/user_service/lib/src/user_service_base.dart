import 'dart:developer';
import 'dart:async';
import 'dart:math' show Random;

import 'package:collection/collection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:mongo_dart/mongo_dart.dart' hide Timestamp;

import 'package:protos_weebi/grpc.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

import 'package:boutique_service/boutique_service.dart';
import 'package:user_service/user_service.dart';

// TODO : create updateUserPassword rpc admins only

class UserService extends UserServiceBase {
  // ignore: unused_field
  final Db _db;
  final DbCollection collection;
  final DbCollection pairingCodesCollection;
  static const String pairingCodesCollectionName = 'pairing_codes';
  final BoutiqueService? _boutiqueService;
  static const String collectionName = 'user';

  final bool isTest;
  UserPermissions? userPermissionIfTest;
  UserService(this._db, this._boutiqueService,
      {this.isTest = false, this.userPermissionIfTest})
      : pairingCodesCollection = _db.collection(pairingCodesCollectionName),
        collection = _db.collection(collectionName);

  @override
  Future<StatusResponse> createOne(
      ServiceCall? call, CreateOneRequest request) async {
    //TODO : consider more annoying password check

    if (request.password.isEmpty) {
      throw GrpcError.failedPrecondition('password cannot be empty');
    }
    if (request.password.length < 3) {
      throw GrpcError.failedPrecondition('password is a bit too short');
    }

    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    _db.isConnected ? null : await _db.open();

    //TODO consider rethinking this, might be also possible to check in db to deduce it

    if (request.isFirstUser == false) {
      if (userPermission.firmId != request.userInfo.permissions.firmId) {
        throw GrpcError.permissionDenied(
            'user does not have access to firm ${request.userInfo.permissions.firmId}');
      }
    }

    if (userPermission.userManagementRights.rights
        .none((e) => e == Right.create)) {
      throw GrpcError.permissionDenied(
          'user does not have right to create other users');
    }
    try {
      final user = UserInfo.create()
        ..mergeFromProto3Json(
            request.userInfo.toProto3Json() as Map<String, dynamic>,
            ignoreUnknownFields: true);
      if (_boutiqueService == null) {
        throw '_boutiqueService is not initialized/available';
      }

      // hack so that manager keep access on new boutiques without having to update their permissions for each new creation/deletion
      // keep simple logic in weebi_web that will pass all boutiques oids in user.permissions.boutiquesAccessible
      // at the time of manager creation if these oids match all that exist in db we set to ALL

      Ids boutiqueIds = request.isFirstUser
          ? Ids(ids: ['ALL'])
          : identical(
                  await _boutiqueService.readAllBoutiquesInChains(
                      user.permissions.firmId,
                      user.permissions.chainsAccessible.ids),
                  user.permissions.boutiquesAccessible)
              ? Ids(ids: ['ALL'])
              : user.permissions.boutiquesAccessible;

      // firstUser cannot have access to a firm that is not created yet
      // so we assign

      final objectId =
          ObjectId.createId(DateTime.now().toUtc().second).hexString;
      String firmId = request.isFirstUser ? objectId : userPermission.firmId;

      final userPrivate = UserPrivate.create()
        ..userId = objectId
        ..passwordEncrypted = Encrypter(request.password).encrypted
        ..mail = user.mail
        ..firstname = user.firstname
        ..lastname = user.lastname
        ..firmId = firmId
        ..chainIds = user.permissions.chainsAccessible
        ..boutiqueIds = boutiqueIds
        ..articleRights = user.permissions.articleRights
        ..boutiqueRights = user.permissions.boutiqueRights
        ..contactRights = user.permissions.contactRights
        ..chainRights = user.permissions.chainRights
        ..firmRights = user.permissions.firmRights
        ..ticketRights = user.permissions.ticketRights
        ..userManagementRights = user.permissions.userManagementRights
        ..boolRights = user.permissions.boolRights;

      final result = await collection
          .insertOne(userPrivate.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      final timestamp = DateTime.now().timestampProto;
      if (result.ok == 1 && result.document != null) {
        final mongoId = result.document!['_id'];
        print('mongoId.runtimeType ${mongoId.runtimeType}');
        return StatusResponse()
          ..id = mongoId
          ..type = StatusResponse_Type.CREATED
          ..timestamp = timestamp;
      } else {
        return StatusResponse()
          ..type = StatusResponse_Type.ERROR
          ..timestamp = timestamp;
      }
    } on GrpcError catch (e) {
      log('user mail ${request.userInfo.mail} createOne error: $e');
      rethrow;
    }
  }

  @override
  Future<Tokens> authenticateWithCredentials(
      ServiceCall? call, LoginRequest request) async {
    try {
      final mailAndEncyptedPassword = await _checkRequest(call, request);

      // * here we will eventually check the subscription validity (1 month free or paid sub)

      final userPermission = await _readUserPermissionsByMailAndPassword(
          call, mailAndEncyptedPassword);
      var jwt = JsonWebToken();
      final payload = userPermission.toProto3Json() as Map<String, dynamic>?;
      jwt.createPayload(
        userPermission.userId,
        expireIn: const Duration(days: 1),
        payload: payload,
      );
      jwt.sign();
      final accessToken = jwt.sign();
      jwt = JsonWebToken();
      jwt.createPayload(
        userPermission.userId,
        expireIn: Duration(days: 30),
        payload: {
          'userId': userPermission.userId,
          'firmId': userPermission.firmId
        },
      );
      // refresh token only contains userId & firmId
      final resfreshToken = jwt.sign();
      return Tokens(accessToken: accessToken, refreshToken: resfreshToken);
    } on GrpcError catch (e) {
      log('authenticate $e');
      rethrow;
    }
  }

  Future<MailAndEncyptedPasswordRequest> _checkRequest(
      ServiceCall? call, LoginRequest request) async {
    if (request.mail.isEmpty) {
      throw GrpcError.invalidArgument('mail isEmpty');
    } else if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(request.mail.trim()) ==
        false) {
      throw GrpcError.invalidArgument('incorrect mail format');
    } else if (request.password.isEmpty) {
      throw GrpcError.invalidArgument('password isEmpty');
    }
    final passwordEncrypted = Encrypter(request.password).encrypted;
    return MailAndEncyptedPasswordRequest(
        passwordEncrypted: passwordEncrypted, mail: request.mail);
  }

  @override
  Future<Tokens> authenticateWithRefreshToken(
      ServiceCall? call, RefreshToken request) async {
    try {
      final jwtRefresh = JsonWebToken.parse(request.refreshToken);
      if (!jwtRefresh.verify()) {
        throw GrpcError.unauthenticated('invalid jwtRefresh ');
      }

      /// permissions may have changed
      final userPermissionObsolete = UserPermissions.create()
        ..mergeFromProto3Json(jwtRefresh.payload, ignoreUnknownFields: true);

      final user = await _readUserByObjectId(
        userPermissionObsolete.userId,
        userPermissionObsolete.firmId,
      );

      final userPermission = await _readUserPermissions(user);

      var jwt = JsonWebToken();
      final payload = userPermission.toProto3Json() as Map<String, dynamic>?;
      jwt.createPayload(
        userPermission.userId,
        expireIn: const Duration(days: 1),
        payload: payload,
      );
      jwt.sign();
      final accessToken = jwt.sign();
      jwt = JsonWebToken();
      jwt.createPayload(userPermission.userId,
          expireIn: Duration(days: 30),
          payload: {
            'userId': userPermission.userId,
            'firmId': userPermission.firmId
          });
      // refresh token only containes userId and firmId
      final resfreshToken = jwt.sign();
      return Tokens(accessToken: accessToken, refreshToken: resfreshToken);
    } on GrpcError catch (e) {
      log('authenticateWithRefreshToken $e');
      rethrow;
    }
  }

  Future<UserPrivate> _readUserByObjectId(String firmId, String userId) async {
    _db.isConnected ? null : await _db.open();
    try {
      final userPrivate = await collection.findOne(
        where.eq('userId', userId).eq('firmId', firmId),
      );
      if (userPrivate == null) {
        throw GrpcError.notFound('userId $userId');
      }
      return UserPrivate()
        ..mergeFromProto3Json(userPrivate, ignoreUnknownFields: true);
    } on GrpcError catch (e) {
      log('$e');
      rethrow;
    }
  }

  Future<UserPermissions> _readUserPermissionsByMailAndPassword(
      ServiceCall? call, MailAndEncyptedPasswordRequest request) async {
    _db.isConnected ? null : await _db.open();
    try {
      final selector = where
          .eq('mail', request.mail.trim())
          .eq('password', request.passwordEncrypted);
      final userPrivateMongo = await collection.findOne(selector);
      if (userPrivateMongo == null) {
        final resultMail =
            await collection.findOne(where.eq('mail', request.mail));
        if (resultMail == null) {
          throw GrpcError.notFound();
        } else {
          throw GrpcError.invalidArgument('incorrect password');
        }
      }
      final user = UserPrivate()
        ..mergeFromProto3Json(userPrivateMongo, ignoreUnknownFields: true);
      final userPermission = await _readUserPermissions(user);
      return userPermission;
    } on GrpcError catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<UserPermissions> readUserPermissionsByToken(
      ServiceCall? call, Empty request) async {
    return isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
  }

  Future<UserPermissions> _readUserPermissions(UserPrivate user) async {
    final access = await _readUserAccess(user);
    return UserPermissions.create()
      ..userId = user.userId
      ..firmId = user.firmId
      ..articleRights = user.articleRights
      ..boutiqueRights = user.boutiqueRights
      ..contactRights = user.contactRights
      ..chainRights = user.chainRights
      ..firmRights = user.firmRights
      ..ticketRights = user.ticketRights
      ..userManagementRights = user.userManagementRights
      ..boutiquesAccessible = Ids(ids: access.boutiquesAccessible.ids)
      ..chainsAccessible = Ids(ids: access.chainsAccessible.ids)
      ..boolRights = user.boolRights;
  }

  Future<Access> _readUserAccess(UserPrivate user) async {
    _db.isConnected ? null : await _db.open();

    /// for users who need to access all boutiques
    /// instead of passing all oids of a chain we use this hack :
    /// boutiqueIds = ['ALL']
    /// accessible boutiques will be deduced in boutique_service endpoint
    /// allowing us not to keep track of boutiques creation/deletion in the user collection
    if (user.boutiqueIds.ids.contains('ALL') && user.chainIds.ids.isNotEmpty) {
      if (_boutiqueService == null) {
        throw '_boutiqueService is not initialized/available';
      }
      final boutiquesOids = await _boutiqueService.readAllBoutiquesInChains(
          user.firmId, user.chainIds.ids);
      return Access(
          chainsAccessible: Ids(ids: user.chainIds.ids),
          boutiquesAccessible: Ids(ids: boutiquesOids));
    } else {
      return Access(
          chainsAccessible: Ids(ids: user.chainIds.ids),
          boutiquesAccessible: Ids(ids: user.boutiqueIds.ids));
    }
  }

  Future<UserPrivate> _checkUserAndProtoIt(String userId) async {
    final userMongo = await collection.findOne(where.eq('userId', userId));
    if (userMongo == null) {
      throw GrpcError.notFound('user not found');
    }
    return UserPrivate.create()
      ..mergeFromProto3Json(userMongo, ignoreUnknownFields: true);
  }

  @override
  Future<StatusResponse> updateOne(ServiceCall? call, UserInfo request) async {
    if (request.userId.isEmpty) {
      throw GrpcError.failedPrecondition('userId cannot be empty');
    }
    if (request.userId != request.permissions.userId) {
      throw GrpcError.failedPrecondition(
          'request.userId != user.permissions.userId');
    }
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    if (userPermission.userManagementRights.rights
            .any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update users');
    }
    final userPrivate = await _checkUserAndProtoIt(request.permissions.userId);
    if (userPrivate.firmId != userPermission.firmId) {
      throw GrpcError.permissionDenied(
          'user cannot be updated because it belongs to a different firm');
    }
    try {
//      final user = request.toProto3Json() as Map<String, dynamic>;
      final userId = ObjectId.fromHexString(request.permissions.userId);
      final result = await collection.update(
          where.id(userId),
          ModifierBuilder()
              .set('firstname', request.firstname)
              .set('lastname', request.lastname)
              .set('mail', request.mail)
              .set('permissions',
                  request.permissions), // TODO check this might fail
          upsert: true);
      print(result);
/*       if (result.hasWriteErrors) {
        throw GrpcError.internal('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok != 1) {
        throw GrpcError.unknown(
            'update != 1 ${result.document} ${result.serverResponses}');
      } */
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
  Future<UserInfo> readOne(ServiceCall? call, UserId request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.userManagementRights.rights
        .none((e) => e == Right.read)) {
      throw GrpcError.permissionDenied(
          'user does not have right to read other users');
    }
    try {
      final userMongo =
          await collection.findOne(where.eq('userId', request.userId));
      if (userMongo == null) {
        throw GrpcError.notFound('user not found');
      }
      final user = UserPrivate()
        ..mergeFromProto3Json(userMongo, ignoreUnknownFields: true);
      final userInfo = UserInfo.create()
        ..firstname = user.firstname
        ..lastname = user.lastname
        ..mail = user.mail;
      return userInfo;
    } on GrpcError catch (e) {
      print('readOne error $e');
      rethrow;
    }
  }

  /// using boutique service check that we have a device with status == true
  /// also check the password (not encrypted yet)
  /// forge a bearer token for the default user on this boutique
  @override
  Future<Tokens> authenticateWithDevice(
      ServiceCall? call, DeviceLoginRequest request) async {
    _db.isConnected ? null : await _db.open();
    if (request.firmId.isEmpty) {
      throw GrpcError.invalidArgument('firmId.isEmpty');
    }
    if (request.chainId.isEmpty) {
      throw GrpcError.invalidArgument('chainId.isEmpty');
    }
    if (request.deviceOid.isEmpty) {
      throw GrpcError.invalidArgument('deviceOid.isEmpty');
    }
    try {
      final firmMongo =
          await collection.findOne(where.eq('firmId', request.firmId));
      if (firmMongo == null) {
        throw GrpcError.notFound();
      }
      final firm = Firm.create()
        ..mergeFromProto3Json(firmMongo, ignoreUnknownFields: true);

      final chainNullable =
          firm.chains.firstWhereOrNull((c) => c.chainId == request.chainId);
      if (chainNullable == null) {
        throw GrpcError.notFound();
      }
      final deviceNullable = chainNullable.devices.firstWhereOrNull((d) =>
          d.id == request.deviceOid && d.boutiqueId == request.boutiqueId);
      if (deviceNullable == null) {
        throw GrpcError.notFound();
      }
      if (deviceNullable.password != request.password) {
        throw GrpcError.invalidArgument('incorrect password');
      }
      if (deviceNullable.status != true) {
        throw GrpcError.failedPrecondition('deactivated device');
      }

      final userPermission = UserPermissions.create()
        ..userId = 'device_${request.deviceOid}'
        ..firmId = request.firmId
        ..articleRights = RightSalesperson.article
        ..boutiqueRights = RightSalesperson.boutique
        ..contactRights = ContactRights(rights: [Right.read])
        ..ticketRights = RightSalesperson.ticket
        ..boolRights = BoolRights.create()
        ..boutiquesAccessible = Ids(ids: [request.boutiqueId])
        ..chainsAccessible = Ids(ids: [request.chainId]);
      var jwt = JsonWebToken();
      final payload = userPermission.toProto3Json() as Map<String, dynamic>?;
      jwt.createPayload(
        userPermission.userId,
        expireIn: const Duration(days: 1),
        payload: payload,
      );
      jwt.sign();
      final accessToken = jwt.sign();
      jwt = JsonWebToken();
      jwt.createPayload(
        userPermission.userId,
        expireIn: Duration(days: 30),
        payload: {
          'userId': userPermission.userId,
          'firmId': userPermission.firmId
        },
      );
      // refresh token only contains userId & firmId
      final resfreshToken = jwt.sign();
      return Tokens(accessToken: accessToken, refreshToken: resfreshToken);
    } on GrpcError catch (e) {
      print('authenticateWithDevice error $e');
      rethrow;
    }
  }

  @override
  Future<DevicePairingResponse> generateCodeForPairingDevice(
      ServiceCall? call, chainIdAndboutiqueId request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    // chain rights encompass device pairing
    if (userPermission.chainRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to pair device (missing chainRights)');
    }
    if (request.chainId.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      /// make sure we do not use an already existing code
      var code = 0;
      var d = DevicePairingResponse.create();
      do {
        code = _createCode();
        d = await _findCode(code);
      } while (code == d.code);

      final millis = DateTime.now().millisecond;
      final timestamp = Timestamp()
        ..seconds = Int64(millis)
        ..nanos = (millis % 1000) * 1000000;
      final temp = DevicePairingResponse.create()
        ..userId = userPermission.userId
        ..firmId = userPermission.firmId
        ..chainId = request.chainId
        ..boutiqueId = request.boutiqueId
        ..code = code
        ..timestampUTC = timestamp;
      final result = await pairingCodesCollection
          .insertOne(temp.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        return temp;
      } else {
        throw GrpcError.unknown('mongo error generateCodeForPairingDevice');
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

  int _createCode() {
    final random = Random();
    return random.nextInt(900000) + 100000;
  }

  Future<DevicePairingResponse> _findCode(int code) async {
    try {
      final d = await pairingCodesCollection.findOne(where.eq('code', code));
      return DevicePairingResponse.create()
        ..mergeFromProto3Json(d, ignoreUnknownFields: true);
    } on MongoDartError catch (e) {
      print('_isCodeInDb error $e');
      rethrow;
    }
  }

  /// authent is not checked since no user is authentified on device
  /// (in packages/user_service/lib/src/auth_interceptor.dart)
  /// this eases pairing remotely
  /// it also imposes that a device be paired before anyone can log in, which is structuring
  /// the device will still need to be approved by admin on the web (pending)
  /// thus the risk is very low
  @override
  Future<StatusResponse> addPendingDevice(
      ServiceCall? call, PendingDeviceRequest request) async {
    final pairingResp = await _findCode(request.code);
    if (pairingResp.code == 0) {
      return StatusResponse()
        ..type = StatusResponse_Type.ERROR
        ..message = 'no match'
        ..timestamp = DateTime.now().timestampProto;
    }
    try {
      final firmMongo =
          await collection.findOne(where.eq('firmId', pairingResp.firmId));
      if (firmMongo == null) {
        throw GrpcError.unknown('firm ${pairingResp.firmId}');
      }

      final firm = Firm.create()
        ..mergeFromProto3Json(firmMongo, ignoreUnknownFields: true);
      final chainIndex =
          firm.chains.indexWhere((e) => e.chainId == pairingResp.chainId);

      if (chainIndex == -1) {
        throw GrpcError.unknown('mall ${pairingResp.chainId}');
      }

      // admin still need to approve device in case code leaked or else
      request.device.status = false;
      // set the boutiqueId selected by web admin
      request.device.boutiqueId = pairingResp.boutiqueId;
      request.device.id =
          ObjectId.createId(DateTime.now().toUtc().second).hexString;

      firm.chains[chainIndex].devices.add(request.device);

      final result = await collection.replaceOne(
        where.eq('firmId', pairingResp.firmId),
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

      // delete the already used code
      await pairingCodesCollection.deleteOne(where.eq('code', request.code));

      // if 10% of the numbers are attributed
      // clean codes older than 10 days
      final countCodes = await pairingCodesCollection.count();
      if (countCodes > 10000) {
        final selector = where.lt('timestampUTC',
            DateTime.now().subtract(Duration(days: 10)).toIso8601String());
        await pairingCodesCollection.deleteMany(selector);
      }

      return StatusResponse()
        ..type = StatusResponse_Type.UPDATED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print('pairOneDevice error $e');
      rethrow;
    }
  }

  // once approved a device == user with minimum rights to ease app handling
  // see UserService.authenticateWithDevice & UserService.updateDeviceDefaultPassword
  @override
  Future<StatusResponse> approveDevice(
      ServiceCall? call, ApproveDeviceRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    // chain rights encompass device pairing
    if (userPermission.chainRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to pair device (missing chainRights)');
    }
    if (request.chainIdAndboutiqueId.chainId
            .isChainAccessible(userPermission) ==
        false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainIdAndboutiqueId.chainId}');
    }
    try {
      final firm =
          await collection.findOne(where.eq('firmId', userPermission.firmId));
      if (firm == null) {
        throw GrpcError.notFound('firm not found');
      }

      final firmProto = Firm.create()
        ..mergeFromProto3Json(firm, ignoreUnknownFields: true);
      final index = firmProto.chains
          .indexWhere((e) => e.chainId == request.chainIdAndboutiqueId.chainId);
      if (index == -1) {
        throw GrpcError.notFound();
      }
      final deviceIndex = firmProto.chains[index].devices.indexWhere((d) =>
          d.id == request.device.id &&
          d.boutiqueId == request.device.boutiqueId);
      if (deviceIndex == -1) {
        throw GrpcError.unknown('no device found');
      }
      firmProto.chains[index].devices[deviceIndex].status = true;

      final result = await collection.replaceOne(
        where.eq('firmId', userPermission.firmId),
        firmProto.toProto3Json() as Map<String, dynamic>,
        upsert: true,
      );
      if (result.hasWriteErrors) {
        throw GrpcError.internal('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok != 1) {
        throw GrpcError.unknown(
            'update != 1 ${result.document} ${result.serverResponses}');
      }
    } on GrpcError catch (e) {
      print('pairOneDevice error $e');
      rethrow;
    }

    // create user for simple

    return await _createDefaultDeviceCashier(
        userPermission.firmId,
        request.chainIdAndboutiqueId.chainId,
        request.chainIdAndboutiqueId.boutiqueId);
  }

  Future<StatusResponse> _createDefaultDeviceCashier(
      String firmId, String chainId, String boutiqueId) async {
    try {
      final userPrivate = UserPrivate.create()
        // no password for simple cashier
        //..passwordEncrypted = Encrypter(request.password).encrypted
        ..firmId = firmId
        ..chainIds = Ids(ids: [chainId])
        ..boutiqueIds = Ids(ids: [boutiqueId])
        ..articleRights = RightSalesperson.article
        ..boutiqueRights = RightSalesperson.boutique
        ..contactRights = ContactRights(rights: [Right.read])
        ..ticketRights = RightSalesperson.ticket;
      final result = await collection
          .insertOne(userPrivate.toProto3Json as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      final timestamp = DateTime.now().timestampProto;
      if (result.ok == 1 && result.document != null) {
        final mongoId = result.document!['_id'];
        return StatusResponse()
          ..id = mongoId
          ..type = StatusResponse_Type
              .CREATED // approving device is an updated but let's consider it is a creation
          ..timestamp = timestamp;
      } else {
        return StatusResponse()
          ..type = StatusResponse_Type.ERROR
          ..timestamp = timestamp;
      }
    } on GrpcError catch (e) {
      log('device creation error: $e on firmId $firmId, chainId $chainId, boutiqueId $boutiqueId');
      rethrow;
    }
  }

  //
  @override
  Future<StatusResponse> updateDeviceDefaultPassword(
      ServiceCall? call, UpdateDevicePasswordRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    // chain rights encompass device pairing
    if (userPermission.chainRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to pair device (missing chainRights)');
    }
    if (request.chainId.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      final firm =
          await collection.findOne(where.eq('firmId', userPermission.firmId));
      if (firm == null) {
        throw GrpcError.notFound();
      }
      final firmProto = Firm.create()
        ..mergeFromProto3Json(firm, ignoreUnknownFields: true);
      final index =
          firmProto.chains.indexWhere((e) => e.chainId == request.chainId);
      if (index == -1) {
        throw GrpcError.notFound();
      }
      final deviceIndex = firmProto.chains[index].devices
          .indexWhere((d) => d.id == request.device.id);
      if (deviceIndex == -1) {
        throw GrpcError.unavailable('no device found');
      }
      firmProto.chains[index].devices[deviceIndex].password =
          request.device.password;

      final result = await collection.replaceOne(
        where.eq('firmId', userPermission.firmId),
        firmProto.toProto3Json() as Map<String, dynamic>,
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
      print('pairOneDevice error $e');
      rethrow;
    }
  }

  @override
  Future<StatusResponse> deleteOne(ServiceCall? call, UserId request) async {
    if (request.userId.isEmpty) {
      throw GrpcError.failedPrecondition('user oid cannot be empty');
    }
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    if (userPermission.userManagementRights.rights
            .any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete users');
    }

    final userPrivate = await _checkUserAndProtoIt(request.userId);
    if (userPrivate.firmId != userPermission.firmId) {
      throw GrpcError.permissionDenied('user belongs to a different firm');
    }

    try {
      // ignore: unused_local_variable
      final result =
          await collection.deleteOne(where.eq('userId', request.userId));
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }
}
