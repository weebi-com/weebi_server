// import 'dart:io';
import 'package:test/test.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'package:ticket_service/ticket_service.dart';
import 'package:models_weebi/models.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:user_service/user_testing.dart';

void main() async {
  final db = TestHelper.localDb;

  final connection = Connection(ConnectionManager(db));
  late TicketService ticketService;
  late Counterfoil counterfoilDummy;
  final ticketDummy = TicketPb.create()
    ..mergeFromProto3Json(
      TicketWeebi.dummySell.toMap(),
      ignoreUnknownFields: true,
    );

  setUpAll(() async {
    final counterfoil = await TestHelper.ticketSetUp(db, connection);

    await db.open();
    ticketService = TicketService(
      db,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.collection(ticketService.collection.collectionName).drop();
    await db.createCollection(ticketService.collection.collectionName);

    counterfoilDummy = counterfoil;
    ticketDummy.counterfoil = counterfoil;
  });

  tearDownAll(() async {
    await db.collection(ticketService.collection.collectionName).drop();
    await connection.close();
  });

  test('test insertOne ', () async {
    final request = TicketRequest(ticket: ticketDummy);
    // ignore: unused_local_variable
    final response = await ticketService.createOne(null, request);
    expect(response.type, StatusResponse_Type.CREATED);
  });
  test('test readAll', () async {
    final response = await ticketService.readAll(null, counterfoilDummy);
    expect(response.tickets.length, 1);
  });
  test('test updateStatus ', () async {
    final lili = TicketWeebi.dummySell.copyWith(
      status: false,
      statusUpdateDate: DateTime.now(),
    );
    final ticketLili = TicketPb.create()
      ..mergeFromProto3Json(
        lili.toMap(),
        ignoreUnknownFields: true,
      );
    ticketLili.counterfoil = counterfoilDummy;

    final request = TicketRequest(
      ticket: ticketLili,
    );
    // ignore: unused_local_variable
    final response = await ticketService.updateStatusOne(null, request);
    // expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await ticketService.readAll(null, counterfoilDummy);
    print('response2 ${response2.tickets.length}');
    expect(response2.tickets.first.status, false);
    expect(
        DateTime.parse(response2.tickets.first.dateStatus)
            .isAfter(DateTime(2023)),
        isTrue);
  });

  test('test deleteOne ', () async {
    final request = TicketRequest(ticket: ticketDummy);
    // ignore: unused_local_variable
    final response = await ticketService.deleteOne(null, request);

    final response2 = await ticketService.readAll(null, counterfoilDummy);
    expect(response2.tickets.length, 0);
  });
}
