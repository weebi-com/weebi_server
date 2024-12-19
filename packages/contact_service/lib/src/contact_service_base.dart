import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/protos_weebi.dart';

abstract class _Helpers {
  static SelectorBuilder selectContact(
          String firmId, String chainId, int contactId, String dateCreation) =>
      where
          .eq('firmId', firmId)
          .eq('chainId', chainId)
          .eq('contactId', contactId)
          .eq('dateCreation', dateCreation);
}

class ContactService extends ContactServiceBase {
  final Db _db;
  final DbCollection collection;
  final bool isTest;
  final UserPermissions? userPermissionIfTest;
  static const String collectionName = 'contact';

  ContactService(
    this._db, {
    this.isTest = false,
    this.userPermissionIfTest,
  }) : collection = _db.collection(collectionName);

  @override
  Future<StatusResponse> createOne(
      ServiceCall? call, ContactRequest request) async {
    _db.isConnected ? null : await _db.open();

    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    if (userPermission.contactRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create articles');
    }
    try {
      final contactMongo = ContactMongo.create()
        ..contact = request.contact
        ..creationDate = request.contact.creationDate
        ..contactId = request.contact.id
        ..chainId = request.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId
        ..lastTouchTimestampUTC = DateTime.now().toUtc().timestampProto;

      final result = await collection
          .insertOne(contactMongo.toProto3Json() as Map<String, dynamic>);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.success && result.document != null) {
        final contactId = result.document!['contactId'] as int;

        return StatusResponse.create()
          ..type = StatusResponse_Type.CREATED
          ..id = contactId.toString()
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
      // the whole stacktrace is heavy
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }

  @override
  Future<StatusResponse> updateOne(
      ServiceCall? call, ContactRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    if (userPermission.contactRights.rights.any((e) => e == Right.update) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to update contacts');
    }
    try {
      final contactMongo = ContactMongo.create()
        ..contact = request.contact
        ..creationDate = request.contact.creationDate
        ..contactId = request.contact.id
        ..chainId = request.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId
        ..lastTouchTimestampUTC = DateTime.now().toUtc().timestampProto;

      final result = await collection.replaceOne(
          _Helpers.selectContact(
            userPermission.firmId,
            request.chainId,
            request.contact.id,
            request.contact.creationDate,
          ),
          contactMongo.toProto3Json() as Map<String, dynamic>,
          upsert: true);
      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.ok != 1) {
        throw GrpcError.unknown(
            'update != 1 ${result.document} ${result.serverResponses}');
      }
      return StatusResponse()
        ..type = StatusResponse_Type.UPDATED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    } catch (e, stacktrace) {
      // the whole stacktrace is heavy
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }

  @override
  Future<StatusResponse> deleteOne(
      ServiceCall? call, ContactRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.contactRights.rights.any((e) => e == Right.delete) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to delete contact');
    }
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    try {
      await collection.deleteOne(
        _Helpers.selectContact(
          userPermission.firmId,
          request.chainId,
          request.contact.id,
          request.contact.creationDate,
        ),
      );
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED
        ..timestamp = DateTime.now().timestampProto;
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<ContactsResponse> readAll(
      ServiceCall? call, ReadAllContactsRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    if (userPermission.contactRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read contacts');
    }
    try {
      var selector = SelectorBuilder();
      if (request.lastFetchTimestampUTC.hasSeconds()) {
        selector = where.gte('lastTouchTimestampUTC.seconds',
            request.lastFetchTimestampUTC.seconds);
      }
      final list = await collection.find(selector).toList();
      if (list.isEmpty) {
        return ContactsResponse.create();
      }

      final contacts = <ContactPb>[];
      for (final e in list) {
        final contactMongo = ContactMongo.create()
          ..mergeFromProto3Json(e, ignoreUnknownFields: true);

        contacts.add(contactMongo.contact);
      }

      final contactsBis = ContactsResponse();
      contactsBis.contacts
        ..clear()
        ..addAll(contacts);
      return contactsBis;
    } on GrpcError catch (e) {
      print('readAll contacts error $e');
      rethrow;
    }
  }

  @override
  Future<ContactPb> readOne(
      ServiceCall? call, FindContactRequest request) async {
    _db.isConnected ? null : await _db.open();
    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.isChainAccessible(request.contactChainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.contactChainId}');
    }

    if (userPermission.contactRights.rights.any((e) => e == Right.read) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to read contact');
    }
    try {
      final selector = where
          .eq('chainId', request.contactChainId)
          .eq('contactId', request.contactId);
      // TOBE completed with firstname, lastname and all that jazz
      final contact = await collection.findOne(selector);
      if (contact != null) {
        final contactMongo = ContactMongo.create()
          ..mergeFromProto3Json(contact, ignoreUnknownFields: true);
        return contactMongo.contact;
      } else {
        return ContactPb.getDefault();
      }
    } on GrpcError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<StatusResponse> createMany(
      ServiceCall call, ContactsRequest request) async {
    _db.isConnected ? null : await _db.open();

    final userPermission = isTest
        ? userPermissionIfTest ?? UserPermissions()
        : call.bearer.userPermission;
    if (userPermission.isChainAccessible(request.chainId) == false) {
      throw GrpcError.permissionDenied(
          'user cannot access data from chain ${request.chainId}');
    }
    if (userPermission.contactRights.rights.any((e) => e == Right.create) ==
        false) {
      throw GrpcError.permissionDenied(
          'user does not have right to create articles');
    }
    final nowProto = DateTime.now().toUtc().timestampProto;
    final contactsMap = <Map<String, dynamic>>[];
    for (final contactPb in request.contacts) {
      final contactMongo = ContactMongo.create()
        ..contact = contactPb
        ..creationDate = contactPb.creationDate
        ..contactId = contactPb.id
        ..chainId = request.chainId
        ..firmId = userPermission.firmId
        ..userId = userPermission.userId
        ..lastTouchTimestampUTC = nowProto;

      contactsMap.add(contactMongo.toProto3Json() as Map<String, dynamic>);
    }

    try {
      final result = await collection.insertMany(contactsMap);
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
          ..timestamp = DateTime.now().timestampProto;
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
      // the whole stacktrace is heavy
      print(stacktrace);
      throw GrpcError.unknown('$e');
    }
  }
}
