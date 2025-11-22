// This is a generated file - do not edit.
//
// Generated from btq_chain.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

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
    {
      '1': 'boutiques',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.weebi.boutique.BoutiqueMongo',
      '10': 'boutiques'
    },
    {
      '1': 'creationDateUTC',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'creationDateUTC'
    },
    {
      '1': 'lastUpdateTimestampUTC',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastUpdateTimestampUTC'
    },
    {
      '1': 'lastUpdatedByuserId',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'lastUpdatedByuserId'
    },
  ],
};

/// Descriptor for `Chain`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainDescriptor = $convert.base64Decode(
    'CgVDaGFpbhIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklkEhYKBmZpcm1JZBgCIAEoCVIGZmlybU'
    'lkEhIKBG5hbWUYAyABKAlSBG5hbWUSOwoJYm91dGlxdWVzGAQgAygLMh0ud2VlYmkuYm91dGlx'
    'dWUuQm91dGlxdWVNb25nb1IJYm91dGlxdWVzEkQKD2NyZWF0aW9uRGF0ZVVUQxgFIAEoCzIaLm'
    'dvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSD2NyZWF0aW9uRGF0ZVVUQxJSChZsYXN0VXBkYXRl'
    'VGltZXN0YW1wVVRDGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIWbGFzdFVwZG'
    'F0ZVRpbWVzdGFtcFVUQxIwChNsYXN0VXBkYXRlZEJ5dXNlcklkGAcgASgJUhNsYXN0VXBkYXRl'
    'ZEJ5dXNlcklk');

@$core.Deprecated('Use chainsDescriptor instead')
const Chains$json = {
  '1': 'Chains',
  '2': [
    {
      '1': 'chains',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.weebi.chain.Chain',
      '10': 'chains'
    },
  ],
};

/// Descriptor for `Chains`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainsDescriptor = $convert.base64Decode(
    'CgZDaGFpbnMSKgoGY2hhaW5zGAEgAygLMhIud2VlYmkuY2hhaW4uQ2hhaW5SBmNoYWlucw==');
