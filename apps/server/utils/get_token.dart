import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_dart.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/protos_weebi.dart' show Credentials, Dummy;

void main(List<String> args) async {
  final user = Dummy.userPublic;
  final db = TestHelper.localDb;
  final connection = Connection(ConnectionManager(db));
  late FenceService fenceService;
  await db.open();
  final isConnected = await connection.connect();
  print('isConnected $isConnected');
  fenceService = FenceService(db);

  final dd = await fenceService.authenticateWithCredentials(
      null, Credentials(mail: user.mail, password: '1234'));
  print(dd);
  await connection.close();
  return;
}

// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5ODc2NTQzMjEiLCJpYXQiOjE3Mjk4NTcxNTUsImV4cCI6MTcyOTk0MzU1NSwidXNlcklkIjoiOTg3NjU0MzIxIiwiZmlybUlkIjoiMTIzNDU2Nzg5IiwiZnVsbEFjY2VzcyI6eyJoYXNGdWxsQWNjZXNzIjp0cnVlfSwidGlja2V0UmlnaHRzIjp7InRpY2tldFJpZ2h0cyI6WyJjcmVhdGUiLCJyZWFkIiwidXBkYXRlIiwiZGVsZXRlIl19LCJjb250YWN0UmlnaHRzIjp7ImNvbnRhY3RSaWdodHMiOlsiY3JlYXRlIiwicmVhZCIsInVwZGF0ZSIsImRlbGV0ZSJdfSwiYXJ0aWNsZVJpZ2h0cyI6eyJhcnRpY2xlUmlnaHRzIjpbImNyZWF0ZSIsInJlYWQiLCJ1cGRhdGUiLCJkZWxldGUiXX0sImJvdXRpcXVlUmlnaHRzIjp7ImJvdXRpcXVlUmlnaHRzIjpbImNyZWF0ZSIsInJlYWQiLCJ1cGRhdGUiLCJkZWxldGUiXX0sImNoYWluUmlnaHRzIjp7ImNoYWluUmlnaHRzIjpbImNyZWF0ZSIsInJlYWQiLCJ1cGRhdGUiLCJkZWxldGUiXX0sImZpcm1SaWdodHMiOnsiZmlybVJpZ2h0cyI6WyJyZWFkIiwidXBkYXRlIiwiZGVsZXRlIl19LCJ1c2VyTWFuYWdlbWVudFJpZ2h0cyI6eyJ1c2VyTWFuYWdlbWVudFJpZ2h0cyI6WyJjcmVhdGUiLCJyZWFkIiwidXBkYXRlIiwiZGVsZXRlIl19LCJiaWxsaW5nUmlnaHRzIjp7ImJpbGxpbmdSaWdodHMiOlsiY3JlYXRlIiwicmVhZCIsInVwZGF0ZSIsImRlbGV0ZSJdfSwiYm9vbFJpZ2h0cyI6eyJjYW5TZWVTdGF0cyI6dHJ1ZSwiY2FuRXhwb3J0RGF0YSI6dHJ1ZSwiY2FuR2l2ZURpc2NvdW50Ijp0cnVlLCJjYW5TZXRQcm9tbyI6dHJ1ZX19.YoRdvyqdUvZYAcu0wIo0RAI7vZC1BrD2nYFmZ6C-rW8=
