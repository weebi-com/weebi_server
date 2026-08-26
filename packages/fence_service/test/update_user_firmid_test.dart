import 'package:fence_service/fence_service.dart';
// ignore: unnecessary_import
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:protos_weebi/data_dummy.dart';
import 'package:protos_weebi/encrypter.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

import 'service_call_impl.dart';

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('update_user_firmid_test');
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

  Future<void> clearUsers() async {
    final db = await poolService.acquire();
    try {
      await db.collection(FenceService.userCollectionName).deleteMany({});
      await db.collection(FenceService.firmCollectionName).deleteMany({});
      await db.collection(FenceService.boutiqueCollectionName).deleteMany({});
    } finally {
      poolService.release(db);
    }
  }

  group('JWT heal from UserPrivate.firmId', () {
    tearDown(() async {
      await clearUsers();
    });

    test('login JWT firmId filled when nested permissions.firmId empty',
        () async {
      const firmId = 'firmX';
      const mail = 'corrupt_firmid@weebi.com';
      const password = '123456';
      final userId = DateTime.now().millisecondsSinceEpoch.toString();

      // Corrupt document: top-level firmId set, nested permissions.firmId omitted
      final permissions = UserPermissions.create()
        ..userId = userId
        ..articleRights = ArticleRights(rights: [Right.read]);
      // deliberately do NOT set permissions.firmId

      final userPrivate = UserPrivate(
        userId: userId,
        mail: mail,
        firstname: 'Corrupt',
        lastname: 'User',
        firmId: firmId,
        permissions: permissions,
        passwordEncrypted: Encrypter(password).encrypted,
        mustChangePassword: false,
      );

      final db = await poolService.acquire();
      try {
        await db.collection(FenceService.userCollectionName).insertOne(
              userPrivate.toProto3Json() as Map<String, dynamic>,
            );
      } finally {
        poolService.release(db);
      }

      final tokens = await fenceService.authenticateWithCredentials(
        null,
        Credentials(mail: mail, password: password),
      );

      expect(tokens.accessToken.isNotEmpty, isTrue);
      expect(tokens.accessToken.userPermissions.firmId, firmId);
    });
  });

  group('updateOneUser preserves firmId identity', () {
    tearDown(() async {
      await clearUsers();
    });

    test('sparse access update keeps permissions.firmId and JWT firmId',
        () async {
      // boss signs up + creates firm
      final signUp = await fenceService.signUp(
        ServiceCallTest('', path: 'signUp'),
        SignUpRequest(
          firstname: 'Boss',
          lastname: 'FirmId',
          mail: 'boss_firmid@weebi.com',
          password: '123456',
        ),
      );
      expect(signUp.statusResponse.type, StatusResponse_Type.CREATED);

      final tokensBoss = await fenceService.authenticateWithCredentials(
        null,
        Credentials(mail: 'boss_firmid@weebi.com', password: '123456'),
      );

      final createFirmResponse = await fenceService.createFirm(
        ServiceCallTest(tokensBoss.accessToken),
        CreateFirmRequest(name: "Boss FirmId Biz"),
      );
      expect(createFirmResponse.statusResponse.type, StatusResponse_Type.CREATED);
      final firmId = createFirmResponse.firm.firmId;

      final tokensBoss2 = await fenceService.authenticateWithRefreshToken(
        null,
        RefreshToken(refreshToken: tokensBoss.refreshToken),
      );

      // create pending salesperson
      final alice = await fenceService.createPendingUser(
        ServiceCallTest(tokensBoss2.accessToken),
        PendingUserRequest(
          password: '987654321',
          mail: 'alice_firmid@weebi.com',
          firstname: 'Alice',
          lastname: 'FirmId',
          phone: Phone(countryCode: 1, number: '123456789'),
          permissions: Dummy.salesPersonPermissionNoId
            ..firmId = firmId
            ..userId = signUp.userId,
        ),
      );
      expect(alice.statusResponse.type, StatusResponse_Type.CREATED);
      expect(alice.userPublic.permissions.firmId, firmId);

      final aliceUserId = alice.userPublic.userId;

      // Sparse update like UserAccessWidget: only userId + limitedAccess
      final sparsePermissions = UserPermissions.create()
        ..userId = aliceUserId
        ..limitedAccess = AccessLimited(
          boutiqueIds: BoutiqueIds(ids: [firmId]),
          chainIds: ChainIds(ids: [firmId]),
        );

      final updateResponse = await fenceService.updateOneUser(
        ServiceCallTest(tokensBoss2.accessToken),
        UserPublic(
          userId: aliceUserId,
          firstname: 'Alice',
          lastname: 'FirmId',
          mail: 'alice_firmid@weebi.com',
          permissions: sparsePermissions,
        ),
      );
      expect(updateResponse.type, StatusResponse_Type.UPDATED);

      // Mongo: nested + top-level firmId preserved
      final db = await poolService.acquire();
      Map<String, dynamic>? userDoc;
      try {
        userDoc = await db
            .collection(FenceService.userCollectionName)
            .findOne(where.eq('userId', aliceUserId));
      } finally {
        poolService.release(db);
      }
      expect(userDoc, isNotNull);
      expect(userDoc!['firmId'], firmId);
      final perm = userDoc['permissions'] as Map<String, dynamic>?;
      expect(perm?['firmId'], firmId);

      // Alice signs up + logs in — JWT must still carry firmId
      final aliceSignUp = await fenceService.signUp(
        ServiceCallTest('', path: 'signUp'),
        SignUpRequest(mail: 'alice_firmid@weebi.com', password: '987654321'),
      );
      expect(aliceSignUp.statusResponse.type, StatusResponse_Type.UPDATED);

      final aliceToken = await fenceService.authenticateWithCredentials(
        null,
        Credentials(mail: 'alice_firmid@weebi.com', password: '987654321'),
      );
      expect(aliceToken.accessToken.userPermissions.firmId, firmId);
    });

    test('sparse self-update does not clear isFirmCreator', () async {
      final signUp = await fenceService.signUp(
        ServiceCallTest('', path: 'signUp'),
        SignUpRequest(
          firstname: 'Creator',
          lastname: 'Sticky',
          mail: 'creator_sticky@weebi.com',
          password: '123456',
        ),
      );

      final tokens = await fenceService.authenticateWithCredentials(
        null,
        Credentials(mail: 'creator_sticky@weebi.com', password: '123456'),
      );

      final firm = await fenceService.createFirm(
        ServiceCallTest(tokens.accessToken),
        CreateFirmRequest(name: 'Sticky Creator Firm'),
      );
      final firmId = firm.firm.firmId;

      final tokens2 = await fenceService.authenticateWithRefreshToken(
        null,
        RefreshToken(refreshToken: tokens.refreshToken),
      );
      expect(tokens2.accessToken.userPermissions.isFirmCreator, isTrue);

      // Boss has userManagement update; sparse payload clears isFirmCreator in proto
      final sparse = UserPermissions.create()
        ..userId = signUp.userId
        ..firmId = firmId
        ..fullAccess = AccessFull(hasFullAccess: true)
        ..userManagementRights =
            UserManagementRights(rights: [Right.update, Right.read]);

      await fenceService.updateOneUser(
        ServiceCallTest(tokens2.accessToken),
        UserPublic(
          userId: signUp.userId,
          firstname: 'Creator',
          lastname: 'Sticky',
          mail: 'creator_sticky@weebi.com',
          permissions: sparse,
        ),
      );

      final tokens3 = await fenceService.authenticateWithCredentials(
        null,
        Credentials(mail: 'creator_sticky@weebi.com', password: '123456'),
      );
      expect(tokens3.accessToken.userPermissions.isFirmCreator, isTrue);
      expect(tokens3.accessToken.userPermissions.firmId, firmId);
    });
  });
}
