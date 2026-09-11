import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:test/test.dart';

void main() {
  group('isFreemiumFullDump', () {
    test('ticket/article: limit 0 + empty lastFetch', () {
      expect(
        isFreemiumFullDump(lastFetchEmpty: true, limit: 0),
        isTrue,
      );
      expect(
        isFreemiumFullDump(lastFetchEmpty: false, limit: 0),
        isFalse,
      );
      expect(
        isFreemiumFullDump(lastFetchEmpty: true, limit: 50),
        isFalse,
      );
    });

    test('photos: empty lastFetch + offset 0 only', () {
      expect(
        isFreemiumFullDump(
          lastFetchEmpty: true,
          limit: 100,
          offset: 0,
          alwaysPaged: true,
        ),
        isTrue,
      );
      expect(
        isFreemiumFullDump(
          lastFetchEmpty: true,
          limit: 100,
          offset: 100,
          alwaysPaged: true,
        ),
        isFalse,
      );
    });
  });

  group('period helpers', () {
    test('daily period start is UTC midnight of day', () {
      final now = DateTime.utc(2026, 9, 9, 15, 30);
      final start = freemiumPeriodStartUtc(now, 1);
      expect(start, DateTime.utc(2026, 9, 9));
      expect(freemiumPeriodRetryAfterUtc(start, 1), DateTime.utc(2026, 9, 10));
    });

    test('weekly period buckets by epoch days', () {
      // Pick two mid-bucket days that share the same 7-day period.
      final a = DateTime.utc(2026, 9, 4);
      final b = DateTime.utc(2026, 9, 8);
      final startA = freemiumPeriodStartUtc(a, 7);
      final startB = freemiumPeriodStartUtc(b, 7);
      expect(startA, startB);
      expect(
        freemiumPeriodRetryAfterUtc(startA, 7).difference(startA).inDays,
        7,
      );
    });
  });

  group('formatFreemiumFullDumpQuotaExceededMessage', () {
    test('stable token and fields', () {
      final msg = formatFreemiumFullDumpQuotaExceededMessage(
        resource: FreemiumDumpResource.ticket,
        periodDays: 1,
        retryAfterUtc: DateTime.utc(2026, 9, 10),
      );
      expect(msg.startsWith(kFreemiumFullDumpQuotaExceeded), isTrue);
      expect(msg, contains('resource=ticket'));
      expect(msg, contains('periodDays=1'));
      expect(msg, contains('retryAfterUtc=2026-09-10T00:00:00.000Z'));
    });
  });

  group('AppEnvironment freemium flags', () {
    tearDown(() {
      AppEnvironment.debugFreemiumThrottleOverride = null;
    });

    test('override forces on/off regardless of env', () {
      AppEnvironment.debugFreemiumThrottleOverride = true;
      expect(AppEnvironment.isFreemiumThrottleEnforced, isTrue);
      AppEnvironment.debugFreemiumThrottleOverride = false;
      expect(AppEnvironment.isFreemiumThrottleEnforced, isFalse);
    });
  });

  test('resourceExhausted message is parseable shape', () {
    final msg = formatFreemiumFullDumpQuotaExceededMessage(
      resource: 'contact',
      periodDays: 7,
      retryAfterUtc: DateTime.utc(2026, 9, 16),
    );
    final err = GrpcError.resourceExhausted(msg);
    expect(err.code, StatusCode.resourceExhausted);
    expect(err.message, startsWith(kFreemiumFullDumpQuotaExceeded));
  });
}
