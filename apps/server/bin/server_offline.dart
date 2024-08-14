import 'dart:developer';
import 'dart:io';

import 'package:logging/logging.dart';

import 'package:protos_weebi/grpc.dart' show Server;
import 'package:article_service/article_service.dart';
import 'package:contact_service/contact_service.dart';
import 'package:boutique_service/boutique_service.dart';
import 'package:ticket_service/ticket_service.dart';
import 'package:user_service/user_service.dart';
import 'package:user_service/user_testing.dart';
import 'package:user_service/weebi_app_service.dart';

void main(List<String> arguments) async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    log(
      '${rec.loggerName}: ${rec.level.name}: ${rec.time}: ${rec.message}',
    );
  });

  // var port = Platform.environment['PORT'];
  final port = '8080';
  // ignore: unnecessary_null_comparison
  if (port == null) {
    throw Exception('Port variable is not defined');
  }

  final intPort = int.parse(port);

  // also possible here to read data from file.txt/csv/json to populate data

  final db = TestHelper.localDb; // mongodb local connexion

  final interceptors = [
    loggingInterceptor,
    authInterceptor,
  ];

  final articleService = ArticleService(db);
  final contactService = ContactService(db);
  final ticketService = TicketService(db);
  final firmService = BoutiqueService(db);
  final userService = UserService(db, firmService);
  final weebiAppService = WeebiAppService(db);

  final server = Server.create(
    services: [
      articleService,
      contactService,
      ticketService,
      firmService,
      userService,
      weebiAppService
    ],
    interceptors: interceptors,
  );

  final ip = InternetAddress.anyIPv4;

  await server.serve(port: intPort, address: ip);

  print('Server running on ip $ip port ${server.port}');
}
