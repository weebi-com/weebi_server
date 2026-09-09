/// Default PawaPay list prices used to seed [billing_products.pawapayAmounts].
///
/// Checkout must read amounts from Mongo; this table is only for migration/seed tools
/// and as a documented catalog snapshot (XOF/XAF share the same FCFA marketing price).
library;

/// productId → ISO 4217 → minor units (same integers sent to PawaPay `amounts[].amount`).
const Map<String, Map<String, int>> kDefaultPawapayAmountsByProduct = {
  'premium': {
    'XOF': 9900,
    'XAF': 9900,
    'CDF': 39900,
  },
  'syscohada': {
    'XOF': 1900,
    'XAF': 1900,
    'CDF': 7900,
  },
};

/// Returns a mutable copy of default amounts for [productId], or empty map.
Map<String, int> defaultPawapayAmountsForProduct(String productId) {
  final defaults =
      kDefaultPawapayAmountsByProduct[productId.trim().toLowerCase()];
  if (defaults == null) return {};
  return Map<String, int>.from(defaults);
}
