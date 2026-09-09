import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:test/test.dart';
import 'package:ticket_service/ticket_service.dart';

TicketPb _ticket({
  required int id,
  required Counterfoil counterfoil,
}) {
  final date = '2020-02-0${id}T00:00:00.000';
  return TicketPb.create()
    ..mergeFromProto3Json(
      {
        'id': id,
        'status': true,
        'date': date,
        'creationDate': date,
        'comment': 'c$id',
        'type': 'sell',
        'items': [
          {
            'articleRetail': {
              'calibreId': 1,
              'id': 1,
              'designation': 'Item $id',
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

UserPermissions _cloneAdmin({
  required String userId,
  required String firmId,
  bool isFirmCreator = false,
}) {
  return UserPermissions.create()
    ..mergeFromProto3Json(
      Dummy.adminPermission.toProto3Json(),
      ignoreUnknownFields: true,
    )
    ..userId = userId
    ..firmId = firmId
    ..isFirmCreator = isFirmCreator;
}

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('freemium_dump_quota_ticket_test');
  await poolService.initialize();

  late TicketService ticketService;
  late Counterfoil counterfoil;
  late UserPermissions unlicensedPerm;
  late UserPermissions licensedPerm;

  setUpAll(() async {
    final db = await poolService.acquire();
    debugResetFreemiumDumpQuotaIndexFlag();
    try {
      await db.collection(freemiumFullDumpQuotaCollectionName).drop();
    } catch (_) {}
    await db.createCollection(freemiumFullDumpQuotaCollectionName);

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

    unlicensedPerm = _cloneAdmin(
      userId: Dummy.userPublic.userId,
      firmId: Dummy.firm.firmId,
    );
    licensedPerm = _cloneAdmin(
      userId: 'licensed-user',
      firmId: Dummy.firm.firmId,
    );

    ticketService = TicketService(
      poolService,
      isTest: true,
      userPermissionIfTest: unlicensedPerm,
    );
    await db.collection(TicketService.collectionName).drop();
    await db.createCollection(TicketService.collectionName);
    poolService.release(db);

    for (var i = 1; i <= 2; i++) {
      await ticketService.createOne(
        null,
        TicketRequest()..ticket = _ticket(id: i, counterfoil: counterfoil),
      );
    }
  });

  setUp(() async {
    AppEnvironment.debugFreemiumThrottleOverride = true;
    final db = await poolService.acquire();
    await db.collection(freemiumFullDumpQuotaCollectionName).deleteMany({});
    await db.collection(FenceService.firmCollectionName).update(
          where.eq('firmId', Dummy.firm.firmId),
          {
            r'$set': {'licenses': <dynamic>[]}
          },
        );
    poolService.release(db);
    ticketService = TicketService(
      poolService,
      isTest: true,
      userPermissionIfTest: unlicensedPerm,
    );
  });

  tearDown(() {
    AppEnvironment.debugFreemiumThrottleOverride = null;
  });

  test('flag off: unlimited full dumps', () async {
    AppEnvironment.debugFreemiumThrottleOverride = false;
    final req = ReadAllTicketsRequest()
      ..chainId = counterfoil.chainId
      ..boutiqueId = counterfoil.boutiqueId;
    final first = await ticketService.readAll(null, req);
    expect(first.tickets.length, greaterThan(0));
    final second = await ticketService.readAll(null, req);
    expect(second.tickets.length, greaterThan(0));
  });

  test('unlicensed full dump then second is resourceExhausted', () async {
    final req = ReadAllTicketsRequest()
      ..chainId = counterfoil.chainId
      ..boutiqueId = counterfoil.boutiqueId;

    final first = await ticketService.readAll(null, req);
    expect(first.tickets.length, greaterThan(0));

    try {
      await ticketService.readAll(null, req);
      fail('expected resourceExhausted');
    } on GrpcError catch (e) {
      expect(e.code, StatusCode.resourceExhausted);
      expect(e.message, contains(kFreemiumFullDumpQuotaExceeded));
      expect(e.message, contains('resource=ticket'));
      expect(e.message, contains('periodDays='));
      expect(e.message, contains('retryAfterUtc='));
    }
  });

  test('incremental lastFetch never quotas', () async {
    final dump = ReadAllTicketsRequest()
      ..chainId = counterfoil.chainId
      ..boutiqueId = counterfoil.boutiqueId;
    await ticketService.readAll(null, dump);

    final incremental = ReadAllTicketsRequest()
      ..chainId = counterfoil.chainId
      ..boutiqueId = counterfoil.boutiqueId
      ..lastFetchTimestampUTC = DateTime.utc(2019, 1, 1).timestampProto;
    final again = await ticketService.readAll(null, incremental);
    expect(again.tickets, isNotEmpty);
  });

  test('portal limit > 0 never quotas', () async {
    final dump = ReadAllTicketsRequest()
      ..chainId = counterfoil.chainId
      ..boutiqueId = counterfoil.boutiqueId;
    await ticketService.readAll(null, dump);

    final page = ReadAllTicketsRequest()
      ..chainId = counterfoil.chainId
      ..boutiqueId = counterfoil.boutiqueId
      ..limit = 10
      ..offset = 0;
    final paged = await ticketService.readAll(null, page);
    expect(paged.tickets, isNotEmpty);
  });

  test('licensed seat unlimited dumps', () async {
    final past = DateTime.utc(2020, 1, 1);
    final license = License(
      licenseId: 'lic-1',
      licensePlan: LicensePlan.ENTERPRISE,
      providerProductId: 'p',
      providerPriceId: 'pr',
      maxUsers: 2,
      validFrom: past.timestampProto,
      seats: [
        LicenseSeat(
          firmId: Dummy.firm.firmId,
          userId: licensedPerm.userId,
        ),
      ],
    );
    final db = await poolService.acquire();
    await db.collection(FenceService.firmCollectionName).update(
      where.eq('firmId', Dummy.firm.firmId),
      {
        r'$set': {
          'licenses': [license.toProto3Json()],
        }
      },
    );
    poolService.release(db);

    ticketService = TicketService(
      poolService,
      isTest: true,
      userPermissionIfTest: licensedPerm,
    );

    final req = ReadAllTicketsRequest()
      ..chainId = counterfoil.chainId
      ..boutiqueId = counterfoil.boutiqueId;
    await ticketService.readAll(null, req);
    final second = await ticketService.readAll(null, req);
    expect(second.tickets, isNotEmpty);
  });
}
