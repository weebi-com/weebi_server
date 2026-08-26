import 'package:fence_service/protos_weebi.dart';

import 'license_seat_entitlement.dart';

/// Whether the proto already carries [UserPermissions.isFirmCreator].
///
/// Prefer [userHasFirmCreatorOperationalAccess] on the operational path so a
/// JWT claim still counts if proto3 JSON merge dropped the field.
bool firmCreatorOperationalJoker(UserPermissions userPermissions) =>
    userPermissions.isFirmCreator;

/// Firm-creator claim on a JWT payload (root, snake_case, or nested
/// `permissions`). Independent of license seats.
bool jwtPayloadSaysFirmCreator(Map<String, dynamic>? payload) {
  if (payload == null) return false;
  bool isTrue(dynamic v) => v == true;
  if (isTrue(payload['isFirmCreator']) || isTrue(payload['is_firm_creator'])) {
    return true;
  }
  final nested = payload['permissions'];
  if (nested is Map) {
    return isTrue(nested['isFirmCreator']) || isTrue(nested['is_firm_creator']);
  }
  return false;
}

/// Operational sync access as **firm creator** — not a license.
///
/// Proto flag **or** raw JWT claim. Seat-gated product features must still
/// use [userHasActiveLicensedSeat] (no creator exemption).
bool userHasFirmCreatorOperationalAccess({
  required UserPermissions userPermissions,
  Map<String, dynamic>? jwtPayload,
}) =>
    userPermissions.isFirmCreator || jwtPayloadSaysFirmCreator(jwtPayload);

/// Active seat on a valid firm license — for subscription-backed features.
///
/// Mirrors [LicenseSeatEntitlement.userHasActiveLicensedSeat] with a name that
/// contrasts with [userHasFirmCreatorOperationalAccess].
bool userHasActiveLicensedSeat(
  String userId,
  Iterable<License> licenses, {
  DateTime? now,
}) =>
    LicenseSeatEntitlement.userHasActiveLicensedSeat(
      userId,
      licenses,
      now: now,
    );
