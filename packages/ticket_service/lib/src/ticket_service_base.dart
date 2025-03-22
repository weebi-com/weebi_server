import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/protos_weebi.dart';

abstract class _Helpers {
  static SelectorBuilder selectTicket(String firmId, String boutiqueId,
          int ticketNonUniqueId, String creationDate) =>
      where
          .eq('firmId', firmId)
          .eq('boutiqueId', boutiqueId)
          .eq('nonUniqueId', ticketNonUniqueId)
          .eq('creationDate', creationDate);
}

class TicketService extends TicketServiceBase {
  final Db _db;
  final DbCollection collection;
  // for unit tests only
  final bool isTest;
  final UserPermissions? userPermissionIfTest;
  static const String collectionName = 'ticket';
  TicketService(
    this._db, {
    this.isTest = false,
    this.userPermissionIfTest,
  }) : collection = _db.collection(collectionName);

  @override
  Future<StatusResponse> createOne(
      ServiceCall? call, TicketRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (!request.ticket.counterfoil.isFirmAndChainAccessible(userPermission)) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.ticket.counterfoil.chainName} ${request.ticket.counterfoil.chainId} / boutique ${request.ticket.counterfoil.boutiqueName} ${request.ticket.counterfoil.boutiqueId}');
    }

    if (userPermission.ticketRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create ticket');
    }

    try {
      final snapshot = await collection.findOne(_Helpers.selectTicket(
          userPermission.firmId,
          request.ticket.counterfoil.boutiqueId,
          request.ticket.nonUniqueId,
          request.ticket.creationDate));
      if (snapshot != null) {
        throw GrpcError.alreadyExists();
      }
      final ticketMongo = TicketMongo.create()
        ..ticket = request.ticket
        ..creationDate = request.ticket.date
        ..nonUniqueId = request.ticket.nonUniqueId
        ..boutiqueId = request.ticket.counterfoil.boutiqueId
        ..chainId = request.ticket.counterfoil.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId
        ..contactId = request.ticket.contactId
        ..lastTouchTimestampUTC = DateTime.now().toUtc().timestampProto;

      final result = await collection
          .insertOne(ticketMongo.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.success && result.document != null) {
        final ticketNonUniqueId = result.document!['nonUniqueId'] as int;

        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..id = ticketNonUniqueId.toString()
          ..timestamp = DateTime.now().timestampProto;
      } else {
        return StatusResponse.create()
          ..type = StatusResponse_Type.ERROR
          ..message = 'result.ok != 1 || result.document == null'
          ..timestamp = DateTime.now().timestampProto;
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }

  @override
  Future<TicketsResponse> readAll(
      ServiceCall? call, ReadAllTicketsRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.ticketRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read tickets');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }

    // the boss and managers can access tickets from several boutiques
    bool isOneBoutiqueFilter = false;
    if (request.boutiqueId.isNotEmpty) {
      if (userPermission.isBoutiqueAccessible(request.boutiqueId) == false) {
        throw GrpcError.permissionDenied(
            'user cannot access data from boutique ${request.boutiqueId}');
      }
      isOneBoutiqueFilter = true;
    }

    print(
        'readTickets : firmId ${userPermission.firmId} chainId ${request.chainId}');

    final selector = where
        .eq('firmId', userPermission.firmId)
        .eq('chainId', request.chainId);

    if (isOneBoutiqueFilter) {
      selector.and(where.eq('boutiqueId', request.boutiqueId));
    }

    if (request.lastFetchTimestampUTC.isNotEmpty) {
      selector.and(where.gte(
          'lastTouchTimestampUTC', request.lastFetchTimestampUTC.toDateTime()));
    }

    if (request.isDeleted) {
      /// will look for deleted tickets
      selector.and(where.eq('isDeleted', true));
    } else {
      /// regular search for tickets
      selector
          .and(where.eq('isDeleted', false).or(where.eq('isDeleted', null)));
    }

    try {
      final list = await collection.find(selector).toList();
      if (list.isEmpty) {
        return TicketsResponse.create();
      }
      final tickets = <TicketPb>[];
      for (final t in list) {
        final ticketMongo = TicketMongo.create()
          ..mergeFromProto3Json(t, ignoreUnknownFields: true);
        tickets.add(ticketMongo.ticket);
      }
      final ticketsBis = TicketsResponse();
      ticketsBis.tickets
        ..clear()
        ..addAll(tickets);
      return ticketsBis;
    } on GrpcError catch (e) {
      print('readAll tickets error $e');
      rethrow;
    }
  }

  @override
  Future<TicketPb> readOne(ServiceCall? call, FindTicketRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (userPermission.ticketRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read tickets');
    }
    if (userPermission.isChainAccessible(request.ticketChainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.ticketChainId}');
    }

    final selector = where
        .eq('firmId', userPermission.firmId)
        .eq('chainId', request.ticketChainId)
        .and(where.eq('isDeleted', false).or(where.eq('isDeleted', null)));

    if (request.ticketBoutiqueId.isNotEmpty) {
      selector.eq('boutiqueId', request.ticketBoutiqueId);
    }
    if (request.nonUniqueId != 0) {
      selector.eq('nonUniqueId', request.nonUniqueId);
    }
    if (request.ticketUserId.isNotEmpty) {
      selector.eq('userId', request.ticketUserId);
    }
    if (request.creationDate.isNotEmpty) {
      selector.eq('creationDate', request.creationDate);
    }
    try {
      final ticket = await collection.findOne(selector);
      if (ticket == null) {
        return TicketPb.getDefault();
      }
      final ticketMongo = TicketMongo.create()
        ..mergeFromProto3Json(ticket, ignoreUnknownFields: true);
      return ticketMongo.ticket;
    } on GrpcError catch (e) {
      print('readOne ticket error $e');
      rethrow;
    }
  }

  @override
  Future<StatusResponse> updateStatusOne(
      ServiceCall? call, TicketRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (!request.ticket.counterfoil.isFirmAndChainAccessible(userPermission)) {
      throw GrpcError.permissionDenied(
          'user cannot access data from firm ${request.ticket.counterfoil.firmName} chain ${request.ticket.counterfoil.chainName}');
    }
    if (userPermission.ticketRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update ticket status');
    }

    if (userPermission
            .isBoutiqueAccessible(request.ticket.counterfoil.boutiqueId) ==
        false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from boutique ${request.ticket.counterfoil.boutiqueName}');
    }
    final selector = _Helpers.selectTicket(
      request.ticket.counterfoil.firmId,
      request.ticket.counterfoil.boutiqueId,
      request.ticket.nonUniqueId,
      request.ticket.date,
    );

    try {
      final result = await collection.updateOne(
        selector,
        modify
            .set('ticket.status', false)
            .set(
              'ticket.statusUpdateDate',
              DateTime.now().toIso8601String(),
            )
            .set('lastTouchTimestampUTC',
                DateTime.now().toUtc().timestampProto.toProto3Json()),
      );
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.success) {
        return StatusResponse.create()
          ..type = StatusResponse_Type.UPDATED
          // ..id= mongoid
          ..timestamp = DateTime.now().timestampProto;
      } else {
        return StatusResponse.create()
          ..type = StatusResponse_Type.ERROR
          ..message = 'result.ok != 1 || result.document == null'
          ..timestamp = DateTime.now().timestampProto;
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }

  @override
  Future<StatusResponse> deleteOne(
      ServiceCall? call, TicketRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;
    if (!request.ticket.counterfoil.isFirmAndChainAccessible(userPermission)) {
      throw GrpcError.permissionDenied(
          'user cannot access data from firm ${request.ticket.counterfoil.firmName} chain ${request.ticket.counterfoil.chainName}');
    }
    if (userPermission
            .isBoutiqueAccessible(request.ticket.counterfoil.boutiqueId) ==
        false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from boutique ${request.ticket.counterfoil.boutiqueName}');
    }
    if (userPermission.ticketRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete ticket');
    }
    final selector = _Helpers.selectTicket(
      request.ticket.counterfoil.firmId,
      request.ticket.counterfoil.boutiqueId,
      request.ticket.nonUniqueId,
      request.ticket.date,
    );

    try {
      // * for legal reasons do not delete a ticket, only softDelete it
      // thus we do not use await collection.deleteOne(selector);
      final result = await collection.updateOne(
        selector,
        modify.set('isDeleted', true).set('lastTouchTimestampUTC',
            DateTime.now().toUtc().timestampProto.toProto3Json()),
      );
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      } else if (result.success) {
        return StatusResponse.create()
          ..type = StatusResponse_Type.DELETED
          ..timestamp = DateTime.now().timestampProto;
      } else {
        return StatusResponse.create()
          ..type = StatusResponse_Type.ERROR
          ..message = 'result.ok != 1 || result.document == null'
          ..timestamp = DateTime.now().timestampProto;
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<StatusResponse> createMany(
      ServiceCall call, TicketsRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermissions;

    if (request.tickets.any((t) =>
        t.counterfoil.isFirmAndChainAccessible(userPermission) == false)) {
      final guiltyTicket = request.tickets.firstWhere((t) =>
          t.counterfoil.isFirmAndChainAccessible(userPermission) == false);
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${guiltyTicket.counterfoil.chainName} ${guiltyTicket.counterfoil.chainId} / boutique ${guiltyTicket.counterfoil.boutiqueName} ${guiltyTicket.counterfoil.boutiqueId}');
    }

    if (userPermission.ticketRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create ticket');
    }

    final ticketsMap = <Map<String, dynamic>>[];
    final nowTimestampUtc = DateTime.now().toUtc().timestampProto;
    int dups = 0;
    for (final ticketPb in request.tickets) {
      final snapshot = await collection.findOne(_Helpers.selectTicket(
          userPermission.firmId,
          ticketPb.counterfoil.boutiqueId,
          ticketPb.nonUniqueId,
          ticketPb.creationDate));
      if (snapshot != null) {
        dups += 1;
        continue;
      }
      final ticketMongo = TicketMongo.create()
        ..ticket = ticketPb
        ..creationDate = ticketPb.date
        ..nonUniqueId = ticketPb.nonUniqueId
        ..boutiqueId = ticketPb.counterfoil.boutiqueId
        ..chainId = ticketPb.counterfoil.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId
        ..contactId = ticketPb.contactId
        ..lastTouchTimestampUTC = nowTimestampUtc;
      ticketsMap.add(ticketMongo.toProto3Json() as Map<String, dynamic>);
    }
    if (request.tickets.length == dups) {
      throw GrpcError.alreadyExists();
    }
    try {
      final result = await collection.insertMany(ticketsMap);
      if (result.hasWriteErrors) {
        final writeErrorsMessages = <String>[];
        for (final error in result.writeErrors) {
          writeErrorsMessages.add(error.toString());
        }
        throw GrpcError.unknown(
            'hasWriteErrors ${writeErrorsMessages.join("\n")}');
      }
      if (result.success) {
        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..timestamp = DateTime.now().timestampProto
          ..message =
              dups > 0 ? 'dups ignored: $dups/${request.tickets.length}' : '';
      } else {
        return StatusResponse.create()
          ..type = StatusResponse_Type.ERROR
          ..message = 'result.failure but no writeErrorsMessages'
          ..timestamp = DateTime.now().timestampProto;
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }
}
