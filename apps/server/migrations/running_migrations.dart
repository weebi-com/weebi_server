import 'package:fence_service/mongo_dart.dart';

import 'migration_example.dart' as migration_001;
import 'migration_example2.dart' as migration_002;

Future<void> main() async {
  var db = Db('mongodb://<username>:<password>@<host>:<port>/<database>');
  await db.open();
  var migrationCollection = db.collection('migrations');

  // Check applied migrations
  var appliedMigrations = await migrationCollection.find().toList();

  // Apply new migrations
  if (!appliedMigrations.any((m) => m['id'] == '001')) {
    await migration_001.up(db);
    await migrationCollection.insert({'id': '001', 'description': 'Create index on field', 'timestamp': DateTime.now()});
  }

  if (!appliedMigrations.any((m) => m['id'] == '002')) {
    await migration_002.up(db);
    await migrationCollection.insert({'id': '002', 'description': 'Another migration', 'timestamp': DateTime.now()});
  }

  print('Migrations completed');
  await db.close();
}
