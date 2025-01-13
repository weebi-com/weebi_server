import 'package:fence_service/mongo_dart.dart';

// TODO: pass mongodb+srv:// in the args
void main(List<String> args) async {
  if (args.isEmpty) {
    throw 'please provide a version number (integer only)';
  }
  final int? minVersion = int.tryParse(args.first);
  if (minVersion == null) {
    throw '${args.first} must be an int, you fool';
  }
  final collectionName = 'weebi_app';
//  final db = TestHelper.localDb;

  final db = await Db.create(args.first);
  final connection = Connection(ConnectionManager(db));
  await db.open();
  final isConnected = await connection.connect();
  print(isConnected);
  await db.createCollection(collectionName);

  final document = <String, Object>{
    'app': 'weebi_app',
    'minVersion': minVersion,
    'isUpgradeImperative': false
  };
  db.collection(collectionName).insertOne(document);
  await connection.close();
  return;
}
