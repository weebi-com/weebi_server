import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_pool.dart' hide Timestamp;
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/logging.dart';
import 'package:http/http.dart' as http;
import 'package:billing_service/src/accounting_year_purchase.dart';
import 'package:billing_service/src/pawapay_checkout.dart';
import 'package:billing_service/src/pawapay_catalog_defaults.dart';
import 'package:billing_service/src/org_country_resolution.dart';
import 'package:billing_service/src/stripe_checkout.dart';
import 'package:billing_service/src/referral_pricing.dart';

Set<String> _distinctNonEmptySeatUserIds(License license) {
  final ids = <String>{};
  for (final s in license.seats) {
    final u = s.userId.trim();
    if (u.isNotEmpty) ids.add(u);
  }
  return ids;
}

/// License CRUD on Firm.licenses (embedded). firmId from authenticated user.
class BillingService extends BillingServiceBase {
  static const String billingProductsCollectionName = 'billing_products';

  final MongoDbPoolService _poolService;
  final WeebiLogger _logger = WeebiLogger.forService('billing_service');
  final bool isTest;
  final UserPermissions? userPermissionIfTest;

  /// Injectable PawaPay client (tests inject [FakePawapayCheckoutClient]).
  final PawapayCheckoutClient? pawapayClient;

  /// Injectable Stripe HTTP client / secret for tests (MockClient).
  final http.Client? stripeHttpClient;
  final String? stripeSecretKeyIfTest;

  BillingService(
    this._poolService, {
    this.isTest = false,
    this.userPermissionIfTest,
    this.pawapayClient,
    this.stripeHttpClient,
    this.stripeSecretKeyIfTest,
  });

  String? _stripeSecretKey() {
    if (isTest && stripeSecretKeyIfTest != null) {
      return stripeSecretKeyIfTest;
    }
    return AppEnvironment.stripeSecretKey;
  }

  PawapayCheckoutClient _requirePawapayClient() {
    if (pawapayClient != null) return pawapayClient!;
    final token = AppEnvironment.pawapayApiToken;
    final base = AppEnvironment.pawapayApiBaseUrl;
    if (token == null || token.isEmpty || base == null || base.isEmpty) {
      throw GrpcError.failedPrecondition('PawaPay not configured');
    }
    return PawapayHttpCheckoutClient(apiBaseUrl: base, apiToken: token);
  }

  UserPermissions _userPermissions(ServiceCall? call) =>
      isTest ? (userPermissionIfTest ?? UserPermissions()) : call!.bearer.userPermissions;

  void _requireBillingRight(UserPermissions p, Right right) {
    if (p.billingRights.rights.any((e) => e == right) == false) {
      throw GrpcError.permissionDenied('user does not have billing right: $right');
    }
  }

  void _requireFirmId(UserPermissions p) {
    if (p.firmId.isEmpty) {
      throw GrpcError.failedPrecondition('user has no firm');
    }
  }

  static const _minPayoutCents = kReferralMinPayoutCents;

  /// Populate firmId on each LicenseSeat for MongoDB queries.
  License _licenseWithSeatFirmIds(License license, String firmId) {
    if (license.seats.isEmpty) return license;
    final copy = License()..mergeFromMessage(license);
    for (var i = 0; i < copy.seats.length; i++) {
      copy.seats[i].firmId = firmId;
    }
    return copy;
  }

  void _assertPerLicenseSeatCap(License license) {
    final maxUsers = license.maxUsers;
    if (maxUsers <= 0) return;
    final n = _distinctNonEmptySeatUserIds(license).length;
    if (n > maxUsers) {
      throw GrpcError.invalidArgument(
        'LICENSE_SEATS_EXCEED_MAX_USERS: $n distinct users exceed maxUsers ($maxUsers)',
      );
    }
  }

  /// After merging one updated [License] into the firm's list: total distinct
  /// assignees must not exceed the sum of positive [License.maxUsers] caps.
  void _assertFirmWideSeatCap(Iterable<License> licenses) {
    var sumMax = 0;
    final allUsers = <String>{};
    for (final lic in licenses) {
      final m = lic.maxUsers;
      if (m > 0) sumMax += m;
      allUsers.addAll(_distinctNonEmptySeatUserIds(lic));
    }
    if (sumMax <= 0) return;
    if (allUsers.length > sumMax) {
      throw GrpcError.invalidArgument(
        'LICENSE_FIRM_WIDE_SEATS_EXCEED_CAP: ${allUsers.length} distinct users exceed total purchased seats ($sumMax)',
      );
    }
  }

  List<License> _licensesAfterReplacingOne({
    required List<dynamic> licensesJson,
    required String updatedLicenseId,
    required License replacement,
  }) {
    final merged = <License>[];
    var found = false;
    for (final raw in licensesJson) {
      final lic = License()
        ..mergeFromProto3Json(
          Map<String, dynamic>.from(raw as Map),
          ignoreUnknownFields: true,
        );
      if (lic.licenseId == updatedLicenseId) {
        merged.add(replacement);
        found = true;
      } else {
        merged.add(lic);
      }
    }
    if (!found) {
      merged.add(replacement);
    }
    return merged;
  }

  Future<Map<String, dynamic>?> _findReferrerFirm(Db db, String code) {
    final trimmed = code.trim();
    if (trimmed.isEmpty) return Future.value(null);
    return db.collection(FenceService.firmCollectionName).findOne({
      r'$or': [
        {'referralCode': trimmed},
        {'firmId': trimmed},
      ],
    });
  }

  int _commissionCents(int amountCents) => referrerCommissionCents(amountCents);

  /// Validates referral code for checkout/create; throws GrpcError on failure.
  Future<void> _assertValidReferralCode({
    required Db db,
    required String buyerFirmId,
    required String referralCode,
  }) async {
    final code = referralCode.trim();
    if (code.isEmpty) return;
    final referrerDoc = await _findReferrerFirm(db, code);
    if (referrerDoc == null) {
      throw GrpcError.invalidArgument('invalid referral code');
    }
    final referrerFirmId = referrerDoc['firmId'] as String?;
    if (referrerFirmId == null || referrerFirmId == buyerFirmId) {
      throw GrpcError.invalidArgument('cannot use own referral code');
    }
  }

  /// Lookup billing product by Stripe price ID. Returns null if not found or deleted.
  Future<BillingProduct?> _lookupBillingProductByStripePriceId(Db db, String stripePriceId) async {
    final doc = await db
        .collection(billingProductsCollectionName)
        .findOne(where.eq('stripePriceId', stripePriceId).eq('isDeleted', false));
    if (doc == null) return null;
    final product = BillingProduct()..mergeFromProto3Json(Map<String, dynamic>.from(doc), ignoreUnknownFields: true);
    return product;
  }

  static const _planToProductId = <LicensePlan, String>{
    LicensePlan.ENTERPRISE: 'entreprise',
    LicensePlan.PREMIUM: 'premium',
  };

  /// Lookup billing product by license plan. Returns null if not found or deleted.
  Future<BillingProduct?> _lookupBillingProductByPlan(Db db, LicensePlan plan) async {
    final productId = _planToProductId[plan];
    if (productId == null) return null;
    return _lookupBillingProductByProductId(db, productId);
  }

