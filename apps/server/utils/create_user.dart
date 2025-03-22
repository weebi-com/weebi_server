import 'package:fence_service/mongo_dart.dart';
import 'package:fence_service/protos_weebi.dart';

import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';

void main() async {
  final db = TestHelper.localDb;
  final connection = Connection(ConnectionManager(db));
  late FenceService fenceService;
  await db.open();
  final isConnected = await connection.connect();
  print('isConnected $isConnected');
  fenceService = FenceService(db);

  final dd = await fenceService.userCollection
      .insertOne(Dummy.userPublic.toProto3Json() as Map<String, dynamic>);
  print(dd.writeError);
  await fenceService.userCollection.update(
    where.eq('userId', Dummy.userPublic.userId),
    ModifierBuilder().set('password', Dummy.password),
  );
  await connection.close();
  return;
}
