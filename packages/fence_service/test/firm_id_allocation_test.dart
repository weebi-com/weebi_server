import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:protos_weebi/grpc.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

import 'service_call_impl.dart';

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('firm_id_allocation_test');
  await poolService.initialize();

  setUp(() async {
    final db = await poolService.acquire();
    try {
      await _dropQuietly(db, FenceService.userCollectionName);
      await _dropQuietly(db, FenceService.boutiqueCollectionName);
      await _dropQuietly(db, FenceService.firmCollectionName);
      await _dropQuietly(db, firmIdCounterCollectionName);
      await db.createCollection(FenceService.userCollectionName);
      await db.createCollection(FenceService.boutiqueCollectionName);
      await db.createCollection(FenceService.firmCollectionName);
      await db.ensureIndex(
        FenceService.firmCollectionName,
        name: 'firmId',
        keys: {'firmId': 1},
        unique: true,
      );
      await db.ensureIndex(
        FenceService.firmCollectionName,
        name: 'referralCode',
        keys: {'referralCode': 1},
        sparse: true,
        unique: true,
      );
    } finally {
      poolService.release(db);
    }
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    try {
      await _dropQuietly(db, FenceService.userCollectionName);
      await _dropQuietly(db, FenceService.boutiqueCollectionName);
      await _dropQuietly(db, FenceService.firmCollectionName);
      await _dropQuietly(db, firmIdCounterCollectionName);
    } finally {
      poolService.release(db);
    }
  });

  test('new firms get consecutive integer strings and leave epoch ids alone',
      () async {
    const legacyId = '1710000000000';
    final db = await poolService.acquire();
    try {
      await db.collection(FenceService.firmCollectionName).insertOne({
        'firmId': legacyId,
        'name': 'Already There',
        'status': true,
        'referralCode': legacyId,
      });
    } finally {
      poolService.release(db);
    }

    final fence = FenceService(poolService, isMock: false);
    final first = await _signUpAndCreateFirm(
      fence,
      mail: 'one@weebi.com',
      name: 'Shop One',
    );
    final second = await _signUpAndCreateFirm(
      fence,
      mail: 'two@weebi.com',
      name: 'Shop Two',
    );

    expect(first.firmId, '1');
    expect(second.firmId, '2');
    expect(first.firmId, isA<String>());
    expect(int.parse(second.firmId), int.parse(first.firmId) + 1);

    final check = await poolService.acquire();
    try {
      final legacy = await check
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', legacyId));
      expect(legacy, isNotNull);
      expect(legacy!['firmId'], legacyId);
      expect(legacy['referralCode'], legacyId);
      expect(legacy['name'], 'Already There');

      final firmOne = await check
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', '1'));
      expect(firmOne!['firmId'], isA<String>());
      expect(firmOne['name'], 'Shop One');
      expect(firmOne['referralCode'], first.referralCode);
      expect(first.referralCode, isNot('1'));
      expect(first.referralCode, matches(RegExp(r'[A-Z]')));

      final user = await check
          .collection(FenceService.userCollectionName)
          .findOne(where.eq('userId', first.userId));
      expect(user!['firmId'], '1');
      final permissions = user['permissions'] as Map<String, dynamic>;
      expect(permissions['firmId'], '1');
      expect(permissions['isFirmCreator'], isTrue);

      final chains = await check
          .collection(FenceService.boutiqueCollectionName)
          .find(where.eq('firmId', '1'))
          .toList();
      expect(chains, hasLength(1));
      expect(chains.single['chainId'], '1');
      final boutiques = chains.single['boutiques'] as List<dynamic>;
      final boutique = boutiques.single as Map<String, dynamic>;
      expect(boutique['boutiqueId'], '1');
      expect(boutique['chainId'], '1');
      expect(boutique['firmId'], '1');

      final counter = await check
          .collection(firmIdCounterCollectionName)
          .findOne(where.eq('_id', firmIdCounterDocumentId));
      expect((counter!['seq'] as num).toInt(), 2);
    } finally {
      poolService.release(check);
    }

    final extraChain = await fence.createOneChain(
      ServiceCallTest(first.refreshedAccessToken),
      Chain()
        ..firmId = first.firmId
        ..name = 'Second shop',
    );
    expect(extraChain.type, StatusResponse_Type.CREATED);
    expect(extraChain.id, isNot(first.firmId));
    expect(extraChain.id, matches(RegExp(r'^\d{13}$')));

    final beforeDenied = await _counterSeq(poolService);
    try {
      await fence.createFirm(
        ServiceCallTest(first.refreshedAccessToken),
        CreateFirmRequest(name: 'Should Fail'),
      );
      fail('refreshed creator must not create a second firm');
    } on GrpcError catch (e) {
      expect(e.code, StatusCode.permissionDenied);
    }
    expect(await _counterSeq(poolService), beforeDenied);
  });

  test('a taken firm id is skipped and the existing document stays', () async {
    final db = await poolService.acquire();
    try {
      await db.collection(FenceService.firmCollectionName).insertOne({
        'firmId': '1',
        'name': 'Preexisting',
        'status': true,
        'referralCode': 'PREEXIST',
      });
    } finally {
      poolService.release(db);
    }

    final fence = FenceService(poolService, isMock: false);
    final created = await _signUpAndCreateFirm(
      fence,
      mail: 'skip@weebi.com',
      name: 'After Collision',
    );
    expect(created.firmId, '2');

    final check = await poolService.acquire();
    try {
      final preexisting = await check
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', '1'));
      expect(preexisting!['name'], 'Preexisting');
      expect(preexisting['referralCode'], 'PREEXIST');
      final createdDoc = await check
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', '2'));
      expect(createdDoc!['name'], 'After Collision');
      expect((await _counterSeq(poolService)), 2);
    } finally {
      poolService.release(check);
    }
  });

  test('a duplicate referral code retries without burning the firm id',
      () async {
    final db = await poolService.acquire();
    try {
      await db.collection(FenceService.firmCollectionName).insertOne({
        'firmId': '99',
        'name': 'Code Owner',
        'status': true,
        'referralCode': 'AAAAAAAA',
      });
    } finally {
      poolService.release(db);
    }

    final fence = FenceService(
      poolService,
      isMock: false,
      firmIds: _ScriptedReferralAllocator(['AAAAAAAA', 'BBBBBBBB']),
    );
    final created = await _signUpAndCreateFirm(
      fence,
      mail: 'code@weebi.com',
      name: 'Retried Code',
    );

    expect(created.firmId, '1');
    expect(created.referralCode, 'BBBBBBBB');
    expect(await _counterSeq(poolService), 1);

    final check = await poolService.acquire();
    try {
      final owner = await check
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', '99'));
      expect(owner!['referralCode'], 'AAAAAAAA');
    } finally {
      poolService.release(check);
    }
  });

  test('missing create right does not consume a firm id', () async {
    final fence = FenceService(
      poolService,
      isMock: true,
      userPermissionIfTest: UserPermissions.create()
        ..userId = 'no-right'
        ..firmRights = FirmRights(rights: [Right.read]),
    );
    try {
      await fence.createFirm(null, CreateFirmRequest(name: 'Nope'));
      fail('Expected permissionDenied');
    } on GrpcError catch (e) {
      expect(e.code, StatusCode.permissionDenied);
    }

    final db = await poolService.acquire();
    try {
      final counter = await db
          .collection(firmIdCounterCollectionName)
          .findOne(where.eq('_id', firmIdCounterDocumentId));
      expect(counter, isNull);
      final firms =
          await db.collection(FenceService.firmCollectionName).find().toList();
      expect(firms, isEmpty);
    } finally {
      poolService.release(db);
    }
  });
}

