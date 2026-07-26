import 'package:test/test.dart';

import 'package:billing_service/src/accounting_year_purchase.dart';

void main() {
  group('isSyscohadaProductId', () {
    test('accepts syscohada case-insensitively', () {
      expect(isSyscohadaProductId('syscohada'), isTrue);
      expect(isSyscohadaProductId('SYSCOHADA'), isTrue);
    });

    test('rejects license products', () {
      expect(isSyscohadaProductId('premium'), isFalse);
      expect(isSyscohadaProductId('entreprise'), isFalse);
      expect(isSyscohadaProductId(''), isFalse);
    });
  });

  group('validateFiscalYear', () {
    test('accepts plausible calendar years', () {
      expect(validateFiscalYear(2024), 2024);
      expect(validateFiscalYear(2025), 2025);
      expect(validateFiscalYear(2100), 2100);
    });

    test('rejects out-of-range years', () {
      expect(() => validateFiscalYear(0), throwsArgumentError);
      expect(() => validateFiscalYear(1999), throwsArgumentError);
      expect(() => validateFiscalYear(2101), throwsArgumentError);
    });
  });

  group('mergeAccountingYearPurchase', () {
    final existing = [
      {
        'year': 2024,
        'stripeCheckoutSessionId': 'cs_old',
        'stripePriceId': 'price_syscohada',
        'paidAtUTC': '2024-01-01T00:00:00.000Z',
        'amountCents': 290,
        'currency': 'eur',
      },
    ];

    test('appends a new year purchase (punctual, not a subscription)', () {
      final purchase = buildAccountingYearPurchase(
        year: 2025,
        stripeCheckoutSessionId: 'cs_new',
        stripePriceId: 'price_syscohada',
        paidAtUTC: DateTime.utc(2025, 3, 1),
        amountCents: 290,
        currency: 'eur',
      );

      final result = mergeAccountingYearPurchase(
        existing: existing,
        purchase: purchase,
      );

      expect(result.alreadyFulfilled, isFalse);
      expect(result.purchases, hasLength(2));
      expect(result.purchases.last['year'], 2025);
      expect(result.purchases.last['stripeCheckoutSessionId'], 'cs_new');
    });

    test('is idempotent for the same checkout session id', () {
      final purchase = buildAccountingYearPurchase(
        year: 2025,
        stripeCheckoutSessionId: 'cs_old',
        stripePriceId: 'price_syscohada',
        paidAtUTC: DateTime.utc(2025, 3, 1),
        amountCents: 290,
        currency: 'eur',
      );

      final result = mergeAccountingYearPurchase(
        existing: existing,
        purchase: purchase,
      );

      expect(result.alreadyFulfilled, isTrue);
      expect(result.purchases, hasLength(1));
    });

    test('is idempotent when the fiscal year was already paid', () {
      final purchase = buildAccountingYearPurchase(
        year: 2024,
        stripeCheckoutSessionId: 'cs_other',
        stripePriceId: 'price_syscohada',
        paidAtUTC: DateTime.utc(2025, 3, 1),
        amountCents: 290,
        currency: 'eur',
      );

      final result = mergeAccountingYearPurchase(
        existing: existing,
        purchase: purchase,
      );

      expect(result.alreadyFulfilled, isTrue);
      expect(result.purchases, hasLength(1));
      expect(result.purchases.first['stripeCheckoutSessionId'], 'cs_old');
    });

    test('does not invent recurrence — buying 2025 does not imply 2026', () {
      final purchase = buildAccountingYearPurchase(
        year: 2025,
        stripeCheckoutSessionId: 'cs_2025',
        stripePriceId: 'price_syscohada',
        paidAtUTC: DateTime.utc(2025, 3, 1),
        amountCents: 290,
        currency: 'eur',
      );

      final result = mergeAccountingYearPurchase(
        existing: const [],
        purchase: purchase,
      );

      expect(result.purchases.map((e) => e['year']), [2025]);
    });
  });
}
