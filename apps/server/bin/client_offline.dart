import 'package:protos_weebi/grpc.dart'
    show
        ClientInterceptor,
        ClientChannel,
        ChannelCredentials,
        ChannelOptions,
        CallOptions;
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:user_service/client_interceptors.dart';

void main(List<String> args) async {
  final channelOptions = ChannelOptions(
    credentials: ChannelCredentials.insecure(), // transmit unencrypted data
  );

  final channel = ClientChannel(
    '0.0.0.0', // connect to localhost. Where it's served
    port: 8080,
    options: channelOptions, // pass the channelOptions above.
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

  final userStub = UserServiceClient(
    channel,
    options: CallOptions(
      timeout: const Duration(seconds: 30),
    ),
    interceptors: interceptors,
  );

  final tokens = await userStub.authenticateWithCredentials(LoginRequest(
    mail: 'dev@weebi.com',
    password: '1234',
  ));
  final accessToken = tokens.accessToken;
  print('accessToken $accessToken');

  // this is simple test, no need for provider / state management mayhem
  final userStub2 = UserServiceClient(
    channel,
    options: CallOptions(
      timeout: const Duration(seconds: 30),
    ),
    interceptors: [AuthInterceptor(accessToken), RequestLogInterceptor()],
  );

  final userInfo = await userStub2.readOne(
      UserId(userId: '665e12f798357783e8000008'),
      options: CallOptions());
  print(userInfo.toProto3Json());
  await channel.terminate();
}
