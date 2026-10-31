import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';
import 'package:ticket_service/ticket_service.dart';

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('ticket_service_delete_all_test');
  await poolService.initialize();

  late TicketService ticketService;
  late Counterfoil counterfoil;

  TicketPb ticket(int nonUniqueId) {
    return TicketPb.create()
      ..nonUniqueId = nonUniqueId
      ..date = '2025-02-02T00:00:00.000'
      ..creationDate = '2025-02-02T00:00:00.00$nonUniqueId'
      ..status = true
      ..ticketType = TicketTypePb.sell
      ..counterfoil = counterfoil;
  }

  setUpAll(() async {
    final db = await poolService.acquire();
    await db.createCollection(FenceService.firmCollectionName);
    await db.collection(FenceService.firmCollectionName).deleteMany(
          where.eq('firmId', Dummy.firm.firmId),
        );
    await db.collection(FenceService.firmCollectionName).insertOne({
      'firmId': Dummy.firm.firmId,
      'licenses': <dynamic>[],
    });
    await db.collection(TicketService.collectionName).drop();
    await db.createCollection(TicketService.collectionName);
    poolService.release(db);

    counterfoil = Counterfoil.create()
      ..firmId = Dummy.firm.firmId
      ..chainId = Dummy.chain.chainId
      ..boutiqueId = Dummy.chain.boutiques.first.boutiqueId
      ..userId = Dummy.userPublic.userId;

    ticketService = TicketService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
  });

  setUp(() async {
    final db = await poolService.acquire();
    await db.collection(TicketService.collectionName).deleteMany({});
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(TicketService.collectionName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    poolService.release(db);
  });

  test('deleteAll soft-deletes boutique tickets and leaves another boutique',
      () async {
    final otherCounterfoil = Counterfoil.create()
      ..firmId = Dummy.firm.firmId
      ..chainId = Dummy.chain.chainId
      ..boutiqueId = 'other-boutique'
      ..userId = Dummy.userPublic.userId;

    await ticketService.createOne(null, TicketRequest(ticket: ticket(1)));
    await ticketService.createOne(null, TicketRequest(ticket: ticket(2)));
    await ticketService.createOne(
      null,
      TicketRequest(
        ticket: ticket(3)..counterfoil = otherCounterfoil,
      ),
    );

    final wiped = await ticketService.deleteAll(
      null,
      DeleteAllTicketsRequest(
        chainId: counterfoil.chainId,
        boutiqueId: counterfoil.boutiqueId,
      ),
    );
    expect(wiped.type, StatusResponse_Type.DELETED);
    expect(wiped.message, contains('deleted=2'));

    final remaining = await ticketService.readAll(
      null,
      ReadAllTicketsRequest(
        chainId: counterfoil.chainId,
        boutiqueId: counterfoil.boutiqueId,
      ),
    );
    expect(remaining.tickets, isEmpty);

    final other = await ticketService.readAll(
      null,
      ReadAllTicketsRequest(
        chainId: otherCounterfoil.chainId,
        boutiqueId: otherCounterfoil.boutiqueId,
      ),
    );
    expect(other.tickets.length, 1);

    final db = await poolService.acquire();
    final docs = await db
        .collection(TicketService.collectionName)
        .find(where.eq('boutiqueId', counterfoil.boutiqueId))
        .toList();
    poolService.release(db);
    expect(docs, isNotEmpty);
    expect(docs.every((d) => d['isDeleted'] == true), isTrue);
  });

  test('deleteAll is idempotent when empty', () async {
    final wiped = await ticketService.deleteAll(
      null,
      DeleteAllTicketsRequest(
        chainId: counterfoil.chainId,
        boutiqueId: counterfoil.boutiqueId,
      ),
    );
    expect(wiped.type, StatusResponse_Type.DELETED);
    expect(wiped.message, contains('deleted=0'));
  });

  test('deleteAll rejects missing boutiqueId', () async {
    try {
      await ticketService.deleteAll(
        null,
        DeleteAllTicketsRequest(chainId: counterfoil.chainId),
      );
      fail('Expected invalidArgument');
    } on GrpcError catch (e) {
      expect(e.code, StatusCode.invalidArgument);
    }
  });
}
