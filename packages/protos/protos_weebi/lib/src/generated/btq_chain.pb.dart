//
//  Generated code. Do not modify.
//  source: btq_chain.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'boutique.pb.dart' as $20;
import 'common/g_timestamp.pb.dart' as $17;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Chain extends $pb.GeneratedMessage {
  factory Chain({
    $core.String? chainId,
    $core.String? firmId,
    $core.String? name,
    $core.Iterable<$20.BoutiqueMongo>? boutiques,
    $17.Timestamp? creationDateUTC,
    $17.Timestamp? lastUpdateTimestampUTC,
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
    ..pc<$20.BoutiqueMongo>(4, _omitFieldNames ? '' : 'boutiques', $pb.PbFieldType.PM, subBuilder: $20.BoutiqueMongo.create)
    ..aOM<$17.Timestamp>(5, _omitFieldNames ? '' : 'creationDateUTC', protoName: 'creationDateUTC', subBuilder: $17.Timestamp.create)
    ..aOM<$17.Timestamp>(6, _omitFieldNames ? '' : 'lastUpdateTimestampUTC', protoName: 'lastUpdateTimestampUTC', subBuilder: $17.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'lastUpdatedByuserId', protoName: 'lastUpdatedByuserId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Chain clone() => Chain()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get firmId => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$20.BoutiqueMongo> get boutiques => $_getList(3);

  @$pb.TagNumber(5)
  $17.Timestamp get creationDateUTC => $_getN(4);
  @$pb.TagNumber(5)
  set creationDateUTC($17.Timestamp v) { $_setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreationDateUTC() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreationDateUTC() => $_clearField(5);
  @$pb.TagNumber(5)
  $17.Timestamp ensureCreationDateUTC() => $_ensure(4);

  @$pb.TagNumber(6)
  $17.Timestamp get lastUpdateTimestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set lastUpdateTimestampUTC($17.Timestamp v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastUpdateTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastUpdateTimestampUTC() => $_clearField(6);
  @$pb.TagNumber(6)
  $17.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get lastUpdatedByuserId => $_getSZ(6);
  @$pb.TagNumber(7)
  set lastUpdatedByuserId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastUpdatedByuserId() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastUpdatedByuserId() => $_clearField(7);
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

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Chains clone() => Chains()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  $pb.PbList<Chain> get chains => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
