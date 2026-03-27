import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';

/// Exercises [loadFirmLicenses] and [assertUserHasOperationalLicenseWithDb] against
/// a real local MongoDB ([TestHelper]), same stack as other fence_service tests.
/// Requires `mongodb://localhost:27017` (or [MONGO_DB_URI]) and is not a pure mock.
void main() {
  late MongoDbPoolService pool;

  setUpAll(() async {
    pool = TestHelper.poolForDatabase('operational_license_gate_mongo_test');
    await pool.initialize();
  });

  tearDownAll(() async {
    final db = await pool.acquire();
    try {
      await db.collection(FenceService.firmCollectionName).drop();
    } catch (_) {}
    pool.release(db);
  });

  group('loadFirmLicenses (mongo)', () {
    test('whitespace-only firmId yields no query — empty list', () async {
      final db = await pool.acquire();
      try {
        expect(await loadFirmLicenses(db, ''), isEmpty);
        expect(await loadFirmLicenses(db, '  \t '), isEmpty);
      } finally {
        pool.release(db);
      }
    });

    test('firm missing — empty list', () async {
      final db = await pool.acquire();
      try {
        expect(await loadFirmLicenses(db, 'firm-that-does-not-exist-999'), isEmpty);
      } finally {
        pool.release(db);
      }
    });

    test('firm with licenses — round-trip proto JSON', () async {
      final db = await pool.acquire();
      const id = 'load_firm_licenses_it_1';
      final coll = db.collection(FenceService.firmCollectionName);
      try {
        await coll.deleteMany(where.eq('firmId', id));
        final past = DateTime.utc(2020, 1, 1);
        final license = License(
          licenseId: 'mongo-lic-1',
          licensePlan: LicensePlan.SOLO,
          providerProductId: 'p',
          providerPriceId: 'pr',
          maxUsers: 3,
          validFrom: past.timestampProto,
          seats: [
            LicenseSeat(userId: 'alice', firmId: id),
          ],
        );
        await coll.insertOne({
          'firmId': id,
          'licenses': [license.toProto3Json()],
        });
        final loaded = await loadFirmLicenses(db, id);
        expect(loaded, hasLength(1));
        expect(loaded.single.licenseId, 'mongo-lic-1');
        expect(loaded.single.maxUsers, 3);
        expect(loaded.single.seats, hasLength(1));
        expect(loaded.single.seats.single.userId, 'alice');
      } finally {
        await coll.deleteMany(where.eq('firmId', id));
        pool.release(db);
      }
    });

    test('firm with absent licenses key — empty list', () async {
      final db = await pool.acquire();
      const id = 'load_firm_licenses_it_2';
      final coll = db.collection(FenceService.firmCollectionName);
      try {
        await coll.deleteMany(where.eq('firmId', id));
        await coll.insertOne({'firmId': id, 'name': 'x'});
        expect(await loadFirmLicenses(db, id), isEmpty);
      } finally {
        await coll.deleteMany(where.eq('firmId', id));
        pool.release(db);
      }
    });
  });

  group('assertUserHasOperationalLicenseWithDb (mongo)', () {
    test('non-creator denied when DB firm has empty licenses', () async {
      final db = await pool.acquire();
      const id = 'gate_db_empty_lic';
      final coll = db.collection(FenceService.firmCollectionName);
      try {
        await coll.deleteMany(where.eq('firmId', id));
        await coll.insertOne({
          'firmId': id,
          'licenses': <dynamic>[],
        });
        await expectLater(
          assertUserHasOperationalLicenseWithDb(
            db,
            userPermissions: UserPermissions.create()
              ..firmId = id
              ..userId = 'u-no-seat',
            authorizationHeader: '',
          ),
          throwsA(
            isA<GrpcError>().having((e) => e.code, 'code', 9),
          ),
        );
      } finally {
        await coll.deleteMany(where.eq('firmId', id));
        pool.release(db);
      }
    });

    test('non-creator allowed when seat is persisted on firm', () async {
      final db = await pool.acquire();
      const id = 'gate_db_seated';
      final coll = db.collection(FenceService.firmCollectionName);
      try {
        await coll.deleteMany(where.eq('firmId', id));
        final past = DateTime.utc(2020, 1, 1);
        final license = License(
          licenseId: 'lic-seat',
          licensePlan: LicensePlan.SOLO,
          providerProductId: 'p',
          providerPriceId: 'pr',
          maxUsers: 5,
          validFrom: past.timestampProto,
          seats: [LicenseSeat(userId: 'bob', firmId: id)],
        );
        await coll.insertOne({
          'firmId': id,
          'licenses': [license.toProto3Json()],
        });
        await assertUserHasOperationalLicenseWithDb(
          db,
          userPermissions: UserPermissions.create()
            ..firmId = id
            ..userId = 'bob',
          authorizationHeader: '',
        );
      } finally {
        await coll.deleteMany(where.eq('firmId', id));
        pool.release(db);
      }
    });

    test('missing firm doc — same as no seats for non-creator', () async {
      final db = await pool.acquire();
      const id = 'gate_no_firm_doc_404';
      final coll = db.collection(FenceService.firmCollectionName);
      try {
        await coll.deleteMany(where.eq('firmId', id));
        await expectLater(
          assertUserHasOperationalLicenseWithDb(
            db,
            userPermissions: UserPermissions.create()
              ..firmId = id
              ..userId = 'u1',
            authorizationHeader: '',
          ),
          throwsA(isA<GrpcError>()),
        );
      } finally {
        pool.release(db);
      }
    });
  });
}
