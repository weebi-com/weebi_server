import 'package:protos_weebi/grpc.dart' show ServiceCall, GrpcError;
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:fence_service/mongo_pool.dart';

class WeebiAppService extends WeebiAppServiceBase {
  final MongoDbPoolService _poolService;

  static const String collectionName = 'weebi_app';
  WeebiAppService(this._poolService);

  @override
  Future<AppMinVersionResponse> readAppMinimumVersion(
      ServiceCall? call, AppMinVersionRequest request) async {
    return databaseMiddleware<AppMinVersionResponse>(_poolService, (db) async {
      final collection = db.collection(collectionName);

      try {
        // one app today, but who knows what tomorrow will bring...
        final doc = await collection.findOne(where.eq('app', 'weebi_app'));
        final minVersion = AppMinVersionResponse()
          ..mergeFromProto3Json(doc, ignoreUnknownFields: true);
        print(minVersion.toProto3Json());
        return minVersion;
      } on GrpcError catch (e) {
        print('readAppMinimumVersion error $e');
        rethrow;
      }
    });
  }
}
