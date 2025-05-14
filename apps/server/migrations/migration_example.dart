import 'package:fence_service/mongo_dart.dart';

Future<void> up(Db db) async {
  var collection = db.collection('your_collection');
  await collection.createIndex(keys: {'field': 1});
  print('Index created');
}

Future<void> down(Db db) async {
  var collection = db.collection('your_collection');
        await collection.dropIndexes('field_1');
/*   final indexes = await collection.getIndexes();
  for (final index in indexes) {
    for (final key in index.keys) {
      if (key == 'field_1') {
        await collection.dropIndexes(key);
      }
    }
  } */
  print('Index dropped');
}
