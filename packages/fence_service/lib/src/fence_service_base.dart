import 'dart:developer';
import 'dart:async';
import 'dart:math' show Random;
import 'dart:io';
import 'dart:convert';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:http/http.dart' as http;

import 'package:collection/collection.dart';
// ignore: unnecessary_import
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_pool.dart';
import 'package:protos_weebi/data_dummy.dart';
import 'package:protos_weebi/encrypter.dart';
import 'package:protos_weebi/extensions.dart';

import 'package:protos_weebi/grpc.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

import 'package:fence_service/fence_service.dart';
import 'package:fence_service/src/weebi_logger.dart';

class PermissionAndSillyBoolean {
  final UserPermissions userPermissions;
  final bool mustChangePassword;
  PermissionAndSillyBoolean(
      {required this.userPermissions, required this.mustChangePassword});
}

class FenceService extends FenceServiceBase {
  final MongoDbPoolService _poolService;
  final WeebiLogger _logger = WeebiLogger.forService('fence_service');

  //final DbCollection userCollection;
  //final DbCollection pairingCodesCollection;
  //final DbCollection boutiqueCollection;
  //final DbCollection firmCollection;

  static const String pairingCodesCollectionName = 'pairing_codes';
  static const String boutiqueCollectionName = 'boutique';
  static const String firmCollectionName = 'firm';
  static const String userCollectionName = 'user';

  bool isMock;
  UserPermissions? userPermissionIfTest;

  FenceService(
    this._poolService, {
    this.isMock = false,
    this.userPermissionIfTest,
  });

  /// Get version information for health check using pubspec_parse
  Map<String, String> _getVersionInfo() {
    try {
      // Get the root directory of the project
      // When running from weebi_server, find pubspec files relative to current directory
      final currentDir = Directory.current.path;

      // Try multiple possible paths to handle different deployment scenarios
      final possiblePaths = [
        '$currentDir/apps/server/pubspec.yaml',
        '/apps/server/pubspec.yaml',
        '/app/apps/server/pubspec.yaml',
      ];
      final protosPaths = [
        '$currentDir/packages/protos/protos_weebi/pubspec.yaml',
        '/packages/protos/protos_weebi/pubspec.yaml',
        '/app/packages/protos/protos_weebi/pubspec.yaml',
      ];
      final fenceServicePaths = [
        '$currentDir/packages/fence_service/pubspec.yaml',
        '/packages/fence_service/pubspec.yaml',
        '/app/packages/fence_service/pubspec.yaml',
      ];
      final fenceServiceLockPaths = [
        '$currentDir/packages/fence_service/pubspec.lock',
        '/packages/fence_service/pubspec.lock',
        '/app/packages/fence_service/pubspec.lock',
      ];

      return {
        'server': Platform.environment['SERVER_VERSION'] ??
            _getVersionFromPubspecMultiplePaths(possiblePaths),
        'protos_weebi': Platform.environment['PROTOS_VERSION'] ??
            _getVersionFromPubspecMultiplePaths(protosPaths),
        'fence_service': Platform.environment['FENCE_SERVICE_VERSION'] ??
            _getVersionFromPubspecMultiplePaths(fenceServicePaths),
        // models_weebi is a pub dependency - read from pubspec.lock
        'models_weebi': Platform.environment['MODELS_VERSION'] ??
            _getVersionFromPubspecLockMultiplePaths(
                fenceServiceLockPaths, 'models_weebi'),
      };
    } catch (e) {
      _logger.error('Error getting version info', error: e);
      return {
        'server': 'unknown',
        'protos_weebi': 'unknown',
        'fence_service': 'unknown',
        'models_weebi': 'unknown',
      };
    }
  }

  /// Try multiple paths to find pubspec.yaml
  String _getVersionFromPubspecMultiplePaths(List<String> paths) {
    for (final path in paths) {
      final version = _getVersionFromPubspec(path);
      if (version != 'unknown') {
        return version;
      }
    }
    return 'unknown';
  }

  /// Try multiple paths to find pubspec.lock
  String _getVersionFromPubspecLockMultiplePaths(
      List<String> paths, String packageName) {
    for (final path in paths) {
      final version = _getVersionFromPubspecLock(path, packageName);
      if (version != 'unknown') {
        return version;
      }
    }
    return 'unknown';
  }

  /// Read version from pubspec.yaml using pubspec_parse
  String _getVersionFromPubspec(String absolutePath) {
    try {
      final pubspecFile = File(absolutePath);
      if (!pubspecFile.existsSync()) {
        _logger.debug('Pubspec file not found', extra: {'path': absolutePath});
        return 'unknown';
      }

      final pubspecContent = pubspecFile.readAsStringSync();
      final pubspec = Pubspec.parse(pubspecContent);

      return pubspec.version?.toString() ?? 'unknown';
    } catch (e) {
      _logger.warning('Error reading version from pubspec', extra: {'path': absolutePath});
      _logger.debug('Version read error details', extra: {'error': e.toString()});
      return 'unknown';
    }
  }

  /// Read version from pubspec.lock for a dependency
  String _getVersionFromPubspecLock(String lockFilePath, String packageName) {
    try {
      final lockFile = File(lockFilePath);
      if (!lockFile.existsSync()) {
        _logger.debug('Pubspec.lock file not found', extra: {'path': lockFilePath});
        return 'unknown';
      }

      final content = lockFile.readAsStringSync();
      // Simple regex to find the package and its version
      final pattern =
          RegExp('$packageName:.*?version: "([^"]+)"', dotAll: true);
      final match = pattern.firstMatch(content);

      if (match != null && match.groupCount >= 1) {
        return match.group(1) ?? 'unknown';
      }

      return 'unknown';
    } catch (e) {
      _logger.warning('Error reading version from pubspec.lock', extra: {
        'path': lockFilePath,
        'packageName': packageName,
      });
      _logger.debug('Version read error details', extra: {'error': e.toString()});
      return 'unknown';
    }
  }

  /// Check database health
  Future<bool> _checkDatabaseHealth() async {
    try {
      return await databaseMiddleware<bool>(_poolService, (db) async {
        // Simple ping to check database connectivity
        await db.runCommand({'ping': 1});
        return true;
      });
    } catch (e) {
      _logger.error('Database health check failed', error: e);
      return false;
    }
  }

  // Will use _getVersionInfo() and _checkDatabaseHealth()

  // NOTE: HTTP handlers and email service methods have been removed
  // Email service functionality is preserved in lib/src/mail/ folder:
  // - mail_service.dart: Email sending logic
  // - password_reset_service.dart: Token management
  // - email_config.dart: Configuration
  // These can be used later for a dedicated email/auth service

  @override
  Future<PendingUserResponse> createPendingUser(
      ServiceCall? call, PendingUserRequest request) async {
    _logger.logRpcEntry('createPendingUser', call, requestData: {
      'mail': request.mail,
      'firmId': request.permissions.firmId,
    });

    final mailChecked = _checkMail(request.mail);
    final passwordEncrypted = _checkAndEncryptPassword(request.password);

    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

    if (request.permissions.firmId.isEmpty) {
      throw GrpcError.invalidArgument(
          'request.permissions.firmId cannot be empty');
    }
    if (request.firstname.isEmpty ||
        request.lastname.isEmpty ||
        request.mail.isEmpty) {
      throw GrpcError.invalidArgument(
          'missing either firstname, lastname, mail');
    }

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
      // Always reject if email exists - force admin to use different email or contact user
      throw GrpcError.invalidArgument('mail ${request.mail} is alreadyUsed');
    }

