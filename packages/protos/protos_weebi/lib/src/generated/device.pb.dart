//
//  Generated code. Do not modify.
//  source: device.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/g_timestamp.pb.dart' as $17;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// / a device == cash register, assigned to a boutique,
/// / by default once enrolled there is a cashier access that can always log in
class Device extends $pb.GeneratedMessage {
  factory Device({
    $core.String? deviceId,
    $core.String? chainId,
    $core.String? boutiqueId,
    $core.bool? status,
    $core.String? password,
    $17.Timestamp? timestamp,
    HardwareInfo? hardwareInfo,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
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
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (hardwareInfo != null) {
      $result.hardwareInfo = hardwareInfo;
    }
    return $result;
  }
  Device._() : super();
  factory Device.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Device.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Device', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.device'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(2, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(3, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOB(4, _omitFieldNames ? '' : 'status')
    ..aOS(5, _omitFieldNames ? '' : 'password')
    ..aOM<$17.Timestamp>(6, _omitFieldNames ? '' : 'timestamp', subBuilder: $17.Timestamp.create)
    ..aOM<HardwareInfo>(7, _omitFieldNames ? '' : 'hardwareInfo', protoName: 'hardwareInfo', subBuilder: HardwareInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Device clone() => Device()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Device copyWith(void Function(Device) updates) => super.copyWith((message) => updates(message as Device)) as Device;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Device create() => Device._();
  Device createEmptyInstance() => create();
  static $pb.PbList<Device> createRepeated() => $pb.PbList<Device>();
  @$core.pragma('dart2js:noInline')
  static Device getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Device>(create);
  static Device? _defaultInstance;

  /// / deviceId is set by the server
  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get boutiqueId => $_getSZ(2);
  @$pb.TagNumber(3)
  set boutiqueId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoutiqueId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoutiqueId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get status => $_getBF(3);
  @$pb.TagNumber(4)
  set status($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => $_clearField(5);

  @$pb.TagNumber(6)
  $17.Timestamp get timestamp => $_getN(5);
  @$pb.TagNumber(6)
  set timestamp($17.Timestamp v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTimestamp() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimestamp() => $_clearField(6);
  @$pb.TagNumber(6)
  $17.Timestamp ensureTimestamp() => $_ensure(5);

  @$pb.TagNumber(7)
  HardwareInfo get hardwareInfo => $_getN(6);
  @$pb.TagNumber(7)
  set hardwareInfo(HardwareInfo v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasHardwareInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearHardwareInfo() => $_clearField(7);
  @$pb.TagNumber(7)
  HardwareInfo ensureHardwareInfo() => $_ensure(6);
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Devices', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.device'), createEmptyInstance: create)
    ..pc<Device>(1, _omitFieldNames ? '' : 'devices', $pb.PbFieldType.PM, subBuilder: Device.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Devices clone() => Devices()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  $pb.PbList<Device> get devices => $_getList(0);
}

/// / come from weebi_app, not set by web
class HardwareInfo extends $pb.GeneratedMessage {
  factory HardwareInfo({
    $core.String? name,
    $core.String? serialNumber,
    $core.String? baseOS,
    $core.String? brand,
  }) {
    final $result = create();
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
  HardwareInfo._() : super();
  factory HardwareInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HardwareInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HardwareInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.device'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'serialNumber', protoName: 'serialNumber')
    ..aOS(3, _omitFieldNames ? '' : 'baseOS', protoName: 'baseOS')
    ..aOS(4, _omitFieldNames ? '' : 'brand')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HardwareInfo clone() => HardwareInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HardwareInfo copyWith(void Function(HardwareInfo) updates) => super.copyWith((message) => updates(message as HardwareInfo)) as HardwareInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HardwareInfo create() => HardwareInfo._();
  HardwareInfo createEmptyInstance() => create();
  static $pb.PbList<HardwareInfo> createRepeated() => $pb.PbList<HardwareInfo>();
  @$core.pragma('dart2js:noInline')
  static HardwareInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HardwareInfo>(create);
  static HardwareInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get serialNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set serialNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSerialNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearSerialNumber() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get baseOS => $_getSZ(2);
  @$pb.TagNumber(3)
  set baseOS($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBaseOS() => $_has(2);
  @$pb.TagNumber(3)
  void clearBaseOS() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get brand => $_getSZ(3);
  @$pb.TagNumber(4)
  set brand($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBrand() => $_has(3);
  @$pb.TagNumber(4)
  void clearBrand() => $_clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
