import 'dart:async';
import 'dart:developer';
import 'dart:io' show HttpHeaders, InternetAddress, Platform;

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

    /// reminder
    /// MAILTRAP_DEV_USERNAME  MAILTRAP_DEV_PASSWORD
    /// prd 'MAILTRAP_API_TOKEN'] optionnal FROM_EMAIL FROM_NAME

    fenceService.configureMailService(EmailConfig.create());

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

    String httpBaseUrl = '';
    if (Platform.environment['ENVIRONMENT'] == null) {
      print(
          'Platform.environment null REST server on localhost:${AppEnvironment.httpPort}');
      httpBaseUrl = 'http://localhost:${AppEnvironment.httpPort}';
    } else {
      // Start HTTP server for REST endpoints
      print('HTTP_BASE_URL: ${Platform.environment['HTTP_BASE_URL']}');
      print('REST server on ${Platform.environment['ENVIRONMENT']} ');
      httpBaseUrl = Platform.environment['HTTP_BASE_URL'] ??
          (Platform.environment['ENVIRONMENT'] == 'production'
              ? 'https://prd.weebi.com'
              : 'https://dev.weebi.com');
    }

    await fenceService.startHttpServer(
      port: AppEnvironment.httpPort,
      baseUrl: httpBaseUrl,
    );
    print(
        'HTTP Server running on port ${AppEnvironment.httpPort} with base URL: $httpBaseUrl');
  } catch (e) {
    log('Failed to connect to MongoDB: $e');
  }
}
