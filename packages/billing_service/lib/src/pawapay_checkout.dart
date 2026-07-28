import 'dart:convert';
import 'dart:math';

import 'package:billing_service/src/pawapay_country.dart';
import 'package:http/http.dart' as http;

/// Result of initiating a PawaPay hosted checkout.
class PawapayCheckoutCreated {
  const PawapayCheckoutCreated({
    required this.checkoutId,
    required this.redirectUrl,
  });

  final String checkoutId;
  final String redirectUrl;
}

/// Latest checkout state from PawaPay (status check / sync fulfill).
class PawapayCheckoutInfo {
  const PawapayCheckoutInfo({
    required this.checkoutId,
    required this.status,
    this.metadata = const {},
  });

  final String checkoutId;

  /// e.g. COMPLETED, FAILED, EXPIRED, PROCESSING
  final String status;
  final Map<String, String> metadata;

  bool get isCompleted => status.toUpperCase() == 'COMPLETED';
}

class PawapayAmount {
  const PawapayAmount({
    required this.country,
    required this.currency,
    required this.amount,
  });

  final String country;
  final String currency;
  final String amount;

  Map<String, String> toJson() => {
        'country': country,
        'currency': currency,
        'amount': amount,
      };
}

/// Injectable PawaPay Merchant API surface (mock in tests).
abstract class PawapayCheckoutClient {
  Future<PawapayCheckoutCreated> initiateCheckout({
    required String checkoutId,
    required String returnUrl,
    required List<PawapayAmount> amounts,
    required List<String> countries,
    required List<Map<String, dynamic>> metadata,
    String defaultLanguage = 'fr',
  });

  Future<PawapayCheckoutInfo> fetchCheckout(String checkoutId);
}

class PawapayCheckoutException implements Exception {
  PawapayCheckoutException(this.message);
  final String message;
  @override
  String toString() => 'PawapayCheckoutException: $message';
}

/// HTTP implementation of [PawapayCheckoutClient].
class PawapayHttpCheckoutClient implements PawapayCheckoutClient {
  PawapayHttpCheckoutClient({
    required this.apiBaseUrl,
    required this.apiToken,
    http.Client? httpClient,
  }) : _http = httpClient ?? http.Client();

  final String apiBaseUrl;
  final String apiToken;
  final http.Client _http;

  Uri _uri(String path) {
    final base = apiBaseUrl.endsWith('/')
        ? apiBaseUrl.substring(0, apiBaseUrl.length - 1)
        : apiBaseUrl;
    return Uri.parse('$base$path');
  }

  Map<String, String> get _headers => {
        'Authorization': 'Bearer $apiToken',
        'Content-Type': 'application/json',
      };

  @override
  Future<PawapayCheckoutCreated> initiateCheckout({
    required String checkoutId,
    required String returnUrl,
    required List<PawapayAmount> amounts,
    required List<String> countries,
    required List<Map<String, dynamic>> metadata,
    String defaultLanguage = 'fr',
  }) async {
    final body = <String, dynamic>{
      'checkoutId': checkoutId,
      'returnUrl': returnUrl,
      'defaultLanguage': defaultLanguage,
      'countries': countries,
      'amounts': amounts.map((a) => a.toJson()).toList(),
      'metadata': metadata,
    };

    final resp = await _http.post(
      _uri('/v2/checkouts'),
      headers: _headers,
      body: jsonEncode(body),
    );
    if (resp.statusCode < 200 || resp.statusCode >= 300) {
      throw PawapayCheckoutException(
        'initiate checkout HTTP ${resp.statusCode}: ${resp.body}',
      );
    }
    final map = jsonDecode(resp.body) as Map<String, dynamic>;
    final status = map['status'] as String? ?? '';
    if (status == 'REJECTED') {
      final reason = map['failureReason'] as Map<String, dynamic>?;
      throw PawapayCheckoutException(
        'initiate checkout REJECTED: ${reason?['failureCode']} ${reason?['failureMessage']}',
      );
    }
    if (status != 'ACCEPTED' && status != 'DUPLICATE_IGNORED') {
      throw PawapayCheckoutException('unexpected initiate status: $status');
    }
    final redirect = map['redirectUrl'] as String? ?? '';
    if (redirect.isEmpty && status == 'ACCEPTED') {
      throw PawapayCheckoutException('ACCEPTED without redirectUrl');
    }
    return PawapayCheckoutCreated(
      checkoutId: map['checkoutId'] as String? ?? checkoutId,
      redirectUrl: redirect,
    );
  }

  @override
  Future<PawapayCheckoutInfo> fetchCheckout(String checkoutId) async {
    final resp = await _http.get(
      _uri('/v2/checkouts/$checkoutId'),
      headers: _headers,
    );
    if (resp.statusCode < 200 || resp.statusCode >= 300) {
      throw PawapayCheckoutException(
        'fetch checkout HTTP ${resp.statusCode}: ${resp.body}',
      );
    }
    final map = jsonDecode(resp.body) as Map<String, dynamic>;
    return PawapayCheckoutInfo(
      checkoutId: map['checkoutId'] as String? ?? checkoutId,
      status: map['status'] as String? ?? '',
      metadata: flattenPawapayMetadata(map['metadata']),
    );
  }
}

