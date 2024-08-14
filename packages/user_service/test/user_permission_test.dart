import 'package:test/test.dart';

import 'package:boutique_service/boutique_service.dart';

import 'package:user_service/user_service.dart';
import 'package:user_service/user_testing.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

void main() async {
  final db = TestHelper.localDb;

  final connection = Connection(ConnectionManager(db));
  late UserService userService;
  late BoutiqueService firmService;
  setUpAll(() async {
    await db.open();
    final isConnected = await connection.connect();
    print(isConnected);
    firmService = BoutiqueService(db);
    userService = UserService(db, firmService);
    await db.createCollection(userService.collection.collectionName);
    await userService.createOne(
        null,
        CreateOneRequest(
          userInfo: Dummy.userInfoNoId,
          password: '1234',
        ));
  });

  tearDownAll(() async {
    await db.collection(userService.collection.collectionName).drop();
    await connection.close();
  });

  test('test readRestrictions', () async {
    final response =
        await userService.readUserPermissionsByToken(null, Empty());
    expect(response.chainsAccessible.ids, ['665e12f798357783e8000001']);
  }, skip: 'will fail until I get a fake token');
}
