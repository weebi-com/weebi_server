import 'package:test/test.dart';

import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/models_weebi.dart' show TicketWeebi;
import 'package:fence_service/mongo_local_testing.dart';
import 'package:ticket_service/ticket_service.dart';

void main() async {
  final MongoDbPoolService poolService = TestHelper.defaultPoolService;

  await poolService.initialize();

  late TicketService ticketService;
  late Counterfoil counterfoilDummy;
  final ticketDummy = TicketPb.create()
    ..mergeFromProto3Json(
      TicketWeebi.dummySell.toMap(isProto: true),
      ignoreUnknownFields: true,
    );

  setUpAll(() async {
    var fenceService = FenceService(
      poolService,
      isMock: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    final db = await poolService.acquire();
    await db.createCollection(FenceService.userCollectionName);
    await db.createCollection(FenceService.boutiqueCollectionName);

    fenceService.userPermissionIfTest = Dummy.adminPermission;
    final counterfoil = Counterfoil.create()
      ..firmId = Dummy.firm.firmId
      ..chainId = Dummy.chain.chainId
      ..boutiqueId = Dummy.chain.boutiques.first.boutiqueId
      ..userId = Dummy.userPublic.userId;

    ticketService = TicketService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.collection(TicketService.collectionName).drop();
    await db.createCollection(TicketService.collectionName);

    counterfoilDummy = counterfoil;
    ticketDummy.counterfoil = counterfoil;
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(TicketService.collectionName).drop();
    poolService.release(db);
  });

  test('test insertOne ', () async {
    final request = TicketRequest(ticket: ticketDummy);
    // ignore: unused_local_variable
    final response = await ticketService.createOne(null, request);
    expect(response.type, StatusResponse_Type.CREATED);
  });
  test('test readAll', () async {
    final response = await ticketService.readAll(
      null,
      ReadAllTicketsRequest(
          chainId: counterfoilDummy.chainId,
          boutiqueId: counterfoilDummy.boutiqueId),
    );
    expect(response.tickets.length, 1);
  });
  test('test updateStatus ', () async {
    final lili = TicketWeebi.dummySell.copyWith(
      status: false,
      statusUpdateDate: DateTime.now(),
    );
    final ticketLili = TicketPb.create()
      ..mergeFromProto3Json(
        lili.toMap(isProto: true),
        ignoreUnknownFields: true,
      );
    ticketLili.counterfoil = counterfoilDummy;

    final request = TicketRequest(
      ticket: ticketLili,
    );
    // ignore: unused_local_variable
    final response = await ticketService.updateStatusOne(null, request);
    // expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await ticketService.readAll(
        null,
        ReadAllTicketsRequest(
            chainId: counterfoilDummy.chainId,
            boutiqueId: counterfoilDummy.boutiqueId));
//    print('response2 ${response2.tickets.length}');
    expect(response2.tickets.first.status, false);
    expect(
        DateTime.parse(response2.tickets.first.statusUpdateDate)
            .isAfter(DateTime(2023)),
        isTrue);
  });

  test('test deleteOne ', () async {
    final request = TicketRequest(ticket: ticketDummy);
    // ignore: unused_local_variable
    final response = await ticketService.deleteOne(null, request);

    final response2 = await ticketService.readAll(
        null,
        ReadAllTicketsRequest(
            chainId: counterfoilDummy.chainId,
            boutiqueId: counterfoilDummy.boutiqueId));
    expect(response2.tickets.length, 0);
  });
}
