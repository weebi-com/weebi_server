import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:protos_weebi/data_dummy.dart';
import 'package:protos_weebi/grpc.dart';

import 'package:test/test.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

import 'service_call_impl.dart';

void main() async {
  final MongoDbPoolService poolService = TestHelper.defaultPoolService;
  await poolService.initialize();

  late FenceService fenceService;

  setUpAll(() async {
    final db = await poolService.acquire();

    fenceService =
        FenceService(poolService, isMock: false); // we do not mock signup

    await db.createCollection(FenceService.userCollectionName);
    await db.createCollection(FenceService.boutiqueCollectionName);
    await db.createCollection(FenceService.firmCollectionName);
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(FenceService.userCollectionName).drop();
    await db.collection(FenceService.boutiqueCollectionName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    poolService.release(db);
  });

  test('''signup createFirm 
      createPendingUser and then have user signup and authent
      ''', () async {
    // boss signs up
    final response = await fenceService.signUp(
      ServiceCallTest('', path: 'signUp'),
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

    final permissions = tokensBoss.accessToken.userPermissions;

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

    final liliPermissions2 = tokensBoss2.accessToken.userPermissions;

    expect(liliPermissions2.firmRights.rights.length, 3);
    expect(liliPermissions2.firmRights.rights.contains(Right.create), isFalse);
    expect(liliPermissions2.firmId, createFirmResponse.firm.firmId);

    // boss creates alice
    final alice = await fenceService.createPendingUser(
      ServiceCallTest(tokensBoss2.accessToken),
      PendingUserRequest(
          mail: 'alice@weebi.com',
          firstname: 'Alice',
          lastname: 'nonyabusiness',
          phone: Phone(countryCode: 1, number: '123456789'),
          permissions: Dummy.salesPersonPermissionNoId
            ..firmId = createFirmResponse.firm.firmId
            ..userId = response.userId),
    );

    expect(alice.statusResponse.type, StatusResponse_Type.CREATED);
    expect(alice.userPublic.firstname, 'Alice');
    expect(alice.userPublic.mail, 'alice@weebi.com');
    expect(alice.userPublic.phone.countryCode, 1);
    expect(alice.userPublic.phone.number, '123456789');

    // alice signs up and is linked to boss' firm
    final aliceSignUp = await fenceService.signUp(
      ServiceCallTest('', path: 'signUp'),
      SignUpRequest(mail: 'alice@weebi.com', password: '987654321'),
    );

    expect(aliceSignUp.statusResponse.type, StatusResponse_Type.UPDATED);
    // indeed update since alice was already created by boss
    expect(aliceSignUp.userId.isNotEmpty, isTrue);

// alice logins with the appropriate access and rights
    final aliceToken = await fenceService.authenticateWithCredentials(
        null, Credentials(mail: 'alice@weebi.com', password: '987654321'));

    expect(aliceToken.accessToken.isNotEmpty, isTrue);

    final alicePermission = aliceToken.accessToken.userPermissions;
    // final alicePermission = await fenceService.readUserPermissionsByToken(null, Empty());
    expect(alicePermission.firmRights.rights.contains(Right.create), isFalse);
    expect(alicePermission.userId, aliceSignUp.userId);
    expect(alicePermission.firmId, createFirmResponse.firm.firmId);
    expect(alicePermission.articleRights,
        Dummy.salesPersonPermissionNoId.articleRights);


    // Alice tries to authent with wrong password
    try {
      await fenceService.authenticateWithCredentials(
          null, Credentials(mail: 'alice@weebi.com', password: 'ILostIt!!'));
    } on GrpcError catch (e) {
      expect(e.message, 'incorrect login or password');
      expect(e.code, 3);
    }

    //  Alice lost her password and asks Lili the boss to reset it
    // Lili first readAllUsers
    final allUsers = await fenceService.readAllUsers(
        ServiceCallTest(tokensBoss2.accessToken), Empty());

    // Lili does not need to look very far!
    expect(allUsers.users.length, 2);
    final aliceUser = allUsers.users.firstWhere((u) => u.firstname == 'Alice');

    final passwordUpdaeResponse = await fenceService.updateUserPassword(
        ServiceCallTest(tokensBoss2.accessToken),
        PasswordUpdateRequest(
            userId: aliceUser.userId,
            firmId: liliPermissions2.firmId,
            passwordCurrent: '987654321',
            passwordNew: 'alice2024'));
    expect(passwordUpdaeResponse.type, StatusResponse_Type.UPDATED);

    // Alice authents with new password

    final aliceToken2 = await fenceService.authenticateWithCredentials(
        null, Credentials(mail: 'alice@weebi.com', password: 'alice2024'));

    expect(aliceToken2.accessToken.isNotEmpty, isTrue);

    // A couple days later Alice forgot her password again
    // Lili is fed up with Alice, fires her and deletes her account

    final deleteUserResponse = await fenceService.deleteOneUser(
        ServiceCallTest(tokensBoss2.accessToken),
        UserId(userId: aliceUser.userId));

    expect(deleteUserResponse.type, StatusResponse_Type.DELETED);
  });
}
