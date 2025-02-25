//
//  Generated code. Do not modify.
//  source: boutique.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use boutiqueMongoDescriptor instead')
const BoutiqueMongo$json = {
  '1': 'BoutiqueMongo',
  '2': [
    {'1': 'boutique', '3': 1, '4': 1, '5': 11, '6': '.weebi.boutique.BoutiquePb', '10': 'boutique'},
    {'1': 'boutiqueId', '3': 2, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'firmId', '3': 3, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 4, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'creationTimestampUTC', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'creationTimestampUTC'},
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    {'1': 'devices', '3': 7, '4': 3, '5': 11, '6': '.weebi.device.Device', '10': 'devices'},
    {'1': 'lastTouchTimestampUTC', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastTouchTimestampUTC'},
    {'1': 'logo', '3': 9, '4': 1, '5': 12, '10': 'logo'},
    {'1': 'logoExtension', '3': 10, '4': 1, '5': 9, '10': 'logoExtension'},
    {'1': 'additional_attributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.boutique.BoutiqueMongo.AdditionalAttributesEntry', '10': 'additional_attributes'},
  ],
  '3': [BoutiqueMongo_AdditionalAttributesEntry$json],
  '9': [
    {'1': 11, '2': 99},
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
    '9nbxgJIAEoDFIEbG9nbxIkCg1sb2dvRXh0ZW5zaW9uGAogASgJUg1sb2dvRXh0ZW5zaW9uEm0K'
    'FWFkZGl0aW9uYWxfYXR0cmlidXRlcxhjIAMoCzI3LndlZWJpLmJvdXRpcXVlLkJvdXRpcXVlTW'
    '9uZ28uQWRkaXRpb25hbEF0dHJpYnV0ZXNFbnRyeVIVYWRkaXRpb25hbF9hdHRyaWJ1dGVzGkcK'
    'GUFkZGl0aW9uYWxBdHRyaWJ1dGVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAi'
    'ABKAlSBXZhbHVlOgI4AUoECAsQYw==');

@$core.Deprecated('Use boutiquePbDescriptor instead')
const BoutiquePb$json = {
  '1': 'BoutiquePb',
  '2': [
    {'1': 'boutiqueId', '3': 1, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'creationDate', '3': 2, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'updateDate', '3': 3, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'statusUpdateDate', '3': 4, '4': 1, '5': 9, '10': 'statusUpdateDate'},
    {'1': 'status', '3': 5, '4': 1, '5': 8, '10': 'status'},
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone', '3': 7, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '10': 'phone'},
    {'1': 'addressFull', '3': 8, '4': 1, '5': 11, '6': '.weebi.common.address.Address', '10': 'addressFull'},
    {'1': 'promo', '3': 9, '4': 1, '5': 1, '10': 'promo'},
    {'1': 'promoStart', '3': 10, '4': 1, '5': 9, '10': 'promoStart'},
    {'1': 'promoEnd', '3': 11, '4': 1, '5': 9, '10': 'promoEnd'},
    {'1': 'additional_attributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.boutique.BoutiquePb.AdditionalAttributesEntry', '10': 'additional_attributes'},
  ],
  '3': [BoutiquePb_AdditionalAttributesEntry$json],
  '9': [
    {'1': 12, '2': 99},
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
    'ZRIqChBzdGF0dXNVcGRhdGVEYXRlGAQgASgJUhBzdGF0dXNVcGRhdGVEYXRlEhYKBnN0YXR1cx'
    'gFIAEoCFIGc3RhdHVzEhIKBG5hbWUYBiABKAlSBG5hbWUSLwoFcGhvbmUYByABKAsyGS53ZWVi'
    'aS5jb21tb24ucGhvbmUuUGhvbmVSBXBob25lEj8KC2FkZHJlc3NGdWxsGAggASgLMh0ud2VlYm'
    'kuY29tbW9uLmFkZHJlc3MuQWRkcmVzc1ILYWRkcmVzc0Z1bGwSFAoFcHJvbW8YCSABKAFSBXBy'
    'b21vEh4KCnByb21vU3RhcnQYCiABKAlSCnByb21vU3RhcnQSGgoIcHJvbW9FbmQYCyABKAlSCH'
    'Byb21vRW5kEmoKFWFkZGl0aW9uYWxfYXR0cmlidXRlcxhjIAMoCzI0LndlZWJpLmJvdXRpcXVl'
    'LkJvdXRpcXVlUGIuQWRkaXRpb25hbEF0dHJpYnV0ZXNFbnRyeVIVYWRkaXRpb25hbF9hdHRyaW'
    'J1dGVzGkcKGUFkZGl0aW9uYWxBdHRyaWJ1dGVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoF'
    'dmFsdWUYAiABKAlSBXZhbHVlOgI4AUoECAwQYw==');

