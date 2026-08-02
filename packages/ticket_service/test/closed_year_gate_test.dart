import 'dart:io' show InternetAddress, X509Certificate;

import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';
import 'package:ticket_service/ticket_service.dart';

/// Minimal [ServiceCall] for isTest paths that ignore the bearer.
class _FakeCall implements ServiceCall {
  @override
  X509Certificate? get clientCertificate => null;
  @override
  Map<String, String>? get clientMetadata => const {};
  @override
  DateTime? get deadline => null;
  @override
  Map<String, String>? get headers => null;
  @override
  bool get isCanceled => false;
  @override
  bool get isTimedOut => false;
  @override
  InternetAddress? get remoteAddress => null;
  @override
  int? get remotePort => null;
  @override
  Map<String, String>? get trailers => null;
  @override
  String get remoteHost => '';
  @override
  void sendHeaders() {}
  @override
  void sendTrailers({int? status, String? message}) {}
}

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('ticket_closed_year_gate_test');
  await poolService.initialize();

  late Counterfoil counterfoil;
  late UserPermissions permsWithFlag;
  late UserPermissions permsWithoutFlag;

  Future<void> seedChainWithClosedYear(int year) async {
    final db = await poolService.acquire();
    await db.collection(FenceService.boutiqueCollectionName).drop();
    await db.createCollection(FenceService.boutiqueCollectionName);

    final chain = Chain.create()
      ..mergeFromProto3Json(
        Dummy.chain.toProto3Json()!,
        ignoreUnknownFields: true,
      );
    chain.boutiques.first.boutique.closedYears.clear();
    chain.boutiques.first.boutique.closedYears.add(
      ClosedYearPb(year: year),
    );
    await db.collection(FenceService.boutiqueCollectionName).insertOne(
          chain.toProto3Json() as Map<String, dynamic>,
        );
    poolService.release(db);
  }

  TicketPb makeTicket({
    required String date,
    required int nonUniqueId,
    TicketTypePb type = TicketTypePb.sell,
  }) {
    return TicketPb.create()
      ..nonUniqueId = nonUniqueId
      ..date = date
      ..creationDate = date
      ..status = true
      ..ticketType = type
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
    await db.createCollection(TicketService.collectionName);
    poolService.release(db);

    counterfoil = Counterfoil.create()
      ..firmId = Dummy.firm.firmId
      ..chainId = Dummy.chain.chainId
      ..boutiqueId = Dummy.chain.boutiques.first.boutiqueId
      ..userId = Dummy.userPublic.userId;

    permsWithoutFlag = UserPermissions.create()
      ..mergeFromProto3Json(
        Dummy.adminPermission.toProto3Json()!,
        ignoreUnknownFields: true,
      )
      ..hasClosedYears = false;

    permsWithFlag = UserPermissions.create()
      ..mergeFromProto3Json(
        Dummy.adminPermission.toProto3Json()!,
        ignoreUnknownFields: true,
      )
      ..hasClosedYears = true;
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(TicketService.collectionName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    await db.collection(FenceService.boutiqueCollectionName).drop();
    poolService.release(db);
  });

  setUp(() async {
    final db = await poolService.acquire();
    await db.collection(TicketService.collectionName).drop();
    await db.createCollection(TicketService.collectionName);
    poolService.release(db);
    await seedChainWithClosedYear(2024);
  });

  group('loadBoutiqueClosedYears', () {
    test('returns closed years for boutique', () async {
      final db = await poolService.acquire();
      final years = await loadBoutiqueClosedYears(
        db,
        firmId: counterfoil.firmId,
        chainId: counterfoil.chainId,
        boutiqueId: counterfoil.boutiqueId,
      );
      poolService.release(db);
      expect(years, {2024});
    });

    test('returns empty when boutique missing', () async {
      final db = await poolService.acquire();
      final years = await loadBoutiqueClosedYears(
        db,
        firmId: counterfoil.firmId,
        chainId: counterfoil.chainId,
        boutiqueId: 'missing-boutique',
      );
      poolService.release(db);
      expect(years, isEmpty);
    });
  });

  group('ticket RPC closed-year gate', () {
    test('createOne allowed when hasClosedYears false despite Mongo years',
        () async {
      final svc = TicketService(
        poolService,
        isTest: true,
        userPermissionIfTest: permsWithoutFlag,
      );
      final res = await svc.createOne(
        null,
        TicketRequest(ticket: makeTicket(date: '2024-06-15T10:00:00.000', nonUniqueId: 1)),
      );
      expect(res.type, StatusResponse_Type.CREATED);
    });

    test('createOne rejects closed year when flag true', () async {
      final svc = TicketService(
        poolService,
        isTest: true,
        userPermissionIfTest: permsWithFlag,
      );
      try {
        await svc.createOne(
          null,
          TicketRequest(
            ticket: makeTicket(date: '2024-06-15T10:00:00.000', nonUniqueId: 2),
          ),
        );
        fail('Expected failedPrecondition');
      } on GrpcError catch (e) {
        expect(e.code, StatusCode.failedPrecondition);
      }
    });

    test('createOne allows open year when flag true', () async {
      final svc = TicketService(
        poolService,
        isTest: true,
        userPermissionIfTest: permsWithFlag,
      );
      final res = await svc.createOne(
        null,
        TicketRequest(
          ticket: makeTicket(date: '2025-03-01T10:00:00.000', nonUniqueId: 3),
        ),
      );
      expect(res.type, StatusResponse_Type.CREATED);
    });

    test('createOne allows inventoryClosingValue in closed year', () async {
      final svc = TicketService(
        poolService,
        isTest: true,
        userPermissionIfTest: permsWithFlag,
      );
      final res = await svc.createOne(
        null,
        TicketRequest(
          ticket: makeTicket(
            date: '2024-12-31T12:00:00.000',
            nonUniqueId: 4,
            type: TicketTypePb.inventoryClosingValue,
          ),
        ),
      );
      expect(res.type, StatusResponse_Type.CREATED);
    });

    test('createMany rejects when any ticket is in closed year', () async {
      final svc = TicketService(
        poolService,
        isTest: true,
        userPermissionIfTest: permsWithFlag,
      );
      try {
        await svc.createMany(
          _FakeCall(),
          TicketsRequest(tickets: [
            makeTicket(date: '2025-01-01T00:00:00.000', nonUniqueId: 10),
            makeTicket(date: '2024-01-01T00:00:00.000', nonUniqueId: 11),
          ]),
        );
        fail('Expected failedPrecondition');
      } on GrpcError catch (e) {
        expect(e.code, StatusCode.failedPrecondition);
      }
    });

    test('updateStatusOne rejects ticket in closed year', () async {
      final openPerms = permsWithoutFlag;
      final createSvc = TicketService(
        poolService,
        isTest: true,
        userPermissionIfTest: openPerms,
      );
      final ticket =
          makeTicket(date: '2024-06-15T10:00:00.000', nonUniqueId: 20);
      await createSvc.createOne(null, TicketRequest(ticket: ticket));

      final gateSvc = TicketService(
        poolService,
        isTest: true,
        userPermissionIfTest: permsWithFlag,
      );
      try {
        await gateSvc.updateStatusOne(null, TicketRequest(ticket: ticket));
        fail('Expected failedPrecondition');
      } on GrpcError catch (e) {
        expect(e.code, StatusCode.failedPrecondition);
      }
    });

    test('deleteOne rejects ticket in closed year', () async {
      final createSvc = TicketService(
        poolService,
        isTest: true,
        userPermissionIfTest: permsWithoutFlag,
      );
      final ticket =
          makeTicket(date: '2024-06-15T10:00:00.000', nonUniqueId: 21);
      await createSvc.createOne(null, TicketRequest(ticket: ticket));

      final gateSvc = TicketService(
        poolService,
        isTest: true,
        userPermissionIfTest: permsWithFlag,
      );
      try {
        await gateSvc.deleteOne(null, TicketRequest(ticket: ticket));
        fail('Expected failedPrecondition');
      } on GrpcError catch (e) {
        expect(e.code, StatusCode.failedPrecondition);
      }
    });
  });
}
