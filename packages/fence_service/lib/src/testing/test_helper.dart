import 'dart:io';
import 'package:fence_service/mongo_pool.dart';

class TestHelper {
  static String get local =>
      Platform.environment['MONGO_DB_URI'] ?? "mongodb://localhost:27017/local";
  static Db get localDb => Db(local);

  /// Returns a MongoDB URI with a unique database name for the given [dbSuffix].
  /// Use this for test isolation: each test file gets its own database so parallel
  /// tests don't interfere (e.g. one test's tearDown dropping another's collections).
  ///
  /// Example: `uriForDatabase('firm_chain_boutiques_test')` →
  /// `mongodb://localhost:27017/local_firm_chain_boutiques_test`
  static String uriForDatabase(String dbSuffix) {
    final base = Uri.parse(local);
    final segments = base.pathSegments;
    final dbName = segments.isNotEmpty ? segments.last : 'local';
    final newDbName = '${dbName}_$dbSuffix';
    final newSegments = segments.isEmpty
        ? [newDbName]
        : [...segments.sublist(0, segments.length - 1), newDbName];
    return base.replace(path: '/${newSegments.join('/')}').toString();
  }

  /// Returns a pool configured for a test-specific database. Pass a unique suffix
  /// per test file (e.g. the test file name without extension).
  static MongoDbPoolService poolForDatabase(String dbSuffix) =>
      MongoDbPoolService(MongoPoolConfiguration(
        maxLifetimeMilliseconds: 180000,
        leakDetectionThreshold: 10000,
        uriString: uriForDatabase(dbSuffix),
        poolSize: 2,
      ));

  static MongoDbPoolService get defaultPoolService => MongoDbPoolService(
    MongoPoolConfiguration(
      /// [maxLifetimeMilliseconds] is the maximum lifetime of a connection in the pool.
      /// Connection pools can dynamically expand when faced with high demand. Unused
      /// connections within a specified period are automatically removed, and the pool
      /// size is reduced to the specified minimum when connections (poolSize) are not reused within
      /// that timeframe.
      maxLifetimeMilliseconds: 180000,

      /// [leakDetectionThreshold] is the threshold for connection leak detection.
      /// If the connection is not released within the specified time, it is
      /// considered as a leak.
      /// It won't work if no value is set. It is recommended to set a value
      leakDetectionThreshold: 10000,
      uriString: TestHelper.local,

      /// [poolSize] is the minimum number of connections in the pool.
      poolSize: 2,
    ),
  );

}
