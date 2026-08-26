import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_dart.dart';
import 'package:fence_service/protos_weebi.dart';

import 'constants/app_environment.dart';
import 'jwt.dart';
import 'entitlement_helpers.dart';

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
/// Two **independent** predicates (firm creator is not a license):
/// 1. Firm creator — [userHasFirmCreatorOperationalAccess] (proto and/or JWT claim).
///    Allows this sync path only. Does not grant seat-gated product features.
/// 2. Else an [userHasActiveLicensedSeat] on [licenses].
///
/// Subscription-backed features (e.g. portal ticket store filter/group, business
/// rules) must use [userHasActiveLicensedSeat] with **no** creator exemption.
///
/// No-op when [UserPermissions.firmId] is empty, or the bearer is a service-account JWT.
///
/// No-op when [AppEnvironment.isLicenseCheckEnforced] is `false` (grace-period deploy).
void assertUserHasOperationalLicense({
  required UserPermissions userPermissions,
  required String authorizationHeader,
  required List<License> licenses,
}) {
  if (!AppEnvironment.isLicenseCheckEnforced) return;

  if (userPermissions.firmId.isEmpty) return;

  Map<String, dynamic>? jwtPayload;
  final rawToken = JsonWebToken.rawToken(authorizationHeader);
  if (rawToken.isNotEmpty) {
    try {
      final jwt = JsonWebToken.parse(rawToken);
      jwtPayload = jwt.payload;
      if (jwt.isServiceAccount) return;
    } on FormatException {
      // Still enforce the two predicates if token shape is wrong.
    }
  }

  if (userPermissions.userId.trim().isEmpty) {
    throw GrpcError.failedPrecondition(
      '$kOperationalLicenseRequired: userId missing',
    );
  }

  // 1. Creator — do not consult seats.
  if (userHasFirmCreatorOperationalAccess(
    userPermissions: userPermissions,
    jwtPayload: jwtPayload,
  )) {
    return;
  }

  // 2. Non-creator — require a seat.
  if (userHasActiveLicensedSeat(userPermissions.userId, licenses)) {
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
  if (!AppEnvironment.isLicenseCheckEnforced) return;

  final licenses = await loadFirmLicenses(db, userPermissions.firmId);
  assertUserHasOperationalLicense(
    userPermissions: userPermissions,
    authorizationHeader: authorizationHeader,
    licenses: licenses,
  );
}
