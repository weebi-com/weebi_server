import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:protos_weebi/extensions.dart';
import 'package:protos_weebi/protos_weebi_io.dart' show CodeForPairingDevice;
import 'package:test/test.dart';

void main() {
  final poolService = TestHelper.poolForDatabase('codes_deletion_test');

  setUpAll(() async {
    await poolService.initialize();
    final db = await poolService.acquire();
    try {
      await db.collection(FenceService.pairingCodesCollectionName).drop();
      await db.createCollection(FenceService.pairingCodesCollectionName);
    } finally {
      poolService.release(db);
    }
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    try {
      await db.collection(FenceService.pairingCodesCollectionName).drop();
    } finally {
      poolService.release(db);
    }
    await poolService.close();
  });

  test('check that timestamps are properly compared', () async {
    final db = await poolService.acquire();
    try {
      final timestamp =
          DateTime.now().subtract(Duration(days: 14)).timestampProto;

      final dd = CodeForPairingDevice(
          code: 123456,
          firmId: '',
          chainId: '',
          userId: '',
          timestampUTC: timestamp);

      final insertResult = await db
          .collection(FenceService.pairingCodesCollectionName)
          .insertOne(dd.toProto3Json() as Map<String, dynamic>);
      expect(insertResult.isSuccess, true);
      final count1 =
          await db.collection(FenceService.pairingCodesCollectionName).count();
      expect(count1, 1);

      final selector = where.lt('timestampUTC',
          DateTime.now().subtract(Duration(days: 10)).toIso8601String());
      final deleted = await db
          .collection(FenceService.pairingCodesCollectionName)
          .deleteMany(selector);
      expect(deleted.isSuccess, true);
      final count2 =
          await db.collection(FenceService.pairingCodesCollectionName).count();
      expect(count2, 0);
    } finally {
      poolService.release(db);
    }
  });
}
