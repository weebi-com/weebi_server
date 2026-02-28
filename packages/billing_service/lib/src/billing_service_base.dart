import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_pool.dart' hide Timestamp;
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/logging.dart';

/// License CRUD on Firm.licenses (embedded). firmId from authenticated user.
class BillingService extends BillingServiceBase {
  final MongoDbPoolService _poolService;
  final WeebiLogger _logger = WeebiLogger.forService('billing_service');

  final bool isTest;
  final UserPermissions? userPermissionIfTest;

  BillingService(
    this._poolService, {
    this.isTest = false,
    this.userPermissionIfTest,
  });

  UserPermissions _userPermissions(ServiceCall? call) =>
      isTest ? (userPermissionIfTest ?? UserPermissions()) : call!.bearer.userPermissions;

  void _requireBillingRight(UserPermissions p, Right right) {
    if (p.billingRights.rights.any((e) => e == right) == false) {
      throw GrpcError.permissionDenied('user does not have billing right: $right');
    }
  }

  void _requireFirmId(UserPermissions p) {
    if (p.firmId.isEmpty) {
      throw GrpcError.failedPrecondition('user has no firm');
    }
  }

  /// Populate firmId on each LicenseSeat for MongoDB queries.
  License _licenseWithSeatFirmIds(License license, String firmId) {
    if (license.seats.isEmpty) return license;
    final copy = License()..mergeFromMessage(license);
    for (var i = 0; i < copy.seats.length; i++) {
      copy.seats[i].firmId = firmId;
    }
    return copy;
  }

  @override
  Future<CreateLicenseResponse> createLicense(
      ServiceCall? call, CreateLicenseRequest request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.create);

    final license = request.license;
    if (license.licenseId.isEmpty) {
      throw GrpcError.invalidArgument('licenseId is required');
    }

    log.logRpcEntry('createLicense', requestData: {
      'firmId': userPermission.firmId,
      'licenseId': license.licenseId,
    });

    return databaseMiddleware<CreateLicenseResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);

      final firmDoc = await firmCollection.findOne(where.eq('firmId', userPermission.firmId));
      if (firmDoc == null) {
        throw GrpcError.notFound('firm not found');
      }

      final licenses = (firmDoc['licenses'] as List?) ?? [];
      if (licenses.any((l) => l['licenseId'] == license.licenseId)) {
        throw GrpcError.alreadyExists('license ${license.licenseId} already exists');
      }

      final licenseWithFirmIds = _licenseWithSeatFirmIds(license, userPermission.firmId);
      final licenseJson = licenseWithFirmIds.toProto3Json() as Map<String, dynamic>;

      final result = await firmCollection.updateOne(
        where.eq('firmId', userPermission.firmId),
        ModifierBuilder().push('licenses', licenseJson),
      );

      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.nModified != 1) {
        throw GrpcError.unknown('update failed: nModified=${result.nModified}');
      }

      log.logRpcExit('createLicense', resultData: {'licenseId': license.licenseId});
      return CreateLicenseResponse()
        ..statusResponse = (StatusResponse()
          ..type = StatusResponse_Type.CREATED
          ..id = license.licenseId
          ..timestamp = DateTime.now().toUtc().timestampProto)
        ..license = licenseWithFirmIds;
    });
  }

  @override
  Future<ReadLicensesResponse> readLicenses(
      ServiceCall? call, Empty request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.read);

    log.logRpcEntry('readLicenses', requestData: {'firmId': userPermission.firmId});

    return databaseMiddleware<ReadLicensesResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);
      final firmDoc = await firmCollection.findOne(where.eq('firmId', userPermission.firmId));
      if (firmDoc == null) {
        throw GrpcError.notFound('firm not found');
      }

      final licensesJson = firmDoc['licenses'] as List? ?? [];
      final licenses = <License>[];
      for (final l in licensesJson) {
        licenses.add(License()..mergeFromProto3Json(l as Map<String, dynamic>, ignoreUnknownFields: true));
      }

      return ReadLicensesResponse()..licenses.addAll(licenses);
    });
  }

  @override
  Future<StatusResponse> updateLicense(
      ServiceCall? call, UpdateLicenseRequest request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.update);

    if (request.licenseId.isEmpty) {
      throw GrpcError.invalidArgument('licenseId is required');
    }
    if (request.license.licenseId != request.licenseId) {
      throw GrpcError.invalidArgument('license.licenseId must match request.licenseId');
    }

    log.logRpcEntry('updateLicense', requestData: {
      'firmId': userPermission.firmId,
      'licenseId': request.licenseId,
    });

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);

      final licenseWithFirmIds = _licenseWithSeatFirmIds(request.license, userPermission.firmId);
      final licenseJson = licenseWithFirmIds.toProto3Json() as Map<String, dynamic>;

      final result = await firmCollection.updateOne(
        where.eq('firmId', userPermission.firmId).eq('licenses.licenseId', request.licenseId),
        ModifierBuilder().set('licenses.\$', licenseJson),
      );

      if (result.nMatched == 0) {
        throw GrpcError.notFound('firm or license ${request.licenseId} not found');
      }

      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.nModified != 1) {
        throw GrpcError.unknown('update failed: nModified=${result.nModified}');
      }

      log.logRpcExit('updateLicense', resultData: {'licenseId': request.licenseId});
      return StatusResponse()
        ..type = StatusResponse_Type.UPDATED
        ..timestamp = DateTime.now().toUtc().timestampProto;
    });
  }

  @override
  Future<StatusResponse> deleteLicense(
      ServiceCall? call, DeleteLicenseRequest request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.delete);

    if (request.licenseId.isEmpty) {
      throw GrpcError.invalidArgument('licenseId is required');
    }

    log.logRpcEntry('deleteLicense', requestData: {
      'firmId': userPermission.firmId,
      'licenseId': request.licenseId,
    });

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);

      final result = await firmCollection.updateOne(
        where.eq('firmId', userPermission.firmId),
        ModifierBuilder().pull('licenses', {'licenseId': request.licenseId}),
      );

      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.nMatched == 0) {
        throw GrpcError.notFound('firm not found');
      }
      if (result.nModified != 1) {
        throw GrpcError.notFound('license ${request.licenseId} not found');
      }

      log.logRpcExit('deleteLicense', resultData: {'licenseId': request.licenseId});
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED
        ..timestamp = DateTime.now().toUtc().timestampProto;
    });
  }

  @override
  Future<StatusResponse> updatePaymentCustomerId(
      ServiceCall? call, UpdatePaymentCustomerIdRequest request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.update);

    if (request.provider.isEmpty) {
      throw GrpcError.invalidArgument('provider is required');
    }
    if (request.paymentCustomerId.isEmpty) {
      throw GrpcError.invalidArgument('paymentCustomerId is required');
    }

    log.logRpcEntry('updatePaymentCustomerId', requestData: {
      'firmId': userPermission.firmId,
      'provider': request.provider,
    });

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);

      final result = await firmCollection.updateOne(
        where.eq('firmId', userPermission.firmId),
        ModifierBuilder().set(
          'providerCustomerIds.${request.provider}',
          request.paymentCustomerId,
        ),
      );

      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.nMatched == 0) {
        throw GrpcError.notFound('firm not found');
      }

      log.logRpcExit('updatePaymentCustomerId');
      return StatusResponse()
        ..type = StatusResponse_Type.UPDATED
        ..timestamp = DateTime.now().toUtc().timestampProto;
    });
  }
}
