import 'dart:async';
import 'dart:developer';
import 'dart:io' show HttpHeaders, InternetAddress;

import 'package:fence_service/mongo_pool.dart';
import 'package:logging/logging.dart';
// import 'package:fence_service/mongo_dart.dart';

import 'package:fence_service/grpc.dart'
    show GrpcError, Server, ServiceCall, ServiceMethod;
import 'package:article_service/article_service.dart';
import 'package:contact_service/contact_service.dart';
import 'package:server/server_interceptors.dart';
import 'package:ticket_service/ticket_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/weebi_app_service.dart';

import '../constants/app_environment.dart';

// * in a production environment, it’s generally not recommended to use * due to security concern
// ? consider adding weebi domain cors here ?
FutureOr<GrpcError?> corsInterceptor(ServiceCall call, ServiceMethod method) {
  call.headers!.addAll({
    HttpHeaders.accessControlAllowOriginHeader: '*',
    HttpHeaders.accessControlAllowMethodsHeader:
        'GET, POST, PUT, DELETE, OPTIONS',
    HttpHeaders.accessControlAllowHeadersHeader: '*',
    HttpHeaders.accessControlExposeHeadersHeader: '*',
    HttpHeaders.accessControlAllowCredentialsHeader: 'true',
  });

  if (call.clientMetadata?[':method'] == 'OPTIONS') {
    return null;
  }

  return null;
}

void main(List<String> arguments) async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    log('${rec.loggerName}: ${rec.level.name}: ${rec.time}: ${rec.message}');
  });
  print('1');

  final MongoDbPoolService poolService = MongoDbPoolService(
    MongoPoolConfiguration(
      maxLifetimeMilliseconds: 180000,
      leakDetectionThreshold: 10000,
      uriString: AppEnvironment.mongoDbUri,
      poolSize: 2,
    ),
  );

  try {
    await poolService.initialize();
    final db = await Db.create(AppEnvironment.mongoDbUri);
    print('2');
    await db.open();
    print('3');
//    final pool = ConnectionPool(5, () => Db(AppEnvironment.mongoDbUri));
    //  final db = await pool.connect();
    final interceptors = [loggingInterceptor, authInterceptor, corsInterceptor];

    final articleService = ArticleService(poolService);
    final contactService = ContactService(poolService);
    final ticketService = TicketService(poolService);
    final weebiAppService = WeebiAppService(poolService);
    final fenceService = FenceService(poolService);

    final server = Server.create(
      services: [
        articleService,
        contactService,
        ticketService,
        fenceService,
        weebiAppService
      ],
      interceptors: interceptors,
    );

    final ip = InternetAddress.anyIPv4;
    print('4');

    await server.serve(port: AppEnvironment.port, address: ip);

    print('gRPC Server running on ip $ip port ${server.port}');
    print('Use healthCheck RPC for service health and version information');
  } catch (e) {
    log('Failed to connect to MongoDB: $e');
  }
}