class _ScriptedReferralAllocator extends FirmIdAllocator {
  _ScriptedReferralAllocator(this._codes);

  final List<String> _codes;
  var _index = 0;

  @override
  String nextReferralCode() {
    final code = _codes[_index];
    _index += 1;
    return code;
  }
}

class _CreatedFirm {
  _CreatedFirm({
    required this.userId,
    required this.firmId,
    required this.referralCode,
    required this.refreshedAccessToken,
  });

  final String userId;
  final String firmId;
  final String referralCode;
  final String refreshedAccessToken;
}

Future<_CreatedFirm> _signUpAndCreateFirm(
  FenceService fence, {
  required String mail,
  required String name,
}) async {
  final signUp = await fence.signUp(
    ServiceCallTest('', path: 'signUp'),
    SignUpRequest(
      firstname: 'Ada',
      lastname: 'Lovelace',
      mail: mail,
      password: '123456',
    ),
  );
  expect(signUp.statusResponse.type, StatusResponse_Type.CREATED);

  final tokens = await fence.authenticateWithCredentials(
    null,
    Credentials(mail: mail, password: '123456'),
  );
  final created = await fence.createFirm(
    ServiceCallTest(tokens.accessToken),
    CreateFirmRequest(name: name),
  );
  expect(created.statusResponse.type, StatusResponse_Type.CREATED);
  expect(created.statusResponse.id, created.firm.firmId);
  expect(created.firm.referralCode, isNot(created.firm.firmId));

  final refreshed = await fence.authenticateWithRefreshToken(
    null,
    RefreshToken(refreshToken: tokens.refreshToken),
  );
  expect(refreshed.accessToken.userPermissions.firmId, created.firm.firmId);

  return _CreatedFirm(
    userId: signUp.userId,
    firmId: created.firm.firmId,
    referralCode: created.firm.referralCode,
    refreshedAccessToken: refreshed.accessToken,
  );
}

Future<int> _counterSeq(MongoDbPoolService poolService) async {
  final db = await poolService.acquire();
  try {
    final counter = await db
        .collection(firmIdCounterCollectionName)
        .findOne(where.eq('_id', firmIdCounterDocumentId));
    return (counter!['seq'] as num).toInt();
  } finally {
    poolService.release(db);
  }
}

Future<void> _dropQuietly(Db db, String name) async {
  try {
    await db.collection(name).drop();
  } catch (_) {
    // The collection is absent on the first run.
  }
}
