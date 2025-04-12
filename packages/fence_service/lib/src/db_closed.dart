import 'package:fence_service/grpc.dart' show GrpcError;
import 'package:fence_service/mongo_dart.dart' show Db, State;

Future<dynamic> _isDbOpen(Db db) async {
  if (!db.isConnected || db.state == State.opening) {
    if (db.state == State.opening) {
      db.state = State
          .closed; // manually updating the state to CLOSE to prevent invalid state exception
    }
    return await db.open();
  }
  return true;
}

Future<void> isDbOpen(Db db) async {
  final isDbOpened = await _isDbOpen(db);
  if (isDbOpened == null) {
    throw GrpcError.aborted('db not open');
  }
}
