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
      TestHelper.poolForDatabase('update_user_password_admin_test');
  await poolService.initialize();

  late FenceService fenceService;

  setUpAll(() async {
    fenceService = FenceService(poolService, isMock: false);
    final db = await poolService.acquire();
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

  test('admin with canUpdateUserPassword sets another user password without current',
      () async {
    final signUp = await fenceService.signUp(
      ServiceCallTest('', path: 'signUp'),
      SignUpRequest(
        firstname: 'Boss',
        lastname: 'Pwd',
        mail: 'boss_pwd@weebi.com',
        password: '123456',
      ),
    );
    expect(signUp.statusResponse.type, StatusResponse_Type.CREATED);

    final tokensBoss = await fenceService.authenticateWithCredentials(
      null,
      Credentials(mail: 'boss_pwd@weebi.com', password: '123456'),
    );

    final createFirmResponse = await fenceService.createFirm(
      ServiceCallTest(tokensBoss.accessToken),
      CreateFirmRequest(name: "Boss Pwd Biz"),
    );
    expect(createFirmResponse.statusResponse.type, StatusResponse_Type.CREATED);
    final firmId = createFirmResponse.firm.firmId;

    final tokensBoss2 = await fenceService.authenticateWithRefreshToken(
      null,
      RefreshToken(refreshToken: tokensBoss.refreshToken),
    );

    final alice = await fenceService.createPendingUser(
      ServiceCallTest(tokensBoss2.accessToken),
      PendingUserRequest(
        password: 'unknown-temp-xyz',
        mail: 'alice_pwd@weebi.com',
        firstname: 'Alice',
        lastname: 'Pwd',
        permissions: Dummy.salesPersonPermissionNoId
          ..firmId = firmId
          ..userId = signUp.userId,
      ),
    );
    expect(alice.statusResponse.type, StatusResponse_Type.CREATED);

    final reset = await fenceService.updateUserPassword(
      ServiceCallTest(tokensBoss2.accessToken),
      PasswordUpdateRequest(
        userId: alice.userPublic.userId,
        firmId: firmId,
        passwordNew: 'alice-first-login',
      ),
    );
    expect(reset.type, StatusResponse_Type.UPDATED);

    final aliceTokens = await fenceService.authenticateWithCredentials(
      null,
      Credentials(mail: 'alice_pwd@weebi.com', password: 'alice-first-login'),
    );
    expect(aliceTokens.accessToken.isNotEmpty, isTrue);

    expect(
      () => fenceService.authenticateWithCredentials(
        null,
        Credentials(mail: 'alice_pwd@weebi.com', password: 'unknown-temp-xyz'),
      ),
      throwsA(isA<GrpcError>()),
    );
  });

  test('self-service still requires passwordCurrent', () async {
    final signUp = await fenceService.signUp(
      ServiceCallTest('', path: 'signUp'),
      SignUpRequest(
        firstname: 'Solo',
        lastname: 'Pwd',
        mail: 'solo_pwd@weebi.com',
        password: '123456',
      ),
    );
    final tokens = await fenceService.authenticateWithCredentials(
      null,
      Credentials(mail: 'solo_pwd@weebi.com', password: '123456'),
    );
    final firm = await fenceService.createFirm(
      ServiceCallTest(tokens.accessToken),
      CreateFirmRequest(name: "Solo Pwd Biz"),
    );
    final tokens2 = await fenceService.authenticateWithRefreshToken(
      null,
      RefreshToken(refreshToken: tokens.refreshToken),
    );

    expect(
      () => fenceService.updateUserPassword(
        ServiceCallTest(tokens2.accessToken),
        PasswordUpdateRequest(
          userId: signUp.userId,
          firmId: firm.firm.firmId,
          passwordNew: 'new-solo-password',
        ),
      ),
      throwsA(isA<GrpcError>()),
    );
  });
}
