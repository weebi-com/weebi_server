/// Pure helpers for App -> Web magic-link bridge (premium + syscohada).
library;

const kWebBridgePremiumProductId = 'premium';
const kWebBridgeSyscohadaProductId = 'syscohada';
const kWebBridgeTokenTtl = Duration(minutes: 3);
const kWebBridgeTokensCollection = 'web_bridge_tokens';

const kWebBridgeAllowedProductIds = {
  kWebBridgePremiumProductId,
  kWebBridgeSyscohadaProductId,
};

class WebBridgeProductError implements Exception {
  WebBridgeProductError(this.message);
  final String message;

  @override
  String toString() => message;
}

/// Normalized product id after validation.
class WebBridgeProduct {
  const WebBridgeProduct({
    required this.productId,
    this.fiscalYear,
  });

  final String productId;
  final int? fiscalYear;

  bool get isSyscohada => productId == kWebBridgeSyscohadaProductId;
}

/// Validates [productId] / [fiscalYear] for createWebBridgeLink.
WebBridgeProduct validateWebBridgeProduct({
  required String productId,
  required int fiscalYear,
}) {
  final pid = productId.trim().toLowerCase();
  if (!kWebBridgeAllowedProductIds.contains(pid)) {
    throw WebBridgeProductError(
      'unsupported productId: $productId (allowed: premium, syscohada)',
    );
  }
  if (pid == kWebBridgeSyscohadaProductId) {
    if (fiscalYear < 2000 || fiscalYear > 2100) {
      throw WebBridgeProductError(
        'fiscalYear is required for syscohada and must be between 2000 and 2100',
      );
    }
    return WebBridgeProduct(productId: pid, fiscalYear: fiscalYear);
  }
  return WebBridgeProduct(productId: pid);
}

/// Builds the SPA hash URL opened in the system browser.
String buildWebBridgeUrl({
  required String webappBaseUrl,
  required String token,
  required WebBridgeProduct product,
}) {
  final base = webappBaseUrl.trim().replaceAll(RegExp(r'/+$'), '');
  if (base.isEmpty) {
    throw WebBridgeProductError('WEBAPP_BASE_URL is not configured');
  }
  final params = <String, String>{
    't': token,
    'product': product.productId,
  };
  if (product.fiscalYear != null) {
    params['year'] = product.fiscalYear.toString();
  }
  final query = params.entries
      .map((e) =>
          '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
      .join('&');
  return '$base/#/bridge?$query';
}
