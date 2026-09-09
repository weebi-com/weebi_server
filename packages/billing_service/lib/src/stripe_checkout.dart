import 'dart:convert';

import 'package:http/http.dart' as http;

/// Builds the form body for a Stripe Checkout Session (one-time payment).
///
/// When [unitAmountCents] is set, uses ad-hoc [price_data] (discounted charge)
/// instead of the catalog [priceId]. Catalog [priceId] should still be stored in
/// [metadata] so fulfill can look up the billing product.
Map<String, String> buildStripeCheckoutSessionFormBody({
  required String priceId,
  required String successUrl,
  required String cancelUrl,
  required Map<String, String> metadata,
  String? customerId,
  int? unitAmountCents,
  String? currency,
  String? stripeProductId,
  String? productName,
}) {
  final body = <String, String>{
    'mode': 'payment',
    'success_url': successUrl,
    'cancel_url': cancelUrl,
    'line_items[0][quantity]': '1',
    'expand[]': 'line_items.data.price',
  };

  final usePriceData = unitAmountCents != null && unitAmountCents > 0;
  if (usePriceData) {
    final cur = (currency ?? 'eur').trim().toLowerCase();
    body['line_items[0][price_data][currency]'] = cur;
    body['line_items[0][price_data][unit_amount]'] = unitAmountCents.toString();
    final productId = stripeProductId?.trim() ?? '';
    if (productId.isNotEmpty) {
      body['line_items[0][price_data][product]'] = productId;
    } else {
      final name = (productName ?? 'Weebi license').trim();
      body['line_items[0][price_data][product_data][name]'] =
          name.isEmpty ? 'Weebi license' : name;
    }
  } else {
    body['line_items[0][price]'] = priceId;
  }

  if (customerId != null && customerId.isNotEmpty) {
    body['customer'] = customerId;
  }
  for (final e in metadata.entries) {
    if (e.value.isNotEmpty) {
      body['metadata[${e.key}]'] = e.value;
    }
  }
  return body;
}

/// Creates a Stripe Checkout Session for a one-time license purchase.
/// Returns the session URL for redirecting the customer.
///
/// [stripeSecretKey] required.
/// [priceId] must be a valid Stripe price ID from billing_products (catalog).
/// When [unitAmountCents] is provided, charges that amount via price_data.
/// [metadata] will be passed to the session (firmId required for webhook).
/// [customerId] optional - use existing Stripe customer to avoid creating a new one.
Future<String> createStripeCheckoutSession({
  required String stripeSecretKey,
  required String priceId,
  required String successUrl,
  required String cancelUrl,
  required Map<String, String> metadata,
  String? customerId,
  int? unitAmountCents,
  String? currency,
  String? stripeProductId,
  String? productName,
  http.Client? httpClient,
}) async {
  final body = buildStripeCheckoutSessionFormBody(
    priceId: priceId,
    successUrl: successUrl,
    cancelUrl: cancelUrl,
    metadata: metadata,
    customerId: customerId,
    unitAmountCents: unitAmountCents,
    currency: currency,
    stripeProductId: stripeProductId,
    productName: productName,
  );

  final client = httpClient ?? http.Client();
  final shouldClose = httpClient == null;
  try {
    final resp = await client.post(
      Uri.parse('https://api.stripe.com/v1/checkout/sessions'),
      headers: {
        'Authorization': 'Bearer $stripeSecretKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );

    if (resp.statusCode != 200) {
      final err = resp.body;
      throw StripeCheckoutException('Stripe API error: ${resp.statusCode} $err');
    }

    final session = _parseStripeResponse(resp.body);
    final url = session['url'] as String?;
    if (url == null || url.isEmpty) {
      throw StripeCheckoutException('Stripe did not return session URL');
    }
    return url;
  } finally {
    if (shouldClose) client.close();
  }
}

Map<String, dynamic> _parseStripeResponse(String body) {
  final decoded = jsonDecode(body);
  if (decoded is Map<String, dynamic>) {
    return decoded;
  }
  throw StripeCheckoutException(
    'Unexpected Stripe response from Checkout: ${decoded.runtimeType}',
  );
}

/// Fetched Checkout Session fields needed for fulfillment.
class StripeCheckoutSessionInfo {
  const StripeCheckoutSessionInfo({
    required this.id,
    required this.paymentStatus,
    required this.metadata,
    required this.priceId,
    this.customer,
  });
  final String id;
  final String paymentStatus;
  final Map<String, String> metadata;
  final String priceId;
  final String? customer;

  /// Catalog Stripe price id for billing_products lookup.
  /// Prefers metadata `priceId` (set for discounted price_data checkouts).
  String get catalogPriceId {
    final fromMeta = metadata['priceId']?.trim() ?? '';
    if (fromMeta.isNotEmpty) return fromMeta;
    return priceId;
  }
}

/// Fetches a Checkout Session from Stripe (for sync-after-redirect).
Future<StripeCheckoutSessionInfo> fetchStripeCheckoutSession({
  required String sessionId,
  required String stripeSecretKey,
  http.Client? httpClient,
}) async {
  final uri = Uri.parse(
    'https://api.stripe.com/v1/checkout/sessions/$sessionId'
    '?expand[]=line_items.data.price',
  );
  final client = httpClient ?? http.Client();
  final shouldClose = httpClient == null;
  try {
    final resp = await client.get(
      uri,
      headers: {
        'Authorization': 'Bearer $stripeSecretKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    if (resp.statusCode != 200) {
      throw StripeCheckoutException(
        'Stripe API error: ${resp.statusCode} ${resp.body}',
      );
    }
    final session = _parseStripeResponse(resp.body);
    final paymentStatus = session['payment_status'] as String? ?? '';
    final metadataMap = session['metadata'] as Map<String, dynamic>? ?? {};
    final metadata = <String, String>{};
    for (final e in metadataMap.entries) {
      if (e.value != null) metadata[e.key.toString()] = e.value.toString();
    }
    String priceId = '';
    final lineItems = session['line_items'] as Map<String, dynamic>?;
    if (lineItems != null) {
      final data = lineItems['data'] as List<dynamic>?;
      if (data != null && data.isNotEmpty) {
        final first = data[0] as Map<String, dynamic>?;
        final price = first?['price'] as Map<String, dynamic>?;
        if (price != null) priceId = price['id'] as String? ?? '';
      }
    }
    final customer = session['customer'] as String?;
    return StripeCheckoutSessionInfo(
      id: session['id'] as String? ?? '',
      paymentStatus: paymentStatus,
      metadata: metadata,
      priceId: priceId,
      customer: customer != null && customer.isNotEmpty ? customer : null,
    );
  } finally {
    if (shouldClose) client.close();
  }
}

class StripeCheckoutException implements Exception {
  final String message;
  StripeCheckoutException(this.message);
  @override
  String toString() => message;
}
