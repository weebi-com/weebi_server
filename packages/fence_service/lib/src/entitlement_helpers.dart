import 'package:fence_service/protos_weebi.dart';

import 'license_seat_entitlement.dart';

/// Whether the bearer qualifies for the **firm creator operational joker**:
/// preview sync for ticket / article / contact RPCs without a license seat.
///
/// Use **only** together with [assertUserHasOperationalLicense]-style checks.
/// Seat-gated product features must use [userHasActiveLicensedSeat] instead
/// (no joker).
bool firmCreatorOperationalJoker(UserPermissions userPermissions) =>
    userPermissions.isFirmCreator;

/// Active seat on a valid firm license — for subscription-backed features.
///
/// Mirrors [LicenseSeatEntitlement.userHasActiveLicensedSeat] with a name that
/// contrasts with [firmCreatorOperationalJoker].
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
