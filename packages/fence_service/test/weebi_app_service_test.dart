import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/src/weebi_app_service/weebi_app_service_base.dart';

import 'package:test/test.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:fence_service/mongo_local_testing.dart';

void main() async {
  final MongoDbPoolService poolService = TestHelper.defaultPoolService;
  await poolService.initialize();

  late WeebiAppService weebiAppService;
  setUpAll(() async {
    final db = await poolService.acquire();
    weebiAppService = WeebiAppService(poolService);
    await db.createCollection(WeebiAppService.collectionName);
    await db.collection(WeebiAppService.collectionName).insertOne(
        {'app': 'weebi_app', 'minVersion': 279, 'isUpgradeImperative': false});
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(WeebiAppService.collectionName).drop();
    poolService.release(db);
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
