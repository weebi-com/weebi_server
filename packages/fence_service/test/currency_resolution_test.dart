import 'package:fence_service/fence_service.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';

void main() {
  group('CurrencyResolution.normalizeOr', () {
    test('normalizes to uppercase 3-letter ISO', () {
      expect(CurrencyResolution.normalizeOr('xof', 'EUR'), 'XOF');
      expect(CurrencyResolution.normalizeOr('Usd', 'EUR'), 'USD');
    });

    test('falls back when invalid or empty', () {
      expect(CurrencyResolution.normalizeOr('', 'EUR'), 'EUR');
      expect(CurrencyResolution.normalizeOr('  ', 'EUR'), 'EUR');
      expect(CurrencyResolution.normalizeOr('USDE', 'EUR'), 'EUR');
      expect(CurrencyResolution.normalizeOr('U1D', 'EUR'), 'EUR');
    });
  });

  group('CurrencyResolution.effectiveForBoutique', () {
    const platformDefault = 'EUR';

    test('uses boutique currency when set', () {
      final boutique = BoutiquePb.create()..currency = 'xof';
      final chain = Chain.create()..currency = 'USD';
      final firm = Firm.create()..defaultCurrency = 'EUR';

      final res = CurrencyResolution.effectiveForBoutique(
        boutique: boutique,
        chain: chain,
        firm: firm,
        platformDefault: platformDefault,
      );

      expect(res, 'XOF');
    });

    test('falls back to chain currency', () {
      final boutique = BoutiquePb.create(); // no currency
      final chain = Chain.create()..currency = 'USD';
      final firm = Firm.create()..defaultCurrency = 'EUR';

      final res = CurrencyResolution.effectiveForBoutique(
        boutique: boutique,
        chain: chain,
        firm: firm,
        platformDefault: platformDefault,
      );

      expect(res, 'USD');
    });

    test('falls back to firm default currency', () {
      final boutique = BoutiquePb.create();
      final chain = Chain.create();
      final firm = Firm.create()..defaultCurrency = 'cdf';

      final res = CurrencyResolution.effectiveForBoutique(
        boutique: boutique,
        chain: chain,
        firm: firm,
        platformDefault: platformDefault,
      );

      expect(res, 'CDF');
    });

    test('falls back to platform default when all empty', () {
      final boutique = BoutiquePb.create();
      final chain = Chain.create();
      final firm = Firm.create();

      final res = CurrencyResolution.effectiveForBoutique(
        boutique: boutique,
        chain: chain,
        firm: firm,
        platformDefault: platformDefault,
      );

      expect(res, 'EUR');
    });
  });
}

