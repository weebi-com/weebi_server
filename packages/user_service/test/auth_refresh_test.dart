import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/grpc.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:user_service/client_interceptors.dart';
import 'package:user_service/user_service.dart';
import 'package:user_service/user_testing.dart';
import 'package:test/test.dart';

final _channelOptions = ChannelOptions(
  credentials: ChannelCredentials.insecure(), // transmit unencrypted data.,
);

final _channel = ClientChannel(
  '0.0.0.0', // connect to localhost
  port: 8080,
  options: _channelOptions, // pass the channelOptions above.
);
void main() {
  final db = TestHelper.localDb;

  final connection = Connection(ConnectionManager(db));
  late UserService userService;
  setUpAll(() async {
    final isConnected = await connection.connect();
    print(isConnected);
    userService = UserService(db, null);

    final userCollection = db.collection('user');
    await userCollection.insertOne({
      'mail': 'dev@weebi.com',
      'password': '1234',
    });
  });

  tearDownAll(() async {
    await db.collection(userService.collection.collectionName).drop();
    await connection.close();
  });

  test('test client auth', () async {
    final stub = UserServiceClient(
      _channel,
      options: CallOptions(
        timeout: const Duration(seconds: 30),
      ),
      interceptors: <ClientInterceptor>[
        AuthInterceptor(
          '', // will be empty if no jwt yet
        )
      ],
    );
    final request = LoginRequest(
      mail: 'dev@weebi.com',
      password: '1234',
    );

    final response = await stub.authenticateWithCredentials(request);

    expect(response.accessToken, true);
    // expect(response.jwtData is String, true);
  });
}
