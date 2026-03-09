import 'dart:convert';

import 'package:http/http.dart' as http;

/// Creates a Stripe Checkout Session for a one-time license purchase.
/// Returns the session URL for redirecting the customer.
///
/// [stripeSecretKey] required.
/// [priceId] must be a valid Stripe price ID (e.g. STRIPE_PRICE_SOLO).
/// [metadata] will be passed to the session (firmId required for webhook).
/// [customerId] optional - use existing Stripe customer to avoid creating a new one.
Future<String> createStripeCheckoutSession({
  required String stripeSecretKey,
  required String priceId,
  required String successUrl,
  required String cancelUrl,
  required Map<String, String> metadata,
  String? customerId,
}) async {
  final body = <String, String>{
    'mode': 'payment',
    'success_url': successUrl,
    'cancel_url': cancelUrl,
    'line_items[0][price]': priceId,
    'line_items[0][quantity]': '1',
    // Expand line_items so webhook receives them
    'expand[]': 'line_items.data.price',
  };
  if (customerId != null && customerId.isNotEmpty) {
    body['customer'] = customerId;
  }
  // Otherwise Stripe collects email and creates customer on payment
  for (final e in metadata.entries) {
    if (e.value.isNotEmpty) {
      body['metadata[${e.key}]'] = e.value;
    }
  }

  final resp = await http.post(
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

class StripeCheckoutException implements Exception {
  final String message;
  StripeCheckoutException(this.message);
  @override
  String toString() => message;
}
