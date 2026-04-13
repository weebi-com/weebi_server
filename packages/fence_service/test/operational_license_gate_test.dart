/// Pure unit tests (in-memory licenses, JWT shape). Mongo integration for
/// `loadFirmLicenses` / `assertUserHasOperationalLicenseWithDb`: see
/// `operational_license_gate_mongo_test.dart`.
import 'dart:convert';

import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';

/// Unsigned JWT sufficient for [JsonWebToken.parse] (payload read only; no verify in gate).
String _unsignedJwt(Map<String, dynamic> payload) {
  final h = base64Url
      .encode(utf8.encode(jsonEncode({'alg': 'none', 'typ': 'JWT'})))
      .replaceAll('=', '');
  final p =
      base64Url.encode(utf8.encode(jsonEncode(payload))).replaceAll('=', '');
  return '$h.$p.x';
}

void main() {
  group('LicenseSeatEntitlement.isLicenseCurrentlyValid', () {
    final past = DateTime.utc(2020, 1, 1);
    final now = DateTime.utc(2025, 6, 15);
    final futureStart = DateTime.utc(2026, 1, 1);

    test('false when validFrom is missing', () {
      final lic = License(
        licenseId: 'l',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'p',
        providerPriceId: 'pr',
        maxUsers: 1,
      );
      expect(LicenseSeatEntitlement.isLicenseCurrentlyValid(lic, now: now), isFalse);
    });

    test('false when validFrom is in the future', () {
      final lic = License(
        licenseId: 'l',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'p',
        providerPriceId: 'pr',
        maxUsers: 1,
        validFrom: futureStart.timestampProto,
      );
      expect(LicenseSeatEntitlement.isLicenseCurrentlyValid(lic, now: now), isFalse);
    });

    test('true for lifetime license (validFrom only, no validUntil)', () {
      final lic = License(
        licenseId: 'l',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'p',
        providerPriceId: 'pr',
        maxUsers: 1,
        validFrom: past.timestampProto,
      );
      expect(LicenseSeatEntitlement.isLicenseCurrentlyValid(lic, now: now), isTrue);
    });

    test('false when validUntil is before now', () {
      final lic = License(
        licenseId: 'l',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'p',
        providerPriceId: 'pr',
        maxUsers: 1,
        validFrom: past.timestampProto,
        validUntil: DateTime.utc(2025, 1, 1).timestampProto,
      );
      expect(LicenseSeatEntitlement.isLicenseCurrentlyValid(lic, now: now), isFalse);
    });
  });

  group('LicenseSeatEntitlement.userHasActiveLicensedSeat', () {
    final past = DateTime.utc(2020, 1, 1);
    final now = DateTime.utc(2025, 6, 15);
    final futureStart = DateTime.utc(2026, 1, 1);

    License validLicenseWithSeat(String userId) => License(
          licenseId: 'l1',
          licensePlan: LicensePlan.SOLO,
          providerProductId: 'p',
          providerPriceId: 'pr',
          maxUsers: 1,
          validFrom: past.timestampProto,
          seats: [
            LicenseSeat(userId: userId, firmId: 'f'),
          ],
        );

    test('empty userId denied', () {
      expect(
        LicenseSeatEntitlement.userHasActiveLicensedSeat('', [validLicenseWithSeat('u')],
            now: now),
        isFalse,
      );
    });

    test('trimmed userId matches seat', () {
      expect(
        LicenseSeatEntitlement.userHasActiveLicensedSeat(
          '  u2 ',
          [validLicenseWithSeat('u2')],
          now: now,
        ),
        isTrue,
      );
    });

    test('wrong user denied when license is otherwise valid', () {
      expect(
        LicenseSeatEntitlement.userHasActiveLicensedSeat(
          'other',
          [validLicenseWithSeat('u2')],
          now: now,
        ),
        isFalse,
      );
    });

    test('empty licenses denied', () {
      expect(
        LicenseSeatEntitlement.userHasActiveLicensedSeat('u2', [], now: now),
        isFalse,
      );
    });

    test('user with active seat allowed', () {
      expect(
        LicenseSeatEntitlement.userHasActiveLicensedSeat(
          'u2',
          [validLicenseWithSeat('u2')],
          now: now,
        ),
        isTrue,
      );
    });

    test('seat validFrom in future denies access', () {
      final lic = License(
        licenseId: 'l1',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'p',
        providerPriceId: 'pr',
        maxUsers: 1,
        validFrom: past.timestampProto,
        seats: [
          LicenseSeat(
            userId: 'u2',
            firmId: 'f',
            validFrom: futureStart.timestampProto,
          ),
        ],
      );
      expect(
        LicenseSeatEntitlement.userHasActiveLicensedSeat('u2', [lic], now: now),
        isFalse,
      );
    });

    test('expired license (validUntil) denied even with matching seat', () {
      final lic = License(
        licenseId: 'l1',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'p',
        providerPriceId: 'pr',
        maxUsers: 1,
        validFrom: past.timestampProto,
        validUntil: DateTime.utc(2025, 1, 1).timestampProto,
        seats: [
          LicenseSeat(userId: 'u2', firmId: 'f'),
        ],
      );
      expect(
        LicenseSeatEntitlement.userHasActiveLicensedSeat(
          'u2',
          [lic],
          now: now,
        ),
        isFalse,
      );
    });
  });

  group('LicenseSeatEntitlement.effectiveMaxUsers / hasValidLicense', () {
    final past = DateTime.utc(2020, 1, 1);
    final now = DateTime.utc(2025, 6, 15);

    License lic(String id, int max, {DateTime? until}) {
      return License(
        licenseId: id,
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'p',
        providerPriceId: 'pr',
        maxUsers: max,
        validFrom: past.timestampProto,
        validUntil: until?.timestampProto,
      );
    }

    test('effectiveMaxUsers sums only currently valid licenses', () {
      expect(
        LicenseSeatEntitlement.effectiveMaxUsers(
          [
            lic('a', 2),
            lic('b', 0),
            lic(
              'c',
              10,
              until: DateTime.utc(2024, 1, 1),
            ),
          ],
          now: now,
        ),
        2,
      );
    });

    test('hasValidLicense mirrors positive effectiveMaxUsers', () {
      expect(
        LicenseSeatEntitlement.hasValidLicense([lic('a', 1)], now: now),
        isTrue,
      );
      expect(
        LicenseSeatEntitlement.hasValidLicense([lic('a', 0)], now: now),
        isFalse,
      );
    });

    test('effectiveMaxUsersWithFallback uses subscription seats when no license capacity',
        () {
      expect(
        LicenseSeatEntitlement.effectiveMaxUsersWithFallback([], 3, now: now),
        3,
      );
      expect(
        LicenseSeatEntitlement.effectiveMaxUsersWithFallback(
          [lic('a', 2)],
          99,
          now: now,
        ),
        2,
      );
    });
  });

  group('assertUserHasOperationalLicense', () {
    setUp(() {
      AppEnvironment.debugLicenseCheckEnforcedOverride = true;
    });

    tearDown(() {
      AppEnvironment.debugLicenseCheckEnforcedOverride = null;
    });

    final past = DateTime.utc(2020, 1, 1);

    License licenseWithSeat(String userId) => License(
          licenseId: 'l1',
          licensePlan: LicensePlan.SOLO,
          providerProductId: 'p',
          providerPriceId: 'pr',
          maxUsers: 1,
          validFrom: past.timestampProto,
          seats: [LicenseSeat(userId: userId, firmId: 'f')],
        );

    test('no-op when firmId empty (pre-firm user flows)', () {
      expect(
        () => assertUserHasOperationalLicense(
          userPermissions: UserPermissions.create()..userId = 'u',
          authorizationHeader: '',
          licenses: [],
        ),
        returnsNormally,
      );
    });

    test('no-op when license check not enforced (grace period)', () {
      AppEnvironment.debugLicenseCheckEnforcedOverride = false;
      expect(
        () => assertUserHasOperationalLicense(
          userPermissions: UserPermissions.create()
            ..firmId = 'f'
            ..userId = '',
          authorizationHeader: '',
          licenses: [],
        ),
        returnsNormally,
      );
    });

    test('failedPrecondition when userId empty but firmId set', () {
      expect(
        () => assertUserHasOperationalLicense(
          userPermissions: UserPermissions.create()..firmId = 'f',
          authorizationHeader: '',
          licenses: [],
        ),
        throwsA(
          isA<GrpcError>()
              .having((e) => e.code, 'code', 9)
              .having(
                (e) => e.message ?? '',
                'message',
                contains(kOperationalLicenseRequired),
              ),
        ),
      );
    });

    test('allows firm creator without seat', () {
      assertUserHasOperationalLicense(
        userPermissions: UserPermissions.create()
          ..firmId = 'f'
          ..userId = 'u1'
          ..isFirmCreator = true,
        authorizationHeader: '',
        licenses: [],
      );
    });

    test('allows non-creator with active seat', () {
      assertUserHasOperationalLicense(
        userPermissions: UserPermissions.create()
          ..firmId = 'f'
          ..userId = 'u2',
        authorizationHeader: '',
        licenses: [licenseWithSeat('u2')],
      );
    });

    test('fails when not creator and no seat', () {
      expect(
        () => assertUserHasOperationalLicense(
          userPermissions: UserPermissions.create()
            ..firmId = 'f'
            ..userId = 'u2',
          authorizationHeader: '',
          licenses: [],
        ),
        throwsA(
          isA<GrpcError>().having((e) => e.code, 'code', 9),
        ),
      );
    });

    test('error message includes stable client token', () {
      try {
        assertUserHasOperationalLicense(
          userPermissions: UserPermissions.create()
            ..firmId = 'f'
            ..userId = 'u2',
          authorizationHeader: '',
          licenses: [],
        );
        fail('expected throw');
      } on GrpcError catch (e) {
        expect(e.message, contains(kOperationalLicenseRequired));
      }
    });

    test('Bearer prefix is stripped when detecting service account', () {
      final saToken = _unsignedJwt({
        'firmId': '',
        'tags': ['service_account'],
      });
      expect(
        () => assertUserHasOperationalLicense(
          userPermissions: UserPermissions.create()
            ..firmId = 'f'
            ..userId = 'u2',
          authorizationHeader: 'Bearer $saToken',
          licenses: [],
        ),
        returnsNormally,
      );
    });

    test('malformed JWT in header still enforces license (FormatException path)', () {
      expect(
        () => assertUserHasOperationalLicense(
          userPermissions: UserPermissions.create()
            ..firmId = 'f'
            ..userId = 'u2',
          authorizationHeader: 'not-a-jwt',
          licenses: [],
        ),
        throwsA(isA<GrpcError>()),
      );
    });
  });

  group('entitlement_helpers', () {
    test('firmCreatorOperationalJoker mirrors isFirmCreator', () {
      expect(
        firmCreatorOperationalJoker(
          UserPermissions.create()..isFirmCreator = true,
        ),
        isTrue,
      );
      expect(
        firmCreatorOperationalJoker(UserPermissions.create()),
        isFalse,
      );
    });
  });
}
