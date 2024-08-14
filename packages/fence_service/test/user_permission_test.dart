import 'package:test/test.dart';

import 'package:fence_service/fence_service.dart';
import 'package:fence_service/user_testing.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

void main() async {
  final db = TestHelper.localDb;

  final connection = Connection(ConnectionManager(db));
  late FenceService fenceService;
  setUpAll(() async {
    await db.open();
    final isConnected = await connection.connect();
    print(isConnected);
    fenceService = FenceService(db);
    await db.createCollection(fenceService.userCollection.collectionName);
    await fenceService.createOneUser(
        null,
        CreateOneUserRequest(
          userInfo: Dummy.userInfoNoId,
          password: '1234',
        ));
  });

  tearDownAll(() async {
    await db.collection(fenceService.userCollection.collectionName).drop();
    await connection.close();
  });

  test('test readRestrictions', () async {
    final response =
        await fenceService.readUserPermissionsByToken(null, Empty());
    expect(response.chainIds.ids, ['665e12f798357783e8000001']);
  }, skip: 'will fail until I get a fake token');
}
