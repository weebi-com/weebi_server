import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/fence_service.dart';
import 'package:test/test.dart';

import 'package:billing_service/billing_service.dart';
import 'package:billing_service/src/accounting_year_purchase.dart';

void main() {
  late MongoDbPoolService poolService;
  late BillingService billingService;
  late String firmId;
  late BillingProduct syscohadaProduct;

  setUpAll(() async {
    poolService = TestHelper.poolForDatabase('billing_syscohada_test');
    await poolService.initialize();

    billingService = BillingService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );

    final db = await poolService.acquire();
    await db.collection(FenceService.firmCollectionName).drop();
    await db.createCollection(FenceService.firmCollectionName);
    await db.collection(BillingService.billingProductsCollectionName).drop();
    await db.createCollection(BillingService.billingProductsCollectionName);

    final nowIso = DateTime.now().toUtc().toIso8601String();
    await db.collection(BillingService.billingProductsCollectionName).insertOne({
      'productId': kSyscohadaProductId,
      'licensePlan': 0,
      'maxUsers': 0,
      'amountCents': 290,
      'currency': 'eur',
      'stripeProductId': 'prod_UxO7tdSJilGiSc',
      'stripePriceId': 'price_1TxTLTLa4MuMWlqCWS8DcHus',
      'pawapayProductId': '',
      'creationDateUTC': nowIso,
      'updateDateUTC': nowIso,
      'isDeleted': false,
    });

    final firm = Firm(
      firmId: Dummy.firm.firmId,
      name: Dummy.firm.name,
      status: true,
      creationDateUTC: DateTime.now().toUtc().timestampProto,
      licenses: [],
    );
    await db
        .collection(FenceService.firmCollectionName)
        .insertOne(firm.toProto3Json() as Map<String, dynamic>);
    firmId = Dummy.firm.firmId;
    poolService.release(db);

    syscohadaProduct = BillingProduct()
      ..productId = kSyscohadaProductId
      ..licensePlan = LicensePlan.LICENSE_PLAN_UNKNOWN
      ..maxUsers = 0
      ..amountCents = 290
      ..currency = 'eur'
      ..stripeProductId = 'prod_UxO7tdSJilGiSc'
      ..stripePriceId = 'price_1TxTLTLa4MuMWlqCWS8DcHus'
      ..pawapayProductId = ''
      ..isDeleted = false;
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(FenceService.firmCollectionName).drop();
    await db.collection(BillingService.billingProductsCollectionName).drop();
    poolService.release(db);
  });

  group('recordAccountingYearPurchase', () {
    test('stores a punctual year purchase without creating a license seat', () async {
      final response = await billingService.recordAccountingYearPurchase(
        firmId: firmId,
        fiscalYear: 2025,
        stripeCheckoutSessionId: 'cs_test_2025',
        product: syscohadaProduct,
      );

      expect(response.statusResponse.type, StatusResponse_Type.CREATED);
      expect(response.license.licenseId, isEmpty);

      final db = await poolService.acquire();
      final firmDoc = await db
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', firmId));
      poolService.release(db);

      final purchases =
          parseAccountingYearPurchases(firmDoc![kAccountingYearPurchasesField]);
      expect(purchases, hasLength(1));
      expect(purchases.first['year'], 2025);
      expect(purchases.first['stripeCheckoutSessionId'], 'cs_test_2025');

      final licenses = firmDoc['licenses'] as List? ?? [];
      expect(licenses, isEmpty);
    });

    test('is idempotent for the same session and does not add a second row', () async {
      final again = await billingService.recordAccountingYearPurchase(
        firmId: firmId,
        fiscalYear: 2025,
        stripeCheckoutSessionId: 'cs_test_2025',
        product: syscohadaProduct,
      );

      expect(again.statusResponse.type, StatusResponse_Type.SUCCESS);

      final db = await poolService.acquire();
      final firmDoc = await db
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', firmId));
      poolService.release(db);

      final purchases =
          parseAccountingYearPurchases(firmDoc![kAccountingYearPurchasesField]);
      expect(purchases, hasLength(1));
    });

    test('allows buying another year later (still not a subscription)', () async {
      final response = await billingService.recordAccountingYearPurchase(
        firmId: firmId,
        fiscalYear: 2026,
        stripeCheckoutSessionId: 'cs_test_2026',
        product: syscohadaProduct,
      );

      expect(response.statusResponse.type, StatusResponse_Type.CREATED);

      final db = await poolService.acquire();
      final firmDoc = await db
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', firmId));
      poolService.release(db);

      final years = parseAccountingYearPurchases(firmDoc![kAccountingYearPurchasesField])
          .map((e) => (e['year'] as num).toInt())
          .toList();
      expect(years, containsAll([2025, 2026]));
    });
  });

  group('listAccountingYearPurchases', () {
    test('returns purchased years for the firm', () async {
      final purchases =
          await billingService.listAccountingYearPurchases(firmId);

      expect(purchases.map((p) => p['year']), containsAll([2025, 2026]));
    });
  });
}
