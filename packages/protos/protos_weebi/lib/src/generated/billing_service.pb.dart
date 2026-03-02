//
//  Generated code. Do not modify.
//  source: billing_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/g_common.pb.dart' as $1;
import 'common/g_timestamp.pb.dart' as $19;
import 'license.pb.dart' as $23;
import 'license.pbenum.dart' as $23;

class CreateLicenseRequest extends $pb.GeneratedMessage {
  factory CreateLicenseRequest({
    $23.License? license,
    $core.String? referralCode,
    $core.int? creditAppliedCents,
  }) {
    final result = create();
    if (license != null) {
      result.license = license;
    }
    if (referralCode != null) {
      result.referralCode = referralCode;
    }
    if (creditAppliedCents != null) {
      result.creditAppliedCents = creditAppliedCents;
    }
    return result;
  }
  CreateLicenseRequest._() : super();
  factory CreateLicenseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLicenseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLicenseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..aOM<$23.License>(1, _omitFieldNames ? '' : 'license', subBuilder: $23.License.create)
    ..aOS(2, _omitFieldNames ? '' : 'referralCode', protoName: 'referralCode')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'creditAppliedCents', $pb.PbFieldType.O3, protoName: 'creditAppliedCents')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLicenseRequest clone() => CreateLicenseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLicenseRequest copyWith(void Function(CreateLicenseRequest) updates) => super.copyWith((message) => updates(message as CreateLicenseRequest)) as CreateLicenseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLicenseRequest create() => CreateLicenseRequest._();
  CreateLicenseRequest createEmptyInstance() => create();
  static $pb.PbList<CreateLicenseRequest> createRepeated() => $pb.PbList<CreateLicenseRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateLicenseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLicenseRequest>(create);
  static CreateLicenseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $23.License get license => $_getN(0);
  @$pb.TagNumber(1)
  set license($23.License v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicense() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicense() => clearField(1);
  @$pb.TagNumber(1)
  $23.License ensureLicense() => $_ensure(0);

  /// / Referral code used by the buyer (e.g. from shopkeeper who referred them).
  @$pb.TagNumber(2)
  $core.String get referralCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set referralCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReferralCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearReferralCode() => clearField(2);

  /// / Amount of referral credit (cents) to apply. Deducted from buyer's firm balance.
  @$pb.TagNumber(3)
  $core.int get creditAppliedCents => $_getIZ(2);
  @$pb.TagNumber(3)
  set creditAppliedCents($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreditAppliedCents() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreditAppliedCents() => clearField(3);
}

class CreateLicenseResponse extends $pb.GeneratedMessage {
  factory CreateLicenseResponse({
    $1.StatusResponse? statusResponse,
    $23.License? license,
  }) {
    final result = create();
    if (statusResponse != null) {
      result.statusResponse = statusResponse;
    }
    if (license != null) {
      result.license = license;
    }
    return result;
  }
  CreateLicenseResponse._() : super();
  factory CreateLicenseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLicenseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLicenseResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..aOM<$1.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse', protoName: 'statusResponse', subBuilder: $1.StatusResponse.create)
    ..aOM<$23.License>(2, _omitFieldNames ? '' : 'license', subBuilder: $23.License.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLicenseResponse clone() => CreateLicenseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLicenseResponse copyWith(void Function(CreateLicenseResponse) updates) => super.copyWith((message) => updates(message as CreateLicenseResponse)) as CreateLicenseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLicenseResponse create() => CreateLicenseResponse._();
  CreateLicenseResponse createEmptyInstance() => create();
  static $pb.PbList<CreateLicenseResponse> createRepeated() => $pb.PbList<CreateLicenseResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateLicenseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLicenseResponse>(create);
  static CreateLicenseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StatusResponse get statusResponse => $_getN(0);
  @$pb.TagNumber(1)
  set statusResponse($1.StatusResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => clearField(1);
  @$pb.TagNumber(1)
  $1.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  $23.License get license => $_getN(1);
  @$pb.TagNumber(2)
  set license($23.License v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLicense() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicense() => clearField(2);
  @$pb.TagNumber(2)
  $23.License ensureLicense() => $_ensure(1);
}

class ReadLicensesResponse extends $pb.GeneratedMessage {
  factory ReadLicensesResponse({
    $core.Iterable<$23.License>? licenses,
  }) {
    final result = create();
    if (licenses != null) {
      result.licenses.addAll(licenses);
    }
    return result;
  }
  ReadLicensesResponse._() : super();
  factory ReadLicensesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadLicensesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadLicensesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..pc<$23.License>(1, _omitFieldNames ? '' : 'licenses', $pb.PbFieldType.PM, subBuilder: $23.License.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadLicensesResponse clone() => ReadLicensesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadLicensesResponse copyWith(void Function(ReadLicensesResponse) updates) => super.copyWith((message) => updates(message as ReadLicensesResponse)) as ReadLicensesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadLicensesResponse create() => ReadLicensesResponse._();
  ReadLicensesResponse createEmptyInstance() => create();
  static $pb.PbList<ReadLicensesResponse> createRepeated() => $pb.PbList<ReadLicensesResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadLicensesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadLicensesResponse>(create);
  static ReadLicensesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$23.License> get licenses => $_getList(0);
}

class UpdateLicenseRequest extends $pb.GeneratedMessage {
  factory UpdateLicenseRequest({
    $core.String? licenseId,
    $23.License? license,
  }) {
    final result = create();
    if (licenseId != null) {
      result.licenseId = licenseId;
    }
    if (license != null) {
      result.license = license;
    }
    return result;
  }
  UpdateLicenseRequest._() : super();
  factory UpdateLicenseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLicenseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateLicenseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'licenseId', protoName: 'licenseId')
    ..aOM<$23.License>(2, _omitFieldNames ? '' : 'license', subBuilder: $23.License.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLicenseRequest clone() => UpdateLicenseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLicenseRequest copyWith(void Function(UpdateLicenseRequest) updates) => super.copyWith((message) => updates(message as UpdateLicenseRequest)) as UpdateLicenseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLicenseRequest create() => UpdateLicenseRequest._();
  UpdateLicenseRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateLicenseRequest> createRepeated() => $pb.PbList<UpdateLicenseRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateLicenseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLicenseRequest>(create);
  static UpdateLicenseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get licenseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set licenseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicenseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseId() => clearField(1);

  @$pb.TagNumber(2)
  $23.License get license => $_getN(1);
  @$pb.TagNumber(2)
  set license($23.License v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLicense() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicense() => clearField(2);
  @$pb.TagNumber(2)
  $23.License ensureLicense() => $_ensure(1);
}

class DeleteLicenseRequest extends $pb.GeneratedMessage {
  factory DeleteLicenseRequest({
    $core.String? licenseId,
  }) {
    final result = create();
    if (licenseId != null) {
      result.licenseId = licenseId;
    }
    return result;
  }
  DeleteLicenseRequest._() : super();
  factory DeleteLicenseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteLicenseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteLicenseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'licenseId', protoName: 'licenseId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteLicenseRequest clone() => DeleteLicenseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteLicenseRequest copyWith(void Function(DeleteLicenseRequest) updates) => super.copyWith((message) => updates(message as DeleteLicenseRequest)) as DeleteLicenseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteLicenseRequest create() => DeleteLicenseRequest._();
  DeleteLicenseRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteLicenseRequest> createRepeated() => $pb.PbList<DeleteLicenseRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteLicenseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteLicenseRequest>(create);
  static DeleteLicenseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get licenseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set licenseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicenseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseId() => clearField(1);
}

class UpdatePaymentCustomerIdRequest extends $pb.GeneratedMessage {
  factory UpdatePaymentCustomerIdRequest({
    $core.String? provider,
    $core.String? paymentCustomerId,
  }) {
    final result = create();
    if (provider != null) {
      result.provider = provider;
    }
    if (paymentCustomerId != null) {
      result.paymentCustomerId = paymentCustomerId;
    }
    return result;
  }
  UpdatePaymentCustomerIdRequest._() : super();
  factory UpdatePaymentCustomerIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePaymentCustomerIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePaymentCustomerIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'provider')
    ..aOS(2, _omitFieldNames ? '' : 'paymentCustomerId', protoName: 'paymentCustomerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePaymentCustomerIdRequest clone() => UpdatePaymentCustomerIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePaymentCustomerIdRequest copyWith(void Function(UpdatePaymentCustomerIdRequest) updates) => super.copyWith((message) => updates(message as UpdatePaymentCustomerIdRequest)) as UpdatePaymentCustomerIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePaymentCustomerIdRequest create() => UpdatePaymentCustomerIdRequest._();
  UpdatePaymentCustomerIdRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePaymentCustomerIdRequest> createRepeated() => $pb.PbList<UpdatePaymentCustomerIdRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePaymentCustomerIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePaymentCustomerIdRequest>(create);
  static UpdatePaymentCustomerIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get provider => $_getSZ(0);
  @$pb.TagNumber(1)
  set provider($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProvider() => $_has(0);
  @$pb.TagNumber(1)
  void clearProvider() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get paymentCustomerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set paymentCustomerId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPaymentCustomerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaymentCustomerId() => clearField(2);
}

class GetReferralInfoResponse extends $pb.GeneratedMessage {
  factory GetReferralInfoResponse({
    $core.String? referralCode,
    $core.int? creditBalanceCents,
    $core.int? minPayoutCents,
  }) {
    final result = create();
    if (referralCode != null) {
      result.referralCode = referralCode;
    }
    if (creditBalanceCents != null) {
      result.creditBalanceCents = creditBalanceCents;
    }
    if (minPayoutCents != null) {
      result.minPayoutCents = minPayoutCents;
    }
    return result;
  }
  GetReferralInfoResponse._() : super();
  factory GetReferralInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetReferralInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetReferralInfoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'referralCode', protoName: 'referralCode')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'creditBalanceCents', $pb.PbFieldType.O3, protoName: 'creditBalanceCents')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'minPayoutCents', $pb.PbFieldType.O3, protoName: 'minPayoutCents')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetReferralInfoResponse clone() => GetReferralInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetReferralInfoResponse copyWith(void Function(GetReferralInfoResponse) updates) => super.copyWith((message) => updates(message as GetReferralInfoResponse)) as GetReferralInfoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetReferralInfoResponse create() => GetReferralInfoResponse._();
  GetReferralInfoResponse createEmptyInstance() => create();
  static $pb.PbList<GetReferralInfoResponse> createRepeated() => $pb.PbList<GetReferralInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static GetReferralInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetReferralInfoResponse>(create);
  static GetReferralInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get referralCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set referralCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReferralCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearReferralCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get creditBalanceCents => $_getIZ(1);
  @$pb.TagNumber(2)
  set creditBalanceCents($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreditBalanceCents() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreditBalanceCents() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get minPayoutCents => $_getIZ(2);
  @$pb.TagNumber(3)
  set minPayoutCents($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMinPayoutCents() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinPayoutCents() => clearField(3);
}

class RequestReferralPayoutResponse extends $pb.GeneratedMessage {
  factory RequestReferralPayoutResponse({
    $1.StatusResponse? statusResponse,
    $core.int? amountCents,
  }) {
    final result = create();
    if (statusResponse != null) {
      result.statusResponse = statusResponse;
    }
    if (amountCents != null) {
      result.amountCents = amountCents;
    }
    return result;
  }
  RequestReferralPayoutResponse._() : super();
  factory RequestReferralPayoutResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestReferralPayoutResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestReferralPayoutResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..aOM<$1.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse', protoName: 'statusResponse', subBuilder: $1.StatusResponse.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'amountCents', $pb.PbFieldType.O3, protoName: 'amountCents')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestReferralPayoutResponse clone() => RequestReferralPayoutResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestReferralPayoutResponse copyWith(void Function(RequestReferralPayoutResponse) updates) => super.copyWith((message) => updates(message as RequestReferralPayoutResponse)) as RequestReferralPayoutResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestReferralPayoutResponse create() => RequestReferralPayoutResponse._();
  RequestReferralPayoutResponse createEmptyInstance() => create();
  static $pb.PbList<RequestReferralPayoutResponse> createRepeated() => $pb.PbList<RequestReferralPayoutResponse>();
  @$core.pragma('dart2js:noInline')
  static RequestReferralPayoutResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestReferralPayoutResponse>(create);
  static RequestReferralPayoutResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StatusResponse get statusResponse => $_getN(0);
  @$pb.TagNumber(1)
  set statusResponse($1.StatusResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => clearField(1);
  @$pb.TagNumber(1)
  $1.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get amountCents => $_getIZ(1);
  @$pb.TagNumber(2)
  set amountCents($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmountCents() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmountCents() => clearField(2);
}

class CreateCheckoutSessionRequest extends $pb.GeneratedMessage {
  factory CreateCheckoutSessionRequest({
    $core.String? priceId,
    $core.String? successUrl,
    $core.String? cancelUrl,
    $core.String? referralCode,
    $core.int? creditAppliedCents,
  }) {
    final result = create();
    if (priceId != null) {
      result.priceId = priceId;
    }
    if (successUrl != null) {
      result.successUrl = successUrl;
    }
    if (cancelUrl != null) {
      result.cancelUrl = cancelUrl;
    }
    if (referralCode != null) {
      result.referralCode = referralCode;
    }
    if (creditAppliedCents != null) {
      result.creditAppliedCents = creditAppliedCents;
    }
    return result;
  }
  CreateCheckoutSessionRequest._() : super();
  factory CreateCheckoutSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCheckoutSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCheckoutSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'priceId', protoName: 'priceId')
    ..aOS(2, _omitFieldNames ? '' : 'successUrl', protoName: 'successUrl')
    ..aOS(3, _omitFieldNames ? '' : 'cancelUrl', protoName: 'cancelUrl')
    ..aOS(4, _omitFieldNames ? '' : 'referralCode', protoName: 'referralCode')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'creditAppliedCents', $pb.PbFieldType.O3, protoName: 'creditAppliedCents')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCheckoutSessionRequest clone() => CreateCheckoutSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCheckoutSessionRequest copyWith(void Function(CreateCheckoutSessionRequest) updates) => super.copyWith((message) => updates(message as CreateCheckoutSessionRequest)) as CreateCheckoutSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCheckoutSessionRequest create() => CreateCheckoutSessionRequest._();
  CreateCheckoutSessionRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCheckoutSessionRequest> createRepeated() => $pb.PbList<CreateCheckoutSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCheckoutSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCheckoutSessionRequest>(create);
  static CreateCheckoutSessionRequest? _defaultInstance;

  /// / Stripe Price ID (from billing_products collection, e.g. readBillingProducts).
  @$pb.TagNumber(1)
  $core.String get priceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set priceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPriceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPriceId() => clearField(1);

  /// / URL to redirect after successful payment. May include {CHECKOUT_SESSION_ID}.
  @$pb.TagNumber(2)
  $core.String get successUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set successUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccessUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessUrl() => clearField(2);

  /// / URL to redirect if customer cancels.
  @$pb.TagNumber(3)
  $core.String get cancelUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set cancelUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCancelUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearCancelUrl() => clearField(3);

  /// / Optional referral code to apply.
  @$pb.TagNumber(4)
  $core.String get referralCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set referralCode($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReferralCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearReferralCode() => clearField(4);

  /// / Optional credit (cents) to apply. Deducted from firm balance.
  @$pb.TagNumber(5)
  $core.int get creditAppliedCents => $_getIZ(4);
  @$pb.TagNumber(5)
  set creditAppliedCents($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreditAppliedCents() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreditAppliedCents() => clearField(5);
}

class CreateCheckoutSessionResponse extends $pb.GeneratedMessage {
  factory CreateCheckoutSessionResponse({
    $core.String? checkoutUrl,
  }) {
    final result = create();
    if (checkoutUrl != null) {
      result.checkoutUrl = checkoutUrl;
    }
    return result;
  }
  CreateCheckoutSessionResponse._() : super();
  factory CreateCheckoutSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCheckoutSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCheckoutSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'checkoutUrl', protoName: 'checkoutUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCheckoutSessionResponse clone() => CreateCheckoutSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCheckoutSessionResponse copyWith(void Function(CreateCheckoutSessionResponse) updates) => super.copyWith((message) => updates(message as CreateCheckoutSessionResponse)) as CreateCheckoutSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCheckoutSessionResponse create() => CreateCheckoutSessionResponse._();
  CreateCheckoutSessionResponse createEmptyInstance() => create();
  static $pb.PbList<CreateCheckoutSessionResponse> createRepeated() => $pb.PbList<CreateCheckoutSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateCheckoutSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCheckoutSessionResponse>(create);
  static CreateCheckoutSessionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get checkoutUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set checkoutUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCheckoutUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearCheckoutUrl() => clearField(1);
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
  }) {
    final result = create();
    if (firmId != null) {
      result.firmId = firmId;
    }
    if (licenseId != null) {
      result.licenseId = licenseId;
    }
    if (priceId != null) {
      result.priceId = priceId;
    }
    if (stripeCustomerId != null) {
      result.stripeCustomerId = stripeCustomerId;
    }
    if (referralCode != null) {
      result.referralCode = referralCode;
    }
    if (creditAppliedCents != null) {
      result.creditAppliedCents = creditAppliedCents;
    }
    return result;
  }
  FulfillLicenseFromStripeRequest._() : super();
  factory FulfillLicenseFromStripeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FulfillLicenseFromStripeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FulfillLicenseFromStripeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'licenseId', protoName: 'licenseId')
    ..aOS(3, _omitFieldNames ? '' : 'priceId', protoName: 'priceId')
    ..aOS(4, _omitFieldNames ? '' : 'stripeCustomerId', protoName: 'stripeCustomerId')
    ..aOS(5, _omitFieldNames ? '' : 'referralCode', protoName: 'referralCode')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'creditAppliedCents', $pb.PbFieldType.O3, protoName: 'creditAppliedCents')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FulfillLicenseFromStripeRequest clone() => FulfillLicenseFromStripeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FulfillLicenseFromStripeRequest copyWith(void Function(FulfillLicenseFromStripeRequest) updates) => super.copyWith((message) => updates(message as FulfillLicenseFromStripeRequest)) as FulfillLicenseFromStripeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FulfillLicenseFromStripeRequest create() => FulfillLicenseFromStripeRequest._();
  FulfillLicenseFromStripeRequest createEmptyInstance() => create();
  static $pb.PbList<FulfillLicenseFromStripeRequest> createRepeated() => $pb.PbList<FulfillLicenseFromStripeRequest>();
  @$core.pragma('dart2js:noInline')
  static FulfillLicenseFromStripeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FulfillLicenseFromStripeRequest>(create);
  static FulfillLicenseFromStripeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get licenseId => $_getSZ(1);
  @$pb.TagNumber(2)
  set licenseId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLicenseId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicenseId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get priceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set priceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPriceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPriceId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get stripeCustomerId => $_getSZ(3);
  @$pb.TagNumber(4)
  set stripeCustomerId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStripeCustomerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStripeCustomerId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get referralCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set referralCode($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReferralCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearReferralCode() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get creditAppliedCents => $_getIZ(5);
  @$pb.TagNumber(6)
  set creditAppliedCents($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreditAppliedCents() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreditAppliedCents() => clearField(6);
}

/// / Billing product (license plan). Stored in billing_products collection.
/// / Single source of truth for price mapping; replaces STRIPE_PRICE_* and STRIPE_PRODUCT_* env vars.
class BillingProduct extends $pb.GeneratedMessage {
  factory BillingProduct({
    $core.String? productId,
    $23.LicensePlan? licensePlan,
    $core.int? maxUsers,
    $core.int? amountCents,
    $core.String? currency,
    $core.String? stripeProductId,
    $core.String? stripePriceId,
    $core.String? pawapayProductId,
    $19.Timestamp? creationDateUTC,
    $19.Timestamp? updateDateUTC,
    $19.Timestamp? deletionDateUTC,
    $core.bool? isDeleted,
  }) {
    final result = create();
    if (productId != null) {
      result.productId = productId;
    }
    if (licensePlan != null) {
      result.licensePlan = licensePlan;
    }
    if (maxUsers != null) {
      result.maxUsers = maxUsers;
    }
    if (amountCents != null) {
      result.amountCents = amountCents;
    }
    if (currency != null) {
      result.currency = currency;
    }
    if (stripeProductId != null) {
      result.stripeProductId = stripeProductId;
    }
    if (stripePriceId != null) {
      result.stripePriceId = stripePriceId;
    }
    if (pawapayProductId != null) {
      result.pawapayProductId = pawapayProductId;
    }
    if (creationDateUTC != null) {
      result.creationDateUTC = creationDateUTC;
    }
    if (updateDateUTC != null) {
      result.updateDateUTC = updateDateUTC;
    }
    if (deletionDateUTC != null) {
      result.deletionDateUTC = deletionDateUTC;
    }
    if (isDeleted != null) {
      result.isDeleted = isDeleted;
    }
    return result;
  }
  BillingProduct._() : super();
  factory BillingProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BillingProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BillingProduct', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId', protoName: 'productId')
    ..e<$23.LicensePlan>(2, _omitFieldNames ? '' : 'licensePlan', $pb.PbFieldType.OE, protoName: 'licensePlan', defaultOrMaker: $23.LicensePlan.LICENSE_PLAN_UNKNOWN, valueOf: $23.LicensePlan.valueOf, enumValues: $23.LicensePlan.values)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'maxUsers', $pb.PbFieldType.O3, protoName: 'maxUsers')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'amountCents', $pb.PbFieldType.O3, protoName: 'amountCents')
    ..aOS(5, _omitFieldNames ? '' : 'currency')
    ..aOS(6, _omitFieldNames ? '' : 'stripeProductId', protoName: 'stripeProductId')
    ..aOS(7, _omitFieldNames ? '' : 'stripePriceId', protoName: 'stripePriceId')
    ..aOS(8, _omitFieldNames ? '' : 'pawapayProductId', protoName: 'pawapayProductId')
    ..aOM<$19.Timestamp>(9, _omitFieldNames ? '' : 'creationDateUTC', protoName: 'creationDateUTC', subBuilder: $19.Timestamp.create)
    ..aOM<$19.Timestamp>(10, _omitFieldNames ? '' : 'updateDateUTC', protoName: 'updateDateUTC', subBuilder: $19.Timestamp.create)
    ..aOM<$19.Timestamp>(11, _omitFieldNames ? '' : 'deletionDateUTC', protoName: 'deletionDateUTC', subBuilder: $19.Timestamp.create)
    ..aOB(12, _omitFieldNames ? '' : 'isDeleted', protoName: 'isDeleted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BillingProduct clone() => BillingProduct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BillingProduct copyWith(void Function(BillingProduct) updates) => super.copyWith((message) => updates(message as BillingProduct)) as BillingProduct;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BillingProduct create() => BillingProduct._();
  BillingProduct createEmptyInstance() => create();
  static $pb.PbList<BillingProduct> createRepeated() => $pb.PbList<BillingProduct>();
  @$core.pragma('dart2js:noInline')
  static BillingProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BillingProduct>(create);
  static BillingProduct? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => clearField(1);

  @$pb.TagNumber(2)
  $23.LicensePlan get licensePlan => $_getN(1);
  @$pb.TagNumber(2)
  set licensePlan($23.LicensePlan v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLicensePlan() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicensePlan() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxUsers => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxUsers($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxUsers() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxUsers() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get amountCents => $_getIZ(3);
  @$pb.TagNumber(4)
  set amountCents($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmountCents() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmountCents() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get currency => $_getSZ(4);
  @$pb.TagNumber(5)
  set currency($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCurrency() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrency() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get stripeProductId => $_getSZ(5);
  @$pb.TagNumber(6)
  set stripeProductId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStripeProductId() => $_has(5);
  @$pb.TagNumber(6)
  void clearStripeProductId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get stripePriceId => $_getSZ(6);
  @$pb.TagNumber(7)
  set stripePriceId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStripePriceId() => $_has(6);
  @$pb.TagNumber(7)
  void clearStripePriceId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get pawapayProductId => $_getSZ(7);
  @$pb.TagNumber(8)
  set pawapayProductId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPawapayProductId() => $_has(7);
  @$pb.TagNumber(8)
  void clearPawapayProductId() => clearField(8);

  @$pb.TagNumber(9)
  $19.Timestamp get creationDateUTC => $_getN(8);
  @$pb.TagNumber(9)
  set creationDateUTC($19.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreationDateUTC() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreationDateUTC() => clearField(9);
  @$pb.TagNumber(9)
  $19.Timestamp ensureCreationDateUTC() => $_ensure(8);

  @$pb.TagNumber(10)
  $19.Timestamp get updateDateUTC => $_getN(9);
  @$pb.TagNumber(10)
  set updateDateUTC($19.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUpdateDateUTC() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdateDateUTC() => clearField(10);
  @$pb.TagNumber(10)
  $19.Timestamp ensureUpdateDateUTC() => $_ensure(9);

  @$pb.TagNumber(11)
  $19.Timestamp get deletionDateUTC => $_getN(10);
  @$pb.TagNumber(11)
  set deletionDateUTC($19.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasDeletionDateUTC() => $_has(10);
  @$pb.TagNumber(11)
  void clearDeletionDateUTC() => clearField(11);
  @$pb.TagNumber(11)
  $19.Timestamp ensureDeletionDateUTC() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.bool get isDeleted => $_getBF(11);
  @$pb.TagNumber(12)
  set isDeleted($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIsDeleted() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsDeleted() => clearField(12);
}

class ReadBillingProductsResponse extends $pb.GeneratedMessage {
  factory ReadBillingProductsResponse({
    $core.Iterable<BillingProduct>? products,
  }) {
    final result = create();
    if (products != null) {
      result.products.addAll(products);
    }
    return result;
  }
  ReadBillingProductsResponse._() : super();
  factory ReadBillingProductsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadBillingProductsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadBillingProductsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..pc<BillingProduct>(1, _omitFieldNames ? '' : 'products', $pb.PbFieldType.PM, subBuilder: BillingProduct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadBillingProductsResponse clone() => ReadBillingProductsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadBillingProductsResponse copyWith(void Function(ReadBillingProductsResponse) updates) => super.copyWith((message) => updates(message as ReadBillingProductsResponse)) as ReadBillingProductsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadBillingProductsResponse create() => ReadBillingProductsResponse._();
  ReadBillingProductsResponse createEmptyInstance() => create();
  static $pb.PbList<ReadBillingProductsResponse> createRepeated() => $pb.PbList<ReadBillingProductsResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadBillingProductsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadBillingProductsResponse>(create);
  static ReadBillingProductsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BillingProduct> get products => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
