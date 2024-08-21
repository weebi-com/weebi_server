import 'dart:developer';
import 'dart:async';
import 'dart:math' show Random;

import 'package:collection/collection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:mongo_dart/mongo_dart.dart' hide Timestamp;

import 'package:protos_weebi/grpc.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

import 'package:fence_service/fence_service.dart';

// TODO : create updateUserPassword rpc admins only

// TODO : sortir chain de firm pour + de sécurité
// TODO : déplacer le device dans la boutique pour plus de lisibilité

class FenceService extends FenceServiceBase {
  // ignore: unused_field
  final Db _db;
  final DbCollection userCollection;
  final DbCollection pairingCodesCollection;
  final DbCollection boutiqueCollection;
  final DbCollection firmCollection;

  static const String pairingCodesCollectionName = 'pairing_codes';
  static const String boutiqueCollectionName = 'boutique';
  static const String firmCollectionName = 'firm';
  static const String userCollectionName = 'user';

  bool isMock;
  UserPermissions? userPermissionIfTest;
  FenceService(this._db, {this.isMock = false, this.userPermissionIfTest})
      : pairingCodesCollection = _db.collection(pairingCodesCollectionName),
        userCollection = _db.collection(userCollectionName),
        boutiqueCollection = _db.collection(boutiqueCollectionName),
        firmCollection = _db.collection(firmCollectionName);

  @override
  Future<PendingUserResponse> createPendingUser(
      ServiceCall? call, PendingUserRequest request) async {
    final mailChecked = _checkMail(request.mail);

    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    _db.isConnected ? null : await _db.open();

    if (userPermission.firmId != request.permissions.firmId) {
      throw GrpcError.permissionDenied(
          'you do not have access to firm ${request.permissions.firmId}');
    }

    if (userPermission.userManagementRights.rights
        .none((e) => e == Right.create)) {
      throw GrpcError.permissionDenied(
          'you do not have right to create other users');
    }
    final user = await _isMailAlreadyUsed(request.mail);
    if (user.userId.isNotEmpty) {
      if (user.permissions.firmId.isEmpty && user.lastSignIn.seconds == 0) {
        // rare use case when user has signed up before the boss created his/her account
        // also the user carefully did not create a firm and patiently stayed in the waiting room
        final userPublic = UserPublic.create()
          ..mergeFromProto3Json(user.toProto3Json() as Map<String, dynamic>,
              ignoreUnknownFields: true)
          ..permissions = request.permissions;
        final status = await _updateUserDBExec(userPublic);
        return PendingUserResponse(
            statusResponse: status, userPublic: userPublic);
      } else {
        // user signed it at least once
        throw GrpcError.failedPrecondition('mail is alreadyUsed');
      }
    }

    try {
      final userId = DateTime.now().objectIdString;
      String firmId =
          userPermission.firmId.isEmpty ? userId : userPermission.firmId;
      request.permissions
        ..firmId = firmId
        ..userId = userId;

      final userPrivate = UserPrivate(
          permissions: request.permissions,
          userId: userId,
          mail: mailChecked,
          phone: request.phone,
          firstname: request.firstname,
          lastname: request.lastname,
          firmId: firmId);

      final result = await userCollection
          .insertOne(userPrivate.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      final timestamp = DateTime.now().timestampProto;
      if (result.ok == 1 && result.document != null) {
        final _id = result.document!['_id'] as ObjectId;
        print('userId.runtimeType ${userId.runtimeType}');

        final userPublic = UserPublic.create()
          ..mergeFromProto3Json(
              (userPrivate.toProto3Json() as Map<String, dynamic>),
              ignoreUnknownFields: true);

        return PendingUserResponse(
            statusResponse: StatusResponse()
              ..id = _id.oid
              ..type = StatusResponse_Type.CREATED
              ..timestamp = timestamp,
            userPublic: userPublic);
      } else {
        return PendingUserResponse(
            statusResponse: StatusResponse()
              ..type = StatusResponse_Type.ERROR
              ..timestamp = timestamp);
      }
    } on GrpcError catch (e) {
      log('user mail ${request.mail} createPendingUser error: $e');
      rethrow;
    }
  }

  @override
  Future<Tokens> authenticateWithCredentials(
      ServiceCall? call, Credentials request) async {
    try {
      final mailAndEncyptedPassword = await _checkCredentials(request);

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
      await _updateUserLastSignIn;
      return Tokens(accessToken: accessToken, refreshToken: resfreshToken);
    } on GrpcError catch (e) {
      log('authenticate error $e');
      rethrow;
    }
  }

  Future<void> _updateUserLastSignIn(String userId) async {
    try {
      final lastSignin = DateTime.now().timestampProto;
      final dd = lastSignin.toProto3Json();
      print('dd $dd');
      await userCollection.update(
        where.eq('userId', userId),
        ModifierBuilder().set('lastSignIn', dd),
      );
    } catch (e) {
      log('eroor $e');
      throw e;
    }
  }

  MailAndEncyptedPassword _checkCredentials(Credentials request) =>
      MailAndEncyptedPassword(
        mail: _checkMail(request.mail),
        passwordEncrypted: _checkAndEncryptPassword(request.password),
      );
  String _checkMail(String mail) {
    if (mail.isEmpty) {
      throw GrpcError.invalidArgument('mail isEmpty');
    } else if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(mail.trim()) ==
        false) {
      throw GrpcError.invalidArgument('incorrect mail format');
    }
    return mail;
  }

