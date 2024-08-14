import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart' show CreateOneUserRequest;
import 'package:fence_service/user_testing.dart';
import 'package:fence_service/fence_service.dart';
import 'package:test/test.dart';

void main() {
  final db = TestHelper.localDb;

  test('testing hex parse', () async {
    final connection = Connection(ConnectionManager(db));
    final isConnected = await connection.connect();
    print(isConnected);
    final fenceService = FenceService(db);
    final d = await fenceService.createOneUser(
        null,
        CreateOneUserRequest(
          userInfo: Dummy.userInfoNoId,
          password: '1234',
        ));
    print(d);
    final object = ObjectId.fromHexString(d.id);
    print(object);
    final result = await fenceService.userCollection.findOne(where.id(object));
    print(result);
    await connection.close();
  });
}
