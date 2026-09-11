/// Referral pricing helpers (buyer discount + referrer commission).
///
/// Buyer discount is applied at payment time (Stripe/Pawapay charge).
/// Referrer commission is credited after paid fulfill, on catalog list price.
library;

/// Percent off catalog price for the buyer when a valid referral code is used.
const int kReferralBuyerDiscountPercent = 10;

/// Percent of catalog list price credited to the referrer after paid fulfill.
const int kReferralCommissionPercent = 20;

/// Minimum payout threshold in EUR cents (€15).
const int kReferralMinPayoutCents = 1500;

/// Buyer discount in cents: [kReferralBuyerDiscountPercent]% of [catalogAmountCents].
int buyerDiscountCents(int catalogAmountCents) {
  if (catalogAmountCents <= 0) return 0;
  return (catalogAmountCents * kReferralBuyerDiscountPercent / 100).round();
}

/// Amount the buyer pays after referral discount.
int buyerChargeCents(int catalogAmountCents) {
  final discount = buyerDiscountCents(catalogAmountCents);
  final charge = catalogAmountCents - discount;
  return charge < 0 ? 0 : charge;
}

/// Referrer commission in cents: [kReferralCommissionPercent]% of catalog list price
/// (not of the discounted charge).
int referrerCommissionCents(int catalogAmountCents) {
  if (catalogAmountCents <= 0) return 0;
  return (catalogAmountCents * kReferralCommissionPercent / 100).round();
}

/// Stacked checkout amounts in catalog (EUR) cents.
///
/// Order: 10% referral discount on list, then Weebi credit on the remainder.
class CheckoutPricing {
  const CheckoutPricing({
    required this.catalogCents,
    required this.afterReferralCents,
    required this.creditAppliedCents,
    required this.chargeCents,
  });

  final int catalogCents;
  final int afterReferralCents;
  final int creditAppliedCents;
  final int chargeCents;
}

/// Caps requested credit at available balance and at the post-referral remainder.
CheckoutPricing checkoutPricing({
  required int catalogCents,
  required bool applyReferralDiscount,
  required int requestedCreditCents,
  required int availableCreditCents,
}) {
  final catalog = catalogCents < 0 ? 0 : catalogCents;
  final afterReferral =
      applyReferralDiscount ? buyerChargeCents(catalog) : catalog;
  final requested = requestedCreditCents < 0 ? 0 : requestedCreditCents;
  final available = availableCreditCents < 0 ? 0 : availableCreditCents;
  var credit = requested < available ? requested : available;
  if (credit > afterReferral) credit = afterReferral;
  return CheckoutPricing(
    catalogCents: catalog,
    afterReferralCents: afterReferral,
    creditAppliedCents: credit,
    chargeCents: afterReferral - credit,
  );
}

/// Maps EUR-cent credit onto a PawaPay list amount (XOF/XAF/CDF).
int creditToLocalListUnits({
  required int creditEurCents,
  required int catalogEurCents,
  required int localCatalog,
}) {
  if (creditEurCents <= 0 || catalogEurCents <= 0 || localCatalog <= 0) {
    return 0;
  }
  return (creditEurCents * localCatalog / catalogEurCents).round();
}

/// PawaPay / local charge after referral and EUR-cent credit.
int localChargeAfterCredit({
  required int localCatalog,
  required int catalogEurCents,
  required bool applyReferralDiscount,
  required int creditEurCents,
}) {
  final afterReferral =
      applyReferralDiscount ? buyerChargeCents(localCatalog) : localCatalog;
  final creditLocal = creditToLocalListUnits(
    creditEurCents: creditEurCents,
    catalogEurCents: catalogEurCents,
    localCatalog: localCatalog,
  );
  final charge = afterReferral - creditLocal;
  return charge < 0 ? 0 : charge;
}
