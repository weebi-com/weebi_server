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
    {'1': 'dualCurrencyEnabled', '3': 12, '4': 1, '5': 8, '9': 1, '10': 'dualCurrencyEnabled', '17': true},
    {'1': 'secondaryDisplayCurrency', '3': 13, '4': 1, '5': 9, '9': 2, '10': 'secondaryDisplayCurrency', '17': true},
  ],
  '8': [
    {'1': '_currency'},
    {'1': '_dualCurrencyEnabled'},
    {'1': '_secondaryDisplayCurrency'},
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
    'Y3kYCyABKAlIAFIIY3VycmVuY3mIAQESNQoTZHVhbEN1cnJlbmN5RW5hYmxlZBgMIAEoCEgBUh'
    'NkdWFsQ3VycmVuY3lFbmFibGVkiAEBEj8KGHNlY29uZGFyeURpc3BsYXlDdXJyZW5jeRgNIAEo'
    'CUgCUhhzZWNvbmRhcnlEaXNwbGF5Q3VycmVuY3mIAQFCCwoJX2N1cnJlbmN5QhYKFF9kdWFsQ3'
    'VycmVuY3lFbmFibGVkQhsKGV9zZWNvbmRhcnlEaXNwbGF5Q3VycmVuY3k=');

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

