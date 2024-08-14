import 'package:mongo_dart/mongo_dart.dart';

import 'package:fence_service/fence_service.dart';
import 'package:fence_service/user_testing.dart';

void main() async {
  final db = TestHelper.localDb;
  final connection = Connection(ConnectionManager(db));
  late FenceService fenceService;
  await db.open();
  final isConnected = await connection.connect();
  print(isConnected);
  fenceService = FenceService(db);
  //await db.createCollection(fenceService.collection.collectionName);
  await fenceService.userCollection
      .insertOne(Dummy.userInfoNoId.toProto3Json() as Map<String, dynamic>);
  await connection.close();
  return;
}
