/// Creates Stripe products and prices for Weebi license plans,
/// and inserts them into the billing_products collection.
///
/// Run: dart run tool/create_stripe_products.dart
/// (from packages/billing_service directory)
///
/// Requires: STRIPE_SECRET_KEY env var
/// Optional: MONGO_DB_URI - if set, inserts into billing_products collection
library;

import 'dart:io';

import 'package:fence_service/mongo_dart.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:http/http.dart' as http;

import 'package:billing_service/billing_service.dart';

void main() async {
  final key = Platform.environment['STRIPE_SECRET_KEY'];
  if (key == null || key.isEmpty) {
    print('ERROR: Set STRIPE_SECRET_KEY');
    exit(1);
  }

  final mongoUri = Platform.environment['MONGO_DB_URI'];
  Db? db;
  if (mongoUri != null && mongoUri.isNotEmpty) {
    db = Db(mongoUri);
    await db.open();
    print('Connected to MongoDB');
  } else {
    print('MONGO_DB_URI not set - skipping billing_products insert');
  }

  final plans = [
    ('Solo', 'solo', LicensePlan.SOLO, 'Weebi Solo - 1 user', 1400, 1),
    ('Trio', 'trio', LicensePlan.TRIO, 'Weebi Trio - 3 users', 2900, 3),
    ('Pro', 'pro', LicensePlan.PRO, 'Weebi Pro - 10 users', 7900, 10),
  ];

  for (final (name, productId, licensePlan, desc, amountCents, maxUsers) in plans) {
    final product = await _createProduct(key, name, desc);
    final price = await _createPrice(key, product['id']!, amountCents);
    print('$name:');
    print('  stripeProductId=${product['id']}');
    print('  stripePriceId=${price['id']}');
    print('');

    if (db != null) {
      final now = DateTime.now().toUtc();
      final billingProduct = BillingProduct()
        ..productId = productId
        ..licensePlan = licensePlan
        ..maxUsers = maxUsers
        ..amountCents = amountCents
        ..currency = 'eur'
        ..stripeProductId = product['id']!
        ..stripePriceId = price['id']!
        ..pawapayProductId = ''
        ..creationDateUTC = now.timestampProto
        ..updateDateUTC = now.timestampProto
        ..isDeleted = false;

      final doc = billingProduct.toProto3Json() as Map<String, dynamic>;
      await db.collection(BillingService.billingProductsCollectionName).insertOne(doc);
      print('  Inserted into billing_products');
    }
  }

  if (db != null) {
    await db.close();
    print('Done. billing_products seeded.');
  }
}

Future<Map<String, dynamic>> _createProduct(
  String key,
  String name,
  String description,
) async {
  final r = await http.post(
    Uri.parse('https://api.stripe.com/v1/products'),
    headers: {
      'Authorization': 'Bearer $key',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {'name': name, 'description': description},
  );
  if (r.statusCode != 200) {
    throw Exception('Product create failed: ${r.statusCode} ${r.body}');
  }
  return _parseStripeResponse(r.body);
}

Future<Map<String, dynamic>> _createPrice(
  String key,
  String productId,
  int unitAmountCents,
) async {
  final r = await http.post(
    Uri.parse('https://api.stripe.com/v1/prices'),
    headers: {
      'Authorization': 'Bearer $key',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'product': productId,
      'unit_amount': unitAmountCents.toString(),
      'currency': 'eur',
    },
  );
  if (r.statusCode != 200) {
    throw Exception('Price create failed: ${r.statusCode} ${r.body}');
  }
  return _parseStripeResponse(r.body);
}

Map<String, dynamic> _parseStripeResponse(String body) {
  final out = <String, dynamic>{};
  for (final line in body.split('&')) {
    final parts = line.split('=');
    if (parts.length == 2) {
      out[Uri.decodeComponent(parts[0])] = Uri.decodeComponent(parts[1]);
    }
  }
  return out;
}
