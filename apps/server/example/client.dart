import 'package:fence_service/grpc.dart';
import 'package:fence_service/protos_weebi.dart';

import 'package:server/client_interceptor_example.dart';

void main(List<String> args) async {
  final channel = ClientChannel(
    '{{SERVER_HOST}}',
    port: 443,
    options: ChannelOptions(
      credentials: ChannelCredentials.secure(),
    ),
  );
  final interceptors = <ClientInterceptor>[
    // will be empty if no jwt yet
    AuthInterceptor(''),
    RequestLogInterceptor()
  ];
  final weebiAppStub = WeebiAppServiceClient(
    channel,
    options: CallOptions(timeout: const Duration(seconds: 10)),
  );
  final appMinVersionResponse =
      await weebiAppStub.readAppMinimumVersion(AppMinVersionRequest());

  print(appMinVersionResponse.toProto3Json());

  final userStub = FenceServiceClient(
    channel,
    options: CallOptions(
      timeout: const Duration(seconds: 30),
    ),
    interceptors: interceptors,
  );

  final tokens = await userStub.authenticateWithCredentials(Credentials(
    mail: 'dev@weebi.com',
    password: '1234',
  ));
  final accessToken = tokens.accessToken;
  print('accessToken $accessToken');

  // this is simple test, no need for provider / state management mayhem
  final userStub2 = FenceServiceClient(
    channel,
    options: CallOptions(
      timeout: const Duration(seconds: 30),
    ),
    interceptors: [AuthInterceptor(accessToken), RequestLogInterceptor()],
  );

  final userInfo = await userStub2.readOneUser(
      UserId(userId: '665e12f798357783e8000008'),
      options: CallOptions());
  print(userInfo.toProto3Json());
  await channel.terminate();
}