  /// Lookup billing product by Weebi [productId] (e.g. premium, syscohada).
  Future<BillingProduct?> _lookupBillingProductByProductId(Db db, String productId) async {
    final id = productId.trim();
    if (id.isEmpty) return null;
    final doc = await db
        .collection(billingProductsCollectionName)
        .findOne(where.eq('productId', id).eq('isDeleted', false));
    if (doc == null) return null;
    final product = BillingProduct()
      ..mergeFromProto3Json(Map<String, dynamic>.from(doc), ignoreUnknownFields: true);
    return product;
  }

  @override
  Future<CreateLicenseResponse> createLicense(
      ServiceCall? call, CreateLicenseRequest request) async {
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.create);
    return _doCreateLicense(call, userPermission.firmId, request);
  }

  /// Internal implementation. Also used by Stripe webhook handler.
  Future<CreateLicenseResponse> _doCreateLicense(
    ServiceCall? call,
    String firmId,
    CreateLicenseRequest request,
  ) async {
    final log = _logger.withContext(call);
    final license = request.license;
    if (license.licenseId.isEmpty) {
      throw GrpcError.invalidArgument('licenseId is required');
    }

    final creditAppliedCents = request.creditAppliedCents > 0 ? request.creditAppliedCents : 0;

    log.logRpcEntry('createLicense', requestData: {
      'firmId': firmId,
      'licenseId': license.licenseId,
      'referralCode': request.referralCode.isNotEmpty ? '***' : null,
      'creditAppliedCents': creditAppliedCents,
    });

    return databaseMiddleware<CreateLicenseResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);

      final firmDoc = await firmCollection.findOne(where.eq('firmId', firmId));
      if (firmDoc == null) {
        throw GrpcError.notFound('firm not found');
      }

      final licenses = (firmDoc['licenses'] as List?) ?? [];
      if (licenses.any((l) => l['licenseId'] == license.licenseId)) {
        throw GrpcError.alreadyExists('license ${license.licenseId} already exists');
      }

      String? referrerFirmId;
      if (request.referralCode.isNotEmpty) {
        final referrerDoc = await _findReferrerFirm(
          db,
          request.referralCode.trim(),
        );
        if (referrerDoc == null) {
          throw GrpcError.invalidArgument('invalid referral code');
        }
        referrerFirmId = referrerDoc['firmId'] as String?;
        if (referrerFirmId == null || referrerFirmId == firmId) {
          throw GrpcError.invalidArgument('cannot use own referral code');
        }
      }

      if (creditAppliedCents > 0) {
        final currentBalance =
            (firmDoc['referralCreditBalanceCents'] as num?)?.toInt() ?? 0;
        if (currentBalance < creditAppliedCents) {
          throw GrpcError.failedPrecondition(
            'insufficient referral credit: have $currentBalance cents, need $creditAppliedCents',
          );
        }
      }

      int commissionCents = 0;
      if (referrerFirmId != null) {
        final billingProduct = await _lookupBillingProductByPlan(db, license.licensePlan);
        if (billingProduct != null) {
          commissionCents = _commissionCents(billingProduct.amountCents);
        }
      }

      final licenseWithFirmIds = _licenseWithSeatFirmIds(license, firmId)
        ..referredByFirmId = referrerFirmId ?? ''
        ..creditAppliedCents = creditAppliedCents;
      final licenseJson = licenseWithFirmIds.toProto3Json() as Map<String, dynamic>;

      var modifier = ModifierBuilder().push('licenses', licenseJson);
      if (creditAppliedCents > 0) {
        modifier = modifier.inc('referralCreditBalanceCents', -creditAppliedCents);
      }

      final result = await firmCollection.updateOne(
        where.eq('firmId', firmId),
        modifier,
      );

      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.nModified != 1) {
        throw GrpcError.unknown('update failed: nModified=${result.nModified}');
      }

      if (referrerFirmId != null && commissionCents > 0) {
        final refResult = await firmCollection.updateOne(
          where.eq('firmId', referrerFirmId),
          ModifierBuilder().inc('referralCreditBalanceCents', commissionCents),
        );
        if (refResult.nModified != 1) {
          log.warning('referrer credit failed: firm=$referrerFirmId');
        }
      }

      log.logRpcExit('createLicense', resultData: {
        'licenseId': license.licenseId,
        'referrerCredited': commissionCents,
      });
      return CreateLicenseResponse()
        ..statusResponse = (StatusResponse()
          ..type = StatusResponse_Type.CREATED
          ..id = license.licenseId
          ..timestamp = DateTime.now().toUtc().timestampProto)
        ..license = licenseWithFirmIds;
    });
  }

  /// Punctual SYSCOHADA year purchase (not a license seat, not a subscription).
  /// Idempotent on provider payment id and on [fiscalYear].
  Future<CreateLicenseResponse> recordAccountingYearPurchase({
    required String firmId,
    required int fiscalYear,
    required BillingProduct product,
    String stripeCheckoutSessionId = '',
    String pawapayCheckoutId = '',
    String creditPurchaseId = '',
    PaymentProvider paymentProvider = PaymentProvider.PAYMENT_PROVIDER_STRIPE,
    String referralCode = '',
    int creditAppliedCents = 0,
  }) async {
    final year = validateFiscalYear(fiscalYear);
    final stripeId = stripeCheckoutSessionId.trim();
    final pawapayId = pawapayCheckoutId.trim();
    final creditId = creditPurchaseId.trim();
    if (stripeId.isEmpty && pawapayId.isEmpty && creditId.isEmpty) {
      throw GrpcError.invalidArgument(
        'stripeCheckoutSessionId, pawapayCheckoutId or creditPurchaseId is required',
      );
    }
    if (!isSyscohadaProductId(product.productId)) {
      throw GrpcError.invalidArgument(
        'product ${product.productId} is not a SYSCOHADA accounting product',
      );
    }

    return databaseMiddleware<CreateLicenseResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);
      final firmDoc = await firmCollection.findOne(where.eq('firmId', firmId));
      if (firmDoc == null) {
        throw GrpcError.notFound('firm not found');
      }

      final existing = parseAccountingYearPurchases(
        firmDoc[kAccountingYearPurchasesField],
      );
      final purchase = buildAccountingYearPurchase(
        year: year,
        stripeCheckoutSessionId: stripeId.isNotEmpty ? stripeId : creditId,
        stripePriceId: product.stripePriceId,
        pawapayCheckoutId: pawapayId,
        paymentProvider: creditId.isNotEmpty
            ? 'credit'
            : paymentProvider.name,
        paidAtUTC: DateTime.now().toUtc(),
        amountCents: product.amountCents,
        currency: product.currency.isNotEmpty ? product.currency : 'eur',
      );
      final merged = mergeAccountingYearPurchase(
        existing: existing,
        purchase: purchase,
      );

      if (!merged.alreadyFulfilled) {
        var modifier = ModifierBuilder().set(
          kAccountingYearPurchasesField,
          merged.purchases,
        );
        if (creditAppliedCents > 0) {
          final currentBalance =
              (firmDoc['referralCreditBalanceCents'] as num?)?.toInt() ?? 0;
          if (currentBalance < creditAppliedCents) {
            throw GrpcError.failedPrecondition(
              'insufficient referral credit: have $currentBalance cents, need $creditAppliedCents',
            );
          }
          modifier = modifier.inc(
            'referralCreditBalanceCents',
            -creditAppliedCents,
          );
        }
        await firmCollection.updateOne(
          where.eq('firmId', firmId),
          modifier,
        );

        if (referralCode.trim().isNotEmpty) {
          final referrerDoc =
              await _findReferrerFirm(db, referralCode.trim());
          final referrerFirmId = referrerDoc?['firmId'] as String?;
          final commissionCents = _commissionCents(product.amountCents);
          if (referrerFirmId != null &&
              referrerFirmId != firmId &&
              commissionCents > 0) {
            await firmCollection.updateOne(
              where.eq('firmId', referrerFirmId),
              ModifierBuilder()
                  .inc('referralCreditBalanceCents', commissionCents),
            );
          }
        }
      }

      return CreateLicenseResponse()
        ..statusResponse = (StatusResponse()
          ..type = merged.alreadyFulfilled
              ? StatusResponse_Type.SUCCESS
              : StatusResponse_Type.CREATED
          ..message = merged.alreadyFulfilled
              ? 'Accounting year purchase already fulfilled'
              : 'Accounting year purchase recorded');
    });
  }

  /// Lists punctual accounting-year purchases for a firm (Mongo field only).
  Future<List<Map<String, dynamic>>> listAccountingYearPurchases(
    String firmId,
  ) async {
    return databaseMiddleware<List<Map<String, dynamic>>>(_poolService, (db) async {
      final firmDoc = await db
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', firmId));
      if (firmDoc == null) {
        throw GrpcError.notFound('firm not found');
      }
      return parseAccountingYearPurchases(
        firmDoc[kAccountingYearPurchasesField],
      );
    });
  }

  @override
  Future<ReadAccountingYearPurchasesResponse> readAccountingYearPurchases(
    ServiceCall? call,
    Empty request,
  ) async {
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.read);

    final raw = await listAccountingYearPurchases(userPermission.firmId);
    final purchases = raw.map((e) {
      final providerName = e['paymentProvider'] as String? ?? '';
      final provider = PaymentProvider.values.firstWhere(
        (p) => p.name == providerName,
        orElse: () => PaymentProvider.PAYMENT_PROVIDER_UNKNOWN,
      );
      return AccountingYearPurchase(
        year: (e['year'] as num?)?.toInt() ?? 0,
        stripeCheckoutSessionId: e['stripeCheckoutSessionId'] as String? ?? '',
        stripePriceId: e['stripePriceId'] as String? ?? '',
        paidAtUTC: e['paidAtUTC'] as String? ?? '',
        amountCents: (e['amountCents'] as num?)?.toInt() ?? 0,
        currency: e['currency'] as String? ?? '',
        pawapayCheckoutId: e['pawapayCheckoutId'] as String? ?? '',
        paymentProvider: provider,
      );
    });
    return ReadAccountingYearPurchasesResponse()..purchases.addAll(purchases);
  }

  @override
  Future<CreateLicenseResponse> fulfillLicenseFromStripe(
      ServiceCall? call, FulfillLicenseFromStripeRequest request) async {
    // Same JWT extraction as auth_interceptor: bearer may be "Bearer <token>" or raw token.
    // JsonWebToken.parse handles Dart/Go token differences (base64 padding, etc.) per jwt.dart.
    final bearer = call!.bearer;
    final token = bearer.startsWith('Bearer ') ? bearer.substring(7) : bearer;
    final jwt = JsonWebToken.parse(token);
    if (!jwt.isServiceAccount) {
      throw GrpcError.permissionDenied('fulfillLicenseFromStripe requires service account');
    }
    final product = await databaseMiddleware<BillingProduct?>(_poolService, (db) async {
      return _lookupBillingProductByStripePriceId(db, request.priceId);
    });
    if (product == null) {
      throw GrpcError.invalidArgument('unknown price: ${request.priceId}');
    }
    if (isSyscohadaProductId(product.productId)) {
      final year = request.fiscalYear;
      if (year == 0) {
        throw GrpcError.invalidArgument(
          'fiscalYear is required for SYSCOHADA purchases',
        );
      }
      final sessionId = request.licenseId.isNotEmpty
          ? request.licenseId
          : 'acct_${year}_${request.priceId}';
      final response = await recordAccountingYearPurchase(
        firmId: request.firmId,
        fiscalYear: year,
        stripeCheckoutSessionId: sessionId,
        product: product,
        paymentProvider: PaymentProvider.PAYMENT_PROVIDER_STRIPE,
      );
      if (request.stripeCustomerId.isNotEmpty) {
        await _updateStripeCustomerId(request.firmId, request.stripeCustomerId);
      }
      return response;
    }
    return _fulfillLicenseInternal(
      request.firmId,
      request.licenseId,
      product.licensePlan,
      product.stripeProductId,
      request.priceId,
      product.maxUsers,
      paymentProvider: PaymentProvider.PAYMENT_PROVIDER_STRIPE,
      stripeCustomerId: request.stripeCustomerId.isNotEmpty ? request.stripeCustomerId : null,
      referralCode: request.referralCode.isNotEmpty ? request.referralCode : null,
      creditAppliedCents: request.creditAppliedCents,
      legalTermsVersionDate: request.legalTermsVersionDate.isNotEmpty
          ? request.legalTermsVersionDate
          : null,
    );
  }

  static final RegExp _legalTermsDatePattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');

  void _validateLegalTermsVersionDate(String value) {
    final v = value.trim();
    if (v.isEmpty) {
      throw GrpcError.invalidArgument(
        'legalTermsVersionDate is required (YYYY-MM-DD)',
      );
    }
    if (!_legalTermsDatePattern.hasMatch(v)) {
      throw GrpcError.invalidArgument(
        'legalTermsVersionDate must be YYYY-MM-DD',
      );
    }
  }

  String _successUrlAfterCreditFulfill(String successUrl) {
    return successUrl
        .replaceAll('&session_id={CHECKOUT_SESSION_ID}', '')
        .replaceAll('session_id={CHECKOUT_SESSION_ID}&', '')
        .replaceAll('session_id={CHECKOUT_SESSION_ID}', '');
  }

  Future<void> _fulfillPaidByWeebiCredit({
    required String firmId,
    required BillingProduct product,
    required int creditAppliedCents,
    String referralCode = '',
    String legalTermsVersionDate = '',
    int? fiscalYear,
  }) async {
    final id = 'credit_${DateTime.now().millisecondsSinceEpoch}';
    if (isSyscohadaProductId(product.productId)) {
      if (fiscalYear == null) {
        throw GrpcError.invalidArgument(
          'fiscalYear is required for SYSCOHADA credit purchases',
        );
      }
      await recordAccountingYearPurchase(
        firmId: firmId,
        fiscalYear: fiscalYear,
        product: product,
        creditPurchaseId: id,
        referralCode: referralCode,
        creditAppliedCents: creditAppliedCents,
        paymentProvider: PaymentProvider.PAYMENT_PROVIDER_UNKNOWN,
      );
      return;
    }
    await _fulfillLicenseInternal(
      firmId,
      'lic_$id',
      product.licensePlan,
      product.stripeProductId.isNotEmpty
          ? product.stripeProductId
          : product.productId,
      product.stripePriceId,
      product.maxUsers,
      paymentProvider: PaymentProvider.PAYMENT_PROVIDER_UNKNOWN,
      referralCode: referralCode.isEmpty ? null : referralCode,
      creditAppliedCents: creditAppliedCents,
      legalTermsVersionDate:
          legalTermsVersionDate.isEmpty ? null : legalTermsVersionDate,
    );
  }

  /// Internal: fulfill a license after provider payment. Idempotent on [licenseId].
  Future<CreateLicenseResponse> _fulfillLicenseInternal(
    String firmId,
    String licenseId,
    LicensePlan plan,
    String providerProductId,
    String providerPriceId,
    int maxUsers, {
    required PaymentProvider paymentProvider,
    String? stripeCustomerId,
    String? referralCode,
    int creditAppliedCents = 0,
    String? legalTermsVersionDate,
  }) async {
    final termsDate = legalTermsVersionDate?.trim() ?? '';
    final request = CreateLicenseRequest(
      license: License(
        licenseId: licenseId,
        licensePlan: plan,
        providerProductId: providerProductId,
        providerPriceId: providerPriceId,
        maxUsers: maxUsers,
        validFrom: DateTime.now().toUtc().timestampProto,
        paymentProvider: paymentProvider,
        legalTermsVersionDate: termsDate,
      ),
      referralCode: referralCode ?? '',
      creditAppliedCents: creditAppliedCents,
    );
    try {
      final response = await _doCreateLicense(null, firmId, request);
      if (stripeCustomerId != null && stripeCustomerId.isNotEmpty) {
        await _updateStripeCustomerId(firmId, stripeCustomerId);
      }
      return response;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.alreadyExists) {
        // Webhook retry or user-triggered sync: license already created.
        if (stripeCustomerId != null && stripeCustomerId.isNotEmpty) {
          await _updateStripeCustomerId(firmId, stripeCustomerId);
        }
        if (termsDate.isNotEmpty) {
          await _backfillLegalTermsOnExistingLicense(firmId, licenseId, termsDate);
        }
        return CreateLicenseResponse()
          ..statusResponse = (StatusResponse()
            ..type = StatusResponse_Type.SUCCESS
            ..message = 'License already fulfilled')
          ..license = License(
            licenseId: licenseId,
            licensePlan: plan,
            providerProductId: providerProductId,
            providerPriceId: providerPriceId,
            maxUsers: maxUsers,
            paymentProvider: paymentProvider,
            legalTermsVersionDate: termsDate,
          );
      }
      rethrow;
    }
  }

  /// Backward-compatible alias used by older call sites / mental model.
  Future<CreateLicenseResponse> _fulfillLicenseFromStripeInternal(
    String firmId,
    String licenseId,
    LicensePlan plan,
    String providerProductId,
    String providerPriceId,
    int maxUsers, {
    String? stripeCustomerId,
    String? referralCode,
    int creditAppliedCents = 0,
    String? legalTermsVersionDate,
  }) {
    return _fulfillLicenseInternal(
      firmId,
      licenseId,
      plan,
      providerProductId,
      providerPriceId,
      maxUsers,
      paymentProvider: PaymentProvider.PAYMENT_PROVIDER_STRIPE,
      stripeCustomerId: stripeCustomerId,
      referralCode: referralCode,
      creditAppliedCents: creditAppliedCents,
      legalTermsVersionDate: legalTermsVersionDate,
    );
  }

  Future<void> _updateStripeCustomerId(String firmId, String customerId) async {
    await databaseMiddleware<void>(_poolService, (db) async {
      await db.collection(FenceService.firmCollectionName).updateOne(
        where.eq('firmId', firmId),
        ModifierBuilder().set('providerCustomerIds.stripe', customerId),
      );
    });
  }

  /// When the webhook created the license first, [legalTermsVersionDate] may be empty; set it once from the client sync RPC.
  Future<void> _backfillLegalTermsOnExistingLicense(
    String firmId,
    String licenseId,
    String termsDate,
  ) async {
    if (termsDate.isEmpty) return;
    await databaseMiddleware<void>(_poolService, (db) async {
      final coll = db.collection(FenceService.firmCollectionName);
      final firm = await coll.findOne(where.eq('firmId', firmId));
      if (firm == null) return;
      final rawList = firm['licenses'] as List?;
      if (rawList == null || rawList.isEmpty) return;

      var targetIndex = -1;
      for (var i = 0; i < rawList.length; i++) {
        final m = Map<String, dynamic>.from(rawList[i] as Map);
        if (m['licenseId'] != licenseId) continue;
        final existing = (m['legalTermsVersionDate'] as String?)?.trim() ?? '';
        if (existing.isNotEmpty) return;
        targetIndex = i;
        break;
      }
      if (targetIndex < 0) return;

      final newList = <dynamic>[];
      for (var i = 0; i < rawList.length; i++) {
        if (i == targetIndex) {
          final copy = Map<String, dynamic>.from(rawList[i] as Map);
          copy['legalTermsVersionDate'] = termsDate;
          newList.add(copy);
        } else {
          newList.add(rawList[i]);
        }
      }

      final result = await coll.updateOne(
        where.eq('firmId', firmId),
        ModifierBuilder().set('licenses', newList),
      );
      if (result.nModified != 1) {
        _logger.warning(
          'backfill legalTermsVersionDate: expected nModified=1 got ${result.nModified} firm=$firmId license=$licenseId',
        );
      }
    });
  }

  @override
  Future<ReadLicensesResponse> readLicenses(
      ServiceCall? call, Empty request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.read);

    log.logRpcEntry('readLicenses', requestData: {'firmId': userPermission.firmId});

    return databaseMiddleware<ReadLicensesResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);
      final firmDoc = await firmCollection.findOne(where.eq('firmId', userPermission.firmId));
      if (firmDoc == null) {
        throw GrpcError.notFound('firm not found');
      }

      final licensesJson = firmDoc['licenses'] as List? ?? [];
      final licenses = <License>[];
      for (final l in licensesJson) {
        licenses.add(License()..mergeFromProto3Json(l as Map<String, dynamic>, ignoreUnknownFields: true));
      }

      return ReadLicensesResponse()..licenses.addAll(licenses);
    });
  }

  @override
  Future<ReadBillingProductsResponse> readBillingProducts(
      ServiceCall? call, Empty request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.read);

    log.logRpcEntry('readBillingProducts', requestData: {'firmId': userPermission.firmId});

    return databaseMiddleware<ReadBillingProductsResponse>(_poolService, (db) async {
      final cursor = db
          .collection(billingProductsCollectionName)
          .find(where.eq('isDeleted', false));
      final products = <BillingProduct>[];
      await for (final doc in cursor) {
        products.add(BillingProduct()..mergeFromProto3Json(Map<String, dynamic>.from(doc), ignoreUnknownFields: true));
      }
      return ReadBillingProductsResponse()..products.addAll(products);
    });
  }

  @override
  Future<StatusResponse> updateLicense(
      ServiceCall? call, UpdateLicenseRequest request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.update);

    if (request.licenseId.isEmpty) {
      throw GrpcError.invalidArgument('licenseId is required');
    }
    if (request.license.licenseId != request.licenseId) {
      throw GrpcError.invalidArgument('license.licenseId must match request.licenseId');
    }

    log.logRpcEntry('updateLicense', requestData: {
      'firmId': userPermission.firmId,
      'licenseId': request.licenseId,
    });

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);

      final firmDoc = await firmCollection.findOne(where.eq('firmId', userPermission.firmId));
      if (firmDoc == null) {
        throw GrpcError.notFound('firm not found');
      }
      final licensesJson = firmDoc['licenses'] as List? ?? [];

      final licenseWithFirmIds = _licenseWithSeatFirmIds(request.license, userPermission.firmId);
      final mergedLicenses = _licensesAfterReplacingOne(
        licensesJson: licensesJson,
        updatedLicenseId: request.licenseId,
        replacement: licenseWithFirmIds,
      );
      _assertPerLicenseSeatCap(licenseWithFirmIds);
      _assertFirmWideSeatCap(mergedLicenses);

      final licenseJson = licenseWithFirmIds.toProto3Json() as Map<String, dynamic>;

      final result = await firmCollection.updateOne(
        where.eq('firmId', userPermission.firmId).eq('licenses.licenseId', request.licenseId),
        ModifierBuilder().set('licenses.\$', licenseJson),
      );

      if (result.nMatched == 0) {
        throw GrpcError.notFound('firm or license ${request.licenseId} not found');
      }

      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.nModified != 1) {
        throw GrpcError.unknown('update failed: nModified=${result.nModified}');
      }

      log.logRpcExit('updateLicense', resultData: {'licenseId': request.licenseId});
      return StatusResponse()
        ..type = StatusResponse_Type.UPDATED
        ..timestamp = DateTime.now().toUtc().timestampProto;
    });
  }

  @override
  Future<StatusResponse> deleteLicense(
      ServiceCall? call, DeleteLicenseRequest request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.delete);

    if (request.licenseId.isEmpty) {
      throw GrpcError.invalidArgument('licenseId is required');
    }

    log.logRpcEntry('deleteLicense', requestData: {
      'firmId': userPermission.firmId,
      'licenseId': request.licenseId,
    });

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);

      final result = await firmCollection.updateOne(
        where.eq('firmId', userPermission.firmId),
        ModifierBuilder().pull('licenses', {'licenseId': request.licenseId}),
      );

      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.nMatched == 0) {
        throw GrpcError.notFound('firm not found');
      }
      if (result.nModified != 1) {
        throw GrpcError.notFound('license ${request.licenseId} not found');
      }

      log.logRpcExit('deleteLicense', resultData: {'licenseId': request.licenseId});
      return StatusResponse()
        ..type = StatusResponse_Type.DELETED
        ..timestamp = DateTime.now().toUtc().timestampProto;
    });
  }

  @override
  Future<StatusResponse> updatePaymentCustomerId(
      ServiceCall? call, UpdatePaymentCustomerIdRequest request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.update);

    if (request.provider.isEmpty) {
      throw GrpcError.invalidArgument('provider is required');
    }
    if (request.paymentCustomerId.isEmpty) {
      throw GrpcError.invalidArgument('paymentCustomerId is required');
    }

    log.logRpcEntry('updatePaymentCustomerId', requestData: {
      'firmId': userPermission.firmId,
      'provider': request.provider,
    });

    return databaseMiddleware<StatusResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);

      final result = await firmCollection.updateOne(
        where.eq('firmId', userPermission.firmId),
        ModifierBuilder().set(
          'providerCustomerIds.${request.provider}',
          request.paymentCustomerId,
        ),
      );

      if (result.hasWriteErrors) {
        throw GrpcError.unknown('hasWriteErrors ${result.writeError!.errmsg}');
      }
      if (result.nMatched == 0) {
        throw GrpcError.notFound('firm not found');
      }

      log.logRpcExit('updatePaymentCustomerId');
      return StatusResponse()
        ..type = StatusResponse_Type.UPDATED
        ..timestamp = DateTime.now().toUtc().timestampProto;
    });
  }

  @override
  Future<GetReferralInfoResponse> getReferralInfo(
      ServiceCall? call, Empty request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.read);

    log.logRpcEntry('getReferralInfo', requestData: {'firmId': userPermission.firmId});

    return databaseMiddleware<GetReferralInfoResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);
      var firmDoc = await firmCollection.findOne(where.eq('firmId', userPermission.firmId));
      if (firmDoc == null) {
        throw GrpcError.notFound('firm not found');
      }

      var referralCode = firmDoc['referralCode'] as String? ?? '';
      if (referralCode.isEmpty) {
        // referralCode = firmId (simple, no random generation)
        referralCode = userPermission.firmId;
        await firmCollection.updateOne(
          where.eq('firmId', userPermission.firmId),
          ModifierBuilder().set('referralCode', referralCode),
        );
      }

      final balance = (firmDoc['referralCreditBalanceCents'] as num?)?.toInt() ?? 0;

      return GetReferralInfoResponse()
        ..referralCode = referralCode
        ..creditBalanceCents = balance
        ..minPayoutCents = _minPayoutCents;
    });
  }

  @override
  Future<RequestReferralPayoutResponse> requestReferralPayout(
      ServiceCall? call, Empty request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.update);

    log.logRpcEntry('requestReferralPayout', requestData: {'firmId': userPermission.firmId});

    return databaseMiddleware<RequestReferralPayoutResponse>(_poolService, (db) async {
      final firmCollection = db.collection(FenceService.firmCollectionName);
      final firmDoc = await firmCollection.findOne(where.eq('firmId', userPermission.firmId));
      if (firmDoc == null) {
        throw GrpcError.notFound('firm not found');
      }

      final balance = (firmDoc['referralCreditBalanceCents'] as num?)?.toInt() ?? 0;
      if (balance < _minPayoutCents) {
        throw GrpcError.failedPrecondition(
          'minimum payout is $_minPayoutCents cents (€${_minPayoutCents / 100}), balance: $balance',
        );
      }

      final providerIds = firmDoc['providerCustomerIds'] as Map<String, dynamic>?;
      if (providerIds == null || providerIds.isEmpty) {
        throw GrpcError.failedPrecondition(
          'no payment method configured; add Stripe or Pawapay customer ID first',
        );
      }

      final result = await firmCollection.updateOne(
        where.eq('firmId', userPermission.firmId)
            .eq('referralCreditBalanceCents', balance),
        ModifierBuilder().set('referralCreditBalanceCents', 0),
      );

      if (result.nModified != 1) {
        throw GrpcError.failedPrecondition(
          'balance changed; please retry',
        );
      }

      log.logRpcExit('requestReferralPayout', resultData: {'amountCents': balance});
      return RequestReferralPayoutResponse()
        ..statusResponse = (StatusResponse()
          ..type = StatusResponse_Type.SUCCESS
          ..timestamp = DateTime.now().toUtc().timestampProto
          ..message = 'Payout of €${balance / 100} requested. Funds will be transferred to your registered payment method.')
        ..amountCents = balance;
    });
  }

  @override
  Future<CreateCheckoutSessionResponse> createCheckoutSession(
      ServiceCall? call, CreateCheckoutSessionRequest request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.create);

    if (request.priceId.isEmpty) {
      throw GrpcError.invalidArgument('priceId is required');
    }
    if (request.successUrl.isEmpty) {
      throw GrpcError.invalidArgument('successUrl is required');
    }
    if (request.cancelUrl.isEmpty) {
      throw GrpcError.invalidArgument('cancelUrl is required');
    }
    _validateLegalTermsVersionDate(request.legalTermsVersionDate);

    final product = await databaseMiddleware<BillingProduct?>(_poolService, (db) async {
      return _lookupBillingProductByStripePriceId(db, request.priceId);
    });
    if (product == null) {
      throw GrpcError.invalidArgument('Unknown price: ${request.priceId}');
    }

    if (isSyscohadaProductId(product.productId)) {
      try {
        validateFiscalYear(request.fiscalYear);
      } on ArgumentError catch (e) {
        throw GrpcError.invalidArgument(e.message);
      }
    }

    final referralCode = request.referralCode.trim();
    if (referralCode.isNotEmpty) {
      await databaseMiddleware<void>(_poolService, (db) async {
        await _assertValidReferralCode(
          db: db,
          buyerFirmId: userPermission.firmId,
          referralCode: referralCode,
        );
      });
    }

    final pricing = await databaseMiddleware<CheckoutPricing>(_poolService, (db) async {
      final firmDoc = await db
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', userPermission.firmId));
      final balance =
          (firmDoc?['referralCreditBalanceCents'] as num?)?.toInt() ?? 0;
      return checkoutPricing(
        catalogCents: product.amountCents,
        applyReferralDiscount: referralCode.isNotEmpty,
        requestedCreditCents: request.creditAppliedCents,
        availableCreditCents: balance,
      );
    });

    log.logRpcEntry('createCheckoutSession', requestData: {
      'firmId': userPermission.firmId,
      'priceId': request.priceId,
      'legalTermsVersionDate': request.legalTermsVersionDate.trim(),
      if (referralCode.isNotEmpty) 'referralCode': '***',
      'creditAppliedCents': pricing.creditAppliedCents,
      'chargeCents': pricing.chargeCents,
      if (isSyscohadaProductId(product.productId))
        'fiscalYear': request.fiscalYear,
    });

    if (pricing.chargeCents <= 0) {
      if (pricing.creditAppliedCents <= 0) {
        throw GrpcError.failedPrecondition('nothing to charge');
      }
      await _fulfillPaidByWeebiCredit(
        firmId: userPermission.firmId,
        product: product,
        creditAppliedCents: pricing.creditAppliedCents,
        referralCode: referralCode,
        legalTermsVersionDate: request.legalTermsVersionDate.trim(),
        fiscalYear: isSyscohadaProductId(product.productId)
            ? request.fiscalYear
            : null,
      );
      log.logRpcExit('createCheckoutSession', resultData: {'fulfilledWithCredit': true});
      return CreateCheckoutSessionResponse()
        ..checkoutUrl = _successUrlAfterCreditFulfill(request.successUrl);
    }

    final secretKey = _stripeSecretKey();
    if (secretKey == null || secretKey.isEmpty) {
      throw GrpcError.failedPrecondition('Stripe not configured');
    }

    final customerId = await databaseMiddleware<String?>(_poolService, (db) async {
      final firmDoc = await db
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', userPermission.firmId));
      final ids = firmDoc?['providerCustomerIds'] as Map<String, dynamic>?;
      return ids?['stripe'] as String?;
    });

    final purchaserEmail = await databaseMiddleware<String?>(_poolService, (db) async {
      final userId = userPermission.userId.trim();
      if (userId.isEmpty) return null;
      final userDoc = await db
          .collection(FenceService.userCollectionName)
          .findOne(where.eq('userId', userId));
      final mail = userDoc?['mail'] as String?;
      final trimmed = mail?.trim();
      if (trimmed == null || trimmed.isEmpty) return null;
      return trimmed;
    });

    final metadata = <String, String>{
      'firmId': userPermission.firmId,
      'legalTermsVersionDate': request.legalTermsVersionDate.trim(),
      'productKind': isSyscohadaProductId(product.productId) ? 'syscohada' : 'license',
      // Catalog price for fulfill when checkout uses discounted price_data.
      'priceId': request.priceId,
    };
    if (isSyscohadaProductId(product.productId)) {
      metadata['fiscalYear'] = request.fiscalYear.toString();
    }
    if (purchaserEmail != null) {
      metadata['purchaserEmail'] = purchaserEmail;
    }
    if (referralCode.isNotEmpty) {
      metadata['referralCode'] = referralCode;
    }
    if (pricing.creditAppliedCents > 0) {
      metadata['creditAppliedCents'] = pricing.creditAppliedCents.toString();
    }

    final int? unitAmountCents =
        pricing.chargeCents != product.amountCents ? pricing.chargeCents : null;

    try {
      final url = await createStripeCheckoutSession(
        stripeSecretKey: secretKey,
        priceId: request.priceId,
        successUrl: request.successUrl,
        cancelUrl: request.cancelUrl,
        metadata: metadata,
        customerId: customerId,
        unitAmountCents: unitAmountCents,
        currency: product.currency.isNotEmpty ? product.currency : 'eur',
        stripeProductId: product.stripeProductId,
        productName: product.productId,
        httpClient: stripeHttpClient,
      );
      log.logRpcExit('createCheckoutSession');
      return CreateCheckoutSessionResponse()..checkoutUrl = url;
    } on StripeCheckoutException catch (e) {
      throw GrpcError.internal(e.message);
    }
  }

  @override
  Future<CreateLicenseResponse> fulfillFromStripeCheckoutSession(
      ServiceCall? call, FulfillFromStripeCheckoutSessionRequest request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.create);

    if (request.checkoutSessionId.isEmpty) {
      throw GrpcError.invalidArgument('checkoutSessionId is required');
    }
    _validateLegalTermsVersionDate(request.legalTermsVersionDate);

    final secretKey = _stripeSecretKey();
    if (secretKey == null || secretKey.isEmpty) {
      throw GrpcError.failedPrecondition('Stripe not configured');
    }

    StripeCheckoutSessionInfo sessionInfo;
    try {
      sessionInfo = await fetchStripeCheckoutSession(
        sessionId: request.checkoutSessionId,
        stripeSecretKey: secretKey,
        httpClient: stripeHttpClient,
      );
    } on StripeCheckoutException catch (e) {
      throw GrpcError.notFound('Could not load checkout session: ${e.message}');
    }

    if (sessionInfo.paymentStatus != 'paid') {
      throw GrpcError.failedPrecondition(
        'Session is not paid yet (status: ${sessionInfo.paymentStatus})',
      );
    }

    final firmIdFromSession = sessionInfo.metadata['firmId'] ?? '';
    if (firmIdFromSession != userPermission.firmId) {
      throw GrpcError.permissionDenied(
        'This checkout session does not belong to your firm',
      );
    }

    final catalogPriceId = sessionInfo.catalogPriceId;
    if (catalogPriceId.isEmpty) {
      throw GrpcError.internal('No price in checkout session');
    }

    final product = await databaseMiddleware<BillingProduct?>(
      _poolService,
      (db) async => _lookupBillingProductByStripePriceId(db, catalogPriceId),
    );
    if (product == null) {
      throw GrpcError.invalidArgument('Unknown price: $catalogPriceId');
    }

    if (isSyscohadaProductId(product.productId)) {
      final yearStr = sessionInfo.metadata['fiscalYear'] ?? '';
      final year = int.tryParse(yearStr) ?? 0;
      if (year == 0) {
        throw GrpcError.invalidArgument(
          'Checkout session missing fiscalYear metadata for SYSCOHADA purchase',
        );
      }
      log.logRpcEntry('fulfillFromStripeCheckoutSession', requestData: {
        'firmId': userPermission.firmId,
        'sessionId': sessionInfo.id,
        'productKind': 'syscohada',
        'fiscalYear': year,
      });
      final creditAppliedCents =
          int.tryParse(sessionInfo.metadata['creditAppliedCents'] ?? '') ?? 0;
      final referralCode = sessionInfo.metadata['referralCode'] ?? '';
      final response = await recordAccountingYearPurchase(
        firmId: userPermission.firmId,
        fiscalYear: year,
        stripeCheckoutSessionId: sessionInfo.id,
        product: product,
        referralCode: referralCode,
        creditAppliedCents: creditAppliedCents,
      );
      if (sessionInfo.customer != null && sessionInfo.customer!.isNotEmpty) {
        await _updateStripeCustomerId(userPermission.firmId, sessionInfo.customer!);
      }
      log.logRpcExit('fulfillFromStripeCheckoutSession');
      return response;
    }

    final licenseId = 'lic_stripe_${_sanitizeStripeSessionId(sessionInfo.id)}';

    int creditAppliedCents = 0;
    final creditStr = sessionInfo.metadata['creditAppliedCents'];
    if (creditStr != null && creditStr.isNotEmpty) {
      creditAppliedCents = int.tryParse(creditStr) ?? 0;
    }
    final referralCode = sessionInfo.metadata['referralCode'] ?? '';

    final termsForLicense = request.legalTermsVersionDate.trim();

    log.logRpcEntry('fulfillFromStripeCheckoutSession', requestData: {
      'firmId': userPermission.firmId,
      'sessionId': sessionInfo.id,
      'legalTermsVersionDate': termsForLicense,
    });

    final response = await _fulfillLicenseFromStripeInternal(
      userPermission.firmId,
      licenseId,
      product.licensePlan,
      product.stripeProductId,
      product.stripePriceId,
      product.maxUsers,
      stripeCustomerId: sessionInfo.customer,
      referralCode: referralCode.isNotEmpty ? referralCode : null,
      creditAppliedCents: creditAppliedCents,
      legalTermsVersionDate: termsForLicense,
    );

    log.logRpcExit('fulfillFromStripeCheckoutSession');
    return response;
  }

  @override
  Future<CreatePawapayCheckoutResponse> createPawapayCheckout(
      ServiceCall? call, CreatePawapayCheckoutRequest request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.create);

    if (request.productId.trim().isEmpty) {
      throw GrpcError.invalidArgument('productId is required');
    }
    if (request.returnUrl.trim().isEmpty) {
      throw GrpcError.invalidArgument('returnUrl is required');
    }
    _validateLegalTermsVersionDate(request.legalTermsVersionDate);

    final product = await databaseMiddleware<BillingProduct?>(_poolService, (db) async {
      return _lookupBillingProductByProductId(db, request.productId);
    });
    if (product == null) {
      throw GrpcError.invalidArgument('Unknown product: ${request.productId}');
    }
    if (isSyscohadaProductId(product.productId)) {
      try {
        validateFiscalYear(request.fiscalYear);
      } on ArgumentError catch (e) {
        throw GrpcError.invalidArgument('${e.message}');
      }
    }

    final referralCode = request.referralCode.trim();
    if (referralCode.isNotEmpty) {
      await databaseMiddleware<void>(_poolService, (db) async {
        await _assertValidReferralCode(
          db: db,
          buyerFirmId: userPermission.firmId,
          referralCode: referralCode,
        );
      });
    }

    final pricing = await databaseMiddleware<CheckoutPricing>(_poolService, (db) async {
      final firmDoc = await db
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', userPermission.firmId));
      final balance =
          (firmDoc?['referralCreditBalanceCents'] as num?)?.toInt() ?? 0;
      return checkoutPricing(
        catalogCents: product.amountCents,
        applyReferralDiscount: referralCode.isNotEmpty,
        requestedCreditCents: request.creditAppliedCents,
        availableCreditCents: balance,
      );
    });

    if (pricing.chargeCents <= 0) {
      if (pricing.creditAppliedCents <= 0) {
        throw GrpcError.failedPrecondition('nothing to charge');
      }
      await _fulfillPaidByWeebiCredit(
        firmId: userPermission.firmId,
        product: product,
        creditAppliedCents: pricing.creditAppliedCents,
        referralCode: referralCode,
        legalTermsVersionDate: request.legalTermsVersionDate.trim(),
        fiscalYear: isSyscohadaProductId(product.productId)
            ? request.fiscalYear
            : null,
      );
      return CreatePawapayCheckoutResponse()
        ..checkoutId = ''
        ..redirectUrl = request.returnUrl.trim();
    }

    final client = _requirePawapayClient();
    final checkoutId = generateUuidV4();

    final purchaserEmail = await databaseMiddleware<String?>(_poolService, (db) async {
      final userId = userPermission.userId.trim();
      if (userId.isEmpty) return null;
      final userDoc = await db
          .collection(FenceService.userCollectionName)
          .findOne(where.eq('userId', userId));
      final mail = userDoc?['mail'] as String?;
      final trimmed = mail?.trim();
      if (trimmed == null || trimmed.isEmpty) return null;
      return trimmed;
    });

    final countryAlpha2 = await databaseMiddleware<String?>(_poolService, (db) async {
      final firmDoc = await db
          .collection(FenceService.firmCollectionName)
          .findOne(where.eq('firmId', userPermission.firmId));
      final chainDocs = await db
          .collection(FenceService.boutiqueCollectionName)
          .find(where.eq('firmId', userPermission.firmId))
          .toList();
      final preferredChainIds = userPermission.hasLimitedAccess()
          ? userPermission.limitedAccess.chainIds.ids.toList()
          : <String>[];
      final preferredBoutiqueIds = userPermission.hasLimitedAccess()
          ? userPermission.limitedAccess.boutiqueIds.ids.toList()
          : <String>[];
      return resolveOrgPawapayCountryAlpha2(
        firmDoc: firmDoc,
        chainDocs: chainDocs.map((e) => Map<String, dynamic>.from(e)),
        preferredChainIds: preferredChainIds,
        preferredBoutiqueIds: preferredBoutiqueIds,
      );
    });
    if (countryAlpha2 == null || countryAlpha2.isEmpty) {
      throw GrpcError.failedPrecondition(
        'Set a boutique address country (ISO alpha-2) or CDF billing currency before paying with mobile money',
      );
    }

    final metaFields = <String, String>{
      'firmId': userPermission.firmId,
      'productId': product.productId,
      'productKind':
          isSyscohadaProductId(product.productId) ? 'syscohada' : 'license',
      'legalTermsVersionDate': request.legalTermsVersionDate.trim(),
      'countryAlpha2': countryAlpha2,
    };
    if (isSyscohadaProductId(product.productId)) {
      metaFields['fiscalYear'] = request.fiscalYear.toString();
    }
    if (referralCode.isNotEmpty) {
      metaFields['referralCode'] = referralCode;
    }
    if (pricing.creditAppliedCents > 0) {
      metaFields['creditAppliedCents'] = pricing.creditAppliedCents.toString();
    }
    if (purchaserEmail != null) {
      metaFields['purchaserEmail'] = purchaserEmail;
    }

    final catalogAmounts = <String, int>{
      for (final e in product.pawapayAmounts.entries) e.key: e.value,
    };
    if (catalogAmounts.isEmpty) {
      // Transition: seed via tool/seed_pawapay_amounts.dart — defaults until migrated.
      catalogAmounts.addAll(defaultPawapayAmountsForProduct(product.productId));
    }
    if (catalogAmounts.isEmpty) {
      throw GrpcError.failedPrecondition(
        'billing_products.${product.productId} has no pawapayAmounts; run seed_pawapay_amounts.dart',
      );
    }

    final PawapayAmount amount;
    try {
      final base = buildPawapayAmountForCountry(
        productId: product.productId,
        countryAlpha2Or3: countryAlpha2,
        pawapayAmounts: catalogAmounts,
        applyReferralBuyerDiscount: false,
      );
      final catalogLocal = int.parse(base.amount);
      final chargeLocal = localChargeAfterCredit(
        localCatalog: catalogLocal,
        catalogEurCents: product.amountCents,
        applyReferralDiscount: referralCode.isNotEmpty,
        creditEurCents: pricing.creditAppliedCents,
      );
      if (chargeLocal <= 0) {
        throw GrpcError.failedPrecondition('nothing to charge');
      }
      amount = PawapayAmount(
        country: base.country,
        currency: base.currency,
        amount: chargeLocal.toString(),
      );
    } on ArgumentError catch (e) {
      throw GrpcError.failedPrecondition('${e.message}');
    }

    log.logRpcEntry('createPawapayCheckout', requestData: {
      'firmId': userPermission.firmId,
      'productId': product.productId,
      'checkoutId': checkoutId,
      'country': amount.country,
    });

    try {
      final returnUrl =
          appendCheckoutIdToReturnUrl(request.returnUrl.trim(), checkoutId);
      final created = await client.initiateCheckout(
        checkoutId: checkoutId,
        returnUrl: returnUrl,
        amounts: [amount],
        countries: [amount.country],
        metadata: buildPawapayMetadata(metaFields),
      );
      if (created.redirectUrl.isEmpty) {
        throw GrpcError.internal('PawaPay returned empty redirectUrl');
      }
      log.logRpcExit('createPawapayCheckout');
      return CreatePawapayCheckoutResponse()
        ..checkoutId = created.checkoutId
        ..redirectUrl = created.redirectUrl;
    } on PawapayCheckoutException catch (e) {
      throw GrpcError.internal(e.message);
    }
  }

  @override
  Future<CreateLicenseResponse> fulfillLicenseFromPawapay(
      ServiceCall? call, FulfillLicenseFromPawapayRequest request) async {
    final bearer = call!.bearer;
    final token = bearer.startsWith('Bearer ') ? bearer.substring(7) : bearer;
    final jwt = JsonWebToken.parse(token);
    if (!jwt.isServiceAccount) {
      throw GrpcError.permissionDenied(
        'fulfillLicenseFromPawapay requires service account',
      );
    }

    final product = await databaseMiddleware<BillingProduct?>(_poolService, (db) async {
      return _lookupBillingProductByProductId(db, request.productId);
    });
    if (product == null) {
      throw GrpcError.invalidArgument('unknown product: ${request.productId}');
    }

    if (isSyscohadaProductId(product.productId)) {
      final year = request.fiscalYear;
      if (year == 0) {
        throw GrpcError.invalidArgument(
          'fiscalYear is required for SYSCOHADA purchases',
        );
      }
      final checkoutId = request.checkoutId.isNotEmpty
          ? request.checkoutId
          : request.licenseId;
      return recordAccountingYearPurchase(
        firmId: request.firmId,
        fiscalYear: year,
        pawapayCheckoutId: checkoutId,
        product: product,
        paymentProvider: PaymentProvider.PAYMENT_PROVIDER_PAWAPAY,
      );
    }

    final licenseId = request.licenseId.isNotEmpty
        ? request.licenseId
        : 'lic_pawapay_${_sanitizeStripeSessionId(request.checkoutId)}';

    return _fulfillLicenseInternal(
      request.firmId,
      licenseId,
      product.licensePlan,
      product.pawapayProductId.isNotEmpty
          ? product.pawapayProductId
          : product.productId,
      request.checkoutId,
      product.maxUsers,
      paymentProvider: PaymentProvider.PAYMENT_PROVIDER_PAWAPAY,
      referralCode:
          request.referralCode.isNotEmpty ? request.referralCode : null,
      creditAppliedCents: request.creditAppliedCents,
      legalTermsVersionDate: request.legalTermsVersionDate.isNotEmpty
          ? request.legalTermsVersionDate
          : null,
    );
  }

  @override
  Future<CreateLicenseResponse> fulfillFromPawapayCheckout(
      ServiceCall? call, FulfillFromPawapayCheckoutRequest request) async {
    final log = _logger.withContext(call);
    final userPermission = _userPermissions(call);
    _requireFirmId(userPermission);
    _requireBillingRight(userPermission, Right.create);

    if (request.checkoutId.trim().isEmpty) {
      throw GrpcError.invalidArgument('checkoutId is required');
    }
    _validateLegalTermsVersionDate(request.legalTermsVersionDate);

    final client = _requirePawapayClient();
    PawapayCheckoutInfo info;
    try {
      info = await client.fetchCheckout(request.checkoutId.trim());
    } on PawapayCheckoutException catch (e) {
      throw GrpcError.notFound('Could not load PawaPay checkout: ${e.message}');
    }

    if (!info.isCompleted) {
      throw GrpcError.failedPrecondition(
        'Checkout is not completed yet (status: ${info.status})',
      );
    }

    final firmIdFromMeta = info.metadata['firmId'] ?? '';
    if (firmIdFromMeta != userPermission.firmId) {
      throw GrpcError.permissionDenied(
        'This checkout does not belong to your firm',
      );
    }

    final productId = info.metadata['productId'] ?? '';
    if (productId.isEmpty) {
      throw GrpcError.internal('No productId in checkout metadata');
    }

    final product = await databaseMiddleware<BillingProduct?>(_poolService, (db) async {
      return _lookupBillingProductByProductId(db, productId);
    });
    if (product == null) {
      throw GrpcError.invalidArgument('Unknown product: $productId');
    }

    final termsForLicense = request.legalTermsVersionDate.trim();
    final creditAppliedCents =
        int.tryParse(info.metadata['creditAppliedCents'] ?? '') ?? 0;
    final referralCode = info.metadata['referralCode'] ?? '';

    if (isSyscohadaProductId(product.productId)) {
      final year = int.tryParse(info.metadata['fiscalYear'] ?? '') ?? 0;
      if (year == 0) {
        throw GrpcError.invalidArgument(
          'Checkout missing fiscalYear metadata for SYSCOHADA purchase',
        );
      }
      log.logRpcEntry('fulfillFromPawapayCheckout', requestData: {
        'firmId': userPermission.firmId,
        'checkoutId': info.checkoutId,
        'productKind': 'syscohada',
        'fiscalYear': year,
      });
      final response = await recordAccountingYearPurchase(
        firmId: userPermission.firmId,
        fiscalYear: year,
        pawapayCheckoutId: info.checkoutId,
        product: product,
        paymentProvider: PaymentProvider.PAYMENT_PROVIDER_PAWAPAY,
        referralCode: referralCode,
        creditAppliedCents: creditAppliedCents,
      );
      log.logRpcExit('fulfillFromPawapayCheckout');
      return response;
    }

    final licenseId =
        'lic_pawapay_${_sanitizeStripeSessionId(info.checkoutId)}';
    log.logRpcEntry('fulfillFromPawapayCheckout', requestData: {
      'firmId': userPermission.firmId,
      'checkoutId': info.checkoutId,
    });

    final response = await _fulfillLicenseInternal(
      userPermission.firmId,
      licenseId,
      product.licensePlan,
      product.pawapayProductId.isNotEmpty
          ? product.pawapayProductId
          : product.productId,
      info.checkoutId,
      product.maxUsers,
      paymentProvider: PaymentProvider.PAYMENT_PROVIDER_PAWAPAY,
      referralCode: referralCode.isNotEmpty ? referralCode : null,
      creditAppliedCents: creditAppliedCents,
      legalTermsVersionDate: termsForLicense,
    );
    log.logRpcExit('fulfillFromPawapayCheckout');
    return response;
  }

  static String _sanitizeStripeSessionId(String sessionId) {
    return sessionId.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
  }
}
