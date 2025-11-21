// This is a generated file - do not edit.
//
// Generated from device.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deviceDescriptor instead')
const Device$json = {
  '1': 'Device',
  '2': [
    {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'chainId', '3': 2, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'boutiqueId', '3': 3, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'status', '3': 4, '4': 1, '5': 8, '10': 'status'},
    {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
    {
      '1': 'timestamp',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
    {
      '1': 'hardwareInfo',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.weebi.device.HardwareInfo',
      '10': 'hardwareInfo'
    },
  ],
};

/// Descriptor for `Device`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceDescriptor = $convert.base64Decode(
    'CgZEZXZpY2USGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEhgKB2NoYWluSWQYAiABKAlSB2'
    'NoYWluSWQSHgoKYm91dGlxdWVJZBgDIAEoCVIKYm91dGlxdWVJZBIWCgZzdGF0dXMYBCABKAhS'
    'BnN0YXR1cxIaCghwYXNzd29yZBgFIAEoCVIIcGFzc3dvcmQSOAoJdGltZXN0YW1wGAYgASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdGltZXN0YW1wEj4KDGhhcmR3YXJlSW5mbxgH'
    'IAEoCzIaLndlZWJpLmRldmljZS5IYXJkd2FyZUluZm9SDGhhcmR3YXJlSW5mbw==');

@$core.Deprecated('Use devicesDescriptor instead')
const Devices$json = {
  '1': 'Devices',
  '2': [
    {
      '1': 'devices',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.weebi.device.Device',
      '10': 'devices'
    },
  ],
};

/// Descriptor for `Devices`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List devicesDescriptor = $convert.base64Decode(
    'CgdEZXZpY2VzEi4KB2RldmljZXMYASADKAsyFC53ZWViaS5kZXZpY2UuRGV2aWNlUgdkZXZpY2'
    'Vz');

@$core.Deprecated('Use hardwareInfoDescriptor instead')
const HardwareInfo$json = {
  '1': 'HardwareInfo',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'serialNumber', '3': 2, '4': 1, '5': 9, '10': 'serialNumber'},
    {'1': 'baseOS', '3': 3, '4': 1, '5': 9, '10': 'baseOS'},
    {'1': 'brand', '3': 4, '4': 1, '5': 9, '10': 'brand'},
  ],
};

/// Descriptor for `HardwareInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hardwareInfoDescriptor = $convert.base64Decode(
    'CgxIYXJkd2FyZUluZm8SEgoEbmFtZRgBIAEoCVIEbmFtZRIiCgxzZXJpYWxOdW1iZXIYAiABKA'
    'lSDHNlcmlhbE51bWJlchIWCgZiYXNlT1MYAyABKAlSBmJhc2VPUxIUCgVicmFuZBgEIAEoCVIF'
    'YnJhbmQ=');
