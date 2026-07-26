/// Punctual SYSCOHADA accounting-year purchase helpers.
///
/// Not a subscription: each paid fiscal year is a one-shot entitlement.
/// Paying for 2025 does not grant 2026.
library;

/// Catalog [productId] for the SYSCOHADA closing product.
const kSyscohadaProductId = 'syscohada';

/// Firm Mongo field storing punctual year purchases.
const kAccountingYearPurchasesField = 'accountingYearPurchases';

bool isSyscohadaProductId(String productId) =>
    productId.trim().toLowerCase() == kSyscohadaProductId;

/// Validates a fiscal/calendar year used for a one-shot purchase.
int validateFiscalYear(int year) {
  if (year < 2000 || year > 2100) {
    throw ArgumentError.value(year, 'fiscalYear', 'must be between 2000 and 2100');
  }
  return year;
}

Map<String, dynamic> buildAccountingYearPurchase({
  required int year,
  required DateTime paidAtUTC,
  required int amountCents,
  required String currency,
  String stripeCheckoutSessionId = '',
  String stripePriceId = '',
  String pawapayCheckoutId = '',
  String paymentProvider = '',
}) {
  final map = <String, dynamic>{
    'year': validateFiscalYear(year),
    'paidAtUTC': paidAtUTC.toUtc().toIso8601String(),
    'amountCents': amountCents,
    'currency': currency,
  };
  if (stripeCheckoutSessionId.isNotEmpty) {
    map['stripeCheckoutSessionId'] = stripeCheckoutSessionId;
  }
  if (stripePriceId.isNotEmpty) {
    map['stripePriceId'] = stripePriceId;
  }
  if (pawapayCheckoutId.isNotEmpty) {
    map['pawapayCheckoutId'] = pawapayCheckoutId;
  }
  if (paymentProvider.isNotEmpty) {
    map['paymentProvider'] = paymentProvider;
  }
  return map;
}

class MergeAccountingYearPurchaseResult {
  const MergeAccountingYearPurchaseResult({
    required this.purchases,
    required this.alreadyFulfilled,
  });

  final List<Map<String, dynamic>> purchases;
  final bool alreadyFulfilled;
}

/// Idempotent merge of a punctual year purchase into the firm list.
MergeAccountingYearPurchaseResult mergeAccountingYearPurchase({
  required List<Map<String, dynamic>> existing,
  required Map<String, dynamic> purchase,
}) {
  final sessionId = purchase['stripeCheckoutSessionId'] as String? ?? '';
  final pawapayId = purchase['pawapayCheckoutId'] as String? ?? '';
  final year = (purchase['year'] as num?)?.toInt();

  for (final e in existing) {
    final existingSession = e['stripeCheckoutSessionId'] as String? ?? '';
    if (sessionId.isNotEmpty && existingSession == sessionId) {
      return MergeAccountingYearPurchaseResult(
        purchases: List<Map<String, dynamic>>.from(existing),
        alreadyFulfilled: true,
      );
    }
    final existingPawapay = e['pawapayCheckoutId'] as String? ?? '';
    if (pawapayId.isNotEmpty && existingPawapay == pawapayId) {
      return MergeAccountingYearPurchaseResult(
        purchases: List<Map<String, dynamic>>.from(existing),
        alreadyFulfilled: true,
      );
    }
    final existingYear = (e['year'] as num?)?.toInt();
    if (year != null && existingYear == year) {
      return MergeAccountingYearPurchaseResult(
        purchases: List<Map<String, dynamic>>.from(existing),
        alreadyFulfilled: true,
      );
    }
  }

  return MergeAccountingYearPurchaseResult(
    purchases: [...existing, Map<String, dynamic>.from(purchase)],
    alreadyFulfilled: false,
  );
}

List<Map<String, dynamic>> parseAccountingYearPurchases(dynamic raw) {
  if (raw is! List) return const [];
  return raw
      .whereType<Map>()
      .map((e) => Map<String, dynamic>.from(e))
      .toList();
}
