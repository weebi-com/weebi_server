import 'package:fence_service/src/db_closed.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/grpc.dart' show ServiceCall, GrpcError;
import 'package:protos_weebi/protos_weebi_io.dart';

class WeebiAppService extends WeebiAppServiceBase {
  final Db _db;
  final DbCollection collection;

  WeebiAppService(this._db) : collection = _db.collection('weebi_app');

  @override
  Future<AppMinVersionResponse> readAppMinimumVersion(
      ServiceCall? call, AppMinVersionRequest request) async {
    _db.isConnected == false ?  await _db.open()  : null;
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
  }
}
