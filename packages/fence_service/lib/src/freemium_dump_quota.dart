import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_dart.dart';
import 'package:fence_service/protos_weebi.dart';

import 'constants/app_environment.dart';
import 'entitlement_helpers.dart';
import 'jwt.dart';
import 'operational_license_gate.dart';

/// Stable substring in [GrpcError.message] for clients to detect freemium dump quota.
/// Treat as a stable API: changing this string is a breaking change for clients.
const String kFreemiumFullDumpQuotaExceeded = 'FREEMIUM_FULL_DUMP_QUOTA_EXCEEDED';

const String freemiumFullDumpQuotaCollectionName = 'freemium_full_dump_quota';

/// Collection resource keys for the quota document.
abstract class FreemiumDumpResource {
  static const ticket = 'ticket';
  static const article = 'article';
  static const contact = 'contact';
  static const articlePhoto = 'article_photo';
}

bool _indexEnsured = false;

/// UTC start of the period bucket containing [now].
DateTime freemiumPeriodStartUtc(DateTime now, int periodDays) {
  final utc = now.toUtc();
  final dayEpoch = DateTime.utc(utc.year, utc.month, utc.day);
  final daysSinceEpoch = dayEpoch.difference(DateTime.utc(1970, 1, 1)).inDays;
  final bucket = (daysSinceEpoch ~/ periodDays) * periodDays;
  return DateTime.utc(1970, 1, 1).add(Duration(days: bucket));
}

/// Exclusive end (= next period start) for [periodStart] and [periodDays].
DateTime freemiumPeriodRetryAfterUtc(DateTime periodStart, int periodDays) =>
    periodStart.add(Duration(days: periodDays));

/// Parseable error message contract for clients.
String formatFreemiumFullDumpQuotaExceededMessage({
  required String resource,
  required int periodDays,
  required DateTime retryAfterUtc,
}) {
  final retry = retryAfterUtc.toUtc().toIso8601String();
  // Keep field order stable for clients that split on spaces.
  return '$kFreemiumFullDumpQuotaExceeded '
      'resource=$resource periodDays=$periodDays retryAfterUtc=$retry';
}

/// True when this read is a freemium-metered full dump.
///
/// Tickets / articles / contacts: `limit == 0` and empty [lastFetch].
/// Photos (always paged): empty [lastFetch] and [offset] == 0 (first page only).
bool isFreemiumFullDump({
  required bool lastFetchEmpty,
  required int limit,
  int offset = 0,
  bool alwaysPaged = false,
}) {
  if (!lastFetchEmpty) return false;
  if (alwaysPaged) return offset == 0;
  return limit == 0;
}

Future<void> _ensureQuotaIndex(Db db) async {
  if (_indexEnsured) return;
  final collection = db.collection(freemiumFullDumpQuotaCollectionName);
  await collection.createIndex(
    keys: {'userId': 1, 'resource': 1, 'periodStartUtc': 1},
    name: 'freemium_dump_user_resource_period',
    unique: true,
  );
  _indexEnsured = true;
}

/// Visible for tests — reset the in-process index-ensured flag.
void debugResetFreemiumDumpQuotaIndexFlag() {
  _indexEnsured = false;
}

bool _isDuplicateKeyWrite(WriteResult result) {
  if (!result.hasWriteErrors) return false;
  final code = result.writeError?.code;
  if (code == 11000) return true;
  final msg = result.writeError?.errmsg ?? '';
  return msg.contains('E11000') || msg.toLowerCase().contains('duplicate');
}

/// Consumes one full-dump token for [userId]/[resource] in the current UTC period.
///
/// Throws [GrpcError.resourceExhausted] when the period quota is already used.
Future<void> consumeFreemiumFullDumpQuota(
  Db db, {
  required String userId,
  required String resource,
  DateTime? now,
  int? periodDaysOverride,
}) async {
  final periodDays =
      periodDaysOverride ?? AppEnvironment.freemiumFullDumpPeriodDays;
  final clock = now ?? DateTime.now().toUtc();
  final periodStart = freemiumPeriodStartUtc(clock, periodDays);
  final retryAfter = freemiumPeriodRetryAfterUtc(periodStart, periodDays);
  final periodStartIso = periodStart.toIso8601String();

  await _ensureQuotaIndex(db);
  final collection = db.collection(freemiumFullDumpQuotaCollectionName);

  final result = await collection.insertOne({
    'userId': userId,
    'resource': resource,
    'periodStartUtc': periodStartIso,
    'count': 1,
    'consumedAtUtc': clock.toIso8601String(),
  });

  if (result.success && !result.hasWriteErrors) {
    return;
  }
  if (_isDuplicateKeyWrite(result)) {
    throw GrpcError.resourceExhausted(
      formatFreemiumFullDumpQuotaExceededMessage(
        resource: resource,
        periodDays: periodDays,
        retryAfterUtc: retryAfter,
      ),
    );
  }
  throw GrpcError.unknown(
    'freemium dump quota write failed: ${result.writeError?.errmsg ?? result.toString()}',
  );
}

/// Gate for ticket/article/contact/photo full dumps.
///
/// No-op when freemium throttle is off, caller is a service account, or the
/// user holds an active license seat. Otherwise consumes the period quota.
Future<void> assertFreemiumFullDumpAllowed(
  Db db, {
  required UserPermissions userPermissions,
  required String authorizationHeader,
  required String resource,
  required bool isFullDump,
  DateTime? now,
}) async {
  if (!isFullDump) return;
  if (!AppEnvironment.isFreemiumThrottleEnforced) return;

  final rawToken = JsonWebToken.rawToken(authorizationHeader);
  if (rawToken.isNotEmpty) {
    try {
      final jwt = JsonWebToken.parse(rawToken);
      if (jwt.isServiceAccount) return;
    } on FormatException {
      // Fall through to seat / quota checks.
    }
  }

  final userId = userPermissions.userId.trim();
  if (userId.isEmpty) {
    throw GrpcError.resourceExhausted(
      formatFreemiumFullDumpQuotaExceededMessage(
        resource: resource,
        periodDays: AppEnvironment.freemiumFullDumpPeriodDays,
        retryAfterUtc: freemiumPeriodRetryAfterUtc(
          freemiumPeriodStartUtc(
            now ?? DateTime.now().toUtc(),
            AppEnvironment.freemiumFullDumpPeriodDays,
          ),
          AppEnvironment.freemiumFullDumpPeriodDays,
        ),
      ),
    );
  }

  final licenses = await loadFirmLicenses(db, userPermissions.firmId);
  if (userHasActiveLicensedSeat(userId, licenses, now: now)) {
    return;
  }

  await consumeFreemiumFullDumpQuota(
    db,
    userId: userId,
    resource: resource,
    now: now,
  );
}
