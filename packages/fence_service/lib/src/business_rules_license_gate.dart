import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_dart.dart';
import 'package:fence_service/protos_weebi.dart';

import 'constants/app_environment.dart';
import 'entitlement_helpers.dart';
import 'operational_license_gate.dart';

/// Substring in [GrpcError.message] for clients to detect business-rules gating.
/// Treat as a stable API: changing this string is a breaking change for those clients.
const String kBusinessRulesLicenseRequired = 'BUSINESS_RULES_LICENSE_REQUIRED';

/// Whether [rules] enable licence-gated business-rule features (portal: [SeatCapability]).
bool businessRulesRequireLicensedSeat(BusinessRules rules) =>
    rules.isNegativeStockGuardEnabled || rules.isRecentTicketEditEnabled;

/// Throws [GrpcError.failedPrecondition] when [rules] use licensed features without a seat.
///
/// **No firm-creator joker** — matches portal `businessRulesEditable` / active seat only.
///
/// No-op when [AppEnvironment.isLicenseCheckEnforced] is `false`, or [rules] do not
/// require a seat.
void assertUserMayPersistBusinessRules({
  required UserPermissions userPermissions,
  required List<License> licenses,
  required BusinessRules rules,
}) {
  if (!AppEnvironment.isLicenseCheckEnforced) return;
  if (!businessRulesRequireLicensedSeat(rules)) return;

  if (userPermissions.userId.trim().isEmpty) {
    throw GrpcError.failedPrecondition(
      '$kBusinessRulesLicenseRequired: userId missing',
    );
  }

  if (userHasActiveLicensedSeat(userPermissions.userId, licenses)) {
    return;
  }

  throw GrpcError.failedPrecondition(
    '$kBusinessRulesLicenseRequired: active licence required to enable business rules',
  );
}

/// Loads firm licences then [assertUserMayPersistBusinessRules].
Future<void> assertUserMayPersistBusinessRulesWithDb(
  Db db, {
  required UserPermissions userPermissions,
  required BusinessRules rules,
}) async {
  if (!AppEnvironment.isLicenseCheckEnforced) return;
  if (!businessRulesRequireLicensedSeat(rules)) return;

  final licenses = await loadFirmLicenses(db, userPermissions.firmId);
  assertUserMayPersistBusinessRules(
    userPermissions: userPermissions,
    licenses: licenses,
    rules: rules,
  );
}