/// Fake client for RPC TDD (no network).
class FakePawapayCheckoutClient implements PawapayCheckoutClient {
  FakePawapayCheckoutClient({
    this.redirectUrl = 'https://pay.sandbox.pawapay.io/checkout/test',
    this.fetchStatus = 'COMPLETED',
    this.fetchMetadata = const {},
  });

  String redirectUrl;
  String fetchStatus;
  Map<String, String> fetchMetadata;

  final List<Map<String, dynamic>> initiated = [];

  @override
  Future<PawapayCheckoutCreated> initiateCheckout({
    required String checkoutId,
    required String returnUrl,
    required List<PawapayAmount> amounts,
    required List<String> countries,
    required List<Map<String, dynamic>> metadata,
    String defaultLanguage = 'fr',
  }) async {
    initiated.add({
      'checkoutId': checkoutId,
      'returnUrl': returnUrl,
      'amounts': amounts,
      'countries': countries,
      'metadata': metadata,
      'defaultLanguage': defaultLanguage,
    });
    return PawapayCheckoutCreated(
      checkoutId: checkoutId,
      redirectUrl: redirectUrl,
    );
  }

  @override
  Future<PawapayCheckoutInfo> fetchCheckout(String checkoutId) async {
    return PawapayCheckoutInfo(
      checkoutId: checkoutId,
      status: fetchStatus,
      metadata: fetchMetadata,
    );
  }
}

/// Flatten PawaPay metadata (array of objects or flat map) to string map.
Map<String, String> flattenPawapayMetadata(dynamic raw) {
  final out = <String, String>{};
  if (raw is List) {
    for (final item in raw) {
      if (item is! Map) continue;
      for (final e in item.entries) {
        if (e.key == 'isPII') continue;
        out[e.key.toString()] = e.value?.toString().trim() ?? '';
      }
    }
  } else if (raw is Map) {
    for (final e in raw.entries) {
      if (e.key == 'isPII') continue;
      out[e.key.toString()] = e.value?.toString().trim() ?? '';
    }
  }
  return out;
}

String generateUuidV4() {
  final r = Random.secure();
  final bytes = List<int>.generate(16, (_) => r.nextInt(256));
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;
  String hex(int b) => b.toRadixString(16).padLeft(2, '0');
  final h = bytes.map(hex).join();
  return '${h.substring(0, 8)}-${h.substring(8, 12)}-${h.substring(12, 16)}-'
      '${h.substring(16, 20)}-${h.substring(20)}';
}

/// Marketing FCFA list prices (same numeric for XOF / XAF in v1).
int pawapayXofAmountForProduct(String productId) {
  final id = productId.trim().toLowerCase();
  if (id == 'syscohada') return 1900;
  if (id == 'premium') return 19000;
  // Fallback: refuse silent wrong prices — caller should map known SKUs.
  throw ArgumentError.value(productId, 'productId', 'no XOF list price configured');
}

/// Builds a single-country PawaPay `amounts` entry from Weebi alpha-2 (or alpha-3).
///
/// Throws [ArgumentError] when the country cannot be mapped, currency is missing,
/// or v1 pricing does not support that currency (non-FCFA).
PawapayAmount buildPawapayAmountForCountry({
  required String productId,
  required String countryAlpha2Or3,
}) {
  final iso3 = iso2ToIso3Africa(countryAlpha2Or3);
  if (iso3 == null) {
    throw ArgumentError.value(
      countryAlpha2Or3,
      'country',
      'unsupported country for PawaPay (need African ISO alpha-2)',
    );
  }
  final currency = pawapayCurrencyForCountryIso3(iso3);
  if (currency == null) {
    throw ArgumentError.value(
      iso3,
      'country',
      'no PawaPay currency mapping for country',
    );
  }
  if (!kPawapayFcfaCurrencies.contains(currency)) {
    throw ArgumentError.value(
      iso3,
      'country',
      'PawaPay v1 licence checkout only supports XOF/XAF (got $currency)',
    );
  }
  final amount = pawapayXofAmountForProduct(productId).toString();
  return PawapayAmount(country: iso3, currency: currency, amount: amount);
}

/// @Deprecated Use [buildPawapayAmountForCountry] with a single resolved country.
List<PawapayAmount> buildPawapayXofAmounts(String productId) {
  return [
    buildPawapayAmountForCountry(productId: productId, countryAlpha2Or3: 'SN'),
  ];
}

List<Map<String, dynamic>> buildPawapayMetadata(Map<String, String> fields) {
  return [
    for (final e in fields.entries)
      if (e.value.trim().isNotEmpty)
        {
          e.key: e.value.trim(),
          if (e.key == 'purchaserEmail') 'isPII': true,
        },
  ];
}

/// Appends [checkoutId] to [returnUrl], including hash-route query (`#/billing?...`).
String appendCheckoutIdToReturnUrl(String returnUrl, String checkoutId) {
  if (returnUrl.contains('checkout_id=')) return returnUrl;
  final encoded = Uri.encodeQueryComponent(checkoutId);
  final hashIdx = returnUrl.indexOf('#');
  if (hashIdx >= 0) {
    final before = returnUrl.substring(0, hashIdx);
    final fragment = returnUrl.substring(hashIdx + 1);
    final sep = fragment.contains('?') ? '&' : '?';
    return '$before#$fragment${sep}checkout_id=$encoded';
  }
  final sep = returnUrl.contains('?') ? '&' : '?';
  return '$returnUrl${sep}checkout_id=$encoded';
}
