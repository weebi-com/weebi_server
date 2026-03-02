import 'package:fence_service/grpc.dart' show GrpcError;
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:test/test.dart';

import 'package:billing_service/billing_service.dart';
import 'package:fence_service/fence_service.dart';

void main() {
  late MongoDbPoolService poolService;
  late BillingService billingService;
  late String firmId;

  setUpAll(() async {
    poolService = TestHelper.poolForDatabase('billing_service_test');
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

    // Seed billing_products for referral commission lookup
    final nowIso = DateTime.now().toUtc().toIso8601String();
    final billingProducts = [
      {'productId': 'solo', 'licensePlan': 1, 'maxUsers': 1, 'amountCents': 1400, 'currency': 'eur', 'stripeProductId': 'prod_solo', 'stripePriceId': 'price_solo', 'pawapayProductId': '', 'creationDateUTC': nowIso, 'updateDateUTC': nowIso, 'isDeleted': false},
      {'productId': 'trio', 'licensePlan': 2, 'maxUsers': 3, 'amountCents': 2900, 'currency': 'eur', 'stripeProductId': 'prod_trio', 'stripePriceId': 'price_trio', 'pawapayProductId': '', 'creationDateUTC': nowIso, 'updateDateUTC': nowIso, 'isDeleted': false},
      {'productId': 'pro', 'licensePlan': 3, 'maxUsers': 10, 'amountCents': 7900, 'currency': 'eur', 'stripeProductId': 'prod_pro', 'stripePriceId': 'price_pro', 'pawapayProductId': '', 'creationDateUTC': nowIso, 'updateDateUTC': nowIso, 'isDeleted': false},
    ];
    await db.collection(BillingService.billingProductsCollectionName).insertMany(billingProducts);

    // Insert firm with empty licenses for clean tests
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
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(FenceService.firmCollectionName).drop();
    await db.collection(BillingService.billingProductsCollectionName).drop();
    poolService.release(db);
  });

  group('createLicense', () {
    test('creates a license and appends to firm.licenses', () async {
      final license = License(
        licenseId: 'license-starter-001',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'prod_starter',
        providerPriceId: 'price_starter',
        maxUsers: 1,
        validFrom: DateTime.now().toUtc().timestampProto,
      );

      final response = await billingService.createLicense(
        null,
        CreateLicenseRequest(license: license),
      );

      expect(response.statusResponse.type, StatusResponse_Type.CREATED);
      expect(response.statusResponse.id, 'license-starter-001');
      expect(response.license.licenseId, 'license-starter-001');
      expect(response.license.licensePlan, LicensePlan.SOLO);
      expect(response.license.maxUsers, 1);
    });

    test('throws alreadyExists when licenseId duplicates', () async {
      final license = License(
        licenseId: 'license-starter-001',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'prod_starter',
        providerPriceId: 'price_starter',
        maxUsers: 1,
        validFrom: Dummy.licenseDummy.validFrom,
      );

      try {
        await billingService.createLicense(
          null,
          CreateLicenseRequest(license: license),
        );
        fail('Expected GrpcError.alreadyExists');
      } on GrpcError catch (e) {
        expect(e.code, 6); // ALREADY_EXISTS
      }
    });

    test('throws invalidArgument when licenseId is empty', () async {
      final license = License(
        licenseId: '',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'prod_starter',
        providerPriceId: 'price_starter',
        maxUsers: 1,
      );

      try {
        await billingService.createLicense(
          null,
          CreateLicenseRequest(license: license),
        );
        fail('Expected GrpcError.invalidArgument');
      } on GrpcError catch (e) {
        expect(e.code, 3); // INVALID_ARGUMENT
      }
    });
  });

  group('readLicenses', () {
    test('returns all licenses for the firm', () async {
      final response = await billingService.readLicenses(null, Empty());

      expect(response.licenses.length, 1);
      expect(response.licenses.first.licenseId, 'license-starter-001');
      expect(response.licenses.first.licensePlan, LicensePlan.SOLO);
    });
  });

  group('updateLicense', () {
    test('updates an existing license', () async {
      final updatedLicense = License(
        licenseId: 'license-starter-001',
        licensePlan: LicensePlan.TRIO,
        providerProductId: 'prod_boutique',
        providerPriceId: 'price_boutique',
        maxUsers: 3,
        validFrom: Dummy.licenseDummy.validFrom,
      );

      final response = await billingService.updateLicense(
        null,
        UpdateLicenseRequest(licenseId: 'license-starter-001', license: updatedLicense),
      );

      expect(response.type, StatusResponse_Type.UPDATED);

      final readResponse = await billingService.readLicenses(null, Empty());
      expect(readResponse.licenses.length, 1);
      expect(readResponse.licenses.first.licensePlan, LicensePlan.TRIO);
      expect(readResponse.licenses.first.maxUsers, 3);
    });

    test('throws notFound when licenseId does not exist', () async {
      final license = License(
        licenseId: 'license-nonexistent',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'prod',
        providerPriceId: 'price',
        maxUsers: 1,
      );

      try {
        await billingService.updateLicense(
          null,
          UpdateLicenseRequest(licenseId: 'license-nonexistent', license: license),
        );
        fail('Expected GrpcError.notFound');
      } on GrpcError catch (e) {
        expect(e.code, 5); // NOT_FOUND
      }
    });
  });

  group('updatePaymentCustomerId', () {
    test('sets providerCustomerIds[provider] on the firm', () async {
      final response = await billingService.updatePaymentCustomerId(
        null,
        UpdatePaymentCustomerIdRequest(
          provider: 'stripe',
          paymentCustomerId: 'cus_stripe_123',
        ),
      );

      expect(response.type, StatusResponse_Type.UPDATED);

      final db = await poolService.acquire();
      final firmDoc = await db
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', firmId));
      poolService.release(db);

      final providerCustomerIds =
          firmDoc!['providerCustomerIds'] as Map<String, dynamic>?;
      expect(providerCustomerIds, isNotNull);
      expect(providerCustomerIds!['stripe'], 'cus_stripe_123');
    });

    test('throws invalidArgument when provider is empty', () async {
      try {
        await billingService.updatePaymentCustomerId(
          null,
          UpdatePaymentCustomerIdRequest(
            provider: '',
            paymentCustomerId: 'cus_123',
          ),
        );
        fail('Expected GrpcError.invalidArgument');
      } on GrpcError catch (e) {
        expect(e.code, 3); // INVALID_ARGUMENT
      }
    });
  });

  group('getReferralInfo', () {
    test('returns referral code (= firmId) and balance', () async {
      final response = await billingService.getReferralInfo(null, Empty());

      expect(response.referralCode, firmId);
      expect(response.creditBalanceCents, 0);
      expect(response.minPayoutCents, 1500);

      final response2 = await billingService.getReferralInfo(null, Empty());
      expect(response2.referralCode, response.referralCode);
    });
  });

  group('createLicense with referral', () {
    test('rejects invalid referral code', () async {
      final license = License(
        licenseId: 'license-invalid-ref-001',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'prod_starter',
        providerPriceId: 'price_starter',
        maxUsers: 1,
        validFrom: DateTime.now().toUtc().timestampProto,
      );

      try {
        await billingService.createLicense(
          null,
          CreateLicenseRequest(license: license, referralCode: 'nonexistent-firm-id'),
        );
        fail('Expected invalidArgument');
      } on GrpcError catch (e) {
        expect(e.code, 3); // INVALID_ARGUMENT
      }
    });

    test('rejects own referral code (self-referral)', () async {
      final refResponse = await billingService.getReferralInfo(null, Empty());
      final ownCode = refResponse.referralCode;

      final license = License(
        licenseId: 'license-self-ref-001',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'prod_starter',
        providerPriceId: 'price_starter',
        maxUsers: 1,
        validFrom: DateTime.now().toUtc().timestampProto,
      );

      try {
        await billingService.createLicense(
          null,
          CreateLicenseRequest(license: license, referralCode: ownCode),
        );
        fail('Expected invalidArgument');
      } on GrpcError catch (e) {
        expect(e.code, 3); // INVALID_ARGUMENT
      }
    });

    test('deducts creditAppliedCents from buyer when applying referral credit',
        () async {
      final db = await poolService.acquire();
      await db.collection(FenceService.firmCollectionName).updateOne(
        where.eq('firmId', firmId),
        ModifierBuilder().set('referralCreditBalanceCents', 500),
      );
      poolService.release(db);

      final license = License(
        licenseId: 'license-credit-applied-001',
        licensePlan: LicensePlan.SOLO,
        providerProductId: 'prod_starter',
        providerPriceId: 'price_starter',
        maxUsers: 1,
        validFrom: DateTime.now().toUtc().timestampProto,
      );

      await billingService.createLicense(
        null,
        CreateLicenseRequest(license: license, creditAppliedCents: 300),
      );

      final db3 = await poolService.acquire();
      final firmDoc =
          await db3.collection(FenceService.firmCollectionName).findOne(where.eq('firmId', firmId));
      poolService.release(db3);
      expect((firmDoc!['referralCreditBalanceCents'] as num?)?.toInt(), 200);
    });

    test('credits referrer when valid referral code used', () async {
      final referrerFirmId = 'referrer-firm-001';
      final db = await poolService.acquire();
      await db.collection(FenceService.firmCollectionName).insertOne({
        'firmId': referrerFirmId,
        'name': 'Referrer Boutique',
        'status': true,
        'creationDateUTC': DateTime.now().toUtc(),
        'licenses': [],
        'referralCode': referrerFirmId, // referralCode = firmId
        'referralCreditBalanceCents': 0,
      });
      poolService.release(db);

      final license = License(
        licenseId: 'license-referral-001',
        licensePlan: LicensePlan.TRIO,
        providerProductId: 'prod_boutique',
        providerPriceId: 'price_boutique',
        maxUsers: 3,
        validFrom: DateTime.now().toUtc().timestampProto,
      );

      final createResp = await billingService.createLicense(
        null,
        CreateLicenseRequest(license: license, referralCode: referrerFirmId),
      );

      expect(createResp.license.referredByFirmId, referrerFirmId);

      final db2 = await poolService.acquire();
      final refDoc = await db2
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', referrerFirmId));
      poolService.release(db2);
      expect((refDoc!['referralCreditBalanceCents'] as num?)?.toInt(), 580);
    });
  });

  group('requestReferralPayout', () {
    test('succeeds when balance at or above minimum', () async {
      final db = await poolService.acquire();
      await db.collection(FenceService.firmCollectionName).updateOne(
        where.eq('firmId', firmId),
        ModifierBuilder()
            .set('referralCreditBalanceCents', 2000)
            .set('providerCustomerIds', {'stripe': 'cus_test123'}),
      );
      poolService.release(db);

      final response =
          await billingService.requestReferralPayout(null, Empty());

      expect(response.statusResponse.type, StatusResponse_Type.SUCCESS);
      expect(response.amountCents, 2000);

      final db2 = await poolService.acquire();
      final firmDoc = await db2
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', firmId));
      poolService.release(db2);
      expect((firmDoc!['referralCreditBalanceCents'] as num?)?.toInt(), 0);
    });

    test('throws when balance below minimum', () async {
      try {
        await billingService.requestReferralPayout(null, Empty());
        fail('Expected failedPrecondition');
      } on GrpcError catch (e) {
        expect(e.code, 9); // FAILED_PRECONDITION
      }
    });
  });

  group('deleteLicense', () {
    test('removes license from firm.licenses', () async {
      await billingService.deleteLicense(
        null,
        DeleteLicenseRequest(licenseId: 'license-starter-001'),
      );
      await billingService.deleteLicense(
        null,
        DeleteLicenseRequest(licenseId: 'license-referral-001'),
      );
      await billingService.deleteLicense(
        null,
        DeleteLicenseRequest(licenseId: 'license-credit-applied-001'),
      );

      final readResponse = await billingService.readLicenses(null, Empty());
      expect(readResponse.licenses, isEmpty);
    });

    test('throws notFound when licenseId does not exist', () async {
      try {
        await billingService.deleteLicense(
          null,
          DeleteLicenseRequest(licenseId: 'license-already-deleted'),
        );
        fail('Expected GrpcError.notFound');
      } on GrpcError catch (e) {
        expect(e.code, 5); // NOT_FOUND
      }
    });
  });
}
