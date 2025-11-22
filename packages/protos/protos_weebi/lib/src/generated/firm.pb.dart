// This is a generated file - do not edit.
//
// Generated from firm.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/g_common.pb.dart' as $1;
import 'common/g_timestamp.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Firm extends $pb.GeneratedMessage {
  factory Firm({
    $core.String? firmId,
    $core.String? name,
    $core.String? subscriptionPlan,
    $core.int? subscriptionSeats,
    $0.Timestamp? subscriptionStartTimestampUTC,
    $0.Timestamp? subscriptionEndTimestampUTC,
    $core.bool? status,
    $0.Timestamp? statusUpdateTimestampUTC,
    $0.Timestamp? lastUpdateTimestampUTC,
    $core.String? lastUpdatedByuserId,
    $core.bool? isMailVerified,
    $0.Timestamp? creationDateUTC,
  }) {
    final result = create();
    if (firmId != null) result.firmId = firmId;
    if (name != null) result.name = name;
    if (subscriptionPlan != null) result.subscriptionPlan = subscriptionPlan;
    if (subscriptionSeats != null) result.subscriptionSeats = subscriptionSeats;
    if (subscriptionStartTimestampUTC != null)
      result.subscriptionStartTimestampUTC = subscriptionStartTimestampUTC;
    if (subscriptionEndTimestampUTC != null)
      result.subscriptionEndTimestampUTC = subscriptionEndTimestampUTC;
    if (status != null) result.status = status;
    if (statusUpdateTimestampUTC != null)
      result.statusUpdateTimestampUTC = statusUpdateTimestampUTC;
    if (lastUpdateTimestampUTC != null)
      result.lastUpdateTimestampUTC = lastUpdateTimestampUTC;
    if (lastUpdatedByuserId != null)
      result.lastUpdatedByuserId = lastUpdatedByuserId;
    if (isMailVerified != null) result.isMailVerified = isMailVerified;
    if (creationDateUTC != null) result.creationDateUTC = creationDateUTC;
    return result;
  }

  Firm._();

  factory Firm.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Firm.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Firm',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.firm'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'subscriptionPlan',
        protoName: 'subscriptionPlan')
    ..aI(4, _omitFieldNames ? '' : 'subscriptionSeats',
        protoName: 'subscriptionSeats')
    ..aOM<$0.Timestamp>(
        5, _omitFieldNames ? '' : 'subscriptionStartTimestampUTC',
        protoName: 'subscriptionStartTimestampUTC',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'subscriptionEndTimestampUTC',
        protoName: 'subscriptionEndTimestampUTC',
        subBuilder: $0.Timestamp.create)
    ..aOB(7, _omitFieldNames ? '' : 'status')
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'statusUpdateTimestampUTC',
        protoName: 'statusUpdateTimestampUTC', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'lastUpdateTimestampUTC',
        protoName: 'lastUpdateTimestampUTC', subBuilder: $0.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'lastUpdatedByuserId',
        protoName: 'lastUpdatedByuserId')
    ..aOB(11, _omitFieldNames ? '' : 'isMailVerified',
        protoName: 'isMailVerified')
    ..aOM<$0.Timestamp>(12, _omitFieldNames ? '' : 'creationDateUTC',
        protoName: 'creationDateUTC', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Firm clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Firm copyWith(void Function(Firm) updates) =>
      super.copyWith((message) => updates(message as Firm)) as Firm;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Firm create() => Firm._();
  @$core.override
  Firm createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Firm getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Firm>(create);
  static Firm? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get subscriptionPlan => $_getSZ(2);
  @$pb.TagNumber(3)
  set subscriptionPlan($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSubscriptionPlan() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubscriptionPlan() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get subscriptionSeats => $_getIZ(3);
  @$pb.TagNumber(4)
  set subscriptionSeats($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSubscriptionSeats() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubscriptionSeats() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.Timestamp get subscriptionStartTimestampUTC => $_getN(4);
  @$pb.TagNumber(5)
  set subscriptionStartTimestampUTC($0.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSubscriptionStartTimestampUTC() => $_has(4);
  @$pb.TagNumber(5)
  void clearSubscriptionStartTimestampUTC() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureSubscriptionStartTimestampUTC() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.Timestamp get subscriptionEndTimestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set subscriptionEndTimestampUTC($0.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSubscriptionEndTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearSubscriptionEndTimestampUTC() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureSubscriptionEndTimestampUTC() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.bool get status => $_getBF(6);
  @$pb.TagNumber(7)
  set status($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $0.Timestamp get statusUpdateTimestampUTC => $_getN(7);
  @$pb.TagNumber(8)
  set statusUpdateTimestampUTC($0.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasStatusUpdateTimestampUTC() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatusUpdateTimestampUTC() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureStatusUpdateTimestampUTC() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.Timestamp get lastUpdateTimestampUTC => $_getN(8);
  @$pb.TagNumber(9)
  set lastUpdateTimestampUTC($0.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasLastUpdateTimestampUTC() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastUpdateTimestampUTC() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get lastUpdatedByuserId => $_getSZ(9);
  @$pb.TagNumber(10)
  set lastUpdatedByuserId($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLastUpdatedByuserId() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastUpdatedByuserId() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isMailVerified => $_getBF(10);
  @$pb.TagNumber(11)
  set isMailVerified($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasIsMailVerified() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsMailVerified() => $_clearField(11);

  @$pb.TagNumber(12)
  $0.Timestamp get creationDateUTC => $_getN(11);
  @$pb.TagNumber(12)
  set creationDateUTC($0.Timestamp value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasCreationDateUTC() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreationDateUTC() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.Timestamp ensureCreationDateUTC() => $_ensure(11);
}

class CreateFirmRequest extends $pb.GeneratedMessage {
  factory CreateFirmRequest({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  CreateFirmRequest._();

  factory CreateFirmRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateFirmRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFirmRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.firm'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFirmRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFirmRequest copyWith(void Function(CreateFirmRequest) updates) =>
      super.copyWith((message) => updates(message as CreateFirmRequest))
          as CreateFirmRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFirmRequest create() => CreateFirmRequest._();
  @$core.override
  CreateFirmRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateFirmRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFirmRequest>(create);
  static CreateFirmRequest? _defaultInstance;

  /// / mandatory
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

class CreateFirmResponse extends $pb.GeneratedMessage {
  factory CreateFirmResponse({
    $1.StatusResponse? statusResponse,
    Firm? firm,
  }) {
    final result = create();
    if (statusResponse != null) result.statusResponse = statusResponse;
    if (firm != null) result.firm = firm;
    return result;
  }

  CreateFirmResponse._();

  factory CreateFirmResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateFirmResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFirmResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.firm'),
      createEmptyInstance: create)
    ..aOM<$1.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse',
        protoName: 'statusResponse', subBuilder: $1.StatusResponse.create)
    ..aOM<Firm>(2, _omitFieldNames ? '' : 'firm', subBuilder: Firm.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFirmResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFirmResponse copyWith(void Function(CreateFirmResponse) updates) =>
      super.copyWith((message) => updates(message as CreateFirmResponse))
          as CreateFirmResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFirmResponse create() => CreateFirmResponse._();
  @$core.override
  CreateFirmResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateFirmResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFirmResponse>(create);
  static CreateFirmResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StatusResponse get statusResponse => $_getN(0);
  @$pb.TagNumber(1)
  set statusResponse($1.StatusResponse value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  Firm get firm => $_getN(1);
  @$pb.TagNumber(2)
  set firm(Firm value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFirm() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirm() => $_clearField(2);
  @$pb.TagNumber(2)
  Firm ensureFirm() => $_ensure(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
