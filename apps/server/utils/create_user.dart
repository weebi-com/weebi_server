import 'package:fence_service/mongo_dart.dart';
import 'package:fence_service/protos_weebi.dart';

import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';

void main() async {
  final poolService = TestHelper.defaultPoolService;
  final db = await poolService.acquire();
  final userCollection = db.collection(FenceService.userCollectionName);
  final dd = await userCollection
      .insertOne(Dummy.userPublic.toProto3Json() as Map<String, dynamic>);
  print(dd.writeError);
  await userCollection.update(
    where.eq('userId', Dummy.userPublic.userId),
    ModifierBuilder().set('password', Dummy.password),
  );
  poolService.release(db);
  return;
}
