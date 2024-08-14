import 'dart:developer';

import 'package:boutique_service/boutique_service.dart';
import 'package:logging/logging.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/grpc.dart';
import 'package:user_service/src/auth_interceptor.dart';
import 'package:user_service/src/log_interceptor.dart';
import 'package:user_service/src/user_service_base.dart';
import 'package:user_service/user_testing.dart';

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
  final firmService = BoutiqueService(db);
  await connection.connect();
  final server = Server.create(
    services: [UserService(db, firmService)],
    interceptors: interceptors,
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

  await server.serve(port: 8080);
  print('Server listening on port ${server.port}');
}
