/// Seeds `pawapayAmounts` on active billing_products rows (Mongo only, no Stripe).
///
/// Run from packages/billing_service:
///   dart run tool/seed_pawapay_amounts.dart
///   dart run tool/seed_pawapay_amounts.dart "mongodb+srv://..."
///
/// Env: MONGO_DB_URI
library;

import 'dart:io';

import 'package:fence_service/mongo_dart.dart';

import 'package:billing_service/billing_service.dart';

void main(List<String> args) async {
  final mongoUri =
      args.isNotEmpty ? args.first : Platform.environment['MONGO_DB_URI'];
  if (mongoUri == null || mongoUri.isEmpty) {
    print('ERROR: Set MONGO_DB_URI');
    exit(1);
  }

  final db = await Db.create(mongoUri);
  await db.open();
  print('Connected to MongoDB');

  final collection =
      db.collection(BillingService.billingProductsCollectionName);
  final nowIso = DateTime.now().toUtc().toIso8601String();

  var updated = 0;
  var skipped = 0;
  for (final entry in kDefaultPawapayAmountsByProduct.entries) {
    final productId = entry.key;
    final amounts = entry.value;
    final result = await collection.updateOne(
      where.eq('productId', productId).eq('isDeleted', false),
      ModifierBuilder()
          .set('pawapayAmounts', amounts)
          .set('updateDateUTC', nowIso),
    );
    if (result.nMatched == 0) {
      print('$productId: no active billing_products row — skip');
      skipped++;
      continue;
    }
    print('$productId: set pawapayAmounts=$amounts (nModified=${result.nModified})');
    updated++;
  }

  await db.close();
  print('Done. updated=$updated skipped=$skipped');
  exit(0);
}
