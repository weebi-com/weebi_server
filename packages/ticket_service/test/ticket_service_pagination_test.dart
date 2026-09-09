import 'package:test/test.dart';

import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:ticket_service/ticket_service.dart';

TicketPb _ticket({
  required int id,
  required Counterfoil counterfoil,
  required String comment,
  required String designation,
  bool status = true,
  String contactFirstName = '',
}) {
  final date = '2020-02-0${id}T00:00:00.000';
  return TicketPb.create()
    ..mergeFromProto3Json(
      {
        'id': id,
        'status': status,
        'date': date,
        'creationDate': date,
        'comment': comment,
        'contactFirstName': contactFirstName,
        'type': 'sell',
        'items': [
          {
            'articleRetail': {
              'calibreId': 1,
              'id': 1,
              'designation': designation,
              'price': 100.0,
              'cost': 80.0,
              'unitsInOnePiece': 1.0,
            },
            'quantity': 1.0,
          }
        ]
      },
      ignoreUnknownFields: true,
    )
    ..counterfoil = counterfoil;
}

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('ticket_service_pagination_test');
  await poolService.initialize();

  late TicketService ticketService;
  late Counterfoil counterfoil;
  late String chainId;
  late String boutiqueId;

  setUpAll(() async {
    final db = await poolService.acquire();
    await db.createCollection(FenceService.firmCollectionName);
    await db
        .collection(FenceService.firmCollectionName)
        .deleteMany(where.eq('firmId', Dummy.firm.firmId));
    await db.collection(FenceService.firmCollectionName).insertOne({
      'firmId': Dummy.firm.firmId,
      'licenses': <dynamic>[],
    });

    counterfoil = Counterfoil.create()
      ..firmId = Dummy.firm.firmId
      ..chainId = Dummy.chain.chainId
      ..boutiqueId = Dummy.chain.boutiques.first.boutiqueId
      ..userId = Dummy.userPublic.userId
      ..userName = 'alice';
    chainId = counterfoil.chainId;
    boutiqueId = counterfoil.boutiqueId;

    ticketService = TicketService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.collection(TicketService.collectionName).drop();
    await db.createCollection(TicketService.collectionName);
    poolService.release(db);

    final seeds = [
      _ticket(
        id: 1,
        counterfoil: counterfoil,
        comment: 'morning sale',
        designation: 'Cola 33cl',
      ),
      _ticket(
        id: 2,
        counterfoil: counterfoil,
        comment: 'chips pack',
        designation: 'Chips 50g',
        contactFirstName: 'Marie',
      ),
      _ticket(
        id: 3,
        counterfoil: counterfoil,
        comment: 'soap',
        designation: 'Soap bar',
      ),
      _ticket(
        id: 4,
        counterfoil: counterfoil,
        comment: 'milk',
        designation: 'Milk 1L',
      ),
      _ticket(
        id: 5,
        counterfoil: counterfoil,
        comment: 'bread loaf',
        designation: 'Bread loaf',
        status: false,
      ),
    ];
    for (final ticket in seeds) {
      final response = await ticketService.createOne(
        null,
        TicketRequest(ticket: ticket),
      );
      expect(response.type, StatusResponse_Type.CREATED);
    }
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(TicketService.collectionName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    poolService.release(db);
  });

  test('limit 0 returns the full dump without pagination metadata', () async {
    final response = await ticketService.readAll(
      null,
      ReadAllTicketsRequest(chainId: chainId, boutiqueId: boutiqueId),
    );
    expect(response.tickets.length, 5);
    expect(response.total, 0);
    expect(response.hasMore, isFalse);
    expect(response.batchSize, 0);
  });

  test('first page returns limit items newest first and hasMore', () async {
    final response = await ticketService.readAll(
      null,
      ReadAllTicketsRequest(
        chainId: chainId,
        boutiqueId: boutiqueId,
        offset: 0,
        limit: 2,
      ),
    );
    expect(response.tickets.map((t) => t.nonUniqueId), [5, 4]);
    expect(response.total, 5);
    expect(response.offset, 0);
    expect(response.batchSize, 2);
    expect(response.hasMore, isTrue);
  });

  test('second page continues from offset', () async {
    final response = await ticketService.readAll(
      null,
      ReadAllTicketsRequest(
        chainId: chainId,
        boutiqueId: boutiqueId,
        offset: 2,
        limit: 2,
      ),
    );
    expect(response.tickets.map((t) => t.nonUniqueId), [3, 2]);
    expect(response.total, 5);
    expect(response.offset, 2);
    expect(response.hasMore, isTrue);
  });

  test('last page hasMore is false', () async {
    final response = await ticketService.readAll(
      null,
      ReadAllTicketsRequest(
        chainId: chainId,
        boutiqueId: boutiqueId,
        offset: 4,
        limit: 2,
      ),
    );
    expect(response.tickets.map((t) => t.nonUniqueId), [1]);
    expect(response.total, 5);
    expect(response.hasMore, isFalse);
    expect(response.batchSize, 1);
  });

  test('query matches comment contact or designation', () async {
    final byComment = await ticketService.readAll(
      null,
      ReadAllTicketsRequest(
        chainId: chainId,
        boutiqueId: boutiqueId,
        limit: 10,
        query: 'morning',
      ),
    );
    expect(byComment.tickets.map((t) => t.nonUniqueId), [1]);
    expect(byComment.total, 1);

    final byContact = await ticketService.readAll(
      null,
      ReadAllTicketsRequest(
        chainId: chainId,
        boutiqueId: boutiqueId,
        limit: 10,
        query: 'marie',
      ),
    );
    expect(byContact.tickets.map((t) => t.nonUniqueId), [2]);

    final byDesignation = await ticketService.readAll(
      null,
      ReadAllTicketsRequest(
        chainId: chainId,
        boutiqueId: boutiqueId,
        limit: 10,
        query: 'soap',
      ),
    );
    expect(byDesignation.tickets.single.comment, 'soap');
  });

  test('statusFilter 1 is active only, 2 is inactive only', () async {
    final active = await ticketService.readAll(
      null,
      ReadAllTicketsRequest(
        chainId: chainId,
        boutiqueId: boutiqueId,
        limit: 10,
        statusFilter: 1,
      ),
    );
    expect(active.total, 4);
    expect(active.tickets.every((t) => t.status), isTrue);

    final inactive = await ticketService.readAll(
      null,
      ReadAllTicketsRequest(
        chainId: chainId,
        boutiqueId: boutiqueId,
        limit: 10,
        statusFilter: 2,
      ),
    );
    expect(inactive.total, 1);
    expect(inactive.tickets.single.nonUniqueId, 5);
  });
}
