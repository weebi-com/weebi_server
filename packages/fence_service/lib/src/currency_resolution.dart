import 'package:protos_weebi/protos_weebi_io.dart';

/// Normalizes user or stored input to ISO 4217 (3 letters) or returns [fallback].
class CurrencyResolution {
  static final RegExp _iso4217 = RegExp(r'^[A-Za-z]{3}$');

  static String normalizeOr(String? raw, String fallback) {
    if (raw == null || raw.trim().isEmpty) return fallback;
    final u = raw.trim().toUpperCase();
    return _iso4217.hasMatch(u) ? u : fallback;
  }

  /// Firm document default, else [platformDefault].
  static String firmDefaultOrPlatform(Firm firm, String platformDefault) {
    if (firm.hasDefaultCurrency() && firm.defaultCurrency.trim().isNotEmpty) {
      return normalizeOr(firm.defaultCurrency, platformDefault);
    }
    return platformDefault;
  }

  /// Effective boutique billing currency: boutique → chain → firm → platform.
  static String effectiveForBoutique({
    required BoutiquePb boutique,
    required Chain chain,
    required Firm firm,
    required String platformDefault,
  }) {
    if (boutique.hasCurrency() && boutique.currency.trim().isNotEmpty) {
      return normalizeOr(boutique.currency, platformDefault);
    }
    if (chain.hasCurrency() && chain.currency.trim().isNotEmpty) {
      return normalizeOr(chain.currency, platformDefault);
    }
    return firmDefaultOrPlatform(firm, platformDefault);
  }
}
