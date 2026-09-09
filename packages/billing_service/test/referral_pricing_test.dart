import 'package:billing_service/src/referral_pricing.dart';
import 'package:test/test.dart';

void main() {
  group('buyerDiscountCents', () {
    test('10% of 1400 is 140', () {
      expect(buyerDiscountCents(1400), 140);
    });

    test('10% of 2900 is 290', () {
      expect(buyerDiscountCents(2900), 290);
    });

    test('zero catalog yields zero', () {
      expect(buyerDiscountCents(0), 0);
    });

    test('negative catalog yields zero', () {
      expect(buyerDiscountCents(-100), 0);
    });

    test('rounds half up (15 -> 2)', () {
      expect(buyerDiscountCents(15), 2);
    });
  });

  group('buyerChargeCents', () {
    test('1400 catalog -> 1260 charge', () {
      expect(buyerChargeCents(1400), 1260);
    });

    test('never negative', () {
      expect(buyerChargeCents(0), 0);
    });
  });

  group('referrerCommissionCents', () {
    test('20% of 1400 is 280', () {
      expect(referrerCommissionCents(1400), 280);
    });

    test('20% of 2900 is 580', () {
      expect(referrerCommissionCents(2900), 580);
    });

    test('zero catalog yields zero', () {
      expect(referrerCommissionCents(0), 0);
    });

    test('commission uses list price not discounted charge', () {
      final catalog = 1400;
      final charge = buyerChargeCents(catalog);
      expect(charge, 1260);
      expect(referrerCommissionCents(catalog), 280);
      expect(referrerCommissionCents(charge), isNot(280));
    });
  });
}