  String _checkAndEncryptPassword(String password) {
    if (password.isEmpty || password.length < 3) {
      throw GrpcError.failedPrecondition('password is a bit too short');
    }
    return Encrypter(password).encrypted;
  }

  @override
  Future<Tokens> authenticateWithRefreshToken(
      ServiceCall? call, RefreshToken request) async {
    try {
      final jwtRefresh = JsonWebToken.parse(request.refreshToken);
      if (!jwtRefresh.verify()) {
        throw GrpcError.unauthenticated('invalid jwtRefresh ');
      }

      final userPrivate = await _readUserByUserId(jwtRefresh.sub);

      var jwt = JsonWebToken();
      final payload =
          userPrivate.permissions.toProto3Json() as Map<String, dynamic>?;
      jwt.createPayload(
        userPrivate.userId,
        expireIn: const Duration(days: 1),
        payload: payload,
      );
      jwt.sign();
      final accessToken = jwt.sign();
      jwt = JsonWebToken();
      jwt.createPayload(userPrivate.userId,
          expireIn: Duration(days: 30),
          payload: {
            'userId': userPrivate.userId,
            //'firmId': userPrivate.firmId
          });
      // refresh token only contains userId
      final resfreshToken = jwt.sign();
      // ? is below really useful ?
      await _updateUserLastSignIn(userPrivate.userId);
      return Tokens(accessToken: accessToken, refreshToken: resfreshToken);
    } on GrpcError catch (e) {
      log('authenticateWithRefreshToken $e');
      rethrow;
    }
  }

