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
