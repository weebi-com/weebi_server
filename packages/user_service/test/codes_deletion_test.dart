import 'package:mongo_dart/mongo_dart.dart' hide Timestamp;
import 'package:protos_weebi/extensions.dart';
import 'package:protos_weebi/protos_weebi_io.dart' show DevicePairingResponse;
import 'package:test/test.dart';
import 'package:user_service/user_service.dart';
import 'package:user_service/user_testing.dart';

void main() {
  test('check that timestamps are properly compared', () async {
    final db = TestHelper.localDb;

    await db.open();

    final timestamp =
        DateTime.now().subtract(Duration(days: 14)).timestampProto;

    print(timestamp.toProto3Json());

    final dd = DevicePairingResponse(
        code: 123456,
        firmOid: '',
        chainOid: '',
        userOid: '',
        timestampUTC: timestamp);

    final insertResult = await db
        .collection(UserService.pairingCodesCollectionName)
        .insertOne(dd.toProto3Json() as Map<String, dynamic>);
    expect(insertResult.isSuccess, true);
    final count1 =
        await db.collection(UserService.pairingCodesCollectionName).count();
    // print('count1 $count1');
    expect(count1, 1);

    final selector = where.lt('timestampUTC',
        DateTime.now().subtract(Duration(days: 10)).toIso8601String());
    final deleted = await db
        .collection(UserService.pairingCodesCollectionName)
        .deleteMany(selector);
    expect(deleted.isSuccess, true);
    final count2 =
        await db.collection(UserService.pairingCodesCollectionName).count();
    expect(count2, 0);
  });
}
