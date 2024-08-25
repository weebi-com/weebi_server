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
    {'1': 'lastUpdateTimestampUTC', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdateTimestampUTC'},
    {'1': 'lastUpdatedByuserId', '3': 7, '4': 1, '5': 9, '10': 'lastUpdatedByuserId'},
  ],
};

/// Descriptor for `Chain`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainDescriptor = $convert.base64Decode(
    'CgVDaGFpbhIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklkEhYKBmZpcm1JZBgCIAEoCVIGZmlybU'
    'lkEhIKBG5hbWUYAyABKAlSBG5hbWUSNgoJYm91dGlxdWVzGAQgAygLMhgud2VlYmkuYm91dGlx'
    'dWUuQm91dGlxdWVSCWJvdXRpcXVlcxJSChZsYXN0VXBkYXRlVGltZXN0YW1wVVRDGAYgASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIWbGFzdFVwZGF0ZVRpbWVzdGFtcFVUQxIwChNs'
    'YXN0VXBkYXRlZEJ5dXNlcklkGAcgASgJUhNsYXN0VXBkYXRlZEJ5dXNlcklk');

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

