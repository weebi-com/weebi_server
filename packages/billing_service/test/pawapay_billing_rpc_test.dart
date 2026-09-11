import 'package:billing_service/billing_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/grpc.dart';
import 'package:test/test.dart';

void main() {
  late MongoDbPoolService poolService;
  late BillingService billingService;
  late FakePawapayCheckoutClient fakePawapay;

  final nowIso = DateTime.now().toUtc().toIso8601String();

  setUpAll(() async {
    poolService = TestHelper.poolForDatabase('billing_pawapay_rpc_test');
    await poolService.initialize();

    final db = await poolService.acquire();
    await db.collection(FenceService.firmCollectionName).drop();
    await db.createCollection(FenceService.firmCollectionName);
    await db.collection(FenceService.userCollectionName).drop();
    await db.createCollection(FenceService.userCollectionName);
    await db.collection(BillingService.billingProductsCollectionName).drop();
    await db.createCollection(BillingService.billingProductsCollectionName);

    await db.collection(FenceService.firmCollectionName).insertOne({
      'firmId': Dummy.firm.firmId,
      'name': 'Test firm',
      'licenses': <Map<String, dynamic>>[],
      'status': true,
    });
    await db.collection(FenceService.boutiqueCollectionName).drop();
    await db.createCollection(FenceService.boutiqueCollectionName);
    await db.collection(FenceService.boutiqueCollectionName).insertOne({
      'chainId': Dummy.chain.chainId,
      'firmId': Dummy.firm.firmId,
      'name': 'Test chain',
      'boutiques': [
        {
          'boutiqueId': Dummy.boutiqueMongo.boutiqueId,
          'firmId': Dummy.firm.firmId,
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
    await db.collection(FenceService.userCollectionName).insertOne({
      'userId': Dummy.adminPermission.userId,
      'mail': 'owner@weebi.test',
      'firmId': Dummy.firm.firmId,
    });
    await db.collection(BillingService.billingProductsCollectionName).insertMany([
      {
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
      },
      {
        'productId': 'syscohada',
        'licensePlan': 0,
        'maxUsers': 0,
        'amountCents': 290,
        'currency': 'eur',
        'stripeProductId': 'prod_syscohada',
        'stripePriceId': 'price_syscohada',
        'pawapayProductId': '',
        'pawapayAmounts': defaultPawapayAmountsForProduct('syscohada'),
        'creationDateUTC': nowIso,
        'updateDateUTC': nowIso,
        'isDeleted': false,
      },
    ]);
  });

  setUp(() {
    fakePawapay = FakePawapayCheckoutClient();
    billingService = BillingService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
      pawapayClient: fakePawapay,
    );
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.drop();
  });

  test('createPawapayCheckout uses fake client and returns redirectUrl', () async {
    final resp = await billingService.createPawapayCheckout(
      null,
      CreatePawapayCheckoutRequest(
        productId: 'premium',
        returnUrl: 'https://app.weebi.com/#/billing?success=true',
        legalTermsVersionDate: '2026-05-01',
      ),
    );
    expect(resp.redirectUrl, isNotEmpty);
    expect(resp.checkoutId, isNotEmpty);
    expect(fakePawapay.initiated, hasLength(1));
    final initiated = fakePawapay.initiated.first;
    expect(initiated['countries'], ['SEN']);
    final amounts = initiated['amounts'] as List;
    expect(amounts, hasLength(1));
    final amount = amounts.first as PawapayAmount;
    expect(amount.country, 'SEN');
    expect(amount.currency, 'XOF');
    final meta = initiated['metadata'] as List;
    final flat = flattenPawapayMetadata(meta);
    expect(flat['firmId'], Dummy.firm.firmId);
    expect(flat['productId'], 'premium');
    expect(flat['purchaserEmail'], 'owner@weebi.test');
    expect(flat['countryAlpha2'], 'SN');
  });

  test('createPawapayCheckout DRC boutique charges premium in CDF', () async {
    final db = await poolService.acquire();
    await _setDummyBoutiqueCountry(db, 'CD');
    poolService.release(db);
    try {
      fakePawapay = FakePawapayCheckoutClient();
      billingService = BillingService(
        poolService,
        isTest: true,
        userPermissionIfTest: Dummy.adminPermission,
        pawapayClient: fakePawapay,
      );

      await billingService.createPawapayCheckout(
        null,
        CreatePawapayCheckoutRequest(
          productId: 'premium',
          returnUrl: 'https://app.weebi.com/#/billing?success=true',
          legalTermsVersionDate: '2026-05-01',
        ),
      );

      final amount =
          (fakePawapay.initiated.first['amounts'] as List).first as PawapayAmount;
      expect(amount.country, 'COD');
      expect(amount.currency, 'CDF');
      expect(amount.amount, '39900');
      final flat = flattenPawapayMetadata(fakePawapay.initiated.first['metadata']);
      expect(flat['countryAlpha2'], 'CD');
    } finally {
      final restore = await poolService.acquire();
      await _setDummyBoutiqueCountry(restore, 'SN');
      poolService.release(restore);
    }
  });

  test('createPawapayCheckout infers DRC from boutique CDF currency', () async {
    final db = await poolService.acquire();
    await _setDummyBoutiqueCountry(db, null, currency: 'CDF');
    poolService.release(db);
    try {
      fakePawapay = FakePawapayCheckoutClient();
      billingService = BillingService(
        poolService,
        isTest: true,
        userPermissionIfTest: Dummy.adminPermission,
        pawapayClient: fakePawapay,
      );

      await billingService.createPawapayCheckout(
        null,
        CreatePawapayCheckoutRequest(
          productId: 'syscohada',
          returnUrl: 'https://app.weebi.com/#/billing?success=true',
          legalTermsVersionDate: '2026-05-01',
          fiscalYear: 2025,
        ),
      );

      final amount =
          (fakePawapay.initiated.first['amounts'] as List).first as PawapayAmount;
      expect(amount.country, 'COD');
      expect(amount.currency, 'CDF');
      expect(amount.amount, '7900');
    } finally {
      final restore = await poolService.acquire();
      await _setDummyBoutiqueCountry(restore, 'SN', currency: '');
      poolService.release(restore);
    }
  });

  test('fulfillFromPawapayCheckout creates PREMIUM licence idempotently', () async {
    final checkoutId = generateUuidV4();
    fakePawapay.fetchStatus = 'COMPLETED';
    fakePawapay.fetchMetadata = {
      'firmId': Dummy.firm.firmId,
      'productId': 'premium',
      'productKind': 'license',
    };

    final sync = await billingService.fulfillFromPawapayCheckout(
      null,
      FulfillFromPawapayCheckoutRequest(
        checkoutId: checkoutId,
        legalTermsVersionDate: '2026-05-01',
      ),
    );
    expect(sync.license.licenseId, startsWith('lic_pawapay_'));
    expect(sync.license.paymentProvider, PaymentProvider.PAYMENT_PROVIDER_PAWAPAY);
    expect(sync.license.licensePlan, LicensePlan.PREMIUM);

    final again = await billingService.fulfillFromPawapayCheckout(
      null,
      FulfillFromPawapayCheckoutRequest(
        checkoutId: checkoutId,
        legalTermsVersionDate: '2026-05-01',
      ),
    );
    expect(again.statusResponse.type, StatusResponse_Type.SUCCESS);
    expect(again.license.licenseId, sync.license.licenseId);
  });

  test('fulfillFromPawapayCheckout rejects non-COMPLETED', () async {
    fakePawapay.fetchStatus = 'FAILED';
    fakePawapay.fetchMetadata = {
      'firmId': Dummy.firm.firmId,
      'productId': 'premium',
    };
    expect(
      () => billingService.fulfillFromPawapayCheckout(
        null,
        FulfillFromPawapayCheckoutRequest(
          checkoutId: generateUuidV4(),
          legalTermsVersionDate: '2026-05-01',
        ),
      ),
      throwsA(
        isA<GrpcError>().having((e) => e.code, 'code', StatusCode.failedPrecondition),
      ),
    );
  });

  test('fulfillFromPawapayCheckout SYSCOHADA records year purchase', () async {
    final checkoutId = generateUuidV4();
    fakePawapay.fetchStatus = 'COMPLETED';
    fakePawapay.fetchMetadata = {
      'firmId': Dummy.firm.firmId,
      'productId': 'syscohada',
      'productKind': 'syscohada',
      'fiscalYear': '2025',
    };

    final resp = await billingService.fulfillFromPawapayCheckout(
      null,
      FulfillFromPawapayCheckoutRequest(
        checkoutId: checkoutId,
        legalTermsVersionDate: '2026-05-01',
      ),
    );
    expect(resp.statusResponse.type, StatusResponse_Type.CREATED);

    final list = await billingService.listAccountingYearPurchases(Dummy.firm.firmId);
    expect(list.any((e) => e['pawapayCheckoutId'] == checkoutId), isTrue);
    expect(list.any((e) => (e['year'] as num?)?.toInt() == 2025), isTrue);
  });
}

Future<void> _setDummyBoutiqueCountry(
  Db db,
  String? code2Letters, {
  String? currency,
}) async {
  final col = db.collection(FenceService.boutiqueCollectionName);
  final doc = await col.findOne(where.eq('firmId', Dummy.firm.firmId));
  expect(doc, isNotNull);
  final boutiques = (doc!['boutiques'] as List)
      .map((e) => Map<String, dynamic>.from(e as Map))
      .toList();
  expect(boutiques, isNotEmpty);
  final wrapper = Map<String, dynamic>.from(boutiques.first);
  final boutique = Map<String, dynamic>.from(wrapper['boutique'] as Map);
  if (code2Letters == null) {
    boutique.remove('addressFull');
  } else {
    boutique['addressFull'] = {
      'city': code2Letters == 'CD' ? 'Kinshasa' : 'Dakar',
      'country': {'code2Letters': code2Letters},
    };
  }
  if (currency != null) {
    if (currency.isEmpty) {
      boutique.remove('currency');
    } else {
      boutique['currency'] = currency;
    }
  }
  wrapper['boutique'] = boutique;
  boutiques[0] = wrapper;
  await col.updateOne(
    where.eq('firmId', Dummy.firm.firmId),
    ModifierBuilder().set('boutiques', boutiques),
  );
}
