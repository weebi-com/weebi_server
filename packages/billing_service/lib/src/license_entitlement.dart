import 'package:fence_service/protos_weebi.dart';

/// Computes effective entitlement from firm.licenses.
/// Use this instead of deprecated subscriptionPlan/subscriptionSeats.
class LicenseEntitlement {
  static DateTime _toDateTime(dynamic t) {
    final s = t.seconds.toInt();
    final n = t.nanos;
    final ms = s * 1000 + (n / 1000000).floor();
    return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true);
  }

  /// Sum of maxUsers from all currently valid licenses.
  /// Valid = validFrom <= now and (validUntil absent or validUntil > now).
  static int effectiveMaxUsers(Iterable<License> licenses) {
    final now = DateTime.now().toUtc();
    var total = 0;
    for (final l in licenses) {
      if (!l.hasValidFrom()) continue;
      final from = _toDateTime(l.validFrom);
      if (from.isAfter(now)) continue;
      if (l.hasValidUntil()) {
        final until = _toDateTime(l.validUntil);
        if (until.isBefore(now)) continue;
      }
      total += l.maxUsers;
    }
    return total;
  }

  /// Whether the firm has at least one valid license.
  static bool hasValidLicense(Iterable<License> licenses) {
    return effectiveMaxUsers(licenses) > 0;
  }

  /// For backward compatibility: if licenses are empty but firm has
  /// subscriptionSeats (deprecated), return that. Otherwise use licenses.
  static int effectiveMaxUsersWithFallback(
    Iterable<License> licenses,
    int deprecatedSubscriptionSeats,
  ) {
    final fromLicenses = effectiveMaxUsers(licenses);
    if (fromLicenses > 0) return fromLicenses;
    return deprecatedSubscriptionSeats > 0 ? deprecatedSubscriptionSeats : 0;
  }
}
