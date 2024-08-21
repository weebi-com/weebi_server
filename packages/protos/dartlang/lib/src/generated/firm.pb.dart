//
//  Generated code. Do not modify.
//  source: firm.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/g_common.pb.dart' as $1;
import 'common/g_timestamp.pb.dart' as $17;

class Firm extends $pb.GeneratedMessage {
  factory Firm({
    $core.String? firmId,
    $core.String? name,
    $core.String? subscriptionPlan,
    $core.int? subscriptionSeats,
    $17.Timestamp? subscriptionStartTimestampUTC,
    $17.Timestamp? subscriptionEndTimestampUTC,
    $core.bool? status,
    $17.Timestamp? statusUpdateTimestampUTC,
    $17.Timestamp? lastUpdateTimestampUTC,
    $core.String? lastUpdatedByuserId,
    $core.bool? isMailVerified,
  }) {
    final $result = create();
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (subscriptionPlan != null) {
      $result.subscriptionPlan = subscriptionPlan;
    }
    if (subscriptionSeats != null) {
      $result.subscriptionSeats = subscriptionSeats;
    }
    if (subscriptionStartTimestampUTC != null) {
      $result.subscriptionStartTimestampUTC = subscriptionStartTimestampUTC;
    }
    if (subscriptionEndTimestampUTC != null) {
      $result.subscriptionEndTimestampUTC = subscriptionEndTimestampUTC;
    }
    if (status != null) {
      $result.status = status;
    }
    if (statusUpdateTimestampUTC != null) {
      $result.statusUpdateTimestampUTC = statusUpdateTimestampUTC;
    }
    if (lastUpdateTimestampUTC != null) {
      $result.lastUpdateTimestampUTC = lastUpdateTimestampUTC;
    }
    if (lastUpdatedByuserId != null) {
      $result.lastUpdatedByuserId = lastUpdatedByuserId;
    }
    if (isMailVerified != null) {
      $result.isMailVerified = isMailVerified;
    }
    return $result;
  }
  Firm._() : super();
  factory Firm.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Firm.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Firm', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.firm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'subscriptionPlan', protoName: 'subscriptionPlan')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'subscriptionSeats', $pb.PbFieldType.O3, protoName: 'subscriptionSeats')
    ..aOM<$17.Timestamp>(5, _omitFieldNames ? '' : 'subscriptionStartTimestampUTC', protoName: 'subscriptionStartTimestampUTC', subBuilder: $17.Timestamp.create)
    ..aOM<$17.Timestamp>(6, _omitFieldNames ? '' : 'subscriptionEndTimestampUTC', protoName: 'subscriptionEndTimestampUTC', subBuilder: $17.Timestamp.create)
    ..aOB(7, _omitFieldNames ? '' : 'status')
    ..aOM<$17.Timestamp>(8, _omitFieldNames ? '' : 'statusUpdateTimestampUTC', protoName: 'statusUpdateTimestampUTC', subBuilder: $17.Timestamp.create)
    ..aOM<$17.Timestamp>(9, _omitFieldNames ? '' : 'lastUpdateTimestampUTC', protoName: 'lastUpdateTimestampUTC', subBuilder: $17.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'lastUpdatedByuserId', protoName: 'lastUpdatedByuserId')
    ..aOB(11, _omitFieldNames ? '' : 'isMailVerified', protoName: 'isMailVerified')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Firm clone() => Firm()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Firm copyWith(void Function(Firm) updates) => super.copyWith((message) => updates(message as Firm)) as Firm;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Firm create() => Firm._();
  Firm createEmptyInstance() => create();
  static $pb.PbList<Firm> createRepeated() => $pb.PbList<Firm>();
  @$core.pragma('dart2js:noInline')
  static Firm getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Firm>(create);
  static Firm? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get subscriptionPlan => $_getSZ(2);
  @$pb.TagNumber(3)
  set subscriptionPlan($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSubscriptionPlan() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubscriptionPlan() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get subscriptionSeats => $_getIZ(3);
  @$pb.TagNumber(4)
  set subscriptionSeats($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSubscriptionSeats() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubscriptionSeats() => clearField(4);

  @$pb.TagNumber(5)
  $17.Timestamp get subscriptionStartTimestampUTC => $_getN(4);
  @$pb.TagNumber(5)
  set subscriptionStartTimestampUTC($17.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSubscriptionStartTimestampUTC() => $_has(4);
  @$pb.TagNumber(5)
  void clearSubscriptionStartTimestampUTC() => clearField(5);
  @$pb.TagNumber(5)
  $17.Timestamp ensureSubscriptionStartTimestampUTC() => $_ensure(4);

  @$pb.TagNumber(6)
  $17.Timestamp get subscriptionEndTimestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set subscriptionEndTimestampUTC($17.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSubscriptionEndTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearSubscriptionEndTimestampUTC() => clearField(6);
  @$pb.TagNumber(6)
  $17.Timestamp ensureSubscriptionEndTimestampUTC() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.bool get status => $_getBF(6);
  @$pb.TagNumber(7)
  set status($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);

  @$pb.TagNumber(8)
  $17.Timestamp get statusUpdateTimestampUTC => $_getN(7);
  @$pb.TagNumber(8)
  set statusUpdateTimestampUTC($17.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatusUpdateTimestampUTC() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatusUpdateTimestampUTC() => clearField(8);
  @$pb.TagNumber(8)
  $17.Timestamp ensureStatusUpdateTimestampUTC() => $_ensure(7);

  @$pb.TagNumber(9)
  $17.Timestamp get lastUpdateTimestampUTC => $_getN(8);
  @$pb.TagNumber(9)
  set lastUpdateTimestampUTC($17.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasLastUpdateTimestampUTC() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastUpdateTimestampUTC() => clearField(9);
  @$pb.TagNumber(9)
  $17.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get lastUpdatedByuserId => $_getSZ(9);
  @$pb.TagNumber(10)
  set lastUpdatedByuserId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLastUpdatedByuserId() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastUpdatedByuserId() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isMailVerified => $_getBF(10);
  @$pb.TagNumber(11)
  set isMailVerified($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasIsMailVerified() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsMailVerified() => clearField(11);
}

class CreateFirmRequest extends $pb.GeneratedMessage {
  factory CreateFirmRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  CreateFirmRequest._() : super();
  factory CreateFirmRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFirmRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFirmRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.firm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFirmRequest clone() => CreateFirmRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFirmRequest copyWith(void Function(CreateFirmRequest) updates) => super.copyWith((message) => updates(message as CreateFirmRequest)) as CreateFirmRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFirmRequest create() => CreateFirmRequest._();
  CreateFirmRequest createEmptyInstance() => create();
  static $pb.PbList<CreateFirmRequest> createRepeated() => $pb.PbList<CreateFirmRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateFirmRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFirmRequest>(create);
  static CreateFirmRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class CreateFirmResponse extends $pb.GeneratedMessage {
  factory CreateFirmResponse({
    $1.StatusResponse? statusResponse,
    Firm? firm,
  }) {
    final $result = create();
    if (statusResponse != null) {
      $result.statusResponse = statusResponse;
    }
    if (firm != null) {
      $result.firm = firm;
    }
    return $result;
  }
  CreateFirmResponse._() : super();
  factory CreateFirmResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFirmResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFirmResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.firm'), createEmptyInstance: create)
    ..aOM<$1.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse', protoName: 'statusResponse', subBuilder: $1.StatusResponse.create)
    ..aOM<Firm>(2, _omitFieldNames ? '' : 'firm', subBuilder: Firm.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFirmResponse clone() => CreateFirmResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFirmResponse copyWith(void Function(CreateFirmResponse) updates) => super.copyWith((message) => updates(message as CreateFirmResponse)) as CreateFirmResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFirmResponse create() => CreateFirmResponse._();
  CreateFirmResponse createEmptyInstance() => create();
  static $pb.PbList<CreateFirmResponse> createRepeated() => $pb.PbList<CreateFirmResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateFirmResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFirmResponse>(create);
  static CreateFirmResponse? _defaultInstance;

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
  Firm get firm => $_getN(1);
  @$pb.TagNumber(2)
  set firm(Firm v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirm() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirm() => clearField(2);
  @$pb.TagNumber(2)
  Firm ensureFirm() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
