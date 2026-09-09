// This is a generated file - do not edit.
//
// Generated from billing_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/g_common.pb.dart' as $2;
import 'common/g_timestamp.pb.dart' as $4;
import 'license.pb.dart' as $3;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CreateLicenseRequest extends $pb.GeneratedMessage {
  factory CreateLicenseRequest({
    $3.License? license,
    $core.String? referralCode,
    $core.int? creditAppliedCents,
  }) {
    final result = create();
    if (license != null) result.license = license;
    if (referralCode != null) result.referralCode = referralCode;
    if (creditAppliedCents != null)
      result.creditAppliedCents = creditAppliedCents;
    return result;
  }

  CreateLicenseRequest._();

  factory CreateLicenseRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateLicenseRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateLicenseRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOM<$3.License>(1, _omitFieldNames ? '' : 'license',
        subBuilder: $3.License.create)
    ..aOS(2, _omitFieldNames ? '' : 'referralCode', protoName: 'referralCode')
    ..aI(3, _omitFieldNames ? '' : 'creditAppliedCents',
        protoName: 'creditAppliedCents')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateLicenseRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateLicenseRequest copyWith(void Function(CreateLicenseRequest) updates) =>
      super.copyWith((message) => updates(message as CreateLicenseRequest))
          as CreateLicenseRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLicenseRequest create() => CreateLicenseRequest._();
  @$core.override
  CreateLicenseRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateLicenseRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateLicenseRequest>(create);
  static CreateLicenseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $3.License get license => $_getN(0);
  @$pb.TagNumber(1)
  set license($3.License value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLicense() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicense() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.License ensureLicense() => $_ensure(0);

  /// / Referral code used by the buyer (e.g. from shopkeeper who referred them).
  @$pb.TagNumber(2)
  $core.String get referralCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set referralCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReferralCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearReferralCode() => $_clearField(2);

  /// / Amount of referral credit (cents) to apply. Deducted from buyer's firm balance.
  @$pb.TagNumber(3)
  $core.int get creditAppliedCents => $_getIZ(2);
  @$pb.TagNumber(3)
  set creditAppliedCents($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCreditAppliedCents() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreditAppliedCents() => $_clearField(3);
}

class CreateLicenseResponse extends $pb.GeneratedMessage {
  factory CreateLicenseResponse({
    $2.StatusResponse? statusResponse,
    $3.License? license,
  }) {
    final result = create();
    if (statusResponse != null) result.statusResponse = statusResponse;
    if (license != null) result.license = license;
    return result;
  }

  CreateLicenseResponse._();

  factory CreateLicenseResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateLicenseResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateLicenseResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOM<$2.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse',
        protoName: 'statusResponse', subBuilder: $2.StatusResponse.create)
    ..aOM<$3.License>(2, _omitFieldNames ? '' : 'license',
        subBuilder: $3.License.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateLicenseResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateLicenseResponse copyWith(
          void Function(CreateLicenseResponse) updates) =>
      super.copyWith((message) => updates(message as CreateLicenseResponse))
          as CreateLicenseResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLicenseResponse create() => CreateLicenseResponse._();
  @$core.override
  CreateLicenseResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateLicenseResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateLicenseResponse>(create);
  static CreateLicenseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $2.StatusResponse get statusResponse => $_getN(0);
  @$pb.TagNumber(1)
  set statusResponse($2.StatusResponse value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.License get license => $_getN(1);
  @$pb.TagNumber(2)
  set license($3.License value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLicense() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicense() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.License ensureLicense() => $_ensure(1);
}

class ReadLicensesResponse extends $pb.GeneratedMessage {
  factory ReadLicensesResponse({
    $core.Iterable<$3.License>? licenses,
  }) {
    final result = create();
    if (licenses != null) result.licenses.addAll(licenses);
    return result;
  }

  ReadLicensesResponse._();

  factory ReadLicensesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadLicensesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadLicensesResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..pPM<$3.License>(1, _omitFieldNames ? '' : 'licenses',
        subBuilder: $3.License.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadLicensesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadLicensesResponse copyWith(void Function(ReadLicensesResponse) updates) =>
      super.copyWith((message) => updates(message as ReadLicensesResponse))
          as ReadLicensesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadLicensesResponse create() => ReadLicensesResponse._();
  @$core.override
  ReadLicensesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReadLicensesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadLicensesResponse>(create);
  static ReadLicensesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$3.License> get licenses => $_getList(0);
}

class UpdateLicenseRequest extends $pb.GeneratedMessage {
  factory UpdateLicenseRequest({
    $core.String? licenseId,
    $3.License? license,
  }) {
    final result = create();
    if (licenseId != null) result.licenseId = licenseId;
    if (license != null) result.license = license;
    return result;
  }

  UpdateLicenseRequest._();

  factory UpdateLicenseRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateLicenseRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateLicenseRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'licenseId', protoName: 'licenseId')
    ..aOM<$3.License>(2, _omitFieldNames ? '' : 'license',
        subBuilder: $3.License.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateLicenseRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateLicenseRequest copyWith(void Function(UpdateLicenseRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateLicenseRequest))
          as UpdateLicenseRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLicenseRequest create() => UpdateLicenseRequest._();
  @$core.override
  UpdateLicenseRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateLicenseRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateLicenseRequest>(create);
  static UpdateLicenseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get licenseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set licenseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLicenseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $3.License get license => $_getN(1);
  @$pb.TagNumber(2)
  set license($3.License value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLicense() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicense() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.License ensureLicense() => $_ensure(1);
}

class DeleteLicenseRequest extends $pb.GeneratedMessage {
  factory DeleteLicenseRequest({
    $core.String? licenseId,
  }) {
    final result = create();
    if (licenseId != null) result.licenseId = licenseId;
    return result;
  }

  DeleteLicenseRequest._();

  factory DeleteLicenseRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteLicenseRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteLicenseRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'licenseId', protoName: 'licenseId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteLicenseRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteLicenseRequest copyWith(void Function(DeleteLicenseRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteLicenseRequest))
          as DeleteLicenseRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteLicenseRequest create() => DeleteLicenseRequest._();
  @$core.override
  DeleteLicenseRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteLicenseRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteLicenseRequest>(create);
  static DeleteLicenseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get licenseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set licenseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLicenseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseId() => $_clearField(1);
}

class UpdatePaymentCustomerIdRequest extends $pb.GeneratedMessage {
  factory UpdatePaymentCustomerIdRequest({
    $core.String? provider,
    $core.String? paymentCustomerId,
  }) {
    final result = create();
    if (provider != null) result.provider = provider;
    if (paymentCustomerId != null) result.paymentCustomerId = paymentCustomerId;
    return result;
  }

  UpdatePaymentCustomerIdRequest._();

  factory UpdatePaymentCustomerIdRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdatePaymentCustomerIdRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdatePaymentCustomerIdRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'provider')
    ..aOS(2, _omitFieldNames ? '' : 'paymentCustomerId',
        protoName: 'paymentCustomerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePaymentCustomerIdRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePaymentCustomerIdRequest copyWith(
          void Function(UpdatePaymentCustomerIdRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdatePaymentCustomerIdRequest))
          as UpdatePaymentCustomerIdRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePaymentCustomerIdRequest create() =>
      UpdatePaymentCustomerIdRequest._();
  @$core.override
  UpdatePaymentCustomerIdRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdatePaymentCustomerIdRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePaymentCustomerIdRequest>(create);
  static UpdatePaymentCustomerIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get provider => $_getSZ(0);
  @$pb.TagNumber(1)
  set provider($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProvider() => $_has(0);
  @$pb.TagNumber(1)
  void clearProvider() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get paymentCustomerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set paymentCustomerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPaymentCustomerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaymentCustomerId() => $_clearField(2);
}

class GetReferralInfoResponse extends $pb.GeneratedMessage {
  factory GetReferralInfoResponse({
    $core.String? referralCode,
    $core.int? creditBalanceCents,
    $core.int? minPayoutCents,
  }) {
    final result = create();
    if (referralCode != null) result.referralCode = referralCode;
    if (creditBalanceCents != null)
      result.creditBalanceCents = creditBalanceCents;
    if (minPayoutCents != null) result.minPayoutCents = minPayoutCents;
    return result;
  }

  GetReferralInfoResponse._();

  factory GetReferralInfoResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetReferralInfoResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetReferralInfoResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'referralCode', protoName: 'referralCode')
    ..aI(2, _omitFieldNames ? '' : 'creditBalanceCents',
        protoName: 'creditBalanceCents')
    ..aI(3, _omitFieldNames ? '' : 'minPayoutCents',
        protoName: 'minPayoutCents')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReferralInfoResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReferralInfoResponse copyWith(
          void Function(GetReferralInfoResponse) updates) =>
      super.copyWith((message) => updates(message as GetReferralInfoResponse))
          as GetReferralInfoResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetReferralInfoResponse create() => GetReferralInfoResponse._();
  @$core.override
  GetReferralInfoResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetReferralInfoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetReferralInfoResponse>(create);
  static GetReferralInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get referralCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set referralCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReferralCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearReferralCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get creditBalanceCents => $_getIZ(1);
  @$pb.TagNumber(2)
  set creditBalanceCents($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreditBalanceCents() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreditBalanceCents() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get minPayoutCents => $_getIZ(2);
  @$pb.TagNumber(3)
  set minPayoutCents($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMinPayoutCents() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinPayoutCents() => $_clearField(3);
}

class RequestReferralPayoutResponse extends $pb.GeneratedMessage {
  factory RequestReferralPayoutResponse({
    $2.StatusResponse? statusResponse,
    $core.int? amountCents,
  }) {
    final result = create();
    if (statusResponse != null) result.statusResponse = statusResponse;
    if (amountCents != null) result.amountCents = amountCents;
    return result;
  }

  RequestReferralPayoutResponse._();

  factory RequestReferralPayoutResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestReferralPayoutResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestReferralPayoutResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOM<$2.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse',
        protoName: 'statusResponse', subBuilder: $2.StatusResponse.create)
    ..aI(2, _omitFieldNames ? '' : 'amountCents', protoName: 'amountCents')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestReferralPayoutResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestReferralPayoutResponse copyWith(
          void Function(RequestReferralPayoutResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RequestReferralPayoutResponse))
          as RequestReferralPayoutResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestReferralPayoutResponse create() =>
      RequestReferralPayoutResponse._();
  @$core.override
  RequestReferralPayoutResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestReferralPayoutResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestReferralPayoutResponse>(create);
  static RequestReferralPayoutResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $2.StatusResponse get statusResponse => $_getN(0);
  @$pb.TagNumber(1)
  set statusResponse($2.StatusResponse value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get amountCents => $_getIZ(1);
  @$pb.TagNumber(2)
  set amountCents($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmountCents() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmountCents() => $_clearField(2);
}

class CreateCheckoutSessionRequest extends $pb.GeneratedMessage {
  factory CreateCheckoutSessionRequest({
    $core.String? priceId,
    $core.String? successUrl,
    $core.String? cancelUrl,
    $core.String? referralCode,
    $core.int? creditAppliedCents,
    $core.String? legalTermsVersionDate,
    $core.int? fiscalYear,
  }) {
    final result = create();
    if (priceId != null) result.priceId = priceId;
    if (successUrl != null) result.successUrl = successUrl;
    if (cancelUrl != null) result.cancelUrl = cancelUrl;
    if (referralCode != null) result.referralCode = referralCode;
    if (creditAppliedCents != null)
      result.creditAppliedCents = creditAppliedCents;
    if (legalTermsVersionDate != null)
      result.legalTermsVersionDate = legalTermsVersionDate;
    if (fiscalYear != null) result.fiscalYear = fiscalYear;
    return result;
  }

  CreateCheckoutSessionRequest._();

  factory CreateCheckoutSessionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCheckoutSessionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCheckoutSessionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'priceId', protoName: 'priceId')
    ..aOS(2, _omitFieldNames ? '' : 'successUrl', protoName: 'successUrl')
    ..aOS(3, _omitFieldNames ? '' : 'cancelUrl', protoName: 'cancelUrl')
    ..aOS(4, _omitFieldNames ? '' : 'referralCode', protoName: 'referralCode')
    ..aI(5, _omitFieldNames ? '' : 'creditAppliedCents',
        protoName: 'creditAppliedCents')
    ..aOS(6, _omitFieldNames ? '' : 'legalTermsVersionDate',
        protoName: 'legalTermsVersionDate')
    ..aI(7, _omitFieldNames ? '' : 'fiscalYear', protoName: 'fiscalYear')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCheckoutSessionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCheckoutSessionRequest copyWith(
          void Function(CreateCheckoutSessionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateCheckoutSessionRequest))
          as CreateCheckoutSessionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCheckoutSessionRequest create() =>
      CreateCheckoutSessionRequest._();
  @$core.override
  CreateCheckoutSessionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateCheckoutSessionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCheckoutSessionRequest>(create);
  static CreateCheckoutSessionRequest? _defaultInstance;

  /// / Stripe Price ID (from billing_products collection, e.g. readBillingProducts).
  @$pb.TagNumber(1)
  $core.String get priceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set priceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPriceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPriceId() => $_clearField(1);

  /// / URL to redirect after successful payment. May include {CHECKOUT_SESSION_ID}.
  @$pb.TagNumber(2)
  $core.String get successUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set successUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuccessUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessUrl() => $_clearField(2);

  /// / URL to redirect if customer cancels.
  @$pb.TagNumber(3)
  $core.String get cancelUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set cancelUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCancelUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearCancelUrl() => $_clearField(3);

  /// / Optional referral code to apply.
  @$pb.TagNumber(4)
  $core.String get referralCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set referralCode($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReferralCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearReferralCode() => $_clearField(4);

  /// / Optional credit (cents) to apply. Deducted from firm balance.
  @$pb.TagNumber(5)
  $core.int get creditAppliedCents => $_getIZ(4);
  @$pb.TagNumber(5)
  set creditAppliedCents($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreditAppliedCents() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreditAppliedCents() => $_clearField(5);

  /// / CGV / terms version the buyer accepted before checkout (YYYY-MM-DD, one revision per day).
  @$pb.TagNumber(6)
  $core.String get legalTermsVersionDate => $_getSZ(5);
  @$pb.TagNumber(6)
  set legalTermsVersionDate($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLegalTermsVersionDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearLegalTermsVersionDate() => $_clearField(6);

  /// / Fiscal/calendar year for punctual SYSCOHADA purchases (required when price is syscohada).
  @$pb.TagNumber(7)
  $core.int get fiscalYear => $_getIZ(6);
  @$pb.TagNumber(7)
  set fiscalYear($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasFiscalYear() => $_has(6);
  @$pb.TagNumber(7)
  void clearFiscalYear() => $_clearField(7);
}

class CreateCheckoutSessionResponse extends $pb.GeneratedMessage {
  factory CreateCheckoutSessionResponse({
    $core.String? checkoutUrl,
  }) {
    final result = create();
    if (checkoutUrl != null) result.checkoutUrl = checkoutUrl;
    return result;
  }

  CreateCheckoutSessionResponse._();

  factory CreateCheckoutSessionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCheckoutSessionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCheckoutSessionResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'checkoutUrl', protoName: 'checkoutUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCheckoutSessionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCheckoutSessionResponse copyWith(
          void Function(CreateCheckoutSessionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateCheckoutSessionResponse))
          as CreateCheckoutSessionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCheckoutSessionResponse create() =>
      CreateCheckoutSessionResponse._();
  @$core.override
  CreateCheckoutSessionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateCheckoutSessionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCheckoutSessionResponse>(create);
  static CreateCheckoutSessionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get checkoutUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set checkoutUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCheckoutUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearCheckoutUrl() => $_clearField(1);
}

/// / priceId is the single source of truth; billing_service maps it via billing_products collection.
class FulfillLicenseFromStripeRequest extends $pb.GeneratedMessage {
  factory FulfillLicenseFromStripeRequest({
    $core.String? firmId,
    $core.String? licenseId,
    $core.String? priceId,
    $core.String? stripeCustomerId,
    $core.String? referralCode,
    $core.int? creditAppliedCents,
    $core.String? legalTermsVersionDate,
    $core.int? fiscalYear,
  }) {
    final result = create();
    if (firmId != null) result.firmId = firmId;
    if (licenseId != null) result.licenseId = licenseId;
    if (priceId != null) result.priceId = priceId;
    if (stripeCustomerId != null) result.stripeCustomerId = stripeCustomerId;
    if (referralCode != null) result.referralCode = referralCode;
    if (creditAppliedCents != null)
      result.creditAppliedCents = creditAppliedCents;
    if (legalTermsVersionDate != null)
      result.legalTermsVersionDate = legalTermsVersionDate;
    if (fiscalYear != null) result.fiscalYear = fiscalYear;
    return result;
  }

  FulfillLicenseFromStripeRequest._();

  factory FulfillLicenseFromStripeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FulfillLicenseFromStripeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FulfillLicenseFromStripeRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'licenseId', protoName: 'licenseId')
    ..aOS(3, _omitFieldNames ? '' : 'priceId', protoName: 'priceId')
    ..aOS(4, _omitFieldNames ? '' : 'stripeCustomerId',
        protoName: 'stripeCustomerId')
    ..aOS(5, _omitFieldNames ? '' : 'referralCode', protoName: 'referralCode')
    ..aI(6, _omitFieldNames ? '' : 'creditAppliedCents',
        protoName: 'creditAppliedCents')
    ..aOS(7, _omitFieldNames ? '' : 'legalTermsVersionDate',
        protoName: 'legalTermsVersionDate')
    ..aI(8, _omitFieldNames ? '' : 'fiscalYear', protoName: 'fiscalYear')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FulfillLicenseFromStripeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FulfillLicenseFromStripeRequest copyWith(
          void Function(FulfillLicenseFromStripeRequest) updates) =>
      super.copyWith(
              (message) => updates(message as FulfillLicenseFromStripeRequest))
          as FulfillLicenseFromStripeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FulfillLicenseFromStripeRequest create() =>
      FulfillLicenseFromStripeRequest._();
  @$core.override
  FulfillLicenseFromStripeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FulfillLicenseFromStripeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FulfillLicenseFromStripeRequest>(
          create);
  static FulfillLicenseFromStripeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get licenseId => $_getSZ(1);
  @$pb.TagNumber(2)
  set licenseId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLicenseId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicenseId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get priceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set priceId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPriceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPriceId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get stripeCustomerId => $_getSZ(3);
  @$pb.TagNumber(4)
  set stripeCustomerId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStripeCustomerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStripeCustomerId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get referralCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set referralCode($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReferralCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearReferralCode() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get creditAppliedCents => $_getIZ(5);
  @$pb.TagNumber(6)
  set creditAppliedCents($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreditAppliedCents() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreditAppliedCents() => $_clearField(6);

  /// / CGV / terms version from checkout session metadata (YYYY-MM-DD).
  @$pb.TagNumber(7)
  $core.String get legalTermsVersionDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set legalTermsVersionDate($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLegalTermsVersionDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearLegalTermsVersionDate() => $_clearField(7);

  /// / Fiscal year for punctual SYSCOHADA fulfill (from Checkout Session metadata).
  @$pb.TagNumber(8)
  $core.int get fiscalYear => $_getIZ(7);
  @$pb.TagNumber(8)
  set fiscalYear($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasFiscalYear() => $_has(7);
  @$pb.TagNumber(8)
  void clearFiscalYear() => $_clearField(8);
}

/// / Request to fulfill a license from a Stripe Checkout Session (e.g. after success redirect).
class FulfillFromStripeCheckoutSessionRequest extends $pb.GeneratedMessage {
  factory FulfillFromStripeCheckoutSessionRequest({
    $core.String? checkoutSessionId,
    $core.String? legalTermsVersionDate,
  }) {
    final result = create();
    if (checkoutSessionId != null) result.checkoutSessionId = checkoutSessionId;
    if (legalTermsVersionDate != null)
      result.legalTermsVersionDate = legalTermsVersionDate;
    return result;
  }

  FulfillFromStripeCheckoutSessionRequest._();

  factory FulfillFromStripeCheckoutSessionRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FulfillFromStripeCheckoutSessionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FulfillFromStripeCheckoutSessionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'checkoutSessionId',
        protoName: 'checkoutSessionId')
    ..aOS(2, _omitFieldNames ? '' : 'legalTermsVersionDate',
        protoName: 'legalTermsVersionDate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FulfillFromStripeCheckoutSessionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FulfillFromStripeCheckoutSessionRequest copyWith(
          void Function(FulfillFromStripeCheckoutSessionRequest) updates) =>
      super.copyWith((message) =>
              updates(message as FulfillFromStripeCheckoutSessionRequest))
          as FulfillFromStripeCheckoutSessionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FulfillFromStripeCheckoutSessionRequest create() =>
      FulfillFromStripeCheckoutSessionRequest._();
  @$core.override
  FulfillFromStripeCheckoutSessionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FulfillFromStripeCheckoutSessionRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          FulfillFromStripeCheckoutSessionRequest>(create);
  static FulfillFromStripeCheckoutSessionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get checkoutSessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set checkoutSessionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCheckoutSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCheckoutSessionId() => $_clearField(1);

  /// / Same value as sent to createCheckoutSession (YYYY-MM-DD). Persisted on the license; not read from Stripe.
  @$pb.TagNumber(2)
  $core.String get legalTermsVersionDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set legalTermsVersionDate($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLegalTermsVersionDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearLegalTermsVersionDate() => $_clearField(2);
}

class CreatePawapayCheckoutRequest extends $pb.GeneratedMessage {
  factory CreatePawapayCheckoutRequest({
    $core.String? productId,
    $core.String? returnUrl,
    $core.String? referralCode,
    $core.int? creditAppliedCents,
    $core.String? legalTermsVersionDate,
    $core.int? fiscalYear,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (returnUrl != null) result.returnUrl = returnUrl;
    if (referralCode != null) result.referralCode = referralCode;
    if (creditAppliedCents != null)
      result.creditAppliedCents = creditAppliedCents;
    if (legalTermsVersionDate != null)
      result.legalTermsVersionDate = legalTermsVersionDate;
    if (fiscalYear != null) result.fiscalYear = fiscalYear;
    return result;
  }

  CreatePawapayCheckoutRequest._();

  factory CreatePawapayCheckoutRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePawapayCheckoutRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePawapayCheckoutRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId', protoName: 'productId')
    ..aOS(2, _omitFieldNames ? '' : 'returnUrl', protoName: 'returnUrl')
    ..aOS(3, _omitFieldNames ? '' : 'referralCode', protoName: 'referralCode')
    ..aI(4, _omitFieldNames ? '' : 'creditAppliedCents',
        protoName: 'creditAppliedCents')
    ..aOS(5, _omitFieldNames ? '' : 'legalTermsVersionDate',
        protoName: 'legalTermsVersionDate')
    ..aI(6, _omitFieldNames ? '' : 'fiscalYear', protoName: 'fiscalYear')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePawapayCheckoutRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePawapayCheckoutRequest copyWith(
          void Function(CreatePawapayCheckoutRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreatePawapayCheckoutRequest))
          as CreatePawapayCheckoutRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePawapayCheckoutRequest create() =>
      CreatePawapayCheckoutRequest._();
  @$core.override
  CreatePawapayCheckoutRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreatePawapayCheckoutRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePawapayCheckoutRequest>(create);
  static CreatePawapayCheckoutRequest? _defaultInstance;

  /// / Weebi product id from billing_products (e.g. "premium", "syscohada"). Not a Stripe priceId.
  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  /// / URL the customer is returned to after the hosted payment page (PawaPay returnUrl).
  @$pb.TagNumber(2)
  $core.String get returnUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set returnUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReturnUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearReturnUrl() => $_clearField(2);

  /// / Optional referral code to apply.
  @$pb.TagNumber(3)
  $core.String get referralCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set referralCode($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReferralCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearReferralCode() => $_clearField(3);

  /// / Optional credit (cents) to apply. Deducted from firm balance.
  @$pb.TagNumber(4)
  $core.int get creditAppliedCents => $_getIZ(3);
  @$pb.TagNumber(4)
  set creditAppliedCents($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreditAppliedCents() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreditAppliedCents() => $_clearField(4);

  /// / CGV / terms version the buyer accepted before checkout (YYYY-MM-DD).
  @$pb.TagNumber(5)
  $core.String get legalTermsVersionDate => $_getSZ(4);
  @$pb.TagNumber(5)
  set legalTermsVersionDate($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLegalTermsVersionDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearLegalTermsVersionDate() => $_clearField(5);

  /// / Fiscal/calendar year for punctual SYSCOHADA purchases (required when productId is syscohada).
  @$pb.TagNumber(6)
  $core.int get fiscalYear => $_getIZ(5);
  @$pb.TagNumber(6)
  set fiscalYear($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFiscalYear() => $_has(5);
  @$pb.TagNumber(6)
  void clearFiscalYear() => $_clearField(6);
}

class CreatePawapayCheckoutResponse extends $pb.GeneratedMessage {
  factory CreatePawapayCheckoutResponse({
    $core.String? checkoutId,
    $core.String? redirectUrl,
  }) {
    final result = create();
    if (checkoutId != null) result.checkoutId = checkoutId;
    if (redirectUrl != null) result.redirectUrl = redirectUrl;
    return result;
  }

  CreatePawapayCheckoutResponse._();

  factory CreatePawapayCheckoutResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePawapayCheckoutResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePawapayCheckoutResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'checkoutId', protoName: 'checkoutId')
    ..aOS(2, _omitFieldNames ? '' : 'redirectUrl', protoName: 'redirectUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePawapayCheckoutResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePawapayCheckoutResponse copyWith(
          void Function(CreatePawapayCheckoutResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreatePawapayCheckoutResponse))
          as CreatePawapayCheckoutResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePawapayCheckoutResponse create() =>
      CreatePawapayCheckoutResponse._();
  @$core.override
  CreatePawapayCheckoutResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreatePawapayCheckoutResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePawapayCheckoutResponse>(create);
  static CreatePawapayCheckoutResponse? _defaultInstance;

  /// / UUIDv4 checkout id (also used as licenseId suffix: lic_pawapay_{checkoutId}).
  @$pb.TagNumber(1)
  $core.String get checkoutId => $_getSZ(0);
  @$pb.TagNumber(1)
  set checkoutId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCheckoutId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCheckoutId() => $_clearField(1);

  /// / Hosted payment page URL — redirect the customer here.
  @$pb.TagNumber(2)
  $core.String get redirectUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set redirectUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRedirectUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearRedirectUrl() => $_clearField(2);
}

/// / productId is the source of truth; billing_service maps it via billing_products.
class FulfillLicenseFromPawapayRequest extends $pb.GeneratedMessage {
  factory FulfillLicenseFromPawapayRequest({
    $core.String? firmId,
    $core.String? licenseId,
    $core.String? checkoutId,
    $core.String? productId,
    $core.String? referralCode,
    $core.int? creditAppliedCents,
    $core.String? legalTermsVersionDate,
    $core.int? fiscalYear,
  }) {
    final result = create();
    if (firmId != null) result.firmId = firmId;
    if (licenseId != null) result.licenseId = licenseId;
    if (checkoutId != null) result.checkoutId = checkoutId;
    if (productId != null) result.productId = productId;
    if (referralCode != null) result.referralCode = referralCode;
    if (creditAppliedCents != null)
      result.creditAppliedCents = creditAppliedCents;
    if (legalTermsVersionDate != null)
      result.legalTermsVersionDate = legalTermsVersionDate;
    if (fiscalYear != null) result.fiscalYear = fiscalYear;
    return result;
  }

  FulfillLicenseFromPawapayRequest._();

  factory FulfillLicenseFromPawapayRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FulfillLicenseFromPawapayRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FulfillLicenseFromPawapayRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'licenseId', protoName: 'licenseId')
    ..aOS(3, _omitFieldNames ? '' : 'checkoutId', protoName: 'checkoutId')
    ..aOS(4, _omitFieldNames ? '' : 'productId', protoName: 'productId')
    ..aOS(5, _omitFieldNames ? '' : 'referralCode', protoName: 'referralCode')
    ..aI(6, _omitFieldNames ? '' : 'creditAppliedCents',
        protoName: 'creditAppliedCents')
    ..aOS(7, _omitFieldNames ? '' : 'legalTermsVersionDate',
        protoName: 'legalTermsVersionDate')
    ..aI(8, _omitFieldNames ? '' : 'fiscalYear', protoName: 'fiscalYear')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FulfillLicenseFromPawapayRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FulfillLicenseFromPawapayRequest copyWith(
          void Function(FulfillLicenseFromPawapayRequest) updates) =>
      super.copyWith(
              (message) => updates(message as FulfillLicenseFromPawapayRequest))
          as FulfillLicenseFromPawapayRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FulfillLicenseFromPawapayRequest create() =>
      FulfillLicenseFromPawapayRequest._();
  @$core.override
  FulfillLicenseFromPawapayRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FulfillLicenseFromPawapayRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FulfillLicenseFromPawapayRequest>(
          create);
  static FulfillLicenseFromPawapayRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => $_clearField(1);

  /// / Deterministic license id, e.g. lic_pawapay_{checkoutId}.
  @$pb.TagNumber(2)
  $core.String get licenseId => $_getSZ(1);
  @$pb.TagNumber(2)
  set licenseId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLicenseId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicenseId() => $_clearField(2);

  /// / PawaPay checkout UUID (idempotency / reconciliation key).
  @$pb.TagNumber(3)
  $core.String get checkoutId => $_getSZ(2);
  @$pb.TagNumber(3)
  set checkoutId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCheckoutId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCheckoutId() => $_clearField(3);

  /// / Weebi product id (e.g. "premium", "syscohada").
  @$pb.TagNumber(4)
  $core.String get productId => $_getSZ(3);
  @$pb.TagNumber(4)
  set productId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasProductId() => $_has(3);
  @$pb.TagNumber(4)
  void clearProductId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get referralCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set referralCode($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReferralCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearReferralCode() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get creditAppliedCents => $_getIZ(5);
  @$pb.TagNumber(6)
  set creditAppliedCents($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreditAppliedCents() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreditAppliedCents() => $_clearField(6);

  /// / CGV / terms version from checkout metadata (YYYY-MM-DD).
  @$pb.TagNumber(7)
  $core.String get legalTermsVersionDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set legalTermsVersionDate($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLegalTermsVersionDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearLegalTermsVersionDate() => $_clearField(7);

  /// / Fiscal year for punctual SYSCOHADA fulfill.
  @$pb.TagNumber(8)
  $core.int get fiscalYear => $_getIZ(7);
  @$pb.TagNumber(8)
  set fiscalYear($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasFiscalYear() => $_has(7);
  @$pb.TagNumber(8)
  void clearFiscalYear() => $_clearField(8);
}

/// / Request to fulfill a license from a completed PawaPay checkout (e.g. after returnUrl).
class FulfillFromPawapayCheckoutRequest extends $pb.GeneratedMessage {
  factory FulfillFromPawapayCheckoutRequest({
    $core.String? checkoutId,
    $core.String? legalTermsVersionDate,
  }) {
    final result = create();
    if (checkoutId != null) result.checkoutId = checkoutId;
    if (legalTermsVersionDate != null)
      result.legalTermsVersionDate = legalTermsVersionDate;
    return result;
  }

  FulfillFromPawapayCheckoutRequest._();

  factory FulfillFromPawapayCheckoutRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FulfillFromPawapayCheckoutRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FulfillFromPawapayCheckoutRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'checkoutId', protoName: 'checkoutId')
    ..aOS(2, _omitFieldNames ? '' : 'legalTermsVersionDate',
        protoName: 'legalTermsVersionDate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FulfillFromPawapayCheckoutRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FulfillFromPawapayCheckoutRequest copyWith(
          void Function(FulfillFromPawapayCheckoutRequest) updates) =>
      super.copyWith((message) =>
              updates(message as FulfillFromPawapayCheckoutRequest))
          as FulfillFromPawapayCheckoutRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FulfillFromPawapayCheckoutRequest create() =>
      FulfillFromPawapayCheckoutRequest._();
  @$core.override
  FulfillFromPawapayCheckoutRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FulfillFromPawapayCheckoutRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FulfillFromPawapayCheckoutRequest>(
          create);
  static FulfillFromPawapayCheckoutRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get checkoutId => $_getSZ(0);
  @$pb.TagNumber(1)
  set checkoutId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCheckoutId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCheckoutId() => $_clearField(1);

  /// / Same value as sent to createPawapayCheckout (YYYY-MM-DD). Persisted on the license.
  @$pb.TagNumber(2)
  $core.String get legalTermsVersionDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set legalTermsVersionDate($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLegalTermsVersionDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearLegalTermsVersionDate() => $_clearField(2);
}

/// / Billing product (license plan). Stored in billing_products collection.
/// / Single source of truth for price mapping; replaces STRIPE_PRICE_* and STRIPE_PRODUCT_* env vars.
class BillingProduct extends $pb.GeneratedMessage {
  factory BillingProduct({
    $core.String? productId,
    $3.LicensePlan? licensePlan,
    $core.int? maxUsers,
    $core.int? amountCents,
    $core.String? currency,
    $core.String? stripeProductId,
    $core.String? stripePriceId,
    $core.String? pawapayProductId,
    $4.Timestamp? creationDateUTC,
    $4.Timestamp? updateDateUTC,
    $4.Timestamp? deletionDateUTC,
    $core.bool? isDeleted,
    $core.Iterable<$core.MapEntry<$core.String, $core.int>>? pawapayAmounts,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (licensePlan != null) result.licensePlan = licensePlan;
    if (maxUsers != null) result.maxUsers = maxUsers;
    if (amountCents != null) result.amountCents = amountCents;
    if (currency != null) result.currency = currency;
    if (stripeProductId != null) result.stripeProductId = stripeProductId;
    if (stripePriceId != null) result.stripePriceId = stripePriceId;
    if (pawapayProductId != null) result.pawapayProductId = pawapayProductId;
    if (creationDateUTC != null) result.creationDateUTC = creationDateUTC;
    if (updateDateUTC != null) result.updateDateUTC = updateDateUTC;
    if (deletionDateUTC != null) result.deletionDateUTC = deletionDateUTC;
    if (isDeleted != null) result.isDeleted = isDeleted;
    if (pawapayAmounts != null)
      result.pawapayAmounts.addEntries(pawapayAmounts);
    return result;
  }

  BillingProduct._();

  factory BillingProduct.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BillingProduct.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BillingProduct',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId', protoName: 'productId')
    ..aE<$3.LicensePlan>(2, _omitFieldNames ? '' : 'licensePlan',
        protoName: 'licensePlan', enumValues: $3.LicensePlan.values)
    ..aI(3, _omitFieldNames ? '' : 'maxUsers', protoName: 'maxUsers')
    ..aI(4, _omitFieldNames ? '' : 'amountCents', protoName: 'amountCents')
    ..aOS(5, _omitFieldNames ? '' : 'currency')
    ..aOS(6, _omitFieldNames ? '' : 'stripeProductId',
        protoName: 'stripeProductId')
    ..aOS(7, _omitFieldNames ? '' : 'stripePriceId', protoName: 'stripePriceId')
    ..aOS(8, _omitFieldNames ? '' : 'pawapayProductId',
        protoName: 'pawapayProductId')
    ..aOM<$4.Timestamp>(9, _omitFieldNames ? '' : 'creationDateUTC',
        protoName: 'creationDateUTC', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(10, _omitFieldNames ? '' : 'updateDateUTC',
        protoName: 'updateDateUTC', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(11, _omitFieldNames ? '' : 'deletionDateUTC',
        protoName: 'deletionDateUTC', subBuilder: $4.Timestamp.create)
    ..aOB(12, _omitFieldNames ? '' : 'isDeleted', protoName: 'isDeleted')
    ..m<$core.String, $core.int>(13, _omitFieldNames ? '' : 'pawapayAmounts',
        protoName: 'pawapayAmounts',
        entryClassName: 'BillingProduct.PawapayAmountsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O3,
        packageName: const $pb.PackageName('weebi.billing.service'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BillingProduct clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BillingProduct copyWith(void Function(BillingProduct) updates) =>
      super.copyWith((message) => updates(message as BillingProduct))
          as BillingProduct;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BillingProduct create() => BillingProduct._();
  @$core.override
  BillingProduct createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BillingProduct getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BillingProduct>(create);
  static BillingProduct? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $3.LicensePlan get licensePlan => $_getN(1);
  @$pb.TagNumber(2)
  set licensePlan($3.LicensePlan value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLicensePlan() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicensePlan() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxUsers => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxUsers($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMaxUsers() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxUsers() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get amountCents => $_getIZ(3);
  @$pb.TagNumber(4)
  set amountCents($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAmountCents() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmountCents() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get currency => $_getSZ(4);
  @$pb.TagNumber(5)
  set currency($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCurrency() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrency() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get stripeProductId => $_getSZ(5);
  @$pb.TagNumber(6)
  set stripeProductId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStripeProductId() => $_has(5);
  @$pb.TagNumber(6)
  void clearStripeProductId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get stripePriceId => $_getSZ(6);
  @$pb.TagNumber(7)
  set stripePriceId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStripePriceId() => $_has(6);
  @$pb.TagNumber(7)
  void clearStripePriceId() => $_clearField(7);

  /// / Optional internal SKU / label for PawaPay; amounts are sent explicitly (no Stripe-like Price IDs).
  @$pb.TagNumber(8)
  $core.String get pawapayProductId => $_getSZ(7);
  @$pb.TagNumber(8)
  set pawapayProductId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPawapayProductId() => $_has(7);
  @$pb.TagNumber(8)
  void clearPawapayProductId() => $_clearField(8);

  @$pb.TagNumber(9)
  $4.Timestamp get creationDateUTC => $_getN(8);
  @$pb.TagNumber(9)
  set creationDateUTC($4.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasCreationDateUTC() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreationDateUTC() => $_clearField(9);
  @$pb.TagNumber(9)
  $4.Timestamp ensureCreationDateUTC() => $_ensure(8);

  @$pb.TagNumber(10)
  $4.Timestamp get updateDateUTC => $_getN(9);
  @$pb.TagNumber(10)
  set updateDateUTC($4.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasUpdateDateUTC() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdateDateUTC() => $_clearField(10);
  @$pb.TagNumber(10)
  $4.Timestamp ensureUpdateDateUTC() => $_ensure(9);

  @$pb.TagNumber(11)
  $4.Timestamp get deletionDateUTC => $_getN(10);
  @$pb.TagNumber(11)
  set deletionDateUTC($4.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasDeletionDateUTC() => $_has(10);
  @$pb.TagNumber(11)
  void clearDeletionDateUTC() => $_clearField(11);
  @$pb.TagNumber(11)
  $4.Timestamp ensureDeletionDateUTC() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.bool get isDeleted => $_getBF(11);
  @$pb.TagNumber(12)
  set isDeleted($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasIsDeleted() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsDeleted() => $_clearField(12);

  /// / Fixed PawaPay list prices by ISO 4217 (minor units): e.g. XOF→9900, CDF→39900.
  /// / Source of truth for mobile-money checkout (not derived from EUR amountCents).
  @$pb.TagNumber(13)
  $pb.PbMap<$core.String, $core.int> get pawapayAmounts => $_getMap(12);
}

class ReadBillingProductsResponse extends $pb.GeneratedMessage {
  factory ReadBillingProductsResponse({
    $core.Iterable<BillingProduct>? products,
  }) {
    final result = create();
    if (products != null) result.products.addAll(products);
    return result;
  }

  ReadBillingProductsResponse._();

  factory ReadBillingProductsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadBillingProductsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadBillingProductsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..pPM<BillingProduct>(1, _omitFieldNames ? '' : 'products',
        subBuilder: BillingProduct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadBillingProductsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadBillingProductsResponse copyWith(
          void Function(ReadBillingProductsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ReadBillingProductsResponse))
          as ReadBillingProductsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadBillingProductsResponse create() =>
      ReadBillingProductsResponse._();
  @$core.override
  ReadBillingProductsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReadBillingProductsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadBillingProductsResponse>(create);
  static ReadBillingProductsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BillingProduct> get products => $_getList(0);
}

/// / One punctual SYSCOHADA fiscal-year purchase (not a subscription).
class AccountingYearPurchase extends $pb.GeneratedMessage {
  factory AccountingYearPurchase({
    $core.int? year,
    $core.String? stripeCheckoutSessionId,
    $core.String? stripePriceId,
    $core.String? paidAtUTC,
    $core.int? amountCents,
    $core.String? currency,
    $core.String? pawapayCheckoutId,
    $3.PaymentProvider? paymentProvider,
  }) {
    final result = create();
    if (year != null) result.year = year;
    if (stripeCheckoutSessionId != null)
      result.stripeCheckoutSessionId = stripeCheckoutSessionId;
    if (stripePriceId != null) result.stripePriceId = stripePriceId;
    if (paidAtUTC != null) result.paidAtUTC = paidAtUTC;
    if (amountCents != null) result.amountCents = amountCents;
    if (currency != null) result.currency = currency;
    if (pawapayCheckoutId != null) result.pawapayCheckoutId = pawapayCheckoutId;
    if (paymentProvider != null) result.paymentProvider = paymentProvider;
    return result;
  }

  AccountingYearPurchase._();

  factory AccountingYearPurchase.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AccountingYearPurchase.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccountingYearPurchase',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'year')
    ..aOS(2, _omitFieldNames ? '' : 'stripeCheckoutSessionId',
        protoName: 'stripeCheckoutSessionId')
    ..aOS(3, _omitFieldNames ? '' : 'stripePriceId', protoName: 'stripePriceId')
    ..aOS(4, _omitFieldNames ? '' : 'paidAtUTC', protoName: 'paidAtUTC')
    ..aI(5, _omitFieldNames ? '' : 'amountCents', protoName: 'amountCents')
    ..aOS(6, _omitFieldNames ? '' : 'currency')
    ..aOS(7, _omitFieldNames ? '' : 'pawapayCheckoutId',
        protoName: 'pawapayCheckoutId')
    ..aE<$3.PaymentProvider>(8, _omitFieldNames ? '' : 'paymentProvider',
        protoName: 'paymentProvider', enumValues: $3.PaymentProvider.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccountingYearPurchase clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccountingYearPurchase copyWith(
          void Function(AccountingYearPurchase) updates) =>
      super.copyWith((message) => updates(message as AccountingYearPurchase))
          as AccountingYearPurchase;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountingYearPurchase create() => AccountingYearPurchase._();
  @$core.override
  AccountingYearPurchase createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AccountingYearPurchase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountingYearPurchase>(create);
  static AccountingYearPurchase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get year => $_getIZ(0);
  @$pb.TagNumber(1)
  set year($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasYear() => $_has(0);
  @$pb.TagNumber(1)
  void clearYear() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get stripeCheckoutSessionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set stripeCheckoutSessionId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStripeCheckoutSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStripeCheckoutSessionId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get stripePriceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set stripePriceId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStripePriceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStripePriceId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get paidAtUTC => $_getSZ(3);
  @$pb.TagNumber(4)
  set paidAtUTC($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPaidAtUTC() => $_has(3);
  @$pb.TagNumber(4)
  void clearPaidAtUTC() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get amountCents => $_getIZ(4);
  @$pb.TagNumber(5)
  set amountCents($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAmountCents() => $_has(4);
  @$pb.TagNumber(5)
  void clearAmountCents() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get currency => $_getSZ(5);
  @$pb.TagNumber(6)
  set currency($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCurrency() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrency() => $_clearField(6);

  /// / Set when paid via PawaPay (mutually exclusive with stripeCheckoutSessionId in practice).
  @$pb.TagNumber(7)
  $core.String get pawapayCheckoutId => $_getSZ(6);
  @$pb.TagNumber(7)
  set pawapayCheckoutId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPawapayCheckoutId() => $_has(6);
  @$pb.TagNumber(7)
  void clearPawapayCheckoutId() => $_clearField(7);

  /// / Which provider processed this purchase.
  @$pb.TagNumber(8)
  $3.PaymentProvider get paymentProvider => $_getN(7);
  @$pb.TagNumber(8)
  set paymentProvider($3.PaymentProvider value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasPaymentProvider() => $_has(7);
  @$pb.TagNumber(8)
  void clearPaymentProvider() => $_clearField(8);
}

class ReadAccountingYearPurchasesResponse extends $pb.GeneratedMessage {
  factory ReadAccountingYearPurchasesResponse({
    $core.Iterable<AccountingYearPurchase>? purchases,
  }) {
    final result = create();
    if (purchases != null) result.purchases.addAll(purchases);
    return result;
  }

  ReadAccountingYearPurchasesResponse._();

  factory ReadAccountingYearPurchasesResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadAccountingYearPurchasesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadAccountingYearPurchasesResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.billing.service'),
      createEmptyInstance: create)
    ..pPM<AccountingYearPurchase>(1, _omitFieldNames ? '' : 'purchases',
        subBuilder: AccountingYearPurchase.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadAccountingYearPurchasesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadAccountingYearPurchasesResponse copyWith(
          void Function(ReadAccountingYearPurchasesResponse) updates) =>
      super.copyWith((message) =>
              updates(message as ReadAccountingYearPurchasesResponse))
          as ReadAccountingYearPurchasesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadAccountingYearPurchasesResponse create() =>
      ReadAccountingYearPurchasesResponse._();
  @$core.override
  ReadAccountingYearPurchasesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReadAccountingYearPurchasesResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ReadAccountingYearPurchasesResponse>(create);
  static ReadAccountingYearPurchasesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AccountingYearPurchase> get purchases => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
