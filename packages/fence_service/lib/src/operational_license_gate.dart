import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_dart.dart';
import 'package:fence_service/protos_weebi.dart';

import 'jwt.dart';
import 'license_seat_entitlement.dart';

// Keep in sync with [FenceService.firmCollectionName] (avoid importing the main library here).
const String _firmCollectionName = 'firm';

/// Substring in [GrpcError.message] for clients (e.g. webapp) to detect license gating.
/// Treat as a stable API: changing this string is a breaking change for those clients.
const String kOperationalLicenseRequired = 'OPERATIONAL_LICENSE_REQUIRED';

/// Loads [Firm.licenses] from Mongo (no firm creator field; creator is [UserPermissions.isFirmCreator] on the user/JWT).
Future<List<License>> loadFirmLicenses(Db db, String firmId) async {
  if (firmId.trim().isEmpty) return [];
  final firmCollection = db.collection(_firmCollectionName);
  final firmDoc = await firmCollection.findOne(where.eq('firmId', firmId));
  if (firmDoc == null) return [];
  final licensesJson = firmDoc['licenses'] as List? ?? [];
  return [
    for (final l in licensesJson)
      (License()
        ..mergeFromProto3Json(
          Map<String, dynamic>.from(l as Map),
          ignoreUnknownFields: true,
        )),
  ];
}

/// Throws [GrpcError.failedPrecondition] if the user may not use ticket/article/contact flows.
///
/// No-op when [UserPermissions.firmId] is empty, or the bearer is a service-account JWT.
/// Firm creator ([UserPermissions.isFirmCreator]) skips the DB seat read.
void assertUserHasOperationalLicense({
  required UserPermissions userPermissions,
  required String authorizationHeader,
  required List<License> licenses,
}) {
  if (userPermissions.firmId.isEmpty) return;

  var token = authorizationHeader.trim();
  if (token.startsWith('Bearer ')) {
    token = token.substring(7).trim();
  }
  if (token.isNotEmpty) {
    try {
      if (JsonWebToken.parse(token).isServiceAccount) return;
    } on FormatException {
      // Still enforce normal license path if token shape is wrong.
    }
  }

  if (userPermissions.userId.trim().isEmpty) {
    throw GrpcError.failedPrecondition(
      '$kOperationalLicenseRequired: userId missing',
    );
  }

  if (userPermissions.isFirmCreator) return;

  if (LicenseSeatEntitlement.userHasActiveLicensedSeat(
    userPermissions.userId,
    licenses,
  )) {
    return;
  }

  throw GrpcError.failedPrecondition(
    '$kOperationalLicenseRequired: assign an active license seat or sign in as the firm creator',
  );
}

/// Loads firm licenses then [assertUserHasOperationalLicense].
Future<void> assertUserHasOperationalLicenseWithDb(
  Db db, {
  required UserPermissions userPermissions,
  required String authorizationHeader,
}) async {
  final licenses = await loadFirmLicenses(db, userPermissions.firmId);
  assertUserHasOperationalLicense(
    userPermissions: userPermissions,
    authorizationHeader: authorizationHeader,
    licenses: licenses,
  );
}
