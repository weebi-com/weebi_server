import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:protos_weebi/data_dummy.dart';
import 'package:protos_weebi/grpc.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

import 'service_call_impl.dart';

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('founder_signup_pairing_test');
  await poolService.initialize();

  late FenceService fenceService;

  setUpAll(() async {
    fenceService = FenceService(poolService, isMock: false);
    final db = await poolService.acquire();
    await db.createCollection(FenceService.userCollectionName);
    await db.createCollection(FenceService.boutiqueCollectionName);
    await db.createCollection(FenceService.firmCollectionName);
    await db.createCollection(FenceService.pairingCodesCollectionName);
    await db.createCollection('web_sessions');
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(FenceService.userCollectionName).drop();
    await db.collection(FenceService.boutiqueCollectionName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    await db.collection(FenceService.pairingCodesCollectionName).drop();
    await db.collection('web_sessions').drop();
    poolService.release(db);
  });

  test('founder pairs a device with the createFirm credential and no second login',
      () async {
    final signup = await fenceService.signUp(
      ServiceCallTest('', path: 'signUp'),
      SignUpRequest(
        firstname: 'Founder',
        lastname: 'Boss',
        mail: 'founder@weebi.com',
        password: '123456',
        phone: Phone(countryCode: 33, number: '612345678'),
      ),
    );
    expect(signup.statusResponse.type, StatusResponse_Type.CREATED);

    final login = await fenceService.authenticateWithCredentials(
      null,
      Credentials(mail: 'founder@weebi.com', password: '123456'),
    );
    final before = login.accessToken.userPermissions;
    expect(before.firmId, isEmpty);
    expect(before.isFirmCreator, isFalse);
    expect(before.firmRights.rights.contains(Right.create), isTrue);
    expect(before.chainRights.rights.contains(Right.create), isTrue);
    expect(before.fullAccess.hasFullAccess, isTrue);

    final created = await fenceService.createFirm(
      ServiceCallTest(login.accessToken),
      CreateFirmRequest(name: 'Founder Shop'),
    );
    expect(created.statusResponse.type, StatusResponse_Type.CREATED);
    expect(created.accessToken, isNotEmpty);
    expect(created.refreshToken, isNotEmpty);
    expect(created.sessionId, isEmpty);

    final after = created.accessToken.userPermissions;
    expect(after.firmId, created.firm.firmId);
    expect(after.isFirmCreator, isTrue);
    expect(after.firmRights.rights.contains(Right.create), isFalse);
    expect(after.firmRights.rights.contains(Right.read), isTrue);
    expect(after.chainRights.rights.contains(Right.create), isTrue);

    final code = await fenceService.generateCodeForPairingDevice(
      ServiceCallTest(created.accessToken),
      ChainIdAndboutiqueId(
        chainId: created.firm.firmId,
        boutiqueId: created.firm.firmId,
      ),
    );
    expect(code.code, isNot(0));
    expect(code.firmId, created.firm.firmId);

    final device = await fenceService.createDevice(
      ServiceCallTest(created.accessToken),
      PendingDeviceRequest(
        code: code.code,
        hardwareInfo: HardwareInfo(name: 'till', baseOS: 'test'),
      ),
    );
    expect(device.statusResponse.type, StatusResponse_Type.CREATED);
    expect(device.deviceId, isNotEmpty);
    expect(device.firmId, created.firm.firmId);

    expect(
      () => fenceService.createFirm(
        ServiceCallTest(created.accessToken),
        CreateFirmRequest(name: 'Second shop'),
      ),
      throwsA(isA<GrpcError>()),
    );
  });

  test('web session is rewritten by createFirm and the next jwt can pair',
      () async {
    final signup = await fenceService.signUp(
      ServiceCallTest('', path: 'signUp'),
      SignUpRequest(
        firstname: 'Web',
        lastname: 'Boss',
        mail: 'webfounder@weebi.com',
        password: '123456',
      ),
    );
    expect(signup.statusResponse.type, StatusResponse_Type.CREATED);

    final login = await fenceService.authenticateWithCredentials(
      null,
      Credentials(mail: 'webfounder@weebi.com', password: '123456'),
    );
    const sessionId = 'founder-web-session';
    final db = await poolService.acquire();
    try {
      await db.collection('web_sessions').insertOne({
        '_id': sessionId,
        'jwt': login.accessToken,
        'refreshToken': login.refreshToken,
        'userId': signup.userId,
        'createdAt': DateTime.now().toIso8601String(),
        'expiresAt': DateTime.now().add(const Duration(days: 7)),
        'lastAccessed': DateTime.now().toIso8601String(),
      });
    } finally {
      poolService.release(db);
    }

    final created = await fenceService.createFirm(
      ServiceCallTest(login.accessToken, sessionId: sessionId),
      CreateFirmRequest(name: 'Web Shop'),
    );
    expect(created.sessionId, sessionId);
    expect(
      created.accessToken,
      isEmpty,
      reason: 'Web BFF createFirm must keep accessToken server-side',
    );
    expect(
      created.refreshToken,
      isEmpty,
      reason: 'Web BFF createFirm must keep refreshToken server-side',
    );

    final dbAfter = await poolService.acquire();
    late String sessionJwt;
    try {
      final session =
          await dbAfter.collection('web_sessions').findOne(where.eq('_id', sessionId));
      sessionJwt = session!['jwt'] as String;
    } finally {
      poolService.release(dbAfter);
    }

    final sessionPermissions = sessionJwt.userPermissions;
    expect(sessionPermissions.firmId, created.firm.firmId);
    expect(sessionPermissions.chainRights.rights.contains(Right.create), isTrue);
    expect(sessionPermissions.firmRights.rights.contains(Right.create), isFalse);

    final code = await fenceService.generateCodeForPairingDevice(
      ServiceCallTest(sessionJwt),
      ChainIdAndboutiqueId(
        chainId: created.firm.firmId,
        boutiqueId: created.firm.firmId,
      ),
    );
    expect(code.code, isNot(0));
  });

  test('pending staff keep their permissions and cannot pair a device', () async {
    final bossSignup = await fenceService.signUp(
      ServiceCallTest('', path: 'signUp'),
      SignUpRequest(
        firstname: 'Boss',
        lastname: 'Two',
        mail: 'boss2@weebi.com',
        password: '123456',
      ),
    );
    final bossLogin = await fenceService.authenticateWithCredentials(
      null,
      Credentials(mail: 'boss2@weebi.com', password: '123456'),
    );
    final firm = await fenceService.createFirm(
      ServiceCallTest(bossLogin.accessToken),
      CreateFirmRequest(name: 'Staff Shop'),
    );

    final alice = await fenceService.createPendingUser(
      ServiceCallTest(firm.accessToken),
      PendingUserRequest(
        password: '987654321',
        mail: 'alice-staff@weebi.com',
        firstname: 'Alice',
        lastname: 'Staff',
        permissions: Dummy.salesPersonPermissionNoId
          ..firmId = firm.firm.firmId
          ..userId = bossSignup.userId,
      ),
    );
    expect(alice.statusResponse.type, StatusResponse_Type.CREATED);

    final aliceSignup = await fenceService.signUp(
      ServiceCallTest('', path: 'signUp'),
      SignUpRequest(mail: 'alice-staff@weebi.com', password: '987654321'),
    );
    expect(aliceSignup.statusResponse.type, StatusResponse_Type.UPDATED);

    final aliceLogin = await fenceService.authenticateWithCredentials(
      null,
      Credentials(mail: 'alice-staff@weebi.com', password: '987654321'),
    );
    final alicePermissions = aliceLogin.accessToken.userPermissions;
    expect(alicePermissions.firmRights.rights.contains(Right.create), isFalse);
    expect(alicePermissions.chainRights.rights.contains(Right.create), isFalse);
    expect(alicePermissions.firmId, firm.firm.firmId);
    expect(
      alicePermissions.articleRights,
      Dummy.salesPersonPermissionNoId.articleRights,
    );

    expect(
      () => fenceService.generateCodeForPairingDevice(
        ServiceCallTest(aliceLogin.accessToken),
        ChainIdAndboutiqueId(
          chainId: firm.firm.firmId,
          boutiqueId: firm.firm.firmId,
        ),
      ),
      throwsA(isA<GrpcError>()),
    );
  });

  test('createFirm does not return CREATED when the user row is missing', () async {
    final signup = await fenceService.signUp(
      ServiceCallTest('', path: 'signUp'),
      SignUpRequest(
        firstname: 'Ghost',
        lastname: 'User',
        mail: 'ghost@weebi.com',
        password: '123456',
      ),
    );
    final login = await fenceService.authenticateWithCredentials(
      null,
      Credentials(mail: 'ghost@weebi.com', password: '123456'),
    );

    final db = await poolService.acquire();
    try {
      await db
          .collection(FenceService.userCollectionName)
          .deleteOne(where.eq('userId', signup.userId));
    } finally {
      poolService.release(db);
    }

    await expectLater(
      fenceService.createFirm(
        ServiceCallTest(login.accessToken),
        CreateFirmRequest(name: 'Orphan'),
      ),
      throwsA(
        isA<GrpcError>().having(
          (error) => error.code,
          'code',
          StatusCode.internal,
        ),
      ),
    );
  });
}
