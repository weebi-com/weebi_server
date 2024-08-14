import 'package:mongo_dart/mongo_dart.dart' hide Timestamp;
import 'package:user_service/user_service.dart';
import 'package:protos_weebi/grpc.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

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
        : call.bearer.userPermission;
    if (!request.ticket.counterfoil.isFirmAndChainAccessible(userPermission)) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.ticket.counterfoil.chainName} ${request.ticket.counterfoil.chainOid} / boutique ${request.ticket.counterfoil.boutiqueName} ${request.ticket.counterfoil.boutiqueOid}');
    }

    if (userPermission.ticketRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create ticket');
    }

    try {
      final ticketMongo = TicketMongo.create()
        ..ticket = request.ticket
        ..ticketNonUniqueId = request.ticket.id
        ..boutiqueOid = request.ticket.counterfoil.boutiqueOid
        ..chainOid = request.ticket.counterfoil.chainOid
        ..firmOid = userPermission.firmOid
        ..userOid = userPermission.userOid;

      final result = await collection
          .insertOne(ticketMongo.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1 && result.document != null) {
        final mongoId = result.document!['_id'] as ObjectId;

        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..message = mongoId.oid
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
      ServiceCall? call, Counterfoil request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.ticketRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read tickets');
    }
    if (!request.isFirmAndChainAccessible(userPermission)) {
      throw GrpcError.permissionDenied(
          'user cannot access data from firm ${request.firmName} or chain ${request.chainName}');
    }

    bool isOneBoutiqueFilter = false;
    if (request.boutiqueOid.isNotEmpty) {
      if (userPermission.boutiquesAccessible.oids
              .contains(request.boutiqueOid) ==
          false) {
        throw GrpcError.permissionDenied(
            'user cannot access data from boutique ${request.boutiqueName}');
      }
      isOneBoutiqueFilter = true;
    }
    var selector = SelectorBuilder();
    if (isOneBoutiqueFilter) {
      selector = where
          .eq('firmOid', userPermission.firmOid)
          .eq('chainOid', request.chainOid)
          .eq('boutiqueOid', request.boutiqueOid);
    } else {
      selector = where
          .eq('firmOid', userPermission.firmOid)
          .eq('chainOid', request.chainOid);
    }
    try {
      final list = await collection.find(selector).toList();
      if (list.isEmpty) {
        return TicketsResponse.create();
      }
      final tickets = <TicketPb>[];
      for (final t in list) {
        final ticketMongo = TicketMongo.create()
          ..mergeFromProto3Json(
            t, // no need to make oid proper, objects made in flutter app
            ignoreUnknownFields: true,
          );
        tickets.add(ticketMongo.ticket);
      }
      final ticketsBis = TicketsResponse();
      ticketsBis.tickets
        ..clear()
        ..addAll(tickets);
      return ticketsBis;
    } on GrpcError catch (e) {
      print('readAll ticket error $e');
      rethrow;
    }
  }

  @override
  Future<TicketPb> readOne(ServiceCall? call, FindTicketRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.ticketRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read tickets');
    }
    if (request.ticketChainOid.isChainAccessible(userPermission) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.ticketChainOid}');
    }

    final selector = where
        .eq('firmOid', userPermission.firmOid)
        .eq('chainOid', request.ticketChainOid)
        .eq('ticketNonUniqueId', request.ticketNonUniqueId);
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
        : call.bearer.userPermission;
    if (!request.ticket.counterfoil.isFirmAndChainAccessible(userPermission)) {
      throw GrpcError.permissionDenied(
          'user cannot access data from firm ${request.ticket.counterfoil.firmName} chain ${request.ticket.counterfoil.chainName}');
    }
    if (userPermission.boutiquesAccessible.oids
            .contains(request.ticket.counterfoil.boutiqueOid) ==
        false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from boutique ${request.ticket.counterfoil.boutiqueName}');
    }
    if (userPermission.ticketRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update ticket status');
    }
    final selector = where
        .eq('firmOid', request.ticket.counterfoil.firmOid)
        .eq('chainOid', request.ticket.counterfoil.chainOid)
        .eq('boutiqueOid', request.ticket.counterfoil.boutiqueOid)
        .eq('ticketId', request.ticket.id);
    try {
      final result = await collection.updateOne(
        selector,
        modify.set('ticket.status', false).set(
              'ticket.statusUpdateDate',
              DateTime.now().toIso8601String(),
            ),
      );
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok == 1) {
        // final mongoId = result.document!['_id'] as ObjectId;

        return StatusResponse.create()
          ..type = StatusResponse_Type.UPDATED
          // ..message = mongoId.oid
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
        : call.bearer.userPermission;
    if (!request.ticket.counterfoil.isFirmAndChainAccessible(userPermission)) {
      throw GrpcError.permissionDenied(
          'user cannot access data from firm ${request.ticket.counterfoil.firmName} chain ${request.ticket.counterfoil.chainName}');
    }
    if (userPermission.boutiquesAccessible.oids
            .contains(request.ticket.counterfoil.boutiqueOid) ==
        false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from boutique ${request.ticket.counterfoil.boutiqueName}');
    }
    if (userPermission.ticketRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete ticket');
    }

    final selector = where
        .eq('firmOid', request.ticket.counterfoil.firmOid)
        .eq('chainOid', request.ticket.counterfoil.chainOid)
        .eq('boutiqueOid', request.ticket.counterfoil.boutiqueOid)
        .eq('ticketId', request.ticket.id);

    try {
      await collection.deleteOne(selector);
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }
}
