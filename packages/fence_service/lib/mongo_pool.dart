import 'package:mongo_pool/mongo_pool.dart';
export 'package:mongo_pool/mongo_pool.dart';

/// Database middleware that manages MongoDB connections using a connection pool
///
/// This middleware automatically acquires a connection from the provided pool,
/// passes it to the endpoint function, and ensures proper release even if errors occur.
///
/// Parameters:
/// - [poolService]: The MongoDB connection pool service that provides and manages database connections
/// - [endpoint]: The function that receives a database connection and performs operations
///
/// Example usage:
/// ```dart
/// final poolService = MongoDbPoolService(configuration);
/// await poolService.initialize();
///
/// final result = await databaseMiddleware(
///   poolService,
///   (db) async {
///     final collection = db.collection('my_collection');
///     return await collection.find().toList();
///   }
/// );
/// ```
Future<T> databaseMiddleware<T>(
  MongoDbPoolService poolService,
  Future<T> Function(Db) endpoint,
) async {
  final db = await poolService.acquire();

  try {
    final result = await endpoint(db);
    return result;
  } finally {
    poolService.release(db);
  }
}
