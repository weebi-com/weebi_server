import 'dart:async';
import 'dart:developer';
import 'dart:io' show HttpHeaders, InternetAddress;

import 'package:fence_service/mongo_pool.dart';
import 'package:logging/logging.dart';
// import 'package:fence_service/mongo_dart.dart';

import 'package:fence_service/grpc.dart'
    show GrpcError, Server, ServiceCall, ServiceMethod;
import 'package:fence_service/logging.dart' show WeebiLogger;
import 'package:article_service/article_service.dart';
import 'package:contact_service/contact_service.dart';
import 'package:server/server_interceptors.dart';
import 'package:ticket_service/ticket_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/weebi_app_service.dart';

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
  // Initialize structured JSON logging for Google Cloud Run
  WeebiLogger.initialize(level: Level.INFO);
  
  print('1 - Starting server');

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
    print('1 - Pool service initialized successfully');
  } catch (e) {
    print('ERROR: Failed to initialize pool service: $e');
    rethrow;
  }
  
  try {
    final db = await Db.create(AppEnvironment.mongoDbUri);
    print('2 - MongoDB connection created');
    final startTime = DateTime.now();
    await db.open();
    final endTime = DateTime.now();
    print(
        '3 - MongoDB connection opened successfully in ${endTime.difference(startTime).inSeconds} seconds');
  } catch (e) {
    print('ERROR: Failed to create or open MongoDB connection: $e'); // Log the full error
    rethrow;
  }


  try {
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
    print('4 - gRPC server created about to serve');

    await server.serve(port: AppEnvironment.port, address: ip);

    print('gRPC Server running on ip $ip port ${server.port}');
    print('Use healthCheck RPC for service health and version information');
  } catch (e) {
    log('Failed to create gRPC server: $e');
  }
}
