import 'package:fence_service/fence_service.dart';
import 'package:fence_service/user_testing.dart';
import 'package:protos_weebi/grpc.dart';

import 'package:test/test.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

void main() async {
  final db = TestHelper.localDb;
  final connection = Connection(ConnectionManager(db));
  late FenceService fenceService;

  setUpAll(() async {
    await db.open();
    final isConnected = await connection.connect();

    expect(isConnected, true);
    fenceService = FenceService(db, isMock: false); // we do not mock signup

    await db.createCollection(fenceService.userCollection.collectionName);
    await db.createCollection(fenceService.boutiqueCollection.collectionName);
  });

  tearDownAll(() async {
    await db.collection(fenceService.userCollection.collectionName).drop();
    await db.collection(fenceService.boutiqueCollection.collectionName).drop();
    await connection.close();
  });

  test('signup', () async {
    // boss signs up
    final response = await fenceService.signUp(
      null,
      SignUpRequest(
          firstname: 'lili',
          lastname: 'D. Boss',
          mail: 'lili@weebi.com',
          password: '123456'),
    );
    expect(response.statusResponse.type, StatusResponse_Type.CREATED);
    expect(response.userId.isNotEmpty, isTrue);

    // The boss authents
    final tokensBoss = await fenceService.authenticateWithCredentials(
        null, Credentials(mail: 'lili@weebi.com', password: '123456'));
    expect(tokensBoss.accessToken.isNotEmpty, isTrue);

    // read permissions to check them
    final permissions = await fenceService.readUserPermissionsByToken(
        ServiceCallTest(tokensBoss.accessToken), Empty());

    expect(permissions.firmId.isEmpty, isTrue);
    expect(permissions.userId, response.userId);
    expect(permissions.firmRights.rights.length, 1);
    expect(permissions.firmRights.rights.contains(Right.create), isTrue);

    // Lili the boss creates her new unique firm
    final createFirmResponse = await fenceService.createFirm(
        ServiceCallTest(tokensBoss.accessToken),
        CreateFirmRequest(name: "Lili's Big Biz"));

    expect(createFirmResponse.firm.firmId.isNotEmpty, isTrue);
    expect(createFirmResponse.statusResponse.type, StatusResponse_Type.CREATED);
    expect(createFirmResponse.firm.name, "Lili's Big Biz");

    // boss permissions should not longer allow firm creation
    final tokensBoss2 = await fenceService.authenticateWithRefreshToken(
        null, RefreshToken(refreshToken: tokensBoss.refreshToken));

    final permissions2 = await fenceService.readUserPermissionsByToken(
        ServiceCallTest(tokensBoss2.accessToken), Empty());

    expect(permissions2.firmRights.rights.length, 3);
    expect(permissions2.firmRights.rights.contains(Right.create), isFalse);
    expect(permissions2.firmId, createFirmResponse.firm.firmId);

    // boss creates alice
    final alice = await fenceService.createPendingUser(
      ServiceCallTest(tokensBoss2.accessToken),
      PendingUserRequest(
          mail: 'alice@weebi.com',
          firstname: 'alice',
          lastname: 'nonyabusiness',
          phone: Phone(countryCode: 1, number: '123456789'),
          permissions: Dummy.salesPersonPermissionNoId
            ..firmId = createFirmResponse.firm.firmId
            ..userId = response.userId),
    );

    expect(alice.statusResponse.type, StatusResponse_Type.CREATED);
    expect(alice.userPublic.firstname, 'alice');
    expect(alice.userPublic.mail, 'alice@weebi.com');
    expect(alice.userPublic.phone.countryCode, 1);
    expect(alice.userPublic.phone.number, '123456789');

    // alice signs up and is linked to boss' firm
    final aliceSignUp = await fenceService.signUp(
        null, SignUpRequest(mail: 'alice@weebi.com', password: '987654321'));

    expect(aliceSignUp.statusResponse.type, StatusResponse_Type.UPDATED);
    // indeed update since alice was already created by boss
    expect(aliceSignUp.userId.isNotEmpty, isTrue);

// alice logins with the appropriate access and rights
    final aliceToken = await fenceService.authenticateWithCredentials(
        null, Credentials(mail: 'alice@weebi.com', password: '987654321'));

    expect(aliceToken.accessToken.isNotEmpty, isTrue);

    final alicePermission = aliceToken.accessToken.userPermission;
    // final alicePermission = await fenceService.readUserPermissionsByToken(null, Empty());
    expect(alicePermission.firmRights.rights.contains(Right.create), isFalse);
    expect(alicePermission.userId, aliceSignUp.userId);
    expect(alicePermission.firmId, createFirmResponse.firm.firmId);
    expect(alicePermission.articleRights,
        Dummy.salesPersonPermissionNoId.articleRights);

    // user john signs up and awaits
    final johnSignUp = await fenceService.signUp(
        null,
        SignUpRequest(
            mail: 'john@weebi.com',
            password: 'iDontMindWaiting',
            firstname: 'John',
            lastname: 'Stressless'));

// John is very patient and waits silently
// boss (finally) creates pending user john which updates john's user
    final bossCreateJohnResponse = await fenceService.createPendingUser(
        ServiceCallTest(tokensBoss2.accessToken),
        PendingUserRequest(
            firstname: 'john',
            lastname: 'whateverIForgotImTheBossIDealWithBiggerIssues',
            mail: 'john@weebi.com',
            phone: Phone(countryCode: 221, number: '784578482'),
            permissions: Dummy.salesPersonPermissionNoId
              ..firmId = createFirmResponse.firm.firmId
              ..userId = johnSignUp.userId));

    // again john already existed, so simple udate
    expect(bossCreateJohnResponse.statusResponse.type,
        StatusResponse_Type.UPDATED);
    expect(bossCreateJohnResponse.userPublic.firstname, 'John');
    expect(bossCreateJohnResponse.userPublic.permissions.firmId,
        createFirmResponse.firm.firmId);
    expect(bossCreateJohnResponse.userPublic.permissions.userId,
        johnSignUp.userId);

    // john logins with the appropriate access and rights
    final johnToken = await fenceService.authenticateWithCredentials(null,
        Credentials(mail: 'john@weebi.com', password: 'iDontMindWaiting'));

    final johnPermission = johnToken.accessToken.userPermission;
    // final alicePermission = await fenceService.readUserPermissionsByToken(null, Empty());
    expect(johnPermission.firmRights.rights.contains(Right.create), isFalse);
    expect(johnPermission.userId, johnSignUp.userId);
    expect(johnPermission.firmId, createFirmResponse.firm.firmId);
    expect(johnPermission.articleRights,
        Dummy.salesPersonPermissionNoId.articleRights);
  });
}
