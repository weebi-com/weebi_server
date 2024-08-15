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
import 'common/g_timestamp.pb.dart' as $17;

class Chain extends $pb.GeneratedMessage {
  factory Chain({
    $core.String? chainId,
    $core.String? firmId,
    $core.String? name,
    $core.Iterable<$12.Boutique>? boutiques,
    $core.Iterable<Device>? devices,
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
    if (devices != null) {
      $result.devices.addAll(devices);
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
    ..pc<$12.Boutique>(4, _omitFieldNames ? '' : 'boutiques', $pb.PbFieldType.PM, subBuilder: $12.Boutique.create)
    ..pc<Device>(5, _omitFieldNames ? '' : 'devices', $pb.PbFieldType.PM, subBuilder: Device.create)
    ..aOM<$17.Timestamp>(6, _omitFieldNames ? '' : 'lastUpdateTimestampUTC', protoName: 'lastUpdateTimestampUTC', subBuilder: $17.Timestamp.create)
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
  $core.List<$12.Boutique> get boutiques => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<Device> get devices => $_getList(4);

  @$pb.TagNumber(6)
  $17.Timestamp get lastUpdateTimestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set lastUpdateTimestampUTC($17.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastUpdateTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastUpdateTimestampUTC() => clearField(6);
  @$pb.TagNumber(6)
  $17.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(5);

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

/// / a Device == cash register, assigned to a chain, it can be used by each chain's boutiques
/// / it is assigned to a boutique by default with easy access so that the cashier can always log in
class Device extends $pb.GeneratedMessage {
  factory Device({
    $core.String? id,
    $core.String? chainId,
    $core.String? boutiqueId,
    $core.bool? status,
    $core.String? password,
    $core.String? name,
    $core.String? serialNumber,
    $core.String? baseOS,
    $core.String? brand,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (boutiqueId != null) {
      $result.boutiqueId = boutiqueId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (password != null) {
      $result.password = password;
    }
    if (name != null) {
      $result.name = name;
    }
    if (serialNumber != null) {
      $result.serialNumber = serialNumber;
    }
    if (baseOS != null) {
      $result.baseOS = baseOS;
    }
    if (brand != null) {
      $result.brand = brand;
    }
    return $result;
  }
  Device._() : super();
  factory Device.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Device.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Device', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.chain'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : '_id')
    ..aOS(2, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(3, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOB(4, _omitFieldNames ? '' : 'status')
    ..aOS(5, _omitFieldNames ? '' : 'password')
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..aOS(7, _omitFieldNames ? '' : 'serialNumber', protoName: 'serialNumber')
    ..aOS(8, _omitFieldNames ? '' : 'baseOS', protoName: 'baseOS')
    ..aOS(9, _omitFieldNames ? '' : 'brand')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Device clone() => Device()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Device copyWith(void Function(Device) updates) => super.copyWith((message) => updates(message as Device)) as Device;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Device create() => Device._();
  Device createEmptyInstance() => create();
  static $pb.PbList<Device> createRepeated() => $pb.PbList<Device>();
  @$core.pragma('dart2js:noInline')
  static Device getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Device>(create);
  static Device? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get boutiqueId => $_getSZ(2);
  @$pb.TagNumber(3)
  set boutiqueId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoutiqueId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoutiqueId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get status => $_getBF(3);
  @$pb.TagNumber(4)
  set status($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => clearField(5);

  /// below comes from device
  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get serialNumber => $_getSZ(6);
  @$pb.TagNumber(7)
  set serialNumber($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSerialNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearSerialNumber() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get baseOS => $_getSZ(7);
  @$pb.TagNumber(8)
  set baseOS($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBaseOS() => $_has(7);
  @$pb.TagNumber(8)
  void clearBaseOS() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get brand => $_getSZ(8);
  @$pb.TagNumber(9)
  set brand($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBrand() => $_has(8);
  @$pb.TagNumber(9)
  void clearBrand() => clearField(9);
}

class Devices extends $pb.GeneratedMessage {
  factory Devices({
    $core.Iterable<Device>? devices,
  }) {
    final $result = create();
    if (devices != null) {
      $result.devices.addAll(devices);
    }
    return $result;
  }
  Devices._() : super();
  factory Devices.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Devices.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Devices', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.chain'), createEmptyInstance: create)
    ..pc<Device>(1, _omitFieldNames ? '' : 'devices', $pb.PbFieldType.PM, subBuilder: Device.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Devices clone() => Devices()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Devices copyWith(void Function(Devices) updates) => super.copyWith((message) => updates(message as Devices)) as Devices;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Devices create() => Devices._();
  Devices createEmptyInstance() => create();
  static $pb.PbList<Devices> createRepeated() => $pb.PbList<Devices>();
  @$core.pragma('dart2js:noInline')
  static Devices getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Devices>(create);
  static Devices? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Device> get devices => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');