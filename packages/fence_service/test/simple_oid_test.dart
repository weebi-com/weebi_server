import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart' show CreateFirmRequest;
import 'package:fence_service/user_testing.dart';
import 'package:fence_service/fence_service.dart';
import 'package:test/test.dart';

void main() {
  final db = TestHelper.localDb;

  test('testing firmId hex parse', () async {
    final connection = Connection(ConnectionManager(db));
    final isConnected = await connection.connect();
    print(isConnected);
    final fenceService = FenceService(db);
    final d =
        await fenceService.createFirm(null, CreateFirmRequest(name: 'test'));
    print(d);
    final object = ObjectId.fromHexString(d.firmId);
    print(object);
    final result = await fenceService.userCollection.findOne(where.id(object));
    print(result);
    await connection.close();
  });
}
