//
//  Generated code. Do not modify.
//  source: device.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

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
    {'1': 'dateCreation', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateCreation'},
    {'1': 'hardwareInfo', '3': 7, '4': 1, '5': 11, '6': '.weebi.device.HardwareInfo', '10': 'hardwareInfo'},
  ],
};

/// Descriptor for `Device`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceDescriptor = $convert.base64Decode(
    'CgZEZXZpY2USGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEhgKB2NoYWluSWQYAiABKAlSB2'
    'NoYWluSWQSHgoKYm91dGlxdWVJZBgDIAEoCVIKYm91dGlxdWVJZBIWCgZzdGF0dXMYBCABKAhS'
    'BnN0YXR1cxIaCghwYXNzd29yZBgFIAEoCVIIcGFzc3dvcmQSPgoMZGF0ZUNyZWF0aW9uGAYgAS'
    'gLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIMZGF0ZUNyZWF0aW9uEj4KDGhhcmR3YXJl'
    'SW5mbxgHIAEoCzIaLndlZWJpLmRldmljZS5IYXJkd2FyZUluZm9SDGhhcmR3YXJlSW5mbw==');

@$core.Deprecated('Use devicesDescriptor instead')
const Devices$json = {
  '1': 'Devices',
  '2': [
    {'1': 'devices', '3': 1, '4': 3, '5': 11, '6': '.weebi.device.Device', '10': 'devices'},
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

