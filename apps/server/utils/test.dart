import 'package:contact_service/contact_service.dart';
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/protos_weebi.dart';

import 'service_call_impl.dart';

void main(List<String> args) async {
  final db = TestHelper.localDb;
  final connection = Connection(ConnectionManager(db));
  await db.open();
  await connection.connect();
  final stubContact = ContactService(db);

  final dd = await stubContact.readAll(
      ServiceCallTest(
          'jwtToken'),
      ReadAllContactsRequest(
          chainId: '1736281414234',
          lastFetchTimestampUTC: DateTime.now().timestampProto));

  print(dd);
}
