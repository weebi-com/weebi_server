import 'package:fence_service/fence_service.dart';
import 'package:fence_service/user_testing.dart';

void main(List<String> args) async {
  final userPermission = Dummy.adminPermission;
  var jwt = JsonWebToken();
  final payload = userPermission.toProto3Json() as Map<String, dynamic>?;
  jwt.createPayload(
    userPermission.userId,
    expireIn: const Duration(days: 999),
    payload: payload,
  );
  jwt.sign();
  final accessToken = jwt.sign();
  jwt = JsonWebToken();
  // * userId is also added in the payload for commodity
  jwt.createPayload(
    userPermission.userId,
    expireIn: Duration(days: 30),
    payload: {'userId': userPermission.userId, 'firmId': userPermission.firmId},
  );
  // refresh token only contains userId & firmId
  final resfreshToken = jwt.sign();
  print('accessToken $accessToken');
  print('refreshToken: $resfreshToken');
}

const String accessToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2NjVlMTJmNzk4MzU3NzgzZTgwMDAwMDgiLCJpYXQiOjE3MTg1NjAwNzAsImV4cCI6MTgwNDg3MzY3MCwidXNlck9pZCI6IjY2NWUxMmY3OTgzNTc3ODNlODAwMDAwOCIsImZpcm1PaWQiOiI2NjVlMTJmNzk4MzU3NzgzZTgwMDAwMDAiLCJtYWxsc0FjY2Vzc2libGUiOnsibWFsbE9pZHMiOlsiNjY1ZTEyZjc5ODM1Nzc4M2U4MDAwMDAxIl19LCJib3V0aXF1ZXNBY2Nlc3NpYmxlIjp7ImJvdXRpcXVlT2lkcyI6WyI2NjVlMTJmNzk4MzU3NzgzZTgwMDAwMDIiXX0sImFydGljbGVSaWdodHMiOnsiYXJ0aWNsZVJpZ2h0cyI6WyJjcmVhdGUiLCJyZWFkIiwidXBkYXRlIiwiZGVsZXRlIl19LCJib3V0aXF1ZVJpZ2h0cyI6eyJib3V0aXF1ZVJpZ2h0cyI6WyJjcmVhdGUiLCJyZWFkIiwidXBkYXRlIiwiZGVsZXRlIl19LCJmaXJtUmlnaHRzIjp7IkZpcm1SaWdodHMiOlsiY3JlYXRlIiwicmVhZCIsInVwZGF0ZSIsImRlbGV0ZSJdfSwibWFsbFJpZ2h0cyI6eyJNYWxsUmlnaHRzIjpbImNyZWF0ZSIsInJlYWQiLCJ1cGRhdGUiLCJkZWxldGUiXX0sImNvbnRhY3RSaWdodHMiOnsiY29udGFjdFJpZ2h0cyI6WyJjcmVhdGUiLCJyZWFkIiwidXBkYXRlIiwiZGVsZXRlIl19LCJ0aWNrZXRSaWdodHMiOnsidGlja2V0UmlnaHRzIjpbImNyZWF0ZSIsInJlYWQiLCJ1cGRhdGUiLCJkZWxldGUiXX0sInVzZXJNYW5hZ2VtZW50UmlnaHRzIjp7InVzZXJNYW5hZ2VtZW50UmlnaHRzIjpbImNyZWF0ZSIsInJlYWQiLCJ1cGRhdGUiLCJkZWxldGUiXX0sImlzQWx3YXlzT25saW5lIjp0cnVlfQ==._W2SgN8Sxc-K_N7RJS60GIU4LAY3wmFE7-onMQVK1Iw=';
