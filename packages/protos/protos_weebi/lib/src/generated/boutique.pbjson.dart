// This is a generated file - do not edit.
//
// Generated from boutique.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use boutiqueMongoDescriptor instead')
const BoutiqueMongo$json = {
  '1': 'BoutiqueMongo',
  '2': [
    {
      '1': 'boutique',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.weebi.boutique.BoutiquePb',
      '10': 'boutique'
    },
    {'1': 'boutiqueId', '3': 2, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'firmId', '3': 3, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 4, '4': 1, '5': 9, '10': 'chainId'},
    {
      '1': 'creationTimestampUTC',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'creationTimestampUTC'
    },
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'devices',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.weebi.device.Device',
      '10': 'devices'
    },
    {
      '1': 'lastTouchTimestampUTC',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastTouchTimestampUTC'
    },
    {'1': 'logo', '3': 9, '4': 1, '5': 12, '10': 'logo'},
    {'1': 'logoExtension', '3': 10, '4': 1, '5': 9, '10': 'logoExtension'},
    {'1': 'isDeleted', '3': 11, '4': 1, '5': 8, '10': 'isDeleted'},
    {'1': 'deletedBy', '3': 12, '4': 1, '5': 9, '10': 'deletedBy'},
    {'1': 'restoredBy', '3': 13, '4': 1, '5': 9, '10': 'restoredBy'},
    {
      '1': 'additional_attributes',
      '3': 99,
      '4': 3,
      '5': 11,
      '6': '.weebi.boutique.BoutiqueMongo.AdditionalAttributesEntry',
      '10': 'additional_attributes'
    },
  ],
  '3': [BoutiqueMongo_AdditionalAttributesEntry$json],
  '9': [
    {'1': 14, '2': 99},
  ],
};

@$core.Deprecated('Use boutiqueMongoDescriptor instead')
const BoutiqueMongo_AdditionalAttributesEntry$json = {
  '1': 'AdditionalAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `BoutiqueMongo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boutiqueMongoDescriptor = $convert.base64Decode(
    'Cg1Cb3V0aXF1ZU1vbmdvEjYKCGJvdXRpcXVlGAEgASgLMhoud2VlYmkuYm91dGlxdWUuQm91dG'
    'lxdWVQYlIIYm91dGlxdWUSHgoKYm91dGlxdWVJZBgCIAEoCVIKYm91dGlxdWVJZBIWCgZmaXJt'
    'SWQYAyABKAlSBmZpcm1JZBIYCgdjaGFpbklkGAQgASgJUgdjaGFpbklkEk4KFGNyZWF0aW9uVG'
    'ltZXN0YW1wVVRDGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIUY3JlYXRpb25U'
    'aW1lc3RhbXBVVEMSEgoEbmFtZRgGIAEoCVIEbmFtZRIuCgdkZXZpY2VzGAcgAygLMhQud2VlYm'
    'kuZGV2aWNlLkRldmljZVIHZGV2aWNlcxJQChVsYXN0VG91Y2hUaW1lc3RhbXBVVEMYCCABKAsy'
    'Gi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUhVsYXN0VG91Y2hUaW1lc3RhbXBVVEMSEgoEbG'
    '9nbxgJIAEoDFIEbG9nbxIkCg1sb2dvRXh0ZW5zaW9uGAogASgJUg1sb2dvRXh0ZW5zaW9uEhwK'
    'CWlzRGVsZXRlZBgLIAEoCFIJaXNEZWxldGVkEhwKCWRlbGV0ZWRCeRgMIAEoCVIJZGVsZXRlZE'
    'J5Eh4KCnJlc3RvcmVkQnkYDSABKAlSCnJlc3RvcmVkQnkSbQoVYWRkaXRpb25hbF9hdHRyaWJ1'
    'dGVzGGMgAygLMjcud2VlYmkuYm91dGlxdWUuQm91dGlxdWVNb25nby5BZGRpdGlvbmFsQXR0cm'
    'lidXRlc0VudHJ5UhVhZGRpdGlvbmFsX2F0dHJpYnV0ZXMaRwoZQWRkaXRpb25hbEF0dHJpYnV0'
    'ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBSgQIDh'
    'Bj');

