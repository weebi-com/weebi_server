import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:fence_service/mongo_dart.dart';

import 'package:fence_service/grpc.dart'
    show GrpcError, Server, ServiceCall, ServiceMethod;
import 'package:article_service/article_service.dart';
import 'package:contact_service/contact_service.dart';
import 'package:server/server_interceptors.dart';
import 'package:ticket_service/ticket_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/weebi_app_service.dart';
// import 'package:fence_service/mongo_local_testing.dart';

import '../constants/app_environment.dart';

// TODO: in a production environment, it’s generally not recommended to use * due to security concern
// ? can we add weebi domain cors here ?
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

  try {
    final db = await Db.create(AppEnvironment.mongoDbUri);
    await db.open();
    final interceptors = [loggingInterceptor, authInterceptor, corsInterceptor];

    final articleService = ArticleService(db);
    final contactService = ContactService(db);
    final ticketService = TicketService(db);
    final fenceService = FenceService(db);
    final weebiAppService = WeebiAppService(db);

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

    await server.serve(port: AppEnvironment.port, address: ip);

    print('Server running on ip $ip port ${server.port}');
  } catch (e) {
    log('Failed to connect to MongoDB: $e');
  }
}
