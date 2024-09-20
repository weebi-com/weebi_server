import 'dart:developer';

import 'package:logging/logging.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/grpc.dart';
import 'package:fence_service/src/fence_service_base.dart';
import 'package:fence_service/user_testing.dart';
import 'package:server/server_interceptors.dart';

void main(List<String> args) async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    log(
      '${rec.loggerName}: ${rec.level.name}: ${rec.time}: ${rec.message}',
    );
  });

  final db = TestHelper.localDb;
  final connection = Connection(ConnectionManager(db));

  final interceptors = <Interceptor>[
    loggingInterceptor,
    authInterceptor,
  ];
  await connection.connect();
  final server = Server.create(
    services: [FenceService(db)],
    interceptors: interceptors,
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

  await server.serve(port: 8080);
  print('Server listening on port ${server.port}');
}
