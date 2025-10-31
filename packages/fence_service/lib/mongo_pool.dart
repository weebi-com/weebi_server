import 'dart:io';

import 'package:mongo_pool/mongo_pool.dart';
export 'package:mongo_pool/mongo_pool.dart';

/// Database middleware that manages MongoDB connections using a connection pool
/// 
/// connection pools are the industry standards
/// They make database operations 10-40x faster and prevent resource exhaustion
///
/// This middleware acquires a connection from the provided pool,
/// passes it to the endpoint function, and ensures proper release even if errors occur.
///
/// It also provides a [radical] answer to the bloody MongoDartError('No master connection')
/// https://github.com/mongo-dart/mongo_dart/issues/198
/// Which can put your service down for several minutes or more
/// Assuming you are deploying on a modern [cloudProvider] 
/// If the error is encountered the middleware will simply [terminate] the server
/// which the [cloudProvider] will automatically reboot, usually in less than 5 seconds
///
/// Parameters:
/// - [poolService]: The MongoDB connection pool service that provides and manages database connections
/// - [endpoint]: The function that receives a database connection and performs operations
/// - [maxRetries]: The maximum number of retries to attempt before giving up
/// - [retryDelay]: The delay between retries
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
  Future<T> Function(Db) endpoint, {
  int maxRetries = 3,
  Duration retryDelay = const Duration(seconds: 2),
}) async {
  for (int attempt = 1; attempt <= maxRetries; attempt++) {
    try {
      final db = await poolService.acquire();
      try {
        final result = await endpoint(db);
        return result;
      } finally {
        poolService.release(db);
      }
    } catch (e) {
      if (e.toString().contains('No master connection')) {
        print('Database connection error (attempt $attempt/$maxRetries): $e');

        if (attempt < maxRetries) {
          print('Retrying in ${retryDelay.inSeconds} seconds...');
          await Future.delayed(retryDelay);
          continue;
        } else {
          // Last attempt failed - restart the server
          print(
              'MongoDartError No master connection error persists after $maxRetries attempts. Kill the server. CloudProvider will restart it.');
          await poolService.close(); // Clean up connections
          exit(1); // Let the process manager restart it
        }
      }
      rethrow;
    }
  }
  throw Exception('This should never be reached but it makes the compiler happy');
}
