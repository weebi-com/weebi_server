//
//  Generated code. Do not modify.
//  source: btq_chain.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'boutique.pb.dart' as $12;
import 'common/g_timestamp.pb.dart' as $19;

class Chain extends $pb.GeneratedMessage {
  factory Chain({
    $core.String? chainId,
    $core.String? firmId,
    $core.String? name,
    $core.Iterable<$12.BoutiqueMongo>? boutiques,
    $19.Timestamp? creationDateUTC,
    $19.Timestamp? lastUpdateTimestampUTC,
    $core.String? lastUpdatedByuserId,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (boutiques != null) {
      $result.boutiques.addAll(boutiques);
    }
    if (creationDateUTC != null) {
      $result.creationDateUTC = creationDateUTC;
    }
    if (lastUpdateTimestampUTC != null) {
      $result.lastUpdateTimestampUTC = lastUpdateTimestampUTC;
    }
    if (lastUpdatedByuserId != null) {
      $result.lastUpdatedByuserId = lastUpdatedByuserId;
    }
    return $result;
  }
  Chain._() : super();
  factory Chain.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Chain.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Chain', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.chain'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..pc<$12.BoutiqueMongo>(4, _omitFieldNames ? '' : 'boutiques', $pb.PbFieldType.PM, subBuilder: $12.BoutiqueMongo.create)
    ..aOM<$19.Timestamp>(5, _omitFieldNames ? '' : 'creationDateUTC', protoName: 'creationDateUTC', subBuilder: $19.Timestamp.create)
    ..aOM<$19.Timestamp>(6, _omitFieldNames ? '' : 'lastUpdateTimestampUTC', protoName: 'lastUpdateTimestampUTC', subBuilder: $19.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'lastUpdatedByuserId', protoName: 'lastUpdatedByuserId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Chain clone() => Chain()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Chain copyWith(void Function(Chain) updates) => super.copyWith((message) => updates(message as Chain)) as Chain;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Chain create() => Chain._();
  Chain createEmptyInstance() => create();
  static $pb.PbList<Chain> createRepeated() => $pb.PbList<Chain>();
  @$core.pragma('dart2js:noInline')
  static Chain getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chain>(create);
  static Chain? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firmId => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$12.BoutiqueMongo> get boutiques => $_getList(3);

  @$pb.TagNumber(5)
  $19.Timestamp get creationDateUTC => $_getN(4);
  @$pb.TagNumber(5)
  set creationDateUTC($19.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreationDateUTC() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreationDateUTC() => clearField(5);
  @$pb.TagNumber(5)
  $19.Timestamp ensureCreationDateUTC() => $_ensure(4);

  @$pb.TagNumber(6)
  $19.Timestamp get lastUpdateTimestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set lastUpdateTimestampUTC($19.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastUpdateTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastUpdateTimestampUTC() => clearField(6);
  @$pb.TagNumber(6)
  $19.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get lastUpdatedByuserId => $_getSZ(6);
  @$pb.TagNumber(7)
  set lastUpdatedByuserId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastUpdatedByuserId() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastUpdatedByuserId() => clearField(7);
}

class Chains extends $pb.GeneratedMessage {
  factory Chains({
    $core.Iterable<Chain>? chains,
  }) {
    final $result = create();
    if (chains != null) {
      $result.chains.addAll(chains);
    }
    return $result;
  }
  Chains._() : super();
  factory Chains.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Chains.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Chains', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.chain'), createEmptyInstance: create)
    ..pc<Chain>(1, _omitFieldNames ? '' : 'chains', $pb.PbFieldType.PM, subBuilder: Chain.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Chains clone() => Chains()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Chains copyWith(void Function(Chains) updates) => super.copyWith((message) => updates(message as Chains)) as Chains;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Chains create() => Chains._();
  Chains createEmptyInstance() => create();
  static $pb.PbList<Chains> createRepeated() => $pb.PbList<Chains>();
  @$core.pragma('dart2js:noInline')
  static Chains getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chains>(create);
  static Chains? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Chain> get chains => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
