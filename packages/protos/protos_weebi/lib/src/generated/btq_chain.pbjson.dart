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
    {'1': 'boutiques', '3': 4, '4': 3, '5': 11, '6': '.weebi.boutique.BoutiqueMongo', '10': 'boutiques'},
    {'1': 'creationDateUTC', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'creationDateUTC'},
    {'1': 'lastUpdateTimestampUTC', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdateTimestampUTC'},
    {'1': 'lastUpdatedByuserId', '3': 7, '4': 1, '5': 9, '10': 'lastUpdatedByuserId'},
    {'1': 'isDeleted', '3': 8, '4': 1, '5': 8, '10': 'isDeleted'},
    {'1': 'deletedBy', '3': 9, '4': 1, '5': 9, '10': 'deletedBy'},
    {'1': 'restoredBy', '3': 10, '4': 1, '5': 9, '10': 'restoredBy'},
    {'1': 'currency', '3': 11, '4': 1, '5': 9, '9': 0, '10': 'currency', '17': true},
    {'1': 'isDualCurrencyEnabled', '3': 12, '4': 1, '5': 8, '9': 1, '10': 'isDualCurrencyEnabled', '17': true},
    {'1': 'secondaryDisplayCurrency', '3': 13, '4': 1, '5': 9, '9': 2, '10': 'secondaryDisplayCurrency', '17': true},
    {'1': 'businessRules', '3': 14, '4': 1, '5': 11, '6': '.weebi.boutique.BusinessRules', '9': 3, '10': 'businessRules', '17': true},
    {'1': 'closed_years', '3': 15, '4': 3, '5': 11, '6': '.weebi.boutique.ClosedYearPb', '10': 'closedYears'},
    {'1': 'commercial_register_number', '3': 16, '4': 1, '5': 9, '9': 4, '10': 'commercialRegisterNumber', '17': true},
    {'1': 'commerce_type', '3': 17, '4': 1, '5': 14, '6': '.weebi.boutique.CommerceTypePb', '9': 5, '10': 'commerceType', '17': true},
    {'1': 'isic_code', '3': 18, '4': 1, '5': 9, '9': 6, '10': 'isicCode', '17': true},
    {'1': 'isic_sub_code', '3': 19, '4': 1, '5': 9, '9': 7, '10': 'isicSubCode', '17': true},
  ],
  '8': [
    {'1': '_currency'},
    {'1': '_isDualCurrencyEnabled'},
    {'1': '_secondaryDisplayCurrency'},
    {'1': '_businessRules'},
    {'1': '_commercial_register_number'},
    {'1': '_commerce_type'},
    {'1': '_isic_code'},
    {'1': '_isic_sub_code'},
  ],
  '9': [
    {'1': 20, '2': 101},
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
    'ZEJ5dXNlcklkEhwKCWlzRGVsZXRlZBgIIAEoCFIJaXNEZWxldGVkEhwKCWRlbGV0ZWRCeRgJIA'
    'EoCVIJZGVsZXRlZEJ5Eh4KCnJlc3RvcmVkQnkYCiABKAlSCnJlc3RvcmVkQnkSHwoIY3VycmVu'
    'Y3kYCyABKAlIAFIIY3VycmVuY3mIAQESOQoVaXNEdWFsQ3VycmVuY3lFbmFibGVkGAwgASgISA'
    'FSFWlzRHVhbEN1cnJlbmN5RW5hYmxlZIgBARI/ChhzZWNvbmRhcnlEaXNwbGF5Q3VycmVuY3kY'
    'DSABKAlIAlIYc2Vjb25kYXJ5RGlzcGxheUN1cnJlbmN5iAEBEkgKDWJ1c2luZXNzUnVsZXMYDi'
    'ABKAsyHS53ZWViaS5ib3V0aXF1ZS5CdXNpbmVzc1J1bGVzSANSDWJ1c2luZXNzUnVsZXOIAQES'
    'PwoMY2xvc2VkX3llYXJzGA8gAygLMhwud2VlYmkuYm91dGlxdWUuQ2xvc2VkWWVhclBiUgtjbG'
    '9zZWRZZWFycxJBChpjb21tZXJjaWFsX3JlZ2lzdGVyX251bWJlchgQIAEoCUgEUhhjb21tZXJj'
    'aWFsUmVnaXN0ZXJOdW1iZXKIAQESSAoNY29tbWVyY2VfdHlwZRgRIAEoDjIeLndlZWJpLmJvdX'
    'RpcXVlLkNvbW1lcmNlVHlwZVBiSAVSDGNvbW1lcmNlVHlwZYgBARIgCglpc2ljX2NvZGUYEiAB'
    'KAlIBlIIaXNpY0NvZGWIAQESJwoNaXNpY19zdWJfY29kZRgTIAEoCUgHUgtpc2ljU3ViQ29kZY'
    'gBAUILCglfY3VycmVuY3lCGAoWX2lzRHVhbEN1cnJlbmN5RW5hYmxlZEIbChlfc2Vjb25kYXJ5'
    'RGlzcGxheUN1cnJlbmN5QhAKDl9idXNpbmVzc1J1bGVzQh0KG19jb21tZXJjaWFsX3JlZ2lzdG'
    'VyX251bWJlckIQCg5fY29tbWVyY2VfdHlwZUIMCgpfaXNpY19jb2RlQhAKDl9pc2ljX3N1Yl9j'
    'b2RlSgQIFBBl');

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

