import 'dart:developer';
import 'dart:async';
import 'dart:math' show Random;

import 'package:collection/collection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:mongo_dart/mongo_dart.dart' hide Timestamp;
import 'package:protos_weebi/extensions.dart';

import 'package:protos_weebi/grpc.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

import 'package:fence_service/fence_service.dart';

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
        firmCollection = _db.collection(firmCollectionName) {
    _db.isConnected ? null : _db.open();
  }

  @override
  Future<PendingUserResponse> createPendingUser(
      ServiceCall? call, PendingUserRequest request) async {
    final mailChecked = _checkMail(request.mail);
    _db.isConnected ? null : await _db.open();

    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

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
        throw GrpcError.invalidArgument('mail is alreadyUsed');
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
        final userId = result.document!['userId'];
        //print('userId.runtimeType ${userId.runtimeType}');

        final userPublic = UserPublic.create()
          ..mergeFromProto3Json(
              (userPrivate.toProto3Json() as Map<String, dynamic>),
              ignoreUnknownFields: true);

        return PendingUserResponse(
            statusResponse: StatusResponse()
              ..id = userId
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
    _db.isConnected ? null : await _db.open();
    try {
      final mailAndEncyptedPassword = _checkCredentials(request);

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
      _updateUserLastSignIn;
      return Tokens(accessToken: accessToken, refreshToken: resfreshToken);
    } on GrpcError catch (e) {
      log('authenticate error $e');
      rethrow;
    }
  }

  Future<void> _updateUserLastSignIn(String userId) async {
    _db.isConnected ? null : await _db.open();
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
      rethrow;
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
      throw GrpcError.invalidArgument('password is a bit too short');
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
      _db.isConnected ? null : await _db.open();
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
    try {
      final userPrivate = await userCollection.findOne(
        where.eq('userId', userId),
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
      throw GrpcError.invalidArgument('userId cannot be empty');
    }
    if (request.userId != request.permissions.userId) {
      throw GrpcError.invalidArgument(
          'request.userId != user.permissions.userId');
    }
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    if (userPermission.userManagementRights.rights
            .any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update users');
    }
    _db.isConnected ? null : await _db.open();
    final userPrivate = await _checkUserAndProtoIt(request.permissions.userId);
    if (userPrivate.firmId.isNotEmpty &&
        userPrivate.firmId != userPermission.firmId) {
      throw GrpcError.permissionDenied(
          'user cannot be updated because it belongs to a different firm');
    }
    return _updateUserDBExec(request);
  }

  @override
  Future<ReadOneUserResponse> readOneUser(
      ServiceCall? call, UserId request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.userManagementRights.rights
        .none((e) => e == Right.read)) {
      throw GrpcError.permissionDenied(
          'user does not have right to read other users');
    }
    _db.isConnected ? null : await _db.open();
    try {
      final userMongo =
          await userCollection.findOne(where.eq('userId', request.userId));
      if (userMongo == null) {
        throw GrpcError.notFound('user not found');
      }

      final userFound = UserPublic.create()
        ..mergeFromProto3Json(userMongo, ignoreUnknownFields: true);

      // if requestor has limited access we check that the userFound belongs to his/her fence
      if (userPermission.fullAccess.hasFullAccess == false) {
        // if userFound has no access then it is visible and will be returned
        // allowing managers to easily redefine their accesses
        if (userFound.permissions.limitedAccess.chainIds.ids.isNotEmpty ||
            userFound.permissions.limitedAccess.boutiqueIds.ids.isNotEmpty) {
          // need to filter to display only users that are within requestor's "fence"
          // iterator over requestor's chains
          for (final visibleChain
              in userPermission.limitedAccess.chainIds.ids) {
            if (userFound.permissions.limitedAccess.chainIds.ids
                .none((chainId) => chainId == visibleChain)) {
              return ReadOneUserResponse.create()
                ..statusResponse = StatusResponse(
                    type: StatusResponse_Type.ERROR,
                    message: 'one user found but belong to a different chain');
            } else {
              // userFound && request share at least one chain
              // we iterate over the requestor available boutiques
              for (final visibleBoutiques
                  in userPermission.limitedAccess.boutiqueIds.ids) {
                if (userFound.permissions.limitedAccess.boutiqueIds.ids
                    .none((id) => id == visibleBoutiques)) {
                  return ReadOneUserResponse.create()
                    ..statusResponse = StatusResponse(
                        type: StatusResponse_Type.ERROR,
                        message:
                            'one user found in the same chain but in a boutique beyond your access');
                }
              }
            }
          }
        }
      }
      // password will not be passed because does not exist in Userpublic
      return ReadOneUserResponse(
          user: userFound,
          statusResponse: StatusResponse(type: StatusResponse_Type.SUCCESS));
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
    if (request.firmId.isEmpty) {
      throw GrpcError.invalidArgument('firmId.isEmpty');
    }
    if (request.chainId.isEmpty) {
      throw GrpcError.invalidArgument('chainId.isEmpty');
    }
    if (request.deviceId.isEmpty) {
      throw GrpcError.invalidArgument('deviceId.isEmpty');
    }
    try {
      _db.isConnected ? null : await _db.open();
      final chain =
          await _checkOneChainAndProtoIt(request.firmId, request.chainId);

      final boutique = chain.boutiques.firstWhereOrNull((btq) =>
          btq.boutiqueId == request.boutiqueId &&
          btq.chainId == request.chainId &&
          btq.firmId == request.firmId);

      if (boutique == null) {
        throw GrpcError.notFound(
            'did not find boutique matching device firmId,chainId,boutiqueId');
      }

      final device = boutique.devices.firstWhereOrNull((d) =>
          d.chainId == request.chainId &&
          d.boutiqueId == request.boutiqueId &&
          d.deviceId == request.deviceId);

      if (device == null) {
        throw GrpcError.notFound();
      }
      if (device.password != request.password) {
        throw GrpcError.invalidArgument('incorrect password');
      }
      if (device.status != true) {
        throw GrpcError.invalidArgument('deactivated device');
      }

      // now that we know for sure this device is linked with a boutique
      // we can load the default cashier user available for this device
      final user = await _readUserByUserId(request.deviceId);

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
  Future<CodeForPairingDevice> generateCodeForPairingDevice(
      ServiceCall? call, ChainIdAndboutiqueId request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    // chain rights encompass device pairing
    if (userPermission.chainRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to pair device (missing chainRights)');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      _db.isConnected ? null : await _db.open();

      /// make sure we do not use an already existing code
      var code = 0;
      var d = CodeForPairingDevice.create();
      do {
        code = _createCode();
        d = await _findCode(code);
      } while (code == d.code);

      final millis = DateTime.now().millisecond;
      final timestamp = Timestamp()
        ..seconds = Int64(millis)
        ..nanos = (millis % 1000) * 1000000;
      final temp = CodeForPairingDevice.create()
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

  Future<CodeForPairingDevice> _findCode(int code) async {
    try {
      final d = await pairingCodesCollection.findOne(where.eq('code', code));
      return CodeForPairingDevice.create()
        ..mergeFromProto3Json(d, ignoreUnknownFields: true);
    } on MongoDartError catch (e) {
      print('_isCodeInDb error $e');
      rethrow;
    }
  }

  /// authent is not checked since no user is authentified on device
  /// (in packages/fence_service/lib/src/auth_interceptor.dart)
  /// this eases pairing remotely
  /// this means that a device needs to be paired before anyone can log in
  /// the device will still need to be approved by admin on the web (pending)
  /// mitigating the risk of a device added without admin consent
  @override
  Future<CreatePendingDeviceResponse> createPendingDevice(
      ServiceCall? call, PendingDeviceRequest request) async {
    _db.isConnected ? null : await _db.open();
    final pairingResp = await _findCode(request.code);
    if (pairingResp.code == 0) {
      return CreatePendingDeviceResponse(
          statusResponse: StatusResponse(
              type: StatusResponse_Type.ERROR,
              message: 'no match',
              timestamp: DateTime.now().timestampProto));
    }
    try {
      // get chain info
      final chain = await _checkOneChainAndProtoIt(
          pairingResp.firmId, pairingResp.chainId);

      final boutiqueIndex = chain.boutiques.indexWhere((btq) =>
          btq.chainId == request.device.chainId &&
          btq.boutiqueId == request.device.boutiqueId);

      if (boutiqueIndex == -1) {
        throw GrpcError.notFound('no boutique found with this device info');
      }
      // We create the device in the boutique's chain with a false status
      // admin still need to approve device in case code leaked or else
      request.device.status = false;
      request.device.password = '';
      request.device.dateCreation = DateTime.now().timestampProto;
      // set the boutiqueId selected by web admin
      request.device.boutiqueId = pairingResp.boutiqueId;
      request.device.deviceId = DateTime.now().objectIdString;

      chain.boutiques[boutiqueIndex].devices.add(request.device);

      final result = await _updateOneChainDBExec(chain);

      // _cleanPairingCodes
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
      return CreatePendingDeviceResponse(
          statusResponse: StatusResponse(
              type: StatusResponse_Type.CREATED, timestamp: result.timestamp),
          firmId: chain.firmId,
          chainId: chain.chainId,
          boutiqueId: request.device.boutiqueId,
          deviceId: request.device.deviceId);
    } on GrpcError catch (e) {
      print('pairOneDevice error $e');
      rethrow;
    }
  }

  // once approved a device == user with minimum rights to ease app handling
  // see UserService.authenticateWithDevice & UserService.updateDevicePassword
  @override
  Future<StatusResponse> approveDevice(
      ServiceCall? call, ApproveDeviceRequest request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    // chain rights encompass device pairing
    if (userPermission.chainRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to pair device (missing chainRights)');
    }
    if (userPermission.isChainAccessible(request.device.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.device.chainId}');
    }
    _db.isConnected ? null : await _db.open();
    // here we do x2 things :
    // 1. create the device in the chain's boutique
    // 2. create the user with the same deviceId
    final chain = await _checkOneChainAndProtoIt(
        userPermission.firmId, request.device.chainId);

    final btqIndexDeviceIndex =
        chain.boutiqueIndexAndDeviceIndex(request.device);

    chain.boutiques[btqIndexDeviceIndex.boutiqueIndex]
        .devices[btqIndexDeviceIndex.deviceIndex].status = true;

    // create user for simple auth
    await _createDefaultDeviceCashier(
        userPermission.firmId,
        request.device.chainId,
        request.device.boutiqueId,
        request.device.deviceId);

    return await _updateOneChainDBExec(chain);
  }

  Future<StatusResponse> _createDefaultDeviceCashier(
      String firmId, String chainId, String boutiqueId, String deviceId) async {
    /// we use same value for deviceId and userId, making it easy to track "default cashier users"
    try {
      final permissions = UserPermissions.create()
        ..userId = deviceId
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
        ..userId = deviceId
        ..permissions = permissions;
      final userPrivateJson =
          userPrivate.toProto3Json() as Map<String, dynamic>;
      final result = await userCollection.insertOne(userPrivateJson);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      final timestamp = DateTime.now().timestampProto;
      if (result.ok == 1 && result.document != null) {
        final userOid = result.document!['userId'];
        return StatusResponse()
          ..id = userOid
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
  Future<StatusResponse> updateDevicePassword(
      ServiceCall? call, UpdateDevicePasswordRequest request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    // chain rights encompass device pairing
    if (userPermission.chainRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to pair device (missing chainRights)');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    _db.isConnected ? null : await _db.open();
    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);

    final boutiqueIndexAndDeviceIndex =
        chain.boutiqueIndexAndDeviceIndex(request.device);

    chain
        .boutiques[boutiqueIndexAndDeviceIndex.boutiqueIndex]
        .devices[boutiqueIndexAndDeviceIndex.deviceIndex]
        .password = request.device.password;

    try {
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
      throw GrpcError.invalidArgument('user oid cannot be empty');
    }
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.userManagementRights.rights
            .any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete users');
    }

    _db.isConnected ? null : await _db.open();
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
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    // so we assign its own userId to firmOid
    // this same id will be used to create the firm in the following call
    // and will avoid re-forging a bearer token

    if (userPermission.firmRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create firm');
    }

    if (userPermission.firmId.isNotEmpty) {
      throw GrpcError.permissionDenied(
          'userPermissions already contain firmId');
    }
    // ? should we check that no other firm exist for this accouunt ?
    // set the appropriate ids

    _db.isConnected ? null : await _db.open();
    final firmId = DateTime.now().objectIdString;
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
          ..userId = userPermission.userId
          ..fullAccess = AccessFull(hasFullAccess: true);

        try {
          await _updateUserFirmIdAndPermissionsDBExec(
              userPermission.userId, firmId, permissions);
        } on GrpcError catch (e) {
          print('createFirm _updateUserFirmIdAndPermissionsDBExec error $e');
          rethrow;
        }

        final chain = Chain(
            firmId: firmId,
            chainId: firmId,
            name: request.name,
            boutiques: [
              Boutique.create()
                ..firmId = firmId
                ..chainId = firmId
                ..boutiqueId = firmId
                ..name = request.name
            ]);

        try {
          await _createOneChainDBExec(chain);
        } on GrpcError catch (e) {
          print('createFirm _createOneChainDBExec error $e');
          rethrow;
        }
        return CreateFirmResponse(
          statusResponse: StatusResponse.create()
            ..type = StatusResponse_Type.CREATED
            ..id = firmId
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
      await userCollection.update(
        where.eq('userId', user.userId),
        ModifierBuilder()
            .set('firstname', user.firstname)
            .set('lastname', user.lastname)
            .set('mail', user.mail)
            .set('phone', user.phone.toProto3Json() as Map<String, dynamic>)
            .set('permissions',
                user.permissions.toProto3Json() as Map<String, dynamic>),
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

  @override
  Future<Firm> readOneFirm(ServiceCall? call, Empty request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.firmRights.rights.any((e) => e == Right.read) == false) {
      throw GrpcError.permissionDenied('user does not have right to read firm');
    }
    try {
      _db.isConnected ? null : await _db.open();
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

  // Future<Firm> _checkFirmAndProtoIt(UserPermissions userPermissions) async {
  //   final firmMongo = await firmCollection
  //       .findOne(where.eq('firmId', (userPermissions.firmId)));
  //   if (firmMongo == null) {
  //     throw GrpcError.notFound('firm not found');
  //   }
  //   return Firm.create()
  //     ..mergeFromProto3Json(firmMongo, ignoreUnknownFields: true);
  // }

  Future<List<Chain>> _checkChainsAndProtoThem(
      UserPermissions userPermissions) async {
    try {
      final chainsMongo = await boutiqueCollection
          .find(where.eq('firmId', userPermissions.firmId))
          .toList();
      if (chainsMongo.isEmpty) {
        return [];
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
        throw GrpcError.notFound(
            'chain not found firmId: $firmId chainId:$chainId');
      }
      return Chain.create()
        ..mergeFromProto3Json(chainMongo, ignoreUnknownFields: true);
    } on GrpcError catch (e) {
      print('_checkOneChainAndProtoIt $e');
      rethrow;
    }
  }

  // Future<List<String>> _readAllBoutiquesInChain(UserPrivate user) async {
  //   final chains = await _checkChainsAndProtoThem(user.permissions);
  //   final boutiques = <Boutique>[];
  //   for (final requestchainId in user.permissions.limitedAccess.chainIds.ids) {
  //     for (final chain in chains) {
  //       if (requestchainId == chain.chainId) {
  //         for (final boutique in chain.boutiques) {
  //           if (boutique.firmId == user.firmId &&
  //               boutique.chainId == requestchainId) {
  //             boutiques.add(boutique);
  //           }
  //         }
  //       }
  //     }
  //   }
  //   return boutiques.map((e) => e.boutiqueId).toList();
  // }

  @override
  Future<StatusResponse> createOneBoutique(
      ServiceCall? call, Boutique request) async {
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
    _db.isConnected ? null : await _db.open();
    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);

    chain.boutiques.add(request);

    final result = await _updateOneChainDBExec(chain);

    if (result.type == StatusResponse_Type.UPDATED) {
      return StatusResponse.create()
        ..type = StatusResponse_Type.CREATED
        ..timestamp = DateTime.now().timestampProto;
    } else {
      throw GrpcError.unknown('createOneBoutique chainUpdate error $result');
    }
  }

  @override
  Future<StatusResponse> createOneChain(
      ServiceCall? call, Chain request) async {
    if (request.firmId.isEmpty) {
      throw GrpcError.invalidArgument('request.firmId cannot be empty');
    }
    if (request.boutiques.length > 1) {
      throw GrpcError.invalidArgument('create chain with 1 boutique only');
    }
    if (request.boutiques.first.firmId != request.firmId) {
      throw GrpcError.invalidArgument(
          'boutique.firmId must match the chain.firmId');
    }
    if (request.boutiques.first.chainId != request.chainId) {
      throw GrpcError.invalidArgument(
          'boutique.chainId must match the chainId');
    }

    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    // check permissions
    if (userPermission.chainRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create chain');
    }
    if (request.firmId != userPermission.firmId) {
      throw GrpcError.permissionDenied(
          'user cannot access firm ${request.firmId}');
    }
    _db.isConnected ? null : await _db.open();
    final chainId = DateTime.now().objectIdString;
    request.chainId = chainId;
    request.boutiques.first
      ..firmId = request.firmId
      ..chainId = chainId
      ..boutiqueId = chainId;
    return await _createOneChainDBExec(request);
  }

  Future<StatusResponse> _createOneChainDBExec(Chain chain) async {
    try {
      final result = await boutiqueCollection
          .insertOne(chain.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        final chainId = result.document!['chainId'];
        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..id = chainId
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
    if (request.boutiqueId.isEmpty) {
      throw GrpcError.invalidArgument('boutiqueId cannot be empty');
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

    _db.isConnected ? null : await _db.open();
    final chain =
        await _checkOneChainAndProtoIt(request.firmId, request.chainId);
    final boutiqueIndex =
        chain.boutiques.indexWhere((e) => e.boutiqueId == request.boutiqueId);
    if (boutiqueIndex == -1) {
      throw GrpcError.notFound('boutique not found');
    }
    chain.boutiques[boutiqueIndex] = request;

    return await _updateOneChainDBExec(chain);
  }

  @override
  Future<StatusResponse> updateOneChain(
      ServiceCall? call, Chain request) async {
    if (request.firmId.isEmpty) {
      throw GrpcError.invalidArgument('request.firmId cannot be empty');
    }
    if (request.boutiques.any((b) => b.firmId != request.firmId)) {
      throw GrpcError.invalidArgument(
          'each boutique.firmId must match the chain.firmId');
    }
    if (request.boutiques.any((b) => b.chainId != request.chainId)) {
      throw GrpcError.invalidArgument(
          'each boutique.chainId must match the chainId');
    }

    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (request.chainId.isEmpty) {
      throw GrpcError.invalidArgument('chain id cannot be empty');
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
    _db.isConnected ? null : await _db.open();
    return await _updateOneChainDBExec(request);
  }

  Future<StatusResponse> _updateOneChainDBExec(Chain chain) async {
    try {
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
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    // chain rights encompass device pairing
    if (userPermission.chainRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete device');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    _db.isConnected ? null : await _db.open();
    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);
    // find the device
    final btqIndexDeviceIndex =
        chain.boutiqueIndexAndDeviceIndex(request.device);
    // remove device
    chain.boutiques[btqIndexDeviceIndex.boutiqueIndex].devices
        .removeAt(btqIndexDeviceIndex.deviceIndex);
    // update chain in db

    return await _updateOneChainDBExec(chain);
  }

  @override
  Future<Devices> readDevices(
      ServiceCall? call, ReadDevicesRequest request) async {
    if (request.chainId.isEmpty) {
      throw GrpcError.invalidArgument('chainId cannot be empty');
    }
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    if (userPermission.boutiqueRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read boutiques/devices');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    _db.isConnected ? null : await _db.open();
    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);

    final devices = <Device>[];
    for (final boutique in chain.boutiques) {
      if (userPermission.isBoutiqueAccessible(boutique.boutiqueId)) {
        for (final device in boutique.devices) {
          if (device.chainId == request.chainId &&
              device.boutiqueId == boutique.boutiqueId) {
            devices.add(device);
          }
        }
      }
    }
    return Devices(devices: devices);
  }

  @override
  Future<SignUpResponse> signUp(ServiceCall call, SignUpRequest request) async {
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
        throw GrpcError.invalidArgument('mail is not available');
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
        final userId = result.document!['userId'];
        return SignUpResponse(
            statusResponse: StatusResponse()
              ..id = userId
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
      rethrow;
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
      rethrow;
    }
  }

  @override
  Future<ReadAllChainsResponse> readAllChains(
      ServiceCall? call, Empty request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.chainRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read chain');
    }
    _db.isConnected ? null : await _db.open();
    final chains = await _checkChainsAndProtoThem(userPermission);
    return ReadAllChainsResponse(chains: chains);
  }

  @override
  Future<StatusResponse> updateUserPassword(
      ServiceCall? call, PasswordUpdateRequest request) async {
    if (request.firmId.isEmpty ||
        request.userId.isEmpty ||
        request.password.isEmpty) {
      throw GrpcError.invalidArgument(
          'firmId / userId / password cannot be empty');
    }

    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    if (userPermission.userManagementRights.rights
            .any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update user');
    }
    if (userPermission.isFirmAccessible(request.firmId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from firm ${request.firmId}');
    }

    final passwordEncrypted = _checkAndEncryptPassword(request.password);

    try {
      _db.isConnected ? null : await _db.open();
      await userCollection.update(
          where.eq('firmId', request.firmId).eq('userId', request.userId),
          ModifierBuilder().set('password', passwordEncrypted));
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
  Future<UsersPublic> readAllUsers(ServiceCall call, Empty request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;

    if (userPermission.userManagementRights.rights
            .any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read users');
    }
    try {
      _db.isConnected ? null : await _db.open();
      final usersMongo = await userCollection
          .find(where.eq('firmId', userPermission.firmId))
          .toList();
      if (usersMongo.isEmpty) {
        return UsersPublic(users: []);
      }
      final users = <UserPublic>[];
      for (final userMongo in usersMongo) {
        users.add(UserPublic.create()
          ..mergeFromProto3Json(userMongo, ignoreUnknownFields: true));
      }

      if (userPermission.fullAccess.hasFullAccess) {
        return UsersPublic(users: users);
      }
      // if requestor has limitedAccess we retain only users that belong to his/her "fence"
      final usersFiltered = users
        ..retainWhere((userFound) {
          // userFound without any access are included
          // allowing managers to easily redefine their accesses
          if (userFound.permissions.limitedAccess.chainIds.ids.isNotEmpty ||
              userFound.permissions.limitedAccess.boutiqueIds.ids.isNotEmpty) {
            return true;
          }
          // iterate over requestor's chains
          for (final visibleChain
              in userPermission.limitedAccess.chainIds.ids) {
            if (userFound.permissions.limitedAccess.chainIds.ids
                .any((chainId) => chainId == visibleChain)) {
              // userFound && requestor share at least one chain
              // we iterate over the requestor's boutiques
              for (final visibleBoutiques
                  in userPermission.limitedAccess.boutiqueIds.ids) {
                if (userFound.permissions.limitedAccess.boutiqueIds.ids
                    .any((id) => id == visibleBoutiques)) {
                  return true;
                }
              }
            }
          }
          return false;
        });
      return UsersPublic(users: usersFiltered);
    } on GrpcError catch (e) {
      print('readOne error $e');
      rethrow;
    }
  }

  /// webApp admin listens to this stream awaiting pendingDevice to be created
  /// during 2 minutes, duration arbitrarily chosen
  @override
  Future<Device> readOnePendingDevice(
      ServiceCall call, ReadDeviceBtqRequest request) async {
    if (request.chainId.isEmpty) {
      throw GrpcError.invalidArgument('chainId cannot be empty');
    }
    if (request.boutiqueId.isEmpty) {
      throw GrpcError.invalidArgument('boutiqueId cannot be empty');
    }

    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.boutiqueRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read boutiques/devices');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    if (userPermission.isBoutiqueAccessible(request.boutiqueId) == false) {
      throw GrpcError.permissionDenied(
          'user does not have access to read boutique ${request.boutiqueId}');
    }
    _db.isConnected ? null : await _db.open();

    /// ***Mongodb_dart context***
    /// As the change stream return a "fullDocument" and all
    /// checks are made on this document, all field names must be prefixed
    /// with "fullDocument" (see below: 'fullDocument.custId')
    ///
    /// Inside the Match stage there is the query operator "oneFrom" that corresponds to "$in"
    ///
    /// *** Note***
    /// If you use a SelectorBuilder the Match stage requires a Map,
    /// so you have to extract the map with ".map['\$query']"
    final pipeline = AggregationPipelineBuilder().addStage(Match(
        where.eq('fullDocument.chainId', request.chainId).map['\$query']));

    /// If you look for updates is better to set "fullDocument" to "updateLookup"
    /// otherwise the returned document will contain only the changed fields
    /// also, since the pipeline control is made on the document processed,
    /// If the document does not contains the field to be verified the event vill not be fired.
    /// In our case, if we do not specify 'updateLookup' the returned document
    /// will not contain the 'chainId' field and the match will not be performed (no event returned)
    final stream = boutiqueCollection.watch(pipeline,
        changeStreamOptions: ChangeStreamOptions(fullDocument: 'updateLookup'));

    bool pleaseClose = false;

    /// As the stream does not end until it is closed, do not use .toList()
    /// or you will wait indefinitely
    Device device = Device.create();
    Chain chainUpdated = Chain.create();
    final controller = stream.listen((changeEvent) {
      final fullDocument = changeEvent.fullDocument ?? <String, dynamic>{};

      print('Detected change for "chainId" '
          '${fullDocument['chainId']}: "${fullDocument['name']}"');
      chainUpdated.mergeFromProto3Json(fullDocument, ignoreUnknownFields: true);

      if (chainUpdated.boutiques.isNotEmpty) {
        final boutique = chainUpdated.boutiques
            .firstWhereOrNull((b) => b.boutiqueId == request.boutiqueId);
        if (boutique != null) {
          final devices = boutique.devices.where((d) =>
              d.chainId == request.chainId &&
              d.boutiqueId == request.boutiqueId &&
              d.status == false);
          if (devices.isEmpty) {
            // another event first occured on chain, too bad really
            // since adding recursity here would be far-fetched
            // we will simply redirect webapp to devices page
          } else if (devices.length == 1) {
            device = devices.first;
          } else {
            /// latest device prevails, high chance the other ones are not pending but disabled
            devices.toList().sort((a, b) =>
                a.dateCreation.seconds.compareTo(b.dateCreation.seconds));
            device = devices.first;
          }
        }
      }
      pleaseClose = true;
    });

    var waitingCount = 0;
    await Future.doWhile(() async {
      if (pleaseClose) {
        print('Change detected, closing stream and db.');

        /// This is the correct way to cancel the watch subscription
        await controller.cancel();
        return false;
      }
      print('Waiting for change to be detected...');
      await Future.delayed(Duration(seconds: 2));
      waitingCount++;
      if (waitingCount > 60) {
        throw GrpcError.deadlineExceeded(
            'no change on chainId ${request.chainId} for the past 2 minutes, retry');
      }
      return true;
    });
    if (device.boutiqueId.isNotEmpty) {
      return device;
    } else {
      throw GrpcError.notFound('no pendingDevice found');
    }
  }
}