  Future<UserPrivate> _readUserByUserId(String userId) async {
    _db.isConnected ? null : await _db.open();
    try {
      final userPrivate = await userCollection.findOne(
        where.eq('userId', userId),
        // .eq('firmId', firmId).
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
      ServiceCall? call, MailAndEncyptedPassword request) async {
    _db.isConnected ? null : await _db.open();
    try {
      final selector = where
          .eq('mail', request.mail.trim())
          .eq('password', request.passwordEncrypted);
      final userPrivateMongo = await userCollection.findOne(selector);
      if (userPrivateMongo == null) {
        final resultMail =
            await userCollection.findOne(where.eq('mail', request.mail));
        if (resultMail == null) {
          throw GrpcError.notFound();
        } else {
          throw GrpcError.invalidArgument('incorrect password');
        }
      }
      final userPrivate = UserPrivate()
        ..mergeFromProto3Json(userPrivateMongo, ignoreUnknownFields: true);
      final userPermission = UserPermissions.create()
        ..mergeFromProto3Json(
            userPrivate.permissions.toProto3Json() as Map<String, dynamic>);
      return userPermission;
    } on GrpcError catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<UserPermissions> readUserPermissionsByToken(
      ServiceCall? call, Empty request) async {
    return isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
  }

  Future<UserPrivate> _checkUserAndProtoIt(String userId) async {
    final userMongo = await userCollection.findOne(where.eq('userId', userId));
    if (userMongo == null) {
      throw GrpcError.notFound('user not found');
    }
    return UserPrivate.create()
      ..mergeFromProto3Json(userMongo, ignoreUnknownFields: true);
  }

  @override
  Future<StatusResponse> updateOneUser(
      ServiceCall? call, UserPublic request) async {
    if (request.userId.isEmpty) {
      throw GrpcError.failedPrecondition('userId cannot be empty');
    }
    if (request.userId != request.permissions.userId) {
      throw GrpcError.failedPrecondition(
          'request.userId != user.permissions.userId');
    }
    _db.isConnected ? null : await _db.open();
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    if (userPermission.userManagementRights.rights
            .any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update users');
    }
    final userPrivate = await _checkUserAndProtoIt(request.permissions.userId);
    if (userPrivate.firmId.isNotEmpty &&
        userPrivate.firmId != userPermission.firmId) {
      throw GrpcError.permissionDenied(
          'user cannot be updated because it belongs to a different firm');
    }
    return _updateUserDBExec(request);
  }

  @override
  Future<UserPublic> readOneUser(ServiceCall? call, UserId request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.userManagementRights.rights
        .none((e) => e == Right.read)) {
      throw GrpcError.permissionDenied(
          'user does not have right to read other users');
    }
    try {
      final userMongo =
          await userCollection.findOne(where.eq('userId', request.userId));
      if (userMongo == null) {
        throw GrpcError.notFound('user not found');
      }
      final user = UserPrivate()
        ..mergeFromProto3Json(userMongo, ignoreUnknownFields: true);
      final userInfo = UserPublic.create()
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
      ServiceCall? call, DeviceCredentials request) async {
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
      final chain =
          await _checkOneChainAndProtoIt(request.firmId, request.chainId);

      // TODO fetch device from boutique
      final deviceNullable = chain.devices.firstWhereOrNull((d) =>
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

      // now that we know for sure that this device is linked with a boutique
      // TODO remove below code and simply ready userpermission using deviceId (== userId)
      final user = await _readUserByUserId(request.deviceOid);

      var jwt = JsonWebToken();
      final payload = user.permissions.toProto3Json() as Map<String, dynamic>?;
      jwt.createPayload(
        user.userId,
        expireIn: const Duration(days: 1),
        payload: payload,
      );
      jwt.sign();
      final accessToken = jwt.sign();
      jwt = JsonWebToken();
      jwt.createPayload(
        user.userId,
        expireIn: Duration(days: 30),
        payload: {'userId': user.userId, 'firmId': user.firmId},
      );
      // refresh token only contains userId & firmId
      final resfreshToken = jwt.sign();
      await _updateUserLastSignIn(user.userId);
      return Tokens(accessToken: accessToken, refreshToken: resfreshToken);
    } on GrpcError catch (e) {
      print('authenticateWithDevice error $e');
      rethrow;
    }
  }

  @override
  Future<DevicePairingResponse> generateCodeForPairingDevice(
      ServiceCall? call, ChainIdAndboutiqueId request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isMock
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
  /// (in packages/fence_service/lib/src/auth_interceptor.dart)
  /// this eases pairing remotely
  /// it also imposes that a device be paired before anyone can log in, which is structuring
  /// the device will still need to be approved by admin on the web (pending)
  /// thus the risk is very low
  @override
  Future<StatusResponse> createPendingDevice(
      ServiceCall? call, PendingDeviceRequest request) async {
    final pairingResp = await _findCode(request.code);
    if (pairingResp.code == 0) {
      return StatusResponse()
        ..type = StatusResponse_Type.ERROR
        ..message = 'no match'
        ..timestamp = DateTime.now().timestampProto;
    }
    // We create the device in the boutique's chain with a false status
    try {
      final chain = await _checkOneChainAndProtoIt(
          pairingResp.firmId, pairingResp.chainId);

      // admin still need to approve device in case code leaked or else
      request.device.status = false;
      // set the boutiqueId selected by web admin
      request.device.boutiqueId = pairingResp.boutiqueId;
      request.device.id = DateTime.now().objectIdString;

      // TODO we will assign the device to a boutique
      chain.devices.add(request.device);

      final result = await userCollection.replaceOne(
        where
            .eq('firmId', pairingResp.firmId)
            .eq('chainId', pairingResp.chainId),
        chain.toProto3Json() as Map<String, dynamic>,
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
    final userPermission = isMock
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
    // TODO here we want to do x2 things
    // 1. create the device in the chain's boutique
    // 2. create the user with the same deviceId
    try {
      final chain = await _checkOneChainAndProtoIt(
          userPermission.firmId, request.chainIdAndboutiqueId.chainId);

      // TODO boutique instead of chainonly
      final deviceIndex = chain.devices.indexWhere((d) =>
          d.id == request.device.id &&
          d.boutiqueId == request.device.boutiqueId);
      if (deviceIndex == -1) {
        throw GrpcError.unknown('no device found');
      }
      chain.devices[deviceIndex].status = true;

      final result = await boutiqueCollection.replaceOne(
        where.eq('firmId', chain.firmId).eq('chainId', chain.chainId),
        chain.toProto3Json() as Map<String, dynamic>,
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
    String userId = DateTime.now().objectIdString;
    try {
      final permissions = UserPermissions.create()
        ..userId = userId
        ..limitedAccess = AccessLimited(
            boutiqueIds: BoutiqueIds(ids: [boutiqueId]),
            chainIds: ChainIds(ids: [chainId]))
        ..articleRights = RightSalesperson.article
        ..boutiqueRights = RightSalesperson.boutique
        ..contactRights = ContactRights(rights: [Right.read])
        ..ticketRights = RightSalesperson.ticket;
      final userPrivate = UserPrivate.create()
        // no password for simple cashier
        // since it won't pass password verification cannot use createOneUser so inserting in db below
        ..firmId = firmId
        ..userId = userId
        ..permissions = permissions;
      final result = await userCollection
          .insertOne(userPrivate.toProto3Json as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      final timestamp = DateTime.now().timestampProto;
      if (result.ok == 1 && result.document != null) {
        final userOid = result.document!['_id'] as ObjectId;
        return StatusResponse()
          ..id = userOid.oid
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
    final userPermission = isMock
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
      final chain = await _checkOneChainAndProtoIt(
          userPermission.firmId, request.chainId);
      final deviceIndex =
          chain.devices.indexWhere((d) => d.id == request.device.id);
      if (deviceIndex == -1) {
        throw GrpcError.unavailable('no device found');
      }
      chain.devices[deviceIndex].password = request.device.password;

      final result = await userCollection.replaceOne(
        where.eq('firmId', chain.firmId).eq('chainid', chain.chainId),
        chain.toProto3Json() as Map<String, dynamic>,
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
  Future<StatusResponse> deleteOneUser(
      ServiceCall? call, UserId request) async {
    if (request.userId.isEmpty) {
      throw GrpcError.failedPrecondition('user oid cannot be empty');
    }
    _db.isConnected ? null : await _db.open();
    final userPermission = isMock
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
          await userCollection.deleteOne(where.eq('userId', request.userId));
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  ///
  ///
  /// boutique, device, chain, firm
  ///
  ///

  /// only one firm per 'company' using weebi
  /// 1. user signup and get a userId
  /// 2. either
  ///     - A. user create a firm
  ///     - B. user joins a firm
  /// Chain and Boutique will be created by default and will use the same firmId
  /// Since createFirm also updates user permission, clientApp needs to reauthent using refresh right after
  @override
  Future<CreateFirmResponse> createFirm(
      ServiceCall? call, CreateFirmRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    // so we assign its own userId to firmOid
    // this same id will be used to create the firm in the following call
    // and will avoid re-forging a bearer token

    if (userPermission.firmRights.rights.any((e) => e == Right.create) ==
            false ||
        userPermission.firmId.isNotEmpty) {
      throw GrpcError.permissionDenied(
          'user does not have right to create firm');
    }
    // ? should we check that no other firm exist for this accouunt ?
    // set the appropriate ids

    final firmId = DateTime.now().objectIdString;
    final chain =
        Chain(firmId: firmId, chainId: firmId, name: request.name, boutiques: [
      Boutique.create()
        ..firmId = firmId
        ..chainId = firmId
        ..boutiqueId = firmId
        ..name = request.name
    ]);

    final firm = Firm(firmId: firmId, name: request.name);
    try {
      final result = await firmCollection
          .insertOne(firm.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        final permissions = UserPermissions.create()
          ..articleRights = RightsAdmin.article
          ..boutiqueRights = RightsAdmin.boutique
          ..contactRights = RightsAdmin.contact
          ..chainRights = RightsAdmin.chain
          ..firmRights = RightsAdmin.firm
          ..ticketRights = RightsAdmin.ticket
          ..boolRights = RightsAdmin.boolRights
          ..userManagementRights = RightsAdmin.userManagement
          ..billingRights = RightsAdmin.billing
          ..firmId = firmId
          ..userId = userPermission.userId;

        try {
          await _updateUserFirmIdAndPermissionsDBExec(
              userPermission.userId, firmId, permissions);
        } on GrpcError catch (e) {
          print(e);
          rethrow;
        }

        //TODO : make token invalid to force new auth
        final _id = result.document!['_id'] as ObjectId;
        return CreateFirmResponse(
          statusResponse: StatusResponse.create()
            ..type = StatusResponse_Type.CREATED
            ..id = _id.oid
            ..timestamp = DateTime.now().timestampProto,
          firm: firm,
        );
      } else {
        return CreateFirmResponse(
            statusResponse: StatusResponse.create()
              ..type = StatusResponse_Type.ERROR
              ..message = 'result.ok != 1 || result.document == null'
              ..timestamp = DateTime.now().timestampProto);
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

  Future<StatusResponse> _updateUserFirmIdAndPermissionsDBExec(
      String userId, String firmId, UserPermissions permissions) async {
    try {
      print('d');
      await userCollection.update(
        where.eq('userId', userId),
        ModifierBuilder().set('firmId', firmId).set(
            'permissions', permissions.toProto3Json() as Map<String, dynamic>),
      );

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

  Future<StatusResponse> _updateUserDBExec(UserPublic user) async {
    try {
      final result = await userCollection.update(
        where.eq('userId', user.userId),
        ModifierBuilder()
            .set('firstname', user.firstname)
            .set('lastname', user.lastname)
            .set('mail', user.mail)
            .set('phone', user.phone.toProto3Json() as Map<String, dynamic>)
            .set('permissions',
                user.permissions.toProto3Json() as Map<String, dynamic>),
      );
      print('_updateUserDBExec result $result');
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
  Future<Firm> readOneFirm(ServiceCall? call, Empty request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.firmRights.rights.any((e) => e == Right.read) == false) {
      throw GrpcError.permissionDenied('user does not have right to read firm');
    }
    try {
      final firmMongo = await firmCollection
          .findOne(where.eq('firmId', userPermission.firmId));
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
    final firmMongo = await firmCollection
        .findOne(where.eq('firmId', (userPermissions.firmId)));
    if (firmMongo == null) {
      throw GrpcError.notFound('firm not found');
    }
    return Firm.create()
      ..mergeFromProto3Json(firmMongo, ignoreUnknownFields: true);
  }

  Future<List<Chain>> _checkChainsAndProtoThem(
      UserPermissions userPermissions) async {
    try {
      final chainsMongo = await boutiqueCollection
          .find(where.eq('firmId', userPermissions.firmId))
          .toList();
      if (chainsMongo.isEmpty) {
        throw GrpcError.notFound('chain(s) not found');
      }
      final chains = <Chain>[];
      for (final chainMongo in chainsMongo) {
        chains.add(Chain.create()
          ..mergeFromProto3Json(chainMongo, ignoreUnknownFields: true));
      }
      return chains;
    } on GrpcError catch (e) {
      print('_findChainsAndProtoThem $e');
      rethrow;
    }
  }

  Future<Chain> _checkOneChainAndProtoIt(String firmId, String chainId) async {
    try {
      final chainMongo = await boutiqueCollection
          .findOne(where.eq('firmId', firmId).eq('chainId', chainId));
      if (chainMongo == null) {
        throw GrpcError.notFound('chain not found');
      }
      return Chain.create()
        ..mergeFromProto3Json(chainMongo, ignoreUnknownFields: true);
    } on GrpcError catch (e) {
      print('_findChainsAndProtoThem $e');
      rethrow;
    }
  }

  Future<List<String>> _readAllBoutiquesInChain(UserPrivate user) async {
    _db.isConnected ? null : await _db.open();
    final chains = await _checkChainsAndProtoThem(user.permissions);
    final boutiques = <Boutique>[];
    for (final requestchainId in user.permissions.limitedAccess.chainIds.ids) {
      for (final chain in chains) {
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
    return boutiques.map((e) => e.boutiqueId).toList();
  }

  @override
  Future<StatusResponse> createOneBoutique(
      ServiceCall? call, Boutique request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    if (userPermission.boutiqueRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create boutique');
    }
    if (userPermission.isFirmAndChainAccessible(
            request.firmId, request.chainId) ==
        false) {
      throw GrpcError.permissionDenied(
          'user cannot create data for firm ${request.firmId} or chain ${request.chainId}');
    }

    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);

    chain.boutiques.add(request);
    try {
      final result = await boutiqueCollection.replaceOne(
        where.eq('firmId', request.firmId).eq('chainId', request.chainId),
        chain.toProto3Json() as Map<String, dynamic>,
        upsert: true,
      );
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        print(result.document.toString());
        final mongoChainId = result.document!['_id'] as ObjectId;
        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..id = mongoChainId.oid
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
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    if (userPermission.chainRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create chain');
    }

    if (request.firmId.isEmpty) {
      throw GrpcError.failedPrecondition('request.firmId cannot be empty');
    }
    if (request.firmId != userPermission.firmId) {
      throw GrpcError.permissionDenied(
          'user cannot access firm ${request.firmId}');
    }

    try {
      final result = await boutiqueCollection
          .insertOne(request.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        final chainOid = result.document!['_id'] as ObjectId;
        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..id = chainOid.oid
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
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    if (userPermission.boutiqueRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update boutique');
    }
    if (userPermission.isFirmAndChainAccessible(
            request.firmId, request.chainId) ==
        false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from firm ${request.firmId} or chain ${request.chainId}');
    }

    try {
      final chain =
          await _checkOneChainAndProtoIt(request.firmId, request.chainId);
      final boutiqueIndex =
          chain.boutiques.indexWhere((e) => e.boutiqueId == request.boutiqueId);
      if (boutiqueIndex == -1) {
        throw GrpcError.notFound('boutique not found');
      }
      chain.boutiques[boutiqueIndex] = request;

      final result = await boutiqueCollection.replaceOne(
        where.eq('firmId', request.firmId).eq('chainId', request.chainId),
        chain.toProto3Json() as Map<String, dynamic>,
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
    final userPermission = isMock
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
    if (userPermission.isFirmAndChainAccessible(
            request.firmId, request.chainId) ==
        false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from firm ${request.firmId} or chain ${request.chainId}');
    }

    try {
      final chain =
          await _checkOneChainAndProtoIt(request.firmId, request.chainId);
      final result = await boutiqueCollection.replaceOne(
        where.eq('firmId', request.firmId).eq('chainId', request.chainId),
        chain.toProto3Json() as Map<String, dynamic>,
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
  Future<StatusResponse> deleteOneDevice(
      ServiceCall? call, DeleteDeviceRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isMock
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
      final chain = await _checkOneChainAndProtoIt(
          userPermission.firmId, request.chainId);
//TODO use boutique here instead
      final deviceIndex = chain.devices.indexWhere((d) =>
          d.serialNumber == request.device.serialNumber &&
          d.boutiqueId == request.device.boutiqueId);
      if (deviceIndex == -1) {
        throw GrpcError.unavailable('no device found');
      }
      chain.devices.removeAt(deviceIndex);
      final result = await boutiqueCollection.replaceOne(
        where
            .eq('firmId', userPermission.firmId)
            .eq('chainId', request.chainId),
        chain.toProto3Json() as Map<String, dynamic>,
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
  Future<Devices> readDevices(
      ServiceCall? call, ReadDeviceRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    // TODO: device rights are not simple/clear
    if (userPermission.boutiqueRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read devices');
    }
    if (request.chainId.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      final chain = await _checkOneChainAndProtoIt(
          userPermission.firmId, request.chainId);
      final devices = <Device>[];
      for (final device in chain.devices) {
        devices.add(device);
      }
      return Devices(devices: devices);
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<SignUpResponse> signUp(
      ServiceCall? call, SignUpRequest request) async {
    final mailAndEncyptedPassword = _checkCredentials(
        Credentials(mail: request.mail, password: request.password));
    _db.isConnected ? null : await _db.open();

    final user = await _isMailAlreadyUsed(mailAndEncyptedPassword.mail);
    if (user.userId.isNotEmpty) {
      if (_isPendingUser(user)) {
        return await _updatePendingUser(
            user, mailAndEncyptedPassword.passwordEncrypted);
      } else {
        // user signed it at least once
        throw GrpcError.failedPrecondition('mail is not available');
      }
    }
    try {
      // mail/user does not exist AND is not a pending user
      final userId = DateTime.now().objectIdString;
      final permissions = UserPermissions(
          userId: userId, firmRights: FirmRights(rights: [Right.create]));
      final userPrivate = UserPrivate(
          userId: userId,
          permissions: permissions,
          passwordEncrypted: mailAndEncyptedPassword.passwordEncrypted,
          mail: request.mail,
          firstname: request.firstname,
          lastname: request.lastname);

      final result = await userCollection
          .insertOne(userPrivate.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      final timestamp = DateTime.now().timestampProto;
      if (result.ok == 1 && result.document != null) {
        final _id = result.document!['_id'] as ObjectId;
        return SignUpResponse(
            statusResponse: StatusResponse()
              ..id = _id.oid
              ..type = StatusResponse_Type.CREATED
              ..timestamp = timestamp,
            userId: userId);
      } else {
        return SignUpResponse(
            statusResponse: StatusResponse()
              ..type = StatusResponse_Type.ERROR
              ..timestamp = timestamp);
      }
    } on GrpcError catch (e) {
      log('user mail ${request.mail} signup error: $e');
      rethrow;
    }
  }

  /// returns empty user if not found
  Future<UserPublic> _isMailAlreadyUsed(String mail) async {
    try {
      final userMap = await userCollection.findOne(where.eq('mail', mail));
      if (userMap != null) {
        return UserPublic.create()
          ..mergeFromProto3Json(userMap, ignoreUnknownFields: true);
      } else {
        return UserPublic.create();
      }
    } catch (e) {
      log('isMailAlreadyUsed $e');
      throw e;
    }
  }

  /// User created by a firm manager are pending until they sign in
  /// lastSignIn is updated in all auth calls
  bool _isPendingUser(UserPublic user) =>
      user.lastSignIn.seconds == 0 && user.permissions.firmId.isNotEmpty;

  // user was created by someone at ${user.permissions.firmId}
  // so when user signs up we only update password
  // if user was created by mistake, he/she can quit/delete profile to start fresh signup
  Future<SignUpResponse> _updatePendingUser(
      UserPublic user, String passwordEncrypted) async {
    try {
      await userCollection.update(where.eq('userId', user.userId),
          ModifierBuilder().set('password', passwordEncrypted),
          upsert: true);
      return SignUpResponse(
          statusResponse: StatusResponse()
            ..message =
                'pendingUser from firm ${user.permissions.firmId}, just log in to access it'
            ..type = StatusResponse_Type.UPDATED
            ..timestamp = DateTime.now().timestampProto,
          userId: user.userId);
    } catch (e) {
      log('error $e');
      throw e;
    }
  }

  @override
  Future<ReadAllChainsResponse> readAllChains(
      ServiceCall? call, Empty request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.chainRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read chain');
    }

    final chains = await _checkChainsAndProtoThem(userPermission);
    return ReadAllChainsResponse(chains: chains);
  }
}
