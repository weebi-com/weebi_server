import 'package:fence_service/protos_weebi.dart';

/// License validity and seated users ([Firm.licenses]) for operational access checks.
///
/// [License.validFrom] is always interpreted in UTC. Optional [License.validUntil] and
/// seat-level dates exist in the proto for trials / subscriptions; if you omit them,
/// entitlement behaves as "started at validFrom, no end" (typical lifetime license).
class LicenseSeatEntitlement {
  /// Protobuf [Timestamp] → Dart [DateTime] (UTC). Used for every license/seat date
  /// field, not only expiry—e.g. [License.validFrom] must be compared to [now] even
  /// when [validUntil] is unset.
  static DateTime _toDateTime(dynamic t) {
    final s = t.seconds.toInt();
    final n = t.nanos;
    final ms = s * 1000 + (n / 1000000).floor();
    return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true);
  }

  /// License is active at [now]: validFrom <= now and (no validUntil or validUntil >= now).
  static bool isLicenseCurrentlyValid(License license, {DateTime? now}) {
    final at = now ?? DateTime.now().toUtc();
    if (!license.hasValidFrom()) return false;
    final from = _toDateTime(license.validFrom);
    if (from.isAfter(at)) return false;
    if (license.hasValidUntil()) {
      final until = _toDateTime(license.validUntil);
      if (until.isBefore(at)) return false;
    }
    return true;
  }

  /// Seat may narrow the time window relative to the parent license (optional).
  static bool _isSeatTimeWindowActive(LicenseSeat seat, DateTime at) {
    if (seat.hasValidFrom()) {
      final from = _toDateTime(seat.validFrom);
      if (from.isAfter(at)) return false;
    }
    if (seat.hasValidUntil()) {
      final until = _toDateTime(seat.validUntil);
      if (until.isBefore(at)) return false;
    }
    return true;
  }

  /// Whether [userId] has an active seat on a currently valid license (license + optional seat dates).
  static bool userHasActiveLicensedSeat(
    String userId,
    Iterable<License> licenses, {
    DateTime? now,
  }) {
    final uid = userId.trim();
    if (uid.isEmpty) return false;
    final at = now ?? DateTime.now().toUtc();
    for (final license in licenses) {
      if (!isLicenseCurrentlyValid(license, now: at)) continue;
      for (final seat in license.seats) {
        if (seat.userId.trim() != uid) continue;
        if (!_isSeatTimeWindowActive(seat, at)) continue;
        return true;
      }
    }
    return false;
  }

  /// Sum of maxUsers from all currently valid licenses.
  static int effectiveMaxUsers(Iterable<License> licenses, {DateTime? now}) {
    final at = now ?? DateTime.now().toUtc();
    var total = 0;
    for (final l in licenses) {
      if (!isLicenseCurrentlyValid(l, now: at)) continue;
      total += l.maxUsers;
    }
    return total;
  }

  /// Whether the firm has at least one valid license with positive capacity.
  static bool hasValidLicense(Iterable<License> licenses, {DateTime? now}) {
    return effectiveMaxUsers(licenses, now: now) > 0;
  }

  /// If licenses yield no capacity, fall back to deprecated subscriptionSeats.
  static int effectiveMaxUsersWithFallback(
    Iterable<License> licenses,
    int deprecatedSubscriptionSeats, {
    DateTime? now,
  }) {
    final fromLicenses = effectiveMaxUsers(licenses, now: now);
    if (fromLicenses > 0) return fromLicenses;
    return deprecatedSubscriptionSeats > 0 ? deprecatedSubscriptionSeats : 0;
  }
}
