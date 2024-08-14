//
//  Generated code. Do not modify.
//  source: btq_chain.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chainDescriptor instead')
const Chain$json = {
  '1': 'Chain',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'firmId', '3': 2, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'boutiques', '3': 4, '4': 3, '5': 11, '6': '.weebi.boutique.Boutique', '10': 'boutiques'},
    {'1': 'devices', '3': 5, '4': 3, '5': 11, '6': '.weebi.chain.Device', '10': 'devices'},
    {'1': 'lastUpdateTimestampUTC', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdateTimestampUTC'},
    {'1': 'lastUpdatedByuserId', '3': 7, '4': 1, '5': 9, '10': 'lastUpdatedByuserId'},
  ],
};

/// Descriptor for `Chain`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainDescriptor = $convert.base64Decode(
    'CgVDaGFpbhIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklkEhYKBmZpcm1JZBgCIAEoCVIGZmlybU'
    'lkEhIKBG5hbWUYAyABKAlSBG5hbWUSNgoJYm91dGlxdWVzGAQgAygLMhgud2VlYmkuYm91dGlx'
    'dWUuQm91dGlxdWVSCWJvdXRpcXVlcxItCgdkZXZpY2VzGAUgAygLMhMud2VlYmkuY2hhaW4uRG'
    'V2aWNlUgdkZXZpY2VzElIKFmxhc3RVcGRhdGVUaW1lc3RhbXBVVEMYBiABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wUhZsYXN0VXBkYXRlVGltZXN0YW1wVVRDEjAKE2xhc3RVcGRhdG'
    'VkQnl1c2VySWQYByABKAlSE2xhc3RVcGRhdGVkQnl1c2VySWQ=');

@$core.Deprecated('Use chainsDescriptor instead')
const Chains$json = {
  '1': 'Chains',
  '2': [
    {'1': 'chains', '3': 1, '4': 3, '5': 11, '6': '.weebi.chain.Chain', '10': 'chains'},
  ],
};

/// Descriptor for `Chains`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainsDescriptor = $convert.base64Decode(
    'CgZDaGFpbnMSKgoGY2hhaW5zGAEgAygLMhIud2VlYmkuY2hhaW4uQ2hhaW5SBmNoYWlucw==');

@$core.Deprecated('Use deviceDescriptor instead')
const Device$json = {
  '1': 'Device',
  '2': [
    {'1': '_id', '3': 1, '4': 1, '5': 9, '10': '_id'},
    {'1': 'chainId', '3': 2, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'boutiqueId', '3': 3, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'status', '3': 4, '4': 1, '5': 8, '10': 'status'},
    {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    {'1': 'serialNumber', '3': 7, '4': 1, '5': 9, '10': 'serialNumber'},
    {'1': 'baseOS', '3': 8, '4': 1, '5': 9, '10': 'baseOS'},
    {'1': 'brand', '3': 9, '4': 1, '5': 9, '10': 'brand'},
  ],
};

/// Descriptor for `Device`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceDescriptor = $convert.base64Decode(
    'CgZEZXZpY2USEAoDX2lkGAEgASgJUgNfaWQSGAoHY2hhaW5JZBgCIAEoCVIHY2hhaW5JZBIeCg'
    'pib3V0aXF1ZUlkGAMgASgJUgpib3V0aXF1ZUlkEhYKBnN0YXR1cxgEIAEoCFIGc3RhdHVzEhoK'
    'CHBhc3N3b3JkGAUgASgJUghwYXNzd29yZBISCgRuYW1lGAYgASgJUgRuYW1lEiIKDHNlcmlhbE'
    '51bWJlchgHIAEoCVIMc2VyaWFsTnVtYmVyEhYKBmJhc2VPUxgIIAEoCVIGYmFzZU9TEhQKBWJy'
    'YW5kGAkgASgJUgVicmFuZA==');

@$core.Deprecated('Use devicesDescriptor instead')
const Devices$json = {
  '1': 'Devices',
  '2': [
    {'1': 'devices', '3': 1, '4': 3, '5': 11, '6': '.weebi.chain.Device', '10': 'devices'},
  ],
};

/// Descriptor for `Devices`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List devicesDescriptor = $convert.base64Decode(
    'CgdEZXZpY2VzEi0KB2RldmljZXMYASADKAsyEy53ZWViaS5jaGFpbi5EZXZpY2VSB2RldmljZX'
    'M=');

