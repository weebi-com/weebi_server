import 'package:mongo_dart/mongo_dart.dart';
import 'package:user_service/user_testing.dart';
import 'package:user_service/user_service.dart';
import 'package:test/test.dart';

void main() {
  final db = TestHelper.localDb;

  test('testing hex parse', () async {
    final connection = Connection(ConnectionManager(db));
    final isConnected = await connection.connect();
    print(isConnected);
    final userService = UserService(db, null);
    final d = await userService.createOne(null, UserPrivateDummy.userNoId);
    print(d);
    final object = ObjectId.fromHexString(d.id);
    print(object);
    final result = await userService.collection.findOne(where.id(object));
    print(result);
    await connection.close();
  });
}
