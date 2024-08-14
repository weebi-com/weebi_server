import 'package:mongo_dart/mongo_dart.dart';

import 'package:boutique_service/boutique_service.dart';
import 'package:user_service/user_service.dart';
import 'package:user_service/user_testing.dart';

void main() async {
  final db = TestHelper.localDb;
  final connection = Connection(ConnectionManager(db));
  late UserService userService;
  late BoutiqueService firmService;
  await db.open();
  final isConnected = await connection.connect();
  print(isConnected);
  firmService = BoutiqueService(db);
  userService = UserService(db, firmService);
  //await db.createCollection(userService.collection.collectionName);
  await userService.collection.insertOne(
      UserPrivateDummy.userNoId.toProto3Json() as Map<String, dynamic>);
  await connection.close();
  return;
}