    return databaseMiddleware<PendingUserResponse>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

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
          firmId: firmId,
          passwordEncrypted: passwordEncrypted,
          mustChangePassword:
              true, // by default passwords here are auto-generated and must be changed on first login
          emailVerificationSent: false, // not handled yet (end of 2025)
          lastUpdatedByuserId: userPermission.userId,
          creationDateUTC: DateTime.now().toUtc().timestampProto,
        );

        final result = await userCollection
            .insertOne(userPrivate.toProto3Json() as Map<String, dynamic>);
        if (result.hasWriteErrors) {
          throw GrpcError.unknown(
              'hasWriteErrors ${result.writeError!.errmsg}');
        }
        final timestamp = DateTime.now().timestampProto;
        if (result.success && result.document != null) {
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
        _logger.logRpcError('createPendingUser', call, e, extra: {
          'mail': request.mail,
        });
        rethrow;
      }
    });
  }

  @override
  Future<Tokens> authenticateWithCredentials(
      ServiceCall? call, Credentials request) async {
    _logger.logRpcEntry('authenticateWithCredentials', call, requestData: {
      'mail': request.mail,
    });
    
    try {
      final mailAndEncyptedPassword = _checkCredentials(request);

      // * here we will eventually check the subscription validity (1 month free or paid sub)

      final userPermission = await _readUserPermissionsByMailAndPassword(
          call, mailAndEncyptedPassword);
      var jwt = JsonWebToken();
      final payload = userPermission.userPermissions.toProto3Json()
          as Map<String, dynamic>?;
      
      // Diagnostic logging: Check payload structure before JWT creation
      _logger.debug('JWT payload before encoding', extra: {
        'payloadKeys': payload?.keys.toList(),
        'payloadSize': payload?.toString().length ?? 0,
        'hasNullValues': payload?.values.any((v) => v == null) ?? false,
        'payloadTypes': payload?.map((k, v) => MapEntry(k, v.runtimeType.toString())),
      });
      
      jwt.createPayload(
        userPermission.userPermissions.userId,
        expireIn: const Duration(days: 1),
        payload: payload,
      );
      
      // Diagnostic logging: Check payload after createPayload
      _logger.debug('JWT payload after createPayload', extra: {
        'payloadKeys': jwt.payload.keys.toList(),
        'payloadSize': jwt.payload.toString().length,
      });
      
      jwt.sign();
      final accessToken = jwt.sign();
      
      // Diagnostic logging: Check token after signing
      _logger.debug('JWT token generated', extra: {
        'tokenLength': accessToken.length,
        'tokenParts': accessToken.split('.').length,
        'tokenPreview': accessToken.length > 100 
            ? '${accessToken.substring(0, 50)}...${accessToken.substring(accessToken.length - 50)}'
            : accessToken,
      });
      jwt = JsonWebToken();
      jwt.createPayload(
        userPermission.userPermissions.userId,
        expireIn: Duration(days: 30),
        payload: {
          'userId': userPermission.userPermissions.userId,
          'firmId': userPermission.userPermissions.firmId
        },
      );
      // refresh token only contains userId & firmId
      final resfreshToken = jwt.sign();
      _updateUserLastSignIn;
      final tokens = Tokens(
          accessToken: accessToken,
          refreshToken: resfreshToken,
          mustChangePassword: userPermission.mustChangePassword);
      _logger.logRpcExit('authenticateWithCredentials', call);
      return tokens;
    } on GrpcError catch (e) {
      _logger.logRpcError('authenticateWithCredentials', call, e, extra: {
        'mail': request.mail,
      });
      rethrow;
    } on MongoDartError catch (e) {
      _logger.logRpcError('authenticateWithCredentials', call, e, extra: {
        'mail': request.mail,
        'errorType': 'MongoDartError',
      });
      rethrow;
    }
  }

  Future<void> _updateUserLastSignIn(String userId) async {
    return databaseMiddleware(_poolService, (db) async {
      try {
        final lastSignin = DateTime.now().timestampProto;
        final dd = lastSignin.toProto3Json();
        await db.collection(userCollectionName).update(
              where.eq('userId', userId),
              ModifierBuilder().set('lastSignIn', dd),
            );
      } catch (e) {
        log('eroor $e');
        rethrow;
      }
    });
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
    _logger.logRpcEntry('authenticateWithRefreshToken', call);
    
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
      final tokens = Tokens(accessToken: accessToken, refreshToken: resfreshToken);
      _logger.logRpcExit('authenticateWithRefreshToken', call);
      return tokens;
    } on GrpcError catch (e) {
      _logger.logRpcError('authenticateWithRefreshToken', call, e);
      rethrow;
    }
  }

  Future<UserPrivate> _readUserByUserId(String userId) async {
    return databaseMiddleware<UserPrivate>(_poolService, (db) async {
      try {
        final userPrivate = await db.collection(userCollectionName).findOne(
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
    });
  }

  Future<PermissionAndSillyBoolean> _readUserPermissionsByMailAndPassword(
      ServiceCall? call, MailAndEncyptedPassword request) async {
    return databaseMiddleware<PermissionAndSillyBoolean>(_poolService,
        (db) async {
      final selector = where
          .match('mail', r'^' + request.mail.trim() + r'$',
              caseInsensitive: true)
          .eq('password', request.passwordEncrypted);
      try {
        final userPrivateMongo =
            await db.collection(userCollectionName).findOne(selector);
        if (userPrivateMongo == null) {
          /*  final resultMail =
            await userCollection.findOne(where.eq('mail', request.mail));
        if (resultMail == null) {
          throw GrpcError.notFound();
        } else */
          // ! deliberately do not give wrong password info for security reason
          throw GrpcError.invalidArgument('incorrect login or password');
        }
        final userPrivate = UserPrivate()
          ..mergeFromProto3Json(userPrivateMongo, ignoreUnknownFields: true);
        final userPermission = UserPermissions.create()
          ..mergeFromProto3Json(
              userPrivate.permissions.toProto3Json() as Map<String, dynamic>);
        return PermissionAndSillyBoolean(
            userPermissions: userPermission,
            mustChangePassword: userPrivate.mustChangePassword);
      } on GrpcError catch (e) {
        log('$e');
        rethrow;
      }
    });
  }

  Future<UserPrivate> _checkUserAndProtoIt(String userId) async {
    return databaseMiddleware<UserPrivate>(_poolService, (db) async {
      final userMongo = await db
          .collection(userCollectionName)
          .findOne(where.eq('userId', userId));
      if (userMongo == null) {
        throw GrpcError.notFound('user not found');
      }
      return UserPrivate.create()
        ..mergeFromProto3Json(userMongo, ignoreUnknownFields: true);
    });
  }

  @override
  Future<StatusResponse> updateOneUser(
      ServiceCall? call, UserPublic request) async {
    _logger.logRpcEntry('updateOneUser', call, requestData: {
      'userId': request.userId,
    });
    
    if (request.userId.isEmpty) {
      throw GrpcError.invalidArgument('userId cannot be empty');
    }
    if (request.userId != request.permissions.userId) {
      throw GrpcError.invalidArgument(
          'request.userId != user.permissions.userId');
    }
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

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
  Future<ReadOneUserResponse> readOneUser(
      ServiceCall? call, UserId request) async {
    _logger.logRpcEntry('readOneUser', call, requestData: {
      'userId': request.userId,
    });
    
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

    final isReadingOwnUser = userPermission.userId == request.userId;

    if (isReadingOwnUser == false &&
        userPermission.userManagementRights.rights
            .none((e) => e == Right.read)) {
      throw GrpcError.permissionDenied(
          'user does not have right to read other users');
    }
    return databaseMiddleware<ReadOneUserResponse>(_poolService, (db) async {
      try {
        final userMongo = await db
            .collection(userCollectionName)
            .findOne(where.eq('userId', request.userId));
        if (userMongo == null) {
          throw GrpcError.notFound('user not found');
        }

        final userFound = UserPublic.create()
          ..mergeFromProto3Json(userMongo, ignoreUnknownFields: true);

        if (isReadingOwnUser) {
          return ReadOneUserResponse(
              user: userFound,
              statusResponse:
                  StatusResponse(type: StatusResponse_Type.SUCCESS));
        }

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
                      message:
                          'one user found but belong to a different chain');
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
        _logger.logRpcError('readOneUser', call, e, extra: {
          'requestedUserId': request.userId,
        });
        rethrow;
      } on MongoDartError catch (e) {
        _logger.logRpcError('readOneUser', call, e, extra: {
          'requestedUserId': request.userId,
          'errorType': 'MongoDartError',
        });
        rethrow;
      }
    });
  }

  ///  chain rights encompass device pairing, not boutique update rights
  ///  right.create is the right to generate a code for pairing device
  @override
  Future<CodeForPairingDevice> generateCodeForPairingDevice(
      ServiceCall? call, ChainIdAndboutiqueId request) async {
    _logger.logRpcEntry('generateCodeForPairingDevice', call, requestData: {
      'chainId': request.chainId,
      'boutiqueId': request.boutiqueId,
    });
    
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    // chain rights encompass device pairing
    if (userPermission.chainRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to pair device (missing chainRights)');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    // check that chainId exists if not found error thrown by _checkOneChainAndProtoIt
    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);
    // check that boutiqueid exists
    if (chain.boutiques.none((b) => b.boutiqueId == request.boutiqueId)) {
      throw GrpcError.notFound('unknown boutiqueId ${request.boutiqueId}');
    }

    var code = 0;
    var d = CodeForPairingDevice.create();
    do {
      code = _createCode();
      d = await _findCode(code);
    } while (code == d.code);

    return databaseMiddleware<CodeForPairingDevice>(_poolService, (db) async {
      try {
        /// make sure we do not use an already existing code

        final temp = CodeForPairingDevice.create()
          ..userId = userPermission.userId
          ..firmId = userPermission.firmId
          ..chainId = request.chainId
          ..boutiqueId = request.boutiqueId
          ..code = code
          ..timestampUTC = DateTime.now().timestampProto;

        final result = await db
            .collection(pairingCodesCollectionName)
            .insertOne(temp.toProto3Json() as Map<String, dynamic>);
        if (result.hasWriteErrors) {
          throw GrpcError.unknown(
              'hasWriteErrors ${result.writeError!.errmsg}');
        }
        if (result.success && result.document != null) {
          return temp;
        } else {
          throw GrpcError.unknown('mongo error generateCodeForPairingDevice');
        }
      } on GrpcError catch (e) {
        _logger.logRpcError('generateCodeForPairingDevice', call, e);
        rethrow;
      } catch (e, stacktrace) {
        _logger.logRpcError('generateCodeForPairingDevice', call, e, stackTrace: stacktrace);
        throw GrpcError.unknown('$e');
      }
    });
  }

  int _createCode() {
    final random = Random();
    return random.nextInt(900000) + 100000;
  }

  Future<CodeForPairingDevice> _findCode(int code) async {
    return databaseMiddleware<CodeForPairingDevice>(_poolService, (db) async {
      try {
        final d = await db
            .collection(pairingCodesCollectionName)
            .findOne(where.eq('code', code));
        return CodeForPairingDevice.create()
          ..mergeFromProto3Json(d, ignoreUnknownFields: true);
      } on MongoDartError catch (e) {
        _logger.error('Error finding code in database', error: e);
        rethrow;
      }
    });
  }

  /// no specific kind of permission for creating the device as code is required in the payload
  /// this code comes from .generateCodeForPairingDevice()
  /// which requires ChainRights.rights.contains(Right.create)
  /// mitigating the risk of a device added without admin consent
  /// The device is created in the boutique's chain with a true status
  /// so admin will not need to re-approve device
  /// in case of unlikely code leak admin can still disable/delete device
  @override
  Future<CreateDeviceResponse> createDevice(
      ServiceCall? call, PendingDeviceRequest request) async {
    _logger.logRpcEntry('createDevice', call, requestData: {
      'code': request.code,
      'hardwareInfo': {
        'serialNumber': request.hardwareInfo.serialNumber,
      },
    });
    
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

    return databaseMiddleware<CreateDeviceResponse>(_poolService, (db) async {
      final pairingCodesCollection = db.collection(pairingCodesCollectionName);
      final userMongo = await db
          .collection(userCollectionName)
          .findOne(where.eq('userId', userPermission.userId));
      if (userMongo == null) {
        throw GrpcError.notFound('user ${userPermission.userId} not found');
      }

      final pairingResp = await _findCode(request.code);
      if (pairingResp.code == 0) {
        return CreateDeviceResponse(
            statusResponse: StatusResponse(
                type: StatusResponse_Type.ERROR,
                message: 'code no match',
                timestamp: DateTime.now().timestampProto));
      }
      if (pairingResp.firmId != userPermission.firmId) {
        throw GrpcError.permissionDenied(
            'user cannot access data from firmId ${pairingResp.firmId}');
      }

      try {
        // get chain info
        final chain = await _checkOneChainAndProtoIt(
            pairingResp.firmId, pairingResp.chainId);

        final boutiqueIndex = chain.boutiques.indexWhere((btq) =>
            btq.chainId == pairingResp.chainId &&
            btq.boutiqueId == pairingResp.boutiqueId);

        if (boutiqueIndex == -1) {
          throw GrpcError.notFound(
              'no boutique found with this info chainId ${pairingResp.chainId} btqId ${pairingResp.boutiqueId}');
        }

        // Check for duplicate devices based on hardware info
        final boutique = chain.boutiques[boutiqueIndex];

        // Check 1: Serial number duplicates (most reliable)
        final existingDeviceBySerial =
            boutique.devices.firstWhereOrNull((device) {
          final hwInfo = device.hardwareInfo;
          final requestHwInfo = request.hardwareInfo;

          return hwInfo.serialNumber.isNotEmpty &&
              requestHwInfo.serialNumber.isNotEmpty &&
              hwInfo.serialNumber == requestHwInfo.serialNumber;
        });

        // Handle existing device by serial number (most reliable match)
        if (existingDeviceBySerial != null) {
          // Device re-enrollment case - return existing device info to allow mobile app to proceed
          print(
              'Device re-enrollment detected: serial ${request.hardwareInfo.serialNumber} already exists, returning existing device info');

          return CreateDeviceResponse(
              statusResponse: StatusResponse(
                  type: StatusResponse_Type.CREATED,
                  timestamp: DateTime.now().timestampProto,
                  message:
                      'Device re-enrolled - found existing device with same serial number (${request.hardwareInfo.serialNumber})'),
              firmId: chain.firmId,
              chainId: chain.chainId,
              boutiqueId: existingDeviceBySerial.boutiqueId,
              deviceId: existingDeviceBySerial.deviceId);
        }

        // Check 2: Name + Brand + OS combination duplicates (fallback for devices without serial)
        final existingDeviceBySpecs =
            boutique.devices.firstWhereOrNull((device) {
          final hwInfo = device.hardwareInfo;
          final requestHwInfo = request.hardwareInfo;

          // Only check this if at least one device doesn't have a serial number
          final currentHasNoSerial = hwInfo.serialNumber.isEmpty;
          final requestHasNoSerial = requestHwInfo.serialNumber.isEmpty;

          if (!currentHasNoSerial && !requestHasNoSerial) {
            return false; // Both have serials, already checked above
          }

          return hwInfo.name.isNotEmpty &&
              requestHwInfo.name.isNotEmpty &&
              hwInfo.name == requestHwInfo.name &&
              hwInfo.brand == requestHwInfo.brand &&
              hwInfo.baseOS == requestHwInfo.baseOS;
        });

        // Handle existing device by specs (less reliable match)
        if (existingDeviceBySpecs != null) {
          // Device re-enrollment case - return existing device info to allow mobile app to proceed
          print(
              'Device re-enrollment detected: specs ${request.hardwareInfo.name}-${request.hardwareInfo.brand} already exist, returning existing device info');

          return CreateDeviceResponse(
              statusResponse: StatusResponse(
                  type: StatusResponse_Type.CREATED,
                  timestamp: DateTime.now().timestampProto,
                  message:
                      'Device re-enrolled - found existing device with same specifications (${request.hardwareInfo.name} - ${request.hardwareInfo.brand})'),
              firmId: chain.firmId,
              chainId: chain.chainId,
              boutiqueId: existingDeviceBySpecs.boutiqueId,
              deviceId: existingDeviceBySpecs.deviceId);
        }

        // No existing device found - create new one
        final device = Device.create()
          ..status = true
          ..password = ''
          ..timestamp = DateTime.now().timestampProto
          ..boutiqueId = pairingResp.boutiqueId
          ..chainId = pairingResp.chainId
          ..deviceId = DateTime.now().objectIdString
          ..hardwareInfo = request.hardwareInfo;

        chain.boutiques[boutiqueIndex].devices.add(device);

        final result = await _updateOneChainDBExec(chain);

        // _cleanPairingCodes
        // delete the already used code
        await pairingCodesCollection.deleteOne(where.eq('code', request.code));
        // if 10% of the numbers are attributed
        // clean codes older than 10 days
        final countCodes = await pairingCodesCollection.count();
        if (countCodes > 10000) {
          final selector = where.lt(
              'timestampUTC',
              DateTime.now()
                  .subtract(const Duration(days: 10))
                  .toIso8601String());
          await pairingCodesCollection.deleteMany(selector);
        }

        return CreateDeviceResponse(
            statusResponse: StatusResponse(
                type: StatusResponse_Type.CREATED, timestamp: result.timestamp),
            firmId: chain.firmId,
            chainId: chain.chainId,
            boutiqueId: device.boutiqueId,
            deviceId: device.deviceId);
      } on GrpcError catch (e) {
        _logger.logRpcError('createDevice', call, e);
        rethrow;
      }
    });
  }

  @override
  Future<StatusResponse> updateDevicePassword(
      ServiceCall? call, UpdateDevicePasswordRequest request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
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

    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);

    final boutiqueIndexAndDeviceIndex =
        chain.boutiqueIndexAndDeviceIndex(request.device);

    chain
        .boutiques[boutiqueIndexAndDeviceIndex.boutiqueIndex]
        .devices[boutiqueIndexAndDeviceIndex.deviceIndex]
        .password = request.device.password;

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

      try {
        final result = await userCollection.replaceOne(
          where.eq('firmId', chain.firmId).eq('chainid', chain.chainId),
          chain.toProto3Json() as Map<String, dynamic>,
          upsert: true,
        );
        if (result.hasWriteErrors) {
          throw GrpcError.internal(
              'hasWriteErrors ${result.writeError!.errmsg}');
        }
        if (result.ok != 1) {
          throw GrpcError.unknown(
              'update != 1 ${result.document} ${result.serverResponses}');
        }
        return StatusResponse()
          ..type = StatusResponse_Type.UPDATED
          ..timestamp = DateTime.now().timestampProto;
      } on GrpcError catch (e) {
        _logger.logRpcError('updateDevicePassword', call, e);
        rethrow;
      }
    });
  }

  @override
  Future<StatusResponse> deleteOneUser(
      ServiceCall? call, UserId request) async {
    if (request.userId.isEmpty) {
      throw GrpcError.invalidArgument('user oid cannot be empty');
    }
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.userManagementRights.rights
            .any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete users');
    }

    if (userPermission.userId == request.userId) {
      throw GrpcError.permissionDenied('user cannot delete themselves');
    }

    final userPrivate = await _checkUserAndProtoIt(request.userId);
    if (userPrivate.firmId != userPermission.firmId) {
      throw GrpcError.permissionDenied('user belongs to a different firm');
    }

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

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
    });
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
  /// we give firmId the userId
  /// Chain and Boutique will be created by default and will use the same firmId
  /// Since createFirm also updates user permission, clientApp needs to reauthent using refresh right after
  @override
  Future<CreateFirmResponse> createFirm(
      ServiceCall? call, CreateFirmRequest request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

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

    final nowProtoUTC = DateTime.now().toUtc().timestampProto;

    final firmId = DateTime.now().objectIdString;
    final firm = Firm(
        firmId: firmId,
        name: request.name,
        status: true,
        creationDateUTC: nowProtoUTC);

    return databaseMiddleware<CreateFirmResponse>(_poolService, (db) async {
      final firmCollection = db.collection(firmCollectionName);

      try {
        final result = await firmCollection
            .insertOne(firm.toProto3Json() as Map<String, dynamic>);
        if (result.hasWriteErrors) {
          throw GrpcError.unknown(
              'hasWriteErrors ${result.writeError!.errmsg}');
        }
        if (result.success && result.document != null) {
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
              creationDateUTC: nowProtoUTC,
              boutiques: [
                BoutiqueMongo.create()
                  ..firmId = firmId
                  ..chainId = firmId
                  ..boutiqueId = firmId
                  ..name = request.name
                  ..creationTimestampUTC = nowProtoUTC
              ]);

          try {
            await _createOneChainDBExec(chain);
          } on GrpcError catch (e) {
            print('createFirm _createOneChainDBExec error $e');
            rethrow;
          }

          // Email/welcome mail functionality removed - will be handled by dedicated service

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
        print('createFirm $e');
        rethrow;
      } catch (e, stacktrace) {
        print('createFirm $e');
        print(stacktrace);
        rethrow;
      }
    });
  }

  Future<StatusResponse> _updateUserFirmIdAndPermissionsDBExec(
      String userId, String firmId, UserPermissions permissions) async {
    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

      try {
        await userCollection.update(
          where.eq('userId', userId),
          ModifierBuilder().set('firmId', firmId).set('permissions',
              permissions.toProto3Json() as Map<String, dynamic>),
        );

        return StatusResponse()
          ..type = StatusResponse_Type.UPDATED
          ..timestamp = DateTime.now().timestampProto;
      } on GrpcError catch (e) {
        print('_updateUserFirmIdAndPermissionsDBExec $e');
        rethrow;
      } catch (e, stacktrace) {
        print('_updateUserFirmIdAndPermissionsDBExec $e');
        // the whole stacktrace is heavy
        print(stacktrace);
        rethrow;
      }
    });
  }

  Future<StatusResponse> _updateUserDBExec(UserPublic user) async {
    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

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
    });
  }

  @override
  Future<Firm> readOneFirm(ServiceCall? call, Empty request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.firmRights.rights.any((e) => e == Right.read) == false) {
      throw GrpcError.permissionDenied('user does not have right to read firm');
    }
    return databaseMiddleware<Firm>(_poolService, (db) async {
      final firmCollection = db.collection(firmCollectionName);

      try {
        final firmMongo = await firmCollection
            .findOne(where.eq('firmId', userPermission.firmId));
        if (firmMongo == null) {
          throw GrpcError.notFound(
              'Did not find firmId ${userPermission.firmId}');
        }
        final firm = Firm()
          ..mergeFromProto3Json(firmMongo, ignoreUnknownFields: true);
        return firm;
      } on GrpcError catch (e) {
        print('readFirm error $e');
        rethrow;
      }
    });
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
    return databaseMiddleware<List<Chain>>(_poolService, (db) async {
      final boutiqueCollection = db.collection(boutiqueCollectionName);

      try {
        final chainsMongo = await boutiqueCollection
            .find(where.eq('firmId', userPermissions.firmId))
            .toList();
        if (chainsMongo.isEmpty) {
          return [];
        }
        final chains = <Chain>[];
        for (final chainMongo in chainsMongo) {
          final chainTemp = Chain.create()
            ..mergeFromProto3Json(chainMongo, ignoreUnknownFields: true);

          // Filter out soft-deleted boutiques and create new chain
          final activeBoutiques =
              chainTemp.boutiques.where((b) => !b.isDeleted).toList();

          final chain = Chain.create()
            ..chainId = chainTemp.chainId
            ..firmId = chainTemp.firmId
            ..name = chainTemp.name
            ..lastUpdateTimestampUTC = chainTemp.lastUpdateTimestampUTC
            ..lastUpdatedByuserId = chainTemp.lastUpdatedByuserId
            ..creationDateUTC = chainTemp.creationDateUTC
            ..boutiques.addAll(activeBoutiques);

          chains.add(chain);
        }
        return chains;
      } on GrpcError catch (e) {
        print('_findChainsAndProtoThem $e');
        rethrow;
      }
    });
  }

  /// if no match whith firmId and chainId throws GrpcError.notFound
  Future<Chain> _checkOneChainAndProtoIt(String firmId, String chainId) async {
    return databaseMiddleware<Chain>(_poolService, (db) async {
      final boutiqueCollection = db.collection(boutiqueCollectionName);

      try {
        final chainMongo = await boutiqueCollection
            .findOne(where.eq('firmId', firmId).eq('chainId', chainId));
        if (chainMongo == null) {
          throw GrpcError.notFound(
              'firm/chain not found firmId: $firmId chainId:$chainId');
        }
        return Chain.create()
          ..mergeFromProto3Json(chainMongo, ignoreUnknownFields: true);
      } on GrpcError catch (e) {
        print('_checkOneChainAndProtoIt $e');
        rethrow;
      }
    });
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
      ServiceCall? call, BoutiqueRequest request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

    if (userPermission.boutiqueRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create boutique');
    }
    if (userPermission.isFirmAndChainAccessible(
            userPermission.firmId, request.chainId) ==
        false) {
      throw GrpcError.permissionDenied(
          'user cannot create data for firm ${userPermission.firmId} or chain ${request.chainId}');
    }

    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);

    final nowProtoUTC = DateTime.now().toUtc().timestampProto;
    final boutiqueId = DateTime.now().objectIdString;
    final boutiqueRequest = request.boutique..boutiqueId = boutiqueId;

    final boutiqueMongo = BoutiqueMongo.create()
      ..firmId = userPermission.firmId
      ..chainId = request.chainId
      ..boutiqueId = boutiqueId
      ..name = request.boutique.name
      ..creationTimestampUTC = nowProtoUTC
      ..boutique = boutiqueRequest
      ..logo = request.logo
      ..logoExtension = request.logoExtension;

    chain.boutiques.add(boutiqueMongo);

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
        : call.bearer.userPermissions;
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

    final chainId = DateTime.now().objectIdString;
    request.chainId = chainId;
    request.boutiques.first
      ..firmId = request.firmId
      ..chainId = chainId
      ..boutiqueId = chainId;
    return await _createOneChainDBExec(request);
  }

  Future<StatusResponse> _createOneChainDBExec(Chain chain) async {
    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final boutiqueCollection = db.collection(boutiqueCollectionName);

      try {
        final result = await boutiqueCollection
            .insertOne(chain.toProto3Json() as Map<String, dynamic>);
        if (result.hasWriteErrors) {
          throw GrpcError.unknown(
              'hasWriteErrors ${result.writeError!.errmsg}');
        }
        if (result.success && result.document != null) {
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
    });
  }

  @override
  Future<StatusResponse> updateOneBoutique(
      ServiceCall? call, BoutiqueRequest request) async {
    if (request.boutique.boutiqueId.isEmpty) {
      throw GrpcError.invalidArgument('boutiqueId cannot be empty');
    }
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

    if (userPermission.boutiqueRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update boutique');
    }
    if (userPermission.isFirmAndChainAccessible(
            userPermission.firmId, request.chainId) ==
        false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from firm ${userPermission.firmId} or chain ${request.chainId}');
    }

    if(request.boutique.boutiqueId.isEmpty) {
      throw GrpcError.invalidArgument('boutique.boutiqueId cannot be empty');
    }

    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);
    final boutiqueIndex = chain.boutiques
        .indexWhere((e) => e.boutiqueId == request.boutique.boutiqueId);
    if (boutiqueIndex == -1) {
      throw GrpcError.notFound(
          'boutique ${request.boutique.boutiqueId} not found');
    }

    final boutique = chain.boutiques[boutiqueIndex];

    // Prevent updating deleted boutiques
    if (boutique.isDeleted) {
      throw GrpcError.failedPrecondition(
          'cannot update deleted boutique ${request.boutique.boutiqueId}');
    }

    boutique.boutique = request.boutique;
    boutique.name = request.boutique
        .name; // Sync the outer name field with the nested boutique name
    boutique.isDeleted = request.boutique
        .isDeleted; // Sync the outer isDeleted field with the nested boutique isDeleted
    boutique.deletedBy = request.boutique.deletedBy; // Sync the deletedBy field
    boutique.restoredBy =
        request.boutique.restoredBy; // Sync the restoredBy field
    boutique.logo = request.logo;
    boutique.logoExtension = request.logoExtension;
    boutique.lastTouchTimestampUTC = DateTime.now().timestampProto;

    return await _updateOneChainDBExec(chain);
  }

  @override
  Future<StatusResponse> updateOneChain(
      ServiceCall? call, ChainRequest request) async {
/*     if (request.boutiques.any((b) => b.firmId != request.firmId)) {
      throw GrpcError.invalidArgument(
          'each boutique.firmId must match the chain.firmId');
    }
    if (request.boutiques.any((b) => b.chainId != request.chainId)) {
      throw GrpcError.invalidArgument(
          'each boutique.chainId must match the chainId');
    } */

    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (request.chainId.isEmpty) {
      throw GrpcError.invalidArgument('chain id cannot be empty');
    }
    if (userPermission.chainRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update chain');
    }
    if (userPermission.isFirmAndChainAccessible(
            userPermission.firmId, request.chainId) ==
        false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from firm ${userPermission.firmId} or chain ${request.chainId}');
    }
    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final boutiqueCollection = db.collection(boutiqueCollectionName);
      try {
        await boutiqueCollection.update(
          where
              .eq('firmId', userPermission.firmId)
              .eq('chainId', request.chainId),
          ModifierBuilder()
              .set('name', request.name)
              .set('lastUpdatedByuserId', userPermission.userId)
              .set(
                'lastUpdateTimestampUTC',
                DateTime.now().toUtc().timestampProto.toProto3Json(),
              ),
        );
        return StatusResponse()
          ..type = StatusResponse_Type.UPDATED
          ..timestamp = DateTime.now().timestampProto;
      } on GrpcError catch (e) {
        print(e);
        rethrow;
      } catch (e, stacktrace) {
        print(e);
        print(stacktrace);
        rethrow;
      }
    });
  }

  Future<StatusResponse> _updateOneChainDBExec(Chain chain) async {
    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final boutiqueCollection = db.collection(boutiqueCollectionName);

      try {
        final result = await boutiqueCollection.replaceOne(
          where.eq('firmId', chain.firmId).eq('chainId', chain.chainId),
          chain.toProto3Json() as Map<String, dynamic>,
          upsert: true,
        );
        if (result.hasWriteErrors) {
          throw GrpcError.internal(
              'hasWriteErrors ${result.writeError!.errmsg}');
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
    });
  }

  /// chain rights encompass device pairing
  /// right.delete is the right to delete a device
  @override
  Future<StatusResponse> deleteOneDevice(
      ServiceCall? call, DeleteDeviceRequest request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.chainRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete device');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }

    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);
    // find the device
    final btqIndexDeviceIndex =
        chain.boutiqueIndexAndDeviceIndex(request.device);
    // remove device
    chain.boutiques[btqIndexDeviceIndex.boutiqueIndex].devices
        .removeAt(btqIndexDeviceIndex.deviceIndex);
    // update chain in db

    try {
      await _updateOneChainDBExec(chain);
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED
        ..timestamp = DateTime.now().timestampProto;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<IsADeviceInChainResponse> isADeviceInChain(
      ServiceCall? call, ReadDevicesRequest request) async {
    if (request.chainId.isEmpty) {
      throw GrpcError.invalidArgument('chainId cannot be empty');
    }
    final userPermissions = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

    final chain =
        await _checkOneChainAndProtoIt(userPermissions.firmId, request.chainId);

    final devices = <Device>[];
    for (final boutique in chain.boutiques) {
      for (final device in boutique.devices) {
        if (device.status) {
          devices.add(device);
        }
      }
    }
    return IsADeviceInChainResponse(isADevice: devices.isNotEmpty);
  }

  @override
  Future<Devices> readDevices(
      ServiceCall? call, ReadDevicesRequest request) async {
    if (request.chainId.isEmpty) {
      throw GrpcError.invalidArgument('chainId cannot be empty');
    }
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

    if (userPermission.boutiqueRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read boutiques/devices');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }

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
    _logger.logRpcEntry('signUp', call, requestData: {
      'mail': request.mail,
    });
    
    final mailAndEncyptedPassword = _checkCredentials(
        Credentials(mail: request.mail, password: request.password));

    final user = await _isMailAlreadyUsed(mailAndEncyptedPassword.mail);
    if (user.userId.isNotEmpty) {
      if (_isPendingUser(user)) {
        return await _updatePendingUser(
            user, mailAndEncyptedPassword.passwordEncrypted);
      } else {
        // user signed it at least once
        throw GrpcError.invalidArgument(
            'mail ${request.mail} is not available');
      }
    }
    return databaseMiddleware<SignUpResponse>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

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
          lastname: request.lastname,
          mustChangePassword: false,
          creationDateUTC: DateTime.now().toUtc().timestampProto,
        );

        final result = await userCollection
            .insertOne(userPrivate.toProto3Json() as Map<String, dynamic>);
        if (result.hasWriteErrors) {
          throw GrpcError.unknown(
              'hasWriteErrors ${result.writeError!.errmsg}');
        }
        final timestamp = DateTime.now().timestampProto;
        if (result.success && result.document != null) {
          final userId = result.document!['userId'];
          
          // Call weebi_express to send confirmation email (fire-and-forget)
          _sendConfirmationEmailAsync(
            userId: userId,
            email: request.mail,
            firstname: request.firstname,
            lastname: request.lastname,
          );
          
          _logger.logRpcExit('signUp', call, resultData: {
            'userId': userId,
            'mail': request.mail,
          });
          
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
        _logger.error('Signup error', extra: {'mail': request.mail}, error: e);
        rethrow;
      }
    });
  }

  /// Sends confirmation email via weebi_express service (async, non-blocking)
  /// This is fire-and-forget - errors are logged but don't affect the signup flow
  void _sendConfirmationEmailAsync({
    required String userId,
    required String email,
    required String firstname,
    required String lastname,
  }) {
    final baseUrl = AppEnvironment.weebiExpressBaseUrl;
    if (baseUrl == null || baseUrl.isEmpty) {
      _logger.warning('WEEBI_EXPRESS_BASE_URL not configured, skipping confirmation email',
          extra: {'userId': userId, 'email': email});
      return;
    }

    // Create service account JWT token with weebi_express secret
    final expressSecret = AppEnvironment.weebiExpressJwtSecretKey;
    final jwt = JsonWebToken(secretKeyFactory: () => expressSecret);
    jwt.createPayload(
      'weebi_express_service_account',
      expireIn: const Duration(hours: 1),
    );
    final token = jwt.sign();

    // Prepare request payload
    final payload = jsonEncode({
      'userId': userId,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
    });

    // Make async HTTP request (fire-and-forget)
    final url = Uri.parse('$baseUrl/api/v1/emails/send-confirmation');
    http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: payload,
    ).then((response) {
      if (response.statusCode == 200) {
        _logger.info('Confirmation email sent successfully',
            extra: {'userId': userId, 'email': email});
      } else {
        _logger.warning('Failed to send confirmation email',
            extra: {
              'userId': userId,
              'email': email,
              'statusCode': response.statusCode,
              'response': response.body,
            });
      }
    }).catchError((error) {
      _logger.error('Error calling weebi_express send-confirmation',
          extra: {'userId': userId, 'email': email}, error: error);
    });
  }

  /// returns empty user if not found
  Future<UserPublic> _isMailAlreadyUsed(String mail) async {
    return databaseMiddleware<UserPublic>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);
      try {
        final userMap = await userCollection.findOne(where.eq('mail', mail));
        if (userMap != null) {
          return UserPublic.create()
            ..mergeFromProto3Json(userMap, ignoreUnknownFields: true);
        } else {
          return UserPublic.create();
        }
      } catch (e) {
        _logger.error('Error checking if mail already used', extra: {'mail': mail}, error: e);
        rethrow;
      }
    });
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
    return databaseMiddleware<SignUpResponse>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

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
        _logger.error('Error updating pending user', extra: {'userId': user.userId}, error: e);
        rethrow;
      }
    });
  }

  @override
  Future<ReadAllChainsResponse> readAllChains(
      ServiceCall? call, Empty request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.chainRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read chain');
    }

    final chains = await _checkChainsAndProtoThem(userPermission);
    return ReadAllChainsResponse(chains: chains);
  }

  @override
  Future<ReadAllBoutiquesResponse> readAllBoutiques(
      ServiceCall? call, Empty request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

    if (userPermission.boutiqueRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read boutiques');
    }

    // Get all chains (this already filters out deleted boutiques)
    final chains = await _checkChainsAndProtoThem(userPermission);

    // Extract BoutiquePb from each boutique (following readOneBoutique pattern)
    final allBoutiques = <BoutiquePb>[];
    for (final chain in chains) {
      for (final boutique in chain.boutiques) {
        allBoutiques.add(boutique.boutique);
      }
    }

    return ReadAllBoutiquesResponse(boutiques: allBoutiques);
  }

  @override
  Future<StatusResponse> updateUserPassword(
      ServiceCall? call, PasswordUpdateRequest request) async {
    if (request.firmId.isEmpty ||
        request.userId.isEmpty ||
        request.passwordCurrent.isEmpty ||
        request.passwordNew.isEmpty) {
      throw GrpcError.invalidArgument(
          'firmId / userId / passwordCurrent / passwordNew cannot be empty');
    }
    if (request.passwordCurrent == request.passwordNew) {
      throw GrpcError.invalidArgument(
          'passwordCurrent and passwordNew must be different');
    }

    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

    if (userPermission.isFirmAccessible(request.firmId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from firm ${request.firmId}');
    }

    /// userManagementRights.rights is not enough here
    /// use canUpdateUserPassword
    if (request.userId != userPermission.userId &&
        userPermission.userManagementRights.canUpdateUserPassword == false) {
      throw GrpcError.permissionDenied(
          "you do not have the right to update other users' passwords");
    }

    final passwordNewEncrypted = _checkAndEncryptPassword(request.passwordNew);
    // we do not use _checkAndEncryptPassword below because it could lead to techical bug (catch 22)
    // in case password making rules change in the future
    final passwordCurrentEncrypted =
        Encrypter(request.passwordCurrent).encrypted;

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

      try {
        /// ****************
        // * double security in case user bearer token is compromised
        /// ****************
        final user = await userCollection.findOne(
            where.eq('firmId', request.firmId).eq('userId', request.userId));
        if (user == null) {
          throw GrpcError.notFound(
              'userId ${request.userId} not found in firmId ${request.firmId}');
        }
        final userMongo = UserPrivate.create()
          ..mergeFromProto3Json(user, ignoreUnknownFields: true);
        if (userMongo.passwordEncrypted != passwordCurrentEncrypted) {
          throw GrpcError.invalidArgument('passwordCurrent is incorrect');
        }

        /// ****************
        // * update password
        /// ****************
        await userCollection.update(
            where.eq('firmId', request.firmId).eq('userId', request.userId),
            ModifierBuilder()
                .set('password', passwordNewEncrypted)
                .set('mustChangePassword', false));

        ///TODO: invalidate all existing tokens for this user
        // await _invalidateAllUserTokens(request.userId);
        ///... generate new token
        // final newToken = await _generateNewToken(request.userId);
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
    });
  }

  @override
  Future<UsersPublic> readAllUsers(ServiceCall call, Empty request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

    // DEBUG: Log user permissions and firmId
    print(
        'DEBUG readAllUsers: userPermission.firmId = ${userPermission.firmId}');
    print(
        'DEBUG readAllUsers: userPermission.userManagementRights.rights = ${userPermission.userManagementRights.rights}');
    print(
        'DEBUG readAllUsers: userPermission.fullAccess.hasFullAccess = ${userPermission.fullAccess.hasFullAccess}');

    if (userPermission.userManagementRights.rights
            .any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read users');
    }
    return databaseMiddleware<UsersPublic>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

      try {
        final usersMongo = await userCollection
            .find(where.eq('firmId', userPermission.firmId))
            .toList();

        // DEBUG: Log database query results
        print(
            'DEBUG readAllUsers: Found ${usersMongo.length} users in database');
        print('DEBUG readAllUsers: Query firmId = ${userPermission.firmId}');
        for (int i = 0; i < usersMongo.length; i++) {
          print(
              'DEBUG readAllUsers: User $i: ${usersMongo[i]['firstname']} ${usersMongo[i]['lastname']} (firmId: ${usersMongo[i]['firmId']})');
        }

        if (usersMongo.isEmpty) {
          print('DEBUG readAllUsers: No users found, returning empty list');
          return UsersPublic(users: []);
        }
        final users = <UserPublic>[];
        for (final userMongo in usersMongo) {
          users.add(UserPublic.create()
            ..mergeFromProto3Json(userMongo, ignoreUnknownFields: true));
        }

        if (userPermission.fullAccess.hasFullAccess) {
          print(
              'DEBUG readAllUsers: User has full access, returning ${users.length} users');
          return UsersPublic(users: users);
        }
        // if requestor has limitedAccess we retain only users that belong to his/her "fence"
        final usersFiltered = users
          ..retainWhere((userFound) {
            // userFound without any access are included
            // allowing managers to easily redefine their accesses
            if (userFound.permissions.limitedAccess.chainIds.ids.isNotEmpty ||
                userFound
                    .permissions.limitedAccess.boutiqueIds.ids.isNotEmpty) {
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
    });
  }

  /// for web app
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
        : call.bearer.userPermissions;
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

    return databaseMiddleware<Device>(_poolService, (db) async {
      final boutiqueCollection = db.collection(boutiqueCollectionName);

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
          changeStreamOptions:
              ChangeStreamOptions(fullDocument: 'updateLookup'));

      bool pleaseClose = false;

      /// As the stream does not end until it is closed, do not use .toList()
      /// or you will wait indefinitely
      Device device = Device.create();
      Chain chainUpdated = Chain.create();
      final controller = stream.listen((changeEvent) {
        final fullDocument = changeEvent.fullDocument ?? <String, dynamic>{};

        print('Detected change for "chainId" '
            '${fullDocument['chainId']}: "${fullDocument['name']}"');
        chainUpdated.mergeFromProto3Json(fullDocument,
            ignoreUnknownFields: true);

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
              devices.toList().sort(
                  (a, b) => a.timestamp.seconds.compareTo(b.timestamp.seconds));
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
    });
  }

  @override
  Future<StatusResponse> deleteOneBoutique(
      ServiceCall call, BoutiqueRequest request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (request.boutique.boutiqueId.isEmpty) {
      throw GrpcError.invalidArgument('boutiqueId cannot be empty');
    }
    if (userPermission.boutiqueRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete boutique');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }

    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);

    final boutiqueIndex = chain.boutiques.indexWhere((btq) =>
        btq.chainId == request.chainId &&
        btq.boutiqueId == request.boutique.boutiqueId);
    if (boutiqueIndex == -1) {
      throw GrpcError.notFound('no boutique match found');
    }

    // Soft delete: mark as deleted instead of removing
    final boutique = chain.boutiques[boutiqueIndex];
    if (boutique.isDeleted) {
      throw GrpcError.failedPrecondition(
          'boutique ${request.boutique.boutiqueId} is already deleted');
    }

    boutique.isDeleted = true;
    boutique.boutique.isDeleted =
        true; // Sync the nested boutique isDeleted field
    boutique.deletedBy = userPermission.userId;
    boutique.boutique.deletedBy =
        userPermission.userId; // Sync the nested deletedBy field
    boutique.lastTouchTimestampUTC = DateTime.now().timestampProto;

    // update chain in db
    try {
      await _updateOneChainDBExec(chain);
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED // soft delete in fact
        ..timestamp = DateTime.now().timestampProto;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StatusResponse> restoreOneBoutique(
      ServiceCall call, BoutiqueRequest request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

    if (request.boutique.boutiqueId.isEmpty) {
      throw GrpcError.invalidArgument('boutiqueId cannot be empty');
    }

    // Permission check: user needs delete permission to restore
    // This makes sense: if you can delete, you can undo the deletion
    // Alternatively, could check for firm-level rights for stricter control
    if (userPermission.boutiqueRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to restore boutique');
    }

    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }

    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);

    final boutiqueIndex = chain.boutiques.indexWhere((btq) =>
        btq.chainId == request.chainId &&
        btq.boutiqueId == request.boutique.boutiqueId);

    if (boutiqueIndex == -1) {
      throw GrpcError.notFound('no boutique match found');
    }

    final boutique = chain.boutiques[boutiqueIndex];

    // Can only restore a deleted boutique
    if (!boutique.isDeleted) {
      throw GrpcError.failedPrecondition(
          'boutique ${request.boutique.boutiqueId} is not deleted - nothing to restore');
    }

    // Restore: unmark as deleted
    boutique.isDeleted = false;
    boutique.boutique.isDeleted =
        false; // Sync the nested boutique isDeleted field
    boutique.restoredBy = userPermission.userId;
    boutique.boutique.restoredBy =
        userPermission.userId; // Sync the nested restoredBy field
    boutique.lastTouchTimestampUTC = DateTime.now().timestampProto;

    // Note: deletedBy is intentionally kept for audit trail
    // Shows who deleted it originally and who restored it

    // update chain in db
    try {
      await _updateOneChainDBExec(chain);
      return StatusResponse()
        ..type = StatusResponse_Type.UPDATED
        ..timestamp = DateTime.now().timestampProto;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StatusResponse> deleteOneChain(
      ServiceCall call, ChainRequest request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (request.chainId.isEmpty) {
      throw GrpcError.invalidArgument('chainId cannot be empty');
    }
    if (userPermission.chainRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete chain');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final boutiqueCollection = db.collection(boutiqueCollectionName);

      try {
        await boutiqueCollection.deleteOne(where
            .eq('firmId', userPermission.firmId)
            .eq('chainId', request.chainId));
        return StatusResponse()
          ..type = StatusResponse_Type.DELETED
          ..timestamp = DateTime.now().timestampProto;
      } on GrpcError catch (e) {
        print(e);
        rethrow;
      }
    });
  }

  @override
  Future<BoutiqueResponse> readOneBoutique(
      ServiceCall call, BoutiqueRequest request) async {
    final userPermission = isMock
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (request.boutique.boutiqueId.isEmpty) {
      throw GrpcError.invalidArgument('boutiqueId cannot be empty');
    }
    if (userPermission.boutiqueRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read boutique');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }

    final chain =
        await _checkOneChainAndProtoIt(userPermission.firmId, request.chainId);

    final boutiqueIndex = chain.boutiques.indexWhere((btq) =>
        btq.chainId == request.chainId &&
        btq.boutiqueId == request.boutique.boutiqueId);
    if (boutiqueIndex == -1) {
      throw GrpcError.notFound('no boutique match found');
    }

    final boutique = chain.boutiques[boutiqueIndex];

    // Check if boutique is soft-deleted
    if (boutique.isDeleted) {
      throw GrpcError.notFound(
          'boutique ${request.boutique.boutiqueId} has been deleted');
    }

    // If the boutiqueId is not properly set initially, set it from the parent
    if (boutique.boutique.boutiqueId.isEmpty) {
      boutique.boutique.boutiqueId = boutique.boutiqueId;
    }

    return BoutiqueResponse(
      boutique: boutique.boutique,
      logo: boutique.logo,
      logoExtension: boutique.logoExtension,
    );
  }

  @override
  Future<StatusResponse> requestPasswordReset(
      ServiceCall? call, PasswordResetRequest request) async {
    _logger.logRpcEntry('requestPasswordReset', call, requestData: {
      'mail': request.mail,
    });
    
    if (request.mail.isEmpty) {
      throw GrpcError.invalidArgument('mail cannot be empty');
    }

    // Verify user exists
    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

      try {
        final userMongo = await userCollection.findOne(
            where.eq('mail', request.mail));

        if (userMongo == null) {
          // Don't reveal if email exists or not (security best practice)
          // But still log for debugging
          _logger.warning('Password reset requested for non-existent email',
              extra: {'mail': request.mail});
          // Return success anyway to prevent email enumeration
          return StatusResponse()
            ..type = StatusResponse_Type.SUCCESS
            ..timestamp = DateTime.now().timestampProto;
        }

        // Call weebi_express to send password reset email (fire-and-forget)
        _sendPasswordResetEmailAsync(email: request.mail);

        _logger.logRpcExit('requestPasswordReset', call);
        return StatusResponse()
          ..type = StatusResponse_Type.SUCCESS
          ..timestamp = DateTime.now().timestampProto;
      } on GrpcError catch (e) {
        _logger.logRpcError('requestPasswordReset', call, e, extra: {
          'mail': request.mail,
        });
        rethrow;
      }
    });
  }

  @override
  Future<StatusResponse> confirmPasswordReset(
      ServiceCall? call, PasswordResetConfirmRequest request) async {
    _logger.logRpcEntry('confirmPasswordReset', call, requestData: {
      'mail': request.mail,
    });
    
    if (request.mail.isEmpty || request.newPassword.isEmpty) {
      throw GrpcError.invalidArgument('mail and newPassword are required');
    }

    // Note: Token validation is done by weebi_express before calling this RPC
    // We just need to update the password

    final passwordNewEncrypted = _checkAndEncryptPassword(request.newPassword);

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

      try {
        final userMongo = await userCollection.findOne(
            where.eq('mail', request.mail));

        if (userMongo == null) {
          throw GrpcError.notFound('user with mail ${request.mail} not found');
        }

        await userCollection.update(
            where.eq('mail', request.mail),
            ModifierBuilder()
                .set('passwordEncrypted', passwordNewEncrypted)
                .set('mustChangePassword', false));

        _logger.logRpcExit('confirmPasswordReset', call);
        return StatusResponse()
          ..type = StatusResponse_Type.UPDATED
          ..timestamp = DateTime.now().timestampProto;
      } on GrpcError catch (e) {
        _logger.logRpcError('confirmPasswordReset', call, e, extra: {
          'mail': request.mail,
        });
        rethrow;
      }
    });
  }

  @override
  Future<StatusResponse> updateSubscriberId(
      ServiceCall? call, UpdateSubscriberIdRequest request) async {
    _logger.logRpcEntry('updateSubscriberId', call, requestData: {
      'mail': request.mail,
      'subscriberId': request.subscriberId,
      'userId': request.userId.isNotEmpty ? request.userId : 'not provided',
    });

    if (request.mail.isEmpty) {
      throw GrpcError.invalidArgument('mail cannot be empty');
    }

    if (request.subscriberId.isEmpty) {
      throw GrpcError.invalidArgument('subscriberId cannot be empty');
    }

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

      try {
        // If userId is provided, use it directly for better performance
        // Otherwise, look up by email (weebi_server guarantees unique email per user)
        final userMongo = request.userId.isNotEmpty
            ? await userCollection.findOne(where.eq('userId', request.userId))
            : await userCollection.findOne(where.eq('mail', request.mail));

        if (userMongo == null) {
          final identifier = request.userId.isNotEmpty 
              ? 'userId ${request.userId}' 
              : 'mail ${request.mail}';
          throw GrpcError.notFound('user with $identifier not found');
        }

        // Verify email matches if userId was provided (safety check)
        if (request.userId.isNotEmpty && 
            userMongo['mail'] != request.mail) {
          _logger.warning('Email mismatch when updating subscriberId',
              extra: {
                'providedUserId': request.userId,
                'providedMail': request.mail,
                'foundMail': userMongo['mail'],
              });
          throw GrpcError.invalidArgument(
              'email mismatch: provided mail does not match userId');
        }

        // Update using userId (more efficient than email lookup)
        final userId = userMongo['userId'] as String;
        await userCollection.update(
            where.eq('userId', userId),
            ModifierBuilder().set('subscriberId', request.subscriberId));

        _logger.logRpcExit('updateSubscriberId', call);
        return StatusResponse()
          ..type = StatusResponse_Type.UPDATED
          ..timestamp = DateTime.now().timestampProto;
      } on GrpcError catch (e) {
        _logger.logRpcError('updateSubscriberId', call, e, extra: {
          'mail': request.mail,
          'subscriberId': request.subscriberId,
          'userId': request.userId,
        });
        rethrow;
      }
    });
  }

  @override
  Future<StatusResponse> markEmailVerified(
      ServiceCall? call, MarkEmailVerifiedRequest request) async {
    _logger.logRpcEntry('markEmailVerified', call, requestData: {
      'mail': request.mail,
      'userId': request.userId.isNotEmpty ? request.userId : 'not provided',
    });

    if (request.mail.isEmpty) {
      throw GrpcError.invalidArgument('mail cannot be empty');
    }

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final userCollection = db.collection(userCollectionName);

      try {
        // If userId is provided, use it directly for better performance
        // Otherwise, look up by email (weebi_server guarantees unique email per user)
        final userMongo = request.userId.isNotEmpty
            ? await userCollection.findOne(where.eq('userId', request.userId))
            : await userCollection.findOne(where.eq('mail', request.mail));

        if (userMongo == null) {
          final identifier = request.userId.isNotEmpty 
              ? 'userId ${request.userId}' 
              : 'mail ${request.mail}';
          throw GrpcError.notFound('user with $identifier not found');
        }

        // Verify email matches if userId was provided (safety check)
        if (request.userId.isNotEmpty && 
            userMongo['mail'] != request.mail) {
          _logger.warning('Email mismatch when marking email as verified',
              extra: {
                'providedUserId': request.userId,
                'providedMail': request.mail,
                'foundMail': userMongo['mail'],
              });
          throw GrpcError.invalidArgument(
              'email mismatch: provided mail does not match userId');
        }

        // Update using userId (more efficient than email lookup)
        final userId = userMongo['userId'] as String;
        await userCollection.update(
            where.eq('userId', userId),
            ModifierBuilder().set('emailVerificationSent', true));

        _logger.logRpcExit('markEmailVerified', call);
        return StatusResponse()
          ..type = StatusResponse_Type.UPDATED
          ..timestamp = DateTime.now().timestampProto;
      } on GrpcError catch (e) {
        _logger.logRpcError('markEmailVerified', call, e, extra: {
          'mail': request.mail,
          'userId': request.userId,
        });
        rethrow;
      }
    });
  }

  /// Sends password reset email via weebi_express service (async, non-blocking)
  /// This is fire-and-forget - errors are logged but don't affect the flow
  void _sendPasswordResetEmailAsync({
    required String email,
  }) {
    final baseUrl = AppEnvironment.weebiExpressBaseUrl;
    if (baseUrl == null || baseUrl.isEmpty) {
      _logger.warning('WEEBI_EXPRESS_BASE_URL not configured, skipping password reset email',
          extra: {'email': email});
      return;
    }

    // Create service account JWT token with weebi_express secret
    final expressSecret = AppEnvironment.weebiExpressJwtSecretKey;
    final jwt = JsonWebToken(secretKeyFactory: () => expressSecret);
    jwt.createPayload(
      'weebi_express_service_account',
      expireIn: const Duration(hours: 1),
    );
    final token = jwt.sign();

    // Prepare request payload
    final payload = jsonEncode({
      'email': email,
    });

    // Make async HTTP request (fire-and-forget)
    final url = Uri.parse('$baseUrl/api/v1/emails/send-password-reset');
    http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: payload,
    ).then((response) {
      if (response.statusCode == 200) {
        _logger.info('Password reset email sent successfully',
            extra: {'email': email});
      } else {
        _logger.warning('Failed to send password reset email',
            extra: {
              'email': email,
              'statusCode': response.statusCode,
              'response': response.body,
            });
      }
    }).catchError((error) {
      _logger.error('Error calling weebi_express send-password-reset',
          extra: {'email': email}, error: error);
    });
  }

  @override
  Future<HealthCheckWeebiResponse> healthCheck(
      ServiceCall? call, Empty request) async {
    try {
      // Check database connectivity
      final isDbHealthy = await _checkDatabaseHealth();

      // Get version information
      final versionInfo = _getVersionInfo();

      // Create version response
      final versions = ServiceVersions()
        ..server = versionInfo['server'] ?? 'unknown'
        ..protosWeebi = versionInfo['protos_weebi'] ?? 'unknown'
        ..fenceService = versionInfo['fence_service'] ?? 'unknown'
        ..modelsWeebi = versionInfo['models_weebi'] ?? 'unknown';

      // Return health check response
      return HealthCheckWeebiResponse()
        ..status = isDbHealthy ? 'healthy' : 'unhealthy'
        ..timestamp = DateTime.now().toIso8601String()
        ..databaseHealthy = isDbHealthy
        ..versions = versions;
    } catch (e) {
      _logger.error('Health check error', error: e);
      // Return unhealthy status with unknown versions
      return HealthCheckWeebiResponse()
        ..status = 'unhealthy'
        ..timestamp = DateTime.now().toIso8601String()
        ..databaseHealthy = false
        ..versions = (ServiceVersions()
          ..server = 'unknown'
          ..protosWeebi = 'unknown'
          ..fenceService = 'unknown'
          ..modelsWeebi = 'unknown');
    }
  }

  // Email-related methods removed - preserved in lib/src/mail/ folder for future use
}
