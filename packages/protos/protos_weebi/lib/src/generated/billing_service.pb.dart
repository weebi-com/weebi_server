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
import 'license.pb.dart' as $23;

class CreateLicenseRequest extends $pb.GeneratedMessage {
  factory CreateLicenseRequest({
    $23.License? license,
  }) {
    final result = create();
    if (license != null) {
      result.license = license;
    }
    return result;
  }
  CreateLicenseRequest._() : super();
  factory CreateLicenseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLicenseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLicenseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.billing.service'), createEmptyInstance: create)
    ..aOM<$23.License>(1, _omitFieldNames ? '' : 'license', subBuilder: $23.License.create)
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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
