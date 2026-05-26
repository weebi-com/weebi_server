/// Creates Stripe products and prices for Weebi license plans,
/// and inserts them into the billing_products collection.
///
/// Run: dart run tool/create_stripe_products.dart
/// (from packages/billing_service directory)
///
/// Requires: STRIPE_SECRET_KEY env var
/// Requires: MONGO_DB_URI - soft-deletes legacy catalog rows and inserts new ones
library;

import 'dart:convert';
import 'dart:io';

import 'package:fence_service/mongo_dart.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:http/http.dart' as http;

import 'package:billing_service/billing_service.dart';

/// Retire legacy Stripe rows before re-seeding current catalog (solo, trio, pro).
const _legacyProductIds = ['solo', 'trio', 'pro'];

void main(List<String> args) async {
  final key =
      args.isNotEmpty ? args.first : Platform.environment['STRIPE_SECRET_KEY'];
  if (key == null || key.isEmpty) {
    print('ERROR: Set STRIPE_SECRET_KEY');
    exit(1);
  }

  final mongoUri = args.length > 1
      ? args[1]
      : Platform.environment['MONGO_DB_URI'];
  if (mongoUri == null || mongoUri.isEmpty) {
    print('ERROR: Set MONGO_DB_URI (required to retire legacy products)');
    exit(1);
  }

  final db = await Db.create(mongoUri);
  await db.open();
  print('Connected to MongoDB');

  final collection =
      db.collection(BillingService.billingProductsCollectionName);
  final now = DateTime.now().toUtc();
  final nowIso = now.toIso8601String();

  // Soft-delete legacy catalog entries and archive their Stripe products.
  final legacyDocs = await collection
      .find(where.oneFrom('productId', _legacyProductIds).eq('isDeleted', false))
      .toList();
  if (legacyDocs.isNotEmpty) {
    await collection.updateMany(
      where.oneFrom('productId', _legacyProductIds).eq('isDeleted', false),
      ModifierBuilder()
          .set('isDeleted', true)
          .set('updateDateUTC', nowIso),
    );
    print('Soft-deleted ${legacyDocs.length} legacy billing_products row(s)');
    for (final doc in legacyDocs) {
      final stripeProductId = doc['stripeProductId'] as String?;
      if (stripeProductId != null && stripeProductId.isNotEmpty) {
        await _archiveStripeProduct(key, stripeProductId);
      }
    }
  } else {
    print('No active legacy billing_products to soft-delete');
  }

  // Per-user plans (reuse SOLO/TRIO enums). maxUsers=1 per purchased seat.
  final plans = [
    (
      'Weebi Entreprise',
      'solo',
      LicensePlan.SOLO,
      'Weebi Entreprise — 14 € / user',
      1400,
      1,
    ),
    (
      'Weebi Premium',
      'trio',
      LicensePlan.TRIO,
      'Weebi Premium — 29 € / user',
      2900,
      1,
    ),
  ];

  for (final (name, productId, licensePlan, desc, amountCents, maxUsers)
      in plans) {
    final existing = await collection.findOne(
      where.eq('productId', productId).eq('isDeleted', false),
    );
    if (existing != null) {
      print('$name: active billing_products row already exists (productId=$productId) — skip');
      continue;
    }

    final product = await _createProduct(key, name, desc);
    final price = await _createPrice(key, product['id']!, amountCents);
    print('$name:');
    print('  stripeProductId=${product['id']}');
    print('  stripePriceId=${price['id']}');
    print('  amountCents=$amountCents (${amountCents / 100} € / user)');
    print('');

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
    await collection.insertOne(doc);
    print('  Inserted into billing_products');
  }

  await db.close();
  print('Done. billing_products updated (solo=Entreprise, trio=Premium).');
  exit(0);
}

Future<void> _archiveStripeProduct(String key, String stripeProductId) async {
  final r = await http.post(
    Uri.parse('https://api.stripe.com/v1/products/$stripeProductId'),
    headers: {
      'Authorization': 'Bearer $key',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {'active': 'false'},
  );
  if (r.statusCode == 200) {
    print('  Archived Stripe product $stripeProductId');
  } else {
    print('  WARN: could not archive Stripe product $stripeProductId: ${r.statusCode} ${r.body}');
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
    print('Product create failed: ${r.statusCode} ${r.body}');
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
    print('Price create failed: ${r.statusCode} ${r.body}');
    throw Exception('Price create failed: ${r.statusCode} ${r.body}');
  }
  return _parseStripeResponse(r.body);
}

Map<String, dynamic> _parseStripeResponse(String body) {
  final decoded = jsonDecode(body);
  if (decoded is Map<String, dynamic>) {
    return decoded;
  }
  throw Exception('Unexpected Stripe response format: $decoded');
}
