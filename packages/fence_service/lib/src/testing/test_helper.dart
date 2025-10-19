import 'package:fence_service/mongo_pool.dart';

class TestHelper {
  static const String local = "mongodb://localhost:27017/local";
  static final localDb = Db(local);

    static final MongoDbPoolService defaultPoolService = MongoDbPoolService(
    const MongoPoolConfiguration(
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
