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

import 'boutique_chain.pb.dart' as $7;
import 'common/g_timestamp.pb.dart' as $17;
import 'common/mongo.pb.dart' as $11;

/// / yes one object to delimit all but permissions
class Firm extends $pb.GeneratedMessage {
  factory Firm({
    $11.ObjectIdProto? id,
    $core.String? name,
    $core.Iterable<$7.Chain>? chains,
    $core.String? subscriptionPlan,
    $core.int? subscriptionSeats,
    $17.Timestamp? subscriptionStartTimestampUTC,
    $17.Timestamp? subscriptionEndTimestampUTC,
    $core.bool? status,
    $17.Timestamp? statusUpdateTimestampUTC,
    $17.Timestamp? lastUpdateTimestampUTC,
    $core.String? lastUpdatedByUserOid,
    $core.bool? isMailVerified,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (chains != null) {
      $result.chains.addAll(chains);
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
    if (lastUpdatedByUserOid != null) {
      $result.lastUpdatedByUserOid = lastUpdatedByUserOid;
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
    ..aOM<$11.ObjectIdProto>(1, _omitFieldNames ? '' : '_id', subBuilder: $11.ObjectIdProto.create)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pc<$7.Chain>(3, _omitFieldNames ? '' : 'chains', $pb.PbFieldType.PM, subBuilder: $7.Chain.create)
    ..aOS(4, _omitFieldNames ? '' : 'subscriptionPlan', protoName: 'subscriptionPlan')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'subscriptionSeats', $pb.PbFieldType.O3, protoName: 'subscriptionSeats')
    ..aOM<$17.Timestamp>(6, _omitFieldNames ? '' : 'subscriptionStartTimestampUTC', protoName: 'subscriptionStartTimestampUTC', subBuilder: $17.Timestamp.create)
    ..aOM<$17.Timestamp>(7, _omitFieldNames ? '' : 'subscriptionEndTimestampUTC', protoName: 'subscriptionEndTimestampUTC', subBuilder: $17.Timestamp.create)
    ..aOB(8, _omitFieldNames ? '' : 'status')
    ..aOM<$17.Timestamp>(9, _omitFieldNames ? '' : 'statusUpdateTimestampUTC', protoName: 'statusUpdateTimestampUTC', subBuilder: $17.Timestamp.create)
    ..aOM<$17.Timestamp>(10, _omitFieldNames ? '' : 'lastUpdateTimestampUTC', protoName: 'lastUpdateTimestampUTC', subBuilder: $17.Timestamp.create)
    ..aOS(11, _omitFieldNames ? '' : 'lastUpdatedByUserOid', protoName: 'lastUpdatedByUserOid')
    ..aOB(12, _omitFieldNames ? '' : 'isMailVerified', protoName: 'isMailVerified')
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
  $11.ObjectIdProto get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($11.ObjectIdProto v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
  @$pb.TagNumber(1)
  $11.ObjectIdProto ensureId() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$7.Chain> get chains => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get subscriptionPlan => $_getSZ(3);
  @$pb.TagNumber(4)
  set subscriptionPlan($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSubscriptionPlan() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubscriptionPlan() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get subscriptionSeats => $_getIZ(4);
  @$pb.TagNumber(5)
  set subscriptionSeats($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSubscriptionSeats() => $_has(4);
  @$pb.TagNumber(5)
  void clearSubscriptionSeats() => clearField(5);

  @$pb.TagNumber(6)
  $17.Timestamp get subscriptionStartTimestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set subscriptionStartTimestampUTC($17.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSubscriptionStartTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearSubscriptionStartTimestampUTC() => clearField(6);
  @$pb.TagNumber(6)
  $17.Timestamp ensureSubscriptionStartTimestampUTC() => $_ensure(5);

  @$pb.TagNumber(7)
  $17.Timestamp get subscriptionEndTimestampUTC => $_getN(6);
  @$pb.TagNumber(7)
  set subscriptionEndTimestampUTC($17.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasSubscriptionEndTimestampUTC() => $_has(6);
  @$pb.TagNumber(7)
  void clearSubscriptionEndTimestampUTC() => clearField(7);
  @$pb.TagNumber(7)
  $17.Timestamp ensureSubscriptionEndTimestampUTC() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.bool get status => $_getBF(7);
  @$pb.TagNumber(8)
  set status($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => clearField(8);

  @$pb.TagNumber(9)
  $17.Timestamp get statusUpdateTimestampUTC => $_getN(8);
  @$pb.TagNumber(9)
  set statusUpdateTimestampUTC($17.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasStatusUpdateTimestampUTC() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatusUpdateTimestampUTC() => clearField(9);
  @$pb.TagNumber(9)
  $17.Timestamp ensureStatusUpdateTimestampUTC() => $_ensure(8);

  @$pb.TagNumber(10)
  $17.Timestamp get lastUpdateTimestampUTC => $_getN(9);
  @$pb.TagNumber(10)
  set lastUpdateTimestampUTC($17.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasLastUpdateTimestampUTC() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastUpdateTimestampUTC() => clearField(10);
  @$pb.TagNumber(10)
  $17.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get lastUpdatedByUserOid => $_getSZ(10);
  @$pb.TagNumber(11)
  set lastUpdatedByUserOid($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLastUpdatedByUserOid() => $_has(10);
  @$pb.TagNumber(11)
  void clearLastUpdatedByUserOid() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isMailVerified => $_getBF(11);
  @$pb.TagNumber(12)
  set isMailVerified($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIsMailVerified() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsMailVerified() => clearField(12);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
