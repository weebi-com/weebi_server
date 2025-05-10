import 'dart:developer';
import 'dart:io';

import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:logging/logging.dart';

import 'package:article_service/article_service.dart';
import 'package:contact_service/contact_service.dart';
import 'package:server/server_interceptors.dart';
import 'package:ticket_service/ticket_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/weebi_app_service.dart';

void main(List<String> arguments) async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    log(
      '${rec.loggerName}: ${rec.level.name}: ${rec.time}: ${rec.message}',
    );
  });

  final port = '8080';
  final intPort = int.parse(port);
  final db = TestHelper.localDb;
  final MongoDbPoolService poolService = MongoDbPoolService(
    MongoPoolConfiguration(
      maxLifetimeMilliseconds: 180000,
      leakDetectionThreshold: 10000,
      uriString: TestHelper.local,
      poolSize: 2,
    ),
  );
  await poolService.initialize();

  final interceptors = [
    loggingInterceptor,
    authInterceptor,
  ];

  final articleService = ArticleService(poolService);
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

  await server.serve(port: intPort, address: ip);

  print('Server running on ip $ip port ${server.port}');
}