@$core.Deprecated('Use boutiquePbDescriptor instead')
const BoutiquePb$json = {
  '1': 'BoutiquePb',
  '2': [
    {'1': 'boutiqueId', '3': 1, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'creationDate', '3': 2, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'updateDate', '3': 3, '4': 1, '5': 9, '10': 'updateDate'},
    {
      '1': 'statusUpdateDate',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'statusUpdateDate',
    },
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'status',
    },
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'phone',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.weebi.common.phone.Phone',
      '10': 'phone'
    },
    {
      '1': 'addressFull',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.weebi.common.address.Address',
      '10': 'addressFull'
    },
    {'1': 'promo', '3': 9, '4': 1, '5': 1, '10': 'promo'},
    {'1': 'promoStart', '3': 10, '4': 1, '5': 9, '10': 'promoStart'},
    {'1': 'promoEnd', '3': 11, '4': 1, '5': 9, '10': 'promoEnd'},
    {'1': 'isDeleted', '3': 12, '4': 1, '5': 8, '10': 'isDeleted'},
    {'1': 'deletedBy', '3': 13, '4': 1, '5': 9, '10': 'deletedBy'},
    {'1': 'restoredBy', '3': 14, '4': 1, '5': 9, '10': 'restoredBy'},
    {'1': 'mail', '3': 15, '4': 1, '5': 9, '10': 'mail'},
    {
      '1': 'additional_attributes',
      '3': 99,
      '4': 3,
      '5': 11,
      '6': '.weebi.boutique.BoutiquePb.AdditionalAttributesEntry',
      '10': 'additional_attributes'
    },
  ],
  '3': [BoutiquePb_AdditionalAttributesEntry$json],
  '9': [
    {'1': 16, '2': 99},
  ],
};

@$core.Deprecated('Use boutiquePbDescriptor instead')
const BoutiquePb_AdditionalAttributesEntry$json = {
  '1': 'AdditionalAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `BoutiquePb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boutiquePbDescriptor = $convert.base64Decode(
    'CgpCb3V0aXF1ZVBiEh4KCmJvdXRpcXVlSWQYASABKAlSCmJvdXRpcXVlSWQSIgoMY3JlYXRpb2'
    '5EYXRlGAIgASgJUgxjcmVhdGlvbkRhdGUSHgoKdXBkYXRlRGF0ZRgDIAEoCVIKdXBkYXRlRGF0'
    'ZRIuChBzdGF0dXNVcGRhdGVEYXRlGAQgASgJQgIYAVIQc3RhdHVzVXBkYXRlRGF0ZRIaCgZzdG'
    'F0dXMYBSABKAhCAhgBUgZzdGF0dXMSEgoEbmFtZRgGIAEoCVIEbmFtZRIvCgVwaG9uZRgHIAEo'
    'CzIZLndlZWJpLmNvbW1vbi5waG9uZS5QaG9uZVIFcGhvbmUSPwoLYWRkcmVzc0Z1bGwYCCABKA'
    'syHS53ZWViaS5jb21tb24uYWRkcmVzcy5BZGRyZXNzUgthZGRyZXNzRnVsbBIUCgVwcm9tbxgJ'
    'IAEoAVIFcHJvbW8SHgoKcHJvbW9TdGFydBgKIAEoCVIKcHJvbW9TdGFydBIaCghwcm9tb0VuZB'
    'gLIAEoCVIIcHJvbW9FbmQSHAoJaXNEZWxldGVkGAwgASgIUglpc0RlbGV0ZWQSHAoJZGVsZXRl'
    'ZEJ5GA0gASgJUglkZWxldGVkQnkSHgoKcmVzdG9yZWRCeRgOIAEoCVIKcmVzdG9yZWRCeRISCg'
    'RtYWlsGA8gASgJUgRtYWlsEmoKFWFkZGl0aW9uYWxfYXR0cmlidXRlcxhjIAMoCzI0LndlZWJp'
    'LmJvdXRpcXVlLkJvdXRpcXVlUGIuQWRkaXRpb25hbEF0dHJpYnV0ZXNFbnRyeVIVYWRkaXRpb2'
    '5hbF9hdHRyaWJ1dGVzGkcKGUFkZGl0aW9uYWxBdHRyaWJ1dGVzRW50cnkSEAoDa2V5GAEgASgJ'
    'UgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AUoECBAQYw==');
