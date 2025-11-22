// This is a generated file - do not edit.
//
// Generated from btq_chain.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'boutique.pb.dart' as $0;
import 'common/g_timestamp.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Chain extends $pb.GeneratedMessage {
  factory Chain({
    $core.String? chainId,
    $core.String? firmId,
    $core.String? name,
    $core.Iterable<$0.BoutiqueMongo>? boutiques,
    $1.Timestamp? creationDateUTC,
    $1.Timestamp? lastUpdateTimestampUTC,
    $core.String? lastUpdatedByuserId,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (firmId != null) result.firmId = firmId;
    if (name != null) result.name = name;
    if (boutiques != null) result.boutiques.addAll(boutiques);
    if (creationDateUTC != null) result.creationDateUTC = creationDateUTC;
    if (lastUpdateTimestampUTC != null)
      result.lastUpdateTimestampUTC = lastUpdateTimestampUTC;
    if (lastUpdatedByuserId != null)
      result.lastUpdatedByuserId = lastUpdatedByuserId;
    return result;
  }

  Chain._();

  factory Chain.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Chain.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Chain',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.chain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..pPM<$0.BoutiqueMongo>(4, _omitFieldNames ? '' : 'boutiques',
        subBuilder: $0.BoutiqueMongo.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'creationDateUTC',
        protoName: 'creationDateUTC', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'lastUpdateTimestampUTC',
        protoName: 'lastUpdateTimestampUTC', subBuilder: $1.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'lastUpdatedByuserId',
        protoName: 'lastUpdatedByuserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Chain clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Chain copyWith(void Function(Chain) updates) =>
      super.copyWith((message) => updates(message as Chain)) as Chain;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Chain create() => Chain._();
  @$core.override
  Chain createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Chain getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chain>(create);
  static Chain? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get firmId => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFirmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$0.BoutiqueMongo> get boutiques => $_getList(3);

  @$pb.TagNumber(5)
  $1.Timestamp get creationDateUTC => $_getN(4);
  @$pb.TagNumber(5)
  set creationDateUTC($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCreationDateUTC() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreationDateUTC() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureCreationDateUTC() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Timestamp get lastUpdateTimestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set lastUpdateTimestampUTC($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasLastUpdateTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastUpdateTimestampUTC() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get lastUpdatedByuserId => $_getSZ(6);
  @$pb.TagNumber(7)
  set lastUpdatedByuserId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLastUpdatedByuserId() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastUpdatedByuserId() => $_clearField(7);
}

class Chains extends $pb.GeneratedMessage {
  factory Chains({
    $core.Iterable<Chain>? chains,
  }) {
    final result = create();
    if (chains != null) result.chains.addAll(chains);
    return result;
  }

  Chains._();

  factory Chains.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Chains.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Chains',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.chain'),
      createEmptyInstance: create)
    ..pPM<Chain>(1, _omitFieldNames ? '' : 'chains', subBuilder: Chain.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Chains clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Chains copyWith(void Function(Chains) updates) =>
      super.copyWith((message) => updates(message as Chains)) as Chains;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Chains create() => Chains._();
  @$core.override
  Chains createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Chains getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chains>(create);
  static Chains? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Chain> get chains => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
