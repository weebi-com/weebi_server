import 'package:fence_service/src/weebi_app_service/weebi_app_service_base.dart';

import 'package:test/test.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:fence_service/mongo_local_testing.dart';

void main() async {
  final db = TestHelper.localDb;

  final connection = Connection(ConnectionManager(db));
  late WeebiAppService weebiAppService;
  setUpAll(() async {
    await db.open();
    final isConnected = await connection.connect();
    print(isConnected);
    weebiAppService = WeebiAppService(db);
    await db.createCollection(weebiAppService.collection.collectionName);
    await db.collection(weebiAppService.collection.collectionName).insertOne(
        {'app': 'weebi_app', 'minVersion': 279, 'isUpgradeImperative': false});
  });

  tearDownAll(() async {
    await db.collection(weebiAppService.collection.collectionName).drop();
    await connection.close();
  });

  test('test readAppMinimumVersion', () async {
    final response = await weebiAppService.readAppMinimumVersion(
      null,
      AppMinVersionRequest(),
    );
    expect(response.minVersion, 279);
    expect(response.isUpgradeImperative, false);
  });
}
