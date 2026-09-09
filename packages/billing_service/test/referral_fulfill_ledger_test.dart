import 'dart:convert';

import 'package:billing_service/billing_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  late MongoDbPoolService poolService;
  late String firmId;
  const referrerFirmId = 'referrer-fulfill-001';
  final nowIso = DateTime.now().toUtc().toIso8601String();

  setUpAll(() async {
    poolService = TestHelper.poolForDatabase('billing_referral_fulfill_test');
    await poolService.initialize();

    final db = await poolService.acquire();
    await db.collection(FenceService.firmCollectionName).drop();
    await db.createCollection(FenceService.firmCollectionName);
    await db.collection(FenceService.userCollectionName).drop();
    await db.createCollection(FenceService.userCollectionName);
    await db.collection(FenceService.boutiqueCollectionName).drop();
    await db.createCollection(FenceService.boutiqueCollectionName);
    await db.collection(BillingService.billingProductsCollectionName).drop();
    await db.createCollection(BillingService.billingProductsCollectionName);

    firmId = Dummy.firm.firmId;
    await db.collection(FenceService.firmCollectionName).insertOne({
      'firmId': firmId,
      'name': 'Buyer firm',
      'licenses': <Map<String, dynamic>>[],
      'status': true,
      'referralCode': firmId,
      'referralCreditBalanceCents': 0,
    });
    await db.collection(FenceService.firmCollectionName).insertOne({
      'firmId': referrerFirmId,
      'name': 'Referrer firm',
      'licenses': <Map<String, dynamic>>[],
      'status': true,
      'referralCode': referrerFirmId,
      'referralCreditBalanceCents': 0,
    });
    await db.collection(FenceService.userCollectionName).insertOne({
      'userId': Dummy.adminPermission.userId,
      'mail': 'buyer@weebi.test',
      'firmId': firmId,
    });
    await db.collection(FenceService.boutiqueCollectionName).insertOne({
      'chainId': Dummy.chain.chainId,
      'firmId': firmId,
      'name': 'Test chain',
      'boutiques': [
        {
          'boutiqueId': Dummy.boutiqueMongo.boutiqueId,
          'firmId': firmId,
          'chainId': Dummy.chain.chainId,
          'boutique': {
            'boutiqueId': Dummy.boutiqueMongo.boutiqueId,
            'name': 'Dakar shop',
            'addressFull': {
              'city': 'Dakar',
              'country': {'code2Letters': 'SN'},
            },
          },
        },
      ],
    });
    await db.collection(BillingService.billingProductsCollectionName).insertOne({
      'productId': 'premium',
      'licensePlan': 2,
      'maxUsers': 1,
      'amountCents': 1400,
      'currency': 'eur',
      'stripeProductId': 'prod_premium',
      'stripePriceId': 'price_premium',
      'pawapayProductId': '',
      'pawapayAmounts': defaultPawapayAmountsForProduct('premium'),
      'creationDateUTC': nowIso,
      'updateDateUTC': nowIso,
      'isDeleted': false,
    });
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.drop();
  });

  Future<int> referrerBalance() async {
    final db = await poolService.acquire();
    final doc = await db
        .collection(FenceService.firmCollectionName)
        .findOne(where.eq('firmId', referrerFirmId));
    poolService.release(db);
    return (doc?['referralCreditBalanceCents'] as num?)?.toInt() ?? 0;
  }

  test('fulfillFromStripeCheckoutSession credits referrer once', () async {
    const sessionId = 'cs_test_referral_paid';
    final billing = BillingService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
      stripeSecretKeyIfTest: 'sk_test_fake',
      stripeHttpClient: MockClient((request) async {
        expect(request.method, 'GET');
        return http.Response(
          jsonEncode({
            'id': sessionId,
            'payment_status': 'paid',
            'customer': 'cus_ref',
            'metadata': {
              'firmId': firmId,
              'priceId': 'price_premium',
              'referralCode': referrerFirmId,
              'legalTermsVersionDate': '2026-05-01',
              'productKind': 'license',
            },
            'line_items': {
              'data': [
                {
                  'price': {'id': 'price_adhoc_discounted'},
                }
              ],
            },
          }),
          200,
        );
      }),
    );

    final before = await referrerBalance();

    final resp = await billing.fulfillFromStripeCheckoutSession(
      null,
      FulfillFromStripeCheckoutSessionRequest(
        checkoutSessionId: sessionId,
        legalTermsVersionDate: '2026-05-01',
      ),
    );

    expect(resp.license.referredByFirmId, referrerFirmId);
    expect(await referrerBalance(), before + 280);

    final again = await billing.fulfillFromStripeCheckoutSession(
      null,
      FulfillFromStripeCheckoutSessionRequest(
        checkoutSessionId: sessionId,
        legalTermsVersionDate: '2026-05-01',
      ),
    );
    expect(again.statusResponse.message, contains('already'));
    expect(await referrerBalance(), before + 280);
  });

  test('createPawapayCheckout with referral charges discounted amount', () async {
    final fake = FakePawapayCheckoutClient();
    final billing = BillingService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
      pawapayClient: fake,
    );

    await billing.createPawapayCheckout(
      null,
      CreatePawapayCheckoutRequest(
        productId: 'premium',
        returnUrl: 'https://app.weebi.com/#/billing?success=true',
        legalTermsVersionDate: '2026-05-01',
        referralCode: referrerFirmId,
      ),
    );

    final amount =
        (fake.initiated.first['amounts'] as List).first as PawapayAmount;
    expect(amount.amount, '8910'); // 9900 − 10%
    final meta = flattenPawapayMetadata(fake.initiated.first['metadata']);
    expect(meta['referralCode'], referrerFirmId);
  });

  test('fulfillFromPawapayCheckout credits referrer once', () async {
    final before = await referrerBalance();
    final fake = FakePawapayCheckoutClient(
      fetchStatus: 'COMPLETED',
      fetchMetadata: {
        'firmId': firmId,
        'productId': 'premium',
        'productKind': 'license',
        'referralCode': referrerFirmId,
        'legalTermsVersionDate': '2026-05-01',
      },
    );
    final billing = BillingService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
      pawapayClient: fake,
    );

    const checkoutId = 'pawapay-referral-chk-1';
    final resp = await billing.fulfillFromPawapayCheckout(
      null,
      FulfillFromPawapayCheckoutRequest(
        checkoutId: checkoutId,
        legalTermsVersionDate: '2026-05-01',
      ),
    );
    expect(resp.license.referredByFirmId, referrerFirmId);
    expect(await referrerBalance(), before + 280);

    await billing.fulfillFromPawapayCheckout(
      null,
      FulfillFromPawapayCheckoutRequest(
        checkoutId: checkoutId,
        legalTermsVersionDate: '2026-05-01',
      ),
    );
    expect(await referrerBalance(), before + 280);
  });
}
