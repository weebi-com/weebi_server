import 'dart:developer';
import 'dart:io';

import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_dart.dart';
import 'package:logging/logging.dart';

import 'package:article_service/article_service.dart';
import 'package:contact_service/contact_service.dart';
import 'package:server/server_interceptors.dart';
import 'package:ticket_service/ticket_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/weebi_app_service.dart';

// ! a docker image built using this might have issues connecting to mongodb https://github.com/mongo-dart/mongo_dart/issues/59 
void main(List<String> arguments) async {
  print('0');
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    log(
      '${rec.loggerName}: ${rec.level.name}: ${rec.time}: ${rec.message}',
    );
  });

  try {
    final port = '8080';
    final intPort = int.parse(port);
    print('1');

    final db = Db("mongodb://127.0.0.1:27017/local");
    print('2');

    final interceptors = [
      loggingInterceptor,
      authInterceptor,
    ];
    print('3');

    final articleService = ArticleService(db);
    final contactService = ContactService(db);
    final ticketService = TicketService(db);
    final fenceService = FenceService(db);
    final weebiAppService = WeebiAppService(db);
    print('4');

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
    print('5');

    await server.serve(port: intPort, address: ip);

    print('Server running on ip $ip port ${server.port}');
  } catch (e) {
    print('error $e');
  }
}
