// This is a generated file - do not edit.
//
// Generated from evaluation_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common/country.pb.dart' as $2;
import 'common/g_timestamp.pb.dart' as $3;
import 'common/phone.pb.dart' as $1;
import 'evaluation_service.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'evaluation_service.pbenum.dart';

/// / ISO 4217 amount (loan request, etc.). Currency from country mapping on the client.
class MoneyAmount extends $pb.GeneratedMessage {
  factory MoneyAmount({
    $fixnum.Int64? amountMinor,
    $core.String? currency,
  }) {
    final result = create();
    if (amountMinor != null) result.amountMinor = amountMinor;
    if (currency != null) result.currency = currency;
    return result;
  }

  MoneyAmount._();

  factory MoneyAmount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MoneyAmount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MoneyAmount',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.evaluation.service'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'amountMinor')
    ..aOS(2, _omitFieldNames ? '' : 'currency')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MoneyAmount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MoneyAmount copyWith(void Function(MoneyAmount) updates) =>
      super.copyWith((message) => updates(message as MoneyAmount))
          as MoneyAmount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoneyAmount create() => MoneyAmount._();
  @$core.override
  MoneyAmount createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MoneyAmount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MoneyAmount>(create);
  static MoneyAmount? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amountMinor => $_getI64(0);
  @$pb.TagNumber(1)
  set amountMinor($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmountMinor() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmountMinor() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get currency => $_getSZ(1);
  @$pb.TagNumber(2)
  set currency($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrency() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrency() => $_clearField(2);
}

class PhoneContact extends $pb.GeneratedMessage {
  factory PhoneContact({
    $1.Phone? phone,
    $2.Country? country,
    $core.String? city,
    $core.String? merchantName,
  }) {
    final result = create();
    if (phone != null) result.phone = phone;
    if (country != null) result.country = country;
    if (city != null) result.city = city;
    if (merchantName != null) result.merchantName = merchantName;
    return result;
  }

  PhoneContact._();

  factory PhoneContact.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PhoneContact.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PhoneContact',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.evaluation.service'),
      createEmptyInstance: create)
    ..aOM<$1.Phone>(1, _omitFieldNames ? '' : 'phone',
        subBuilder: $1.Phone.create)
    ..aOM<$2.Country>(2, _omitFieldNames ? '' : 'country',
        subBuilder: $2.Country.create)
    ..aOS(3, _omitFieldNames ? '' : 'city')
    ..aOS(4, _omitFieldNames ? '' : 'merchantName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhoneContact clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhoneContact copyWith(void Function(PhoneContact) updates) =>
      super.copyWith((message) => updates(message as PhoneContact))
          as PhoneContact;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhoneContact create() => PhoneContact._();
  @$core.override
  PhoneContact createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PhoneContact getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PhoneContact>(create);
  static PhoneContact? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Phone get phone => $_getN(0);
  @$pb.TagNumber(1)
  set phone($1.Phone value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhone() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Phone ensurePhone() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.Country get country => $_getN(1);
  @$pb.TagNumber(2)
  set country($2.Country value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCountry() => $_has(1);
  @$pb.TagNumber(2)
  void clearCountry() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Country ensureCountry() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get city => $_getSZ(2);
  @$pb.TagNumber(3)
  set city($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCity() => $_has(2);
  @$pb.TagNumber(3)
  void clearCity() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get merchantName => $_getSZ(3);
  @$pb.TagNumber(4)
  set merchantName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMerchantName() => $_has(3);
  @$pb.TagNumber(4)
  void clearMerchantName() => $_clearField(4);
}

class RegistrationDetails extends $pb.GeneratedMessage {
  factory RegistrationDetails({
    $core.String? commercialRegisterNumber,
    LegalForm? legalForm,
  }) {
    final result = create();
    if (commercialRegisterNumber != null)
      result.commercialRegisterNumber = commercialRegisterNumber;
    if (legalForm != null) result.legalForm = legalForm;
    return result;
  }

  RegistrationDetails._();

  factory RegistrationDetails.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegistrationDetails.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegistrationDetails',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.evaluation.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'commercialRegisterNumber')
    ..aE<LegalForm>(2, _omitFieldNames ? '' : 'legalForm',
        enumValues: LegalForm.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegistrationDetails clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegistrationDetails copyWith(void Function(RegistrationDetails) updates) =>
      super.copyWith((message) => updates(message as RegistrationDetails))
          as RegistrationDetails;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegistrationDetails create() => RegistrationDetails._();
  @$core.override
  RegistrationDetails createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RegistrationDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegistrationDetails>(create);
  static RegistrationDetails? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get commercialRegisterNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set commercialRegisterNumber($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCommercialRegisterNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommercialRegisterNumber() => $_clearField(1);

  @$pb.TagNumber(2)
  LegalForm get legalForm => $_getN(1);
  @$pb.TagNumber(2)
  set legalForm(LegalForm value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLegalForm() => $_has(1);
  @$pb.TagNumber(2)
  void clearLegalForm() => $_clearField(2);
}

/// / Immutable core (identity / activity) + Q1–Q5 + optional loan ask.
class BusinessDiagnostic extends $pb.GeneratedMessage {
  factory BusinessDiagnostic({
    $core.String? activityIsicCode,
    $core.String? activitySubCode,
    $core.bool? isRegistered,
    ShopTenure? shopTenure,
    SupplierCredit? supplierCredit,
    CashSeparation? cashSeparation,
    CustomerCreditTracking? customerCreditTracking,
    RestockFrequency? restockFrequency,
    $core.bool? wantsLoan,
    MoneyAmount? requestedLoanAmount,
    RegistrationDetails? registration,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? clientExtras,
  }) {
    final result = create();
    if (activityIsicCode != null) result.activityIsicCode = activityIsicCode;
    if (activitySubCode != null) result.activitySubCode = activitySubCode;
    if (isRegistered != null) result.isRegistered = isRegistered;
    if (shopTenure != null) result.shopTenure = shopTenure;
    if (supplierCredit != null) result.supplierCredit = supplierCredit;
    if (cashSeparation != null) result.cashSeparation = cashSeparation;
    if (customerCreditTracking != null)
      result.customerCreditTracking = customerCreditTracking;
    if (restockFrequency != null) result.restockFrequency = restockFrequency;
    if (wantsLoan != null) result.wantsLoan = wantsLoan;
    if (requestedLoanAmount != null)
      result.requestedLoanAmount = requestedLoanAmount;
    if (registration != null) result.registration = registration;
    if (clientExtras != null) result.clientExtras.addEntries(clientExtras);
    return result;
  }

  BusinessDiagnostic._();

  factory BusinessDiagnostic.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BusinessDiagnostic.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BusinessDiagnostic',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.evaluation.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'activityIsicCode')
    ..aOS(2, _omitFieldNames ? '' : 'activitySubCode')
    ..aOB(3, _omitFieldNames ? '' : 'isRegistered')
    ..aE<ShopTenure>(4, _omitFieldNames ? '' : 'shopTenure',
        enumValues: ShopTenure.values)
    ..aE<SupplierCredit>(5, _omitFieldNames ? '' : 'supplierCredit',
        enumValues: SupplierCredit.values)
    ..aE<CashSeparation>(6, _omitFieldNames ? '' : 'cashSeparation',
        enumValues: CashSeparation.values)
    ..aE<CustomerCreditTracking>(
        7, _omitFieldNames ? '' : 'customerCreditTracking',
        enumValues: CustomerCreditTracking.values)
    ..aE<RestockFrequency>(8, _omitFieldNames ? '' : 'restockFrequency',
        enumValues: RestockFrequency.values)
    ..aOB(9, _omitFieldNames ? '' : 'wantsLoan')
    ..aOM<MoneyAmount>(10, _omitFieldNames ? '' : 'requestedLoanAmount',
        subBuilder: MoneyAmount.create)
    ..aOM<RegistrationDetails>(11, _omitFieldNames ? '' : 'registration',
        subBuilder: RegistrationDetails.create)
    ..m<$core.String, $core.String>(12, _omitFieldNames ? '' : 'clientExtras',
        entryClassName: 'BusinessDiagnostic.ClientExtrasEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('weebi.evaluation.service'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusinessDiagnostic clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusinessDiagnostic copyWith(void Function(BusinessDiagnostic) updates) =>
      super.copyWith((message) => updates(message as BusinessDiagnostic))
          as BusinessDiagnostic;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusinessDiagnostic create() => BusinessDiagnostic._();
  @$core.override
  BusinessDiagnostic createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BusinessDiagnostic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusinessDiagnostic>(create);
  static BusinessDiagnostic? _defaultInstance;

  /// --- identity / activity (always asked) ---
  @$pb.TagNumber(1)
  $core.String get activityIsicCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set activityIsicCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActivityIsicCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityIsicCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get activitySubCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set activitySubCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasActivitySubCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearActivitySubCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isRegistered => $_getBF(2);
  @$pb.TagNumber(3)
  set isRegistered($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsRegistered() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsRegistered() => $_clearField(3);

  /// --- Q1–Q5 ---
  @$pb.TagNumber(4)
  ShopTenure get shopTenure => $_getN(3);
  @$pb.TagNumber(4)
  set shopTenure(ShopTenure value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasShopTenure() => $_has(3);
  @$pb.TagNumber(4)
  void clearShopTenure() => $_clearField(4);

  @$pb.TagNumber(5)
  SupplierCredit get supplierCredit => $_getN(4);
  @$pb.TagNumber(5)
  set supplierCredit(SupplierCredit value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSupplierCredit() => $_has(4);
  @$pb.TagNumber(5)
  void clearSupplierCredit() => $_clearField(5);

  @$pb.TagNumber(6)
  CashSeparation get cashSeparation => $_getN(5);
  @$pb.TagNumber(6)
  set cashSeparation(CashSeparation value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCashSeparation() => $_has(5);
  @$pb.TagNumber(6)
  void clearCashSeparation() => $_clearField(6);

  @$pb.TagNumber(7)
  CustomerCreditTracking get customerCreditTracking => $_getN(6);
  @$pb.TagNumber(7)
  set customerCreditTracking(CustomerCreditTracking value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCustomerCreditTracking() => $_has(6);
  @$pb.TagNumber(7)
  void clearCustomerCreditTracking() => $_clearField(7);

  @$pb.TagNumber(8)
  RestockFrequency get restockFrequency => $_getN(7);
  @$pb.TagNumber(8)
  set restockFrequency(RestockFrequency value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasRestockFrequency() => $_has(7);
  @$pb.TagNumber(8)
  void clearRestockFrequency() => $_clearField(8);

  /// --- financing ask (collection only) ---
  @$pb.TagNumber(9)
  $core.bool get wantsLoan => $_getBF(8);
  @$pb.TagNumber(9)
  set wantsLoan($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasWantsLoan() => $_has(8);
  @$pb.TagNumber(9)
  void clearWantsLoan() => $_clearField(9);

  @$pb.TagNumber(10)
  MoneyAmount get requestedLoanAmount => $_getN(9);
  @$pb.TagNumber(10)
  set requestedLoanAmount(MoneyAmount value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasRequestedLoanAmount() => $_has(9);
  @$pb.TagNumber(10)
  void clearRequestedLoanAmount() => $_clearField(10);
  @$pb.TagNumber(10)
  MoneyAmount ensureRequestedLoanAmount() => $_ensure(9);

  @$pb.TagNumber(11)
  RegistrationDetails get registration => $_getN(10);
  @$pb.TagNumber(11)
  set registration(RegistrationDetails value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasRegistration() => $_has(10);
  @$pb.TagNumber(11)
  void clearRegistration() => $_clearField(11);
  @$pb.TagNumber(11)
  RegistrationDetails ensureRegistration() => $_ensure(10);

  @$pb.TagNumber(12)
  $pb.PbMap<$core.String, $core.String> get clientExtras => $_getMap(11);
}

class SubmitEvaluationRequest extends $pb.GeneratedMessage {
  factory SubmitEvaluationRequest({
    PhoneContact? contact,
    BusinessDiagnostic? diagnostic,
    $core.String? campaignId,
  }) {
    final result = create();
    if (contact != null) result.contact = contact;
    if (diagnostic != null) result.diagnostic = diagnostic;
    if (campaignId != null) result.campaignId = campaignId;
    return result;
  }

  SubmitEvaluationRequest._();

  factory SubmitEvaluationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitEvaluationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitEvaluationRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.evaluation.service'),
      createEmptyInstance: create)
    ..aOM<PhoneContact>(1, _omitFieldNames ? '' : 'contact',
        subBuilder: PhoneContact.create)
    ..aOM<BusinessDiagnostic>(2, _omitFieldNames ? '' : 'diagnostic',
        subBuilder: BusinessDiagnostic.create)
    ..aOS(3, _omitFieldNames ? '' : 'campaignId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitEvaluationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitEvaluationRequest copyWith(
          void Function(SubmitEvaluationRequest) updates) =>
      super.copyWith((message) => updates(message as SubmitEvaluationRequest))
          as SubmitEvaluationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitEvaluationRequest create() => SubmitEvaluationRequest._();
  @$core.override
  SubmitEvaluationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitEvaluationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitEvaluationRequest>(create);
  static SubmitEvaluationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  PhoneContact get contact => $_getN(0);
  @$pb.TagNumber(1)
  set contact(PhoneContact value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasContact() => $_has(0);
  @$pb.TagNumber(1)
  void clearContact() => $_clearField(1);
  @$pb.TagNumber(1)
  PhoneContact ensureContact() => $_ensure(0);

  @$pb.TagNumber(2)
  BusinessDiagnostic get diagnostic => $_getN(1);
  @$pb.TagNumber(2)
  set diagnostic(BusinessDiagnostic value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDiagnostic() => $_has(1);
  @$pb.TagNumber(2)
  void clearDiagnostic() => $_clearField(2);
  @$pb.TagNumber(2)
  BusinessDiagnostic ensureDiagnostic() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get campaignId => $_getSZ(2);
  @$pb.TagNumber(3)
  set campaignId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCampaignId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCampaignId() => $_clearField(3);
}

/// / Store-only ack — no financial_health_score (computed client-side).
class SubmitEvaluationResponse extends $pb.GeneratedMessage {
  factory SubmitEvaluationResponse({
    $core.String? evaluationId,
    $3.Timestamp? createdAt,
  }) {
    final result = create();
    if (evaluationId != null) result.evaluationId = evaluationId;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  SubmitEvaluationResponse._();

  factory SubmitEvaluationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitEvaluationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitEvaluationResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.evaluation.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'evaluationId')
    ..aOM<$3.Timestamp>(2, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitEvaluationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitEvaluationResponse copyWith(
          void Function(SubmitEvaluationResponse) updates) =>
      super.copyWith((message) => updates(message as SubmitEvaluationResponse))
          as SubmitEvaluationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitEvaluationResponse create() => SubmitEvaluationResponse._();
  @$core.override
  SubmitEvaluationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitEvaluationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitEvaluationResponse>(create);
  static SubmitEvaluationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get evaluationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set evaluationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEvaluationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvaluationId() => $_clearField(1);

  @$pb.TagNumber(2)
  $3.Timestamp get createdAt => $_getN(1);
  @$pb.TagNumber(2)
  set createdAt($3.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.Timestamp ensureCreatedAt() => $_ensure(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
