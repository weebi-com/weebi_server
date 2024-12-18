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
    {'1': 'creationDateUTC', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'creationDateUTC'},
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    {'1': 'devices', '3': 7, '4': 3, '5': 11, '6': '.weebi.device.Device', '10': 'devices'},
    {'1': 'additional_attributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.boutique.BoutiqueMongo.AdditionalAttributesEntry', '10': 'additional_attributes'},
  ],
  '3': [BoutiqueMongo_AdditionalAttributesEntry$json],
  '9': [
    {'1': 8, '2': 99},
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
    'SWQYAyABKAlSBmZpcm1JZBIYCgdjaGFpbklkGAQgASgJUgdjaGFpbklkEkQKD2NyZWF0aW9uRG'
    'F0ZVVUQxgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSD2NyZWF0aW9uRGF0ZVVU'
    'QxISCgRuYW1lGAYgASgJUgRuYW1lEi4KB2RldmljZXMYByADKAsyFC53ZWViaS5kZXZpY2UuRG'
    'V2aWNlUgdkZXZpY2VzEm0KFWFkZGl0aW9uYWxfYXR0cmlidXRlcxhjIAMoCzI3LndlZWJpLmJv'
    'dXRpcXVlLkJvdXRpcXVlTW9uZ28uQWRkaXRpb25hbEF0dHJpYnV0ZXNFbnRyeVIVYWRkaXRpb2'
    '5hbF9hdHRyaWJ1dGVzGkcKGUFkZGl0aW9uYWxBdHRyaWJ1dGVzRW50cnkSEAoDa2V5GAEgASgJ'
    'UgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AUoECAgQYw==');

@$core.Deprecated('Use boutiquePbDescriptor instead')
const BoutiquePb$json = {
  '1': 'BoutiquePb',
  '2': [
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
    'CgpCb3V0aXF1ZVBiEiIKDGNyZWF0aW9uRGF0ZRgCIAEoCVIMY3JlYXRpb25EYXRlEh4KCnVwZG'
    'F0ZURhdGUYAyABKAlSCnVwZGF0ZURhdGUSKgoQc3RhdHVzVXBkYXRlRGF0ZRgEIAEoCVIQc3Rh'
    'dHVzVXBkYXRlRGF0ZRIWCgZzdGF0dXMYBSABKAhSBnN0YXR1cxISCgRuYW1lGAYgASgJUgRuYW'
    '1lEi8KBXBob25lGAcgASgLMhkud2VlYmkuY29tbW9uLnBob25lLlBob25lUgVwaG9uZRI/Cgth'
    'ZGRyZXNzRnVsbBgIIAEoCzIdLndlZWJpLmNvbW1vbi5hZGRyZXNzLkFkZHJlc3NSC2FkZHJlc3'
    'NGdWxsEhQKBXByb21vGAkgASgBUgVwcm9tbxIeCgpwcm9tb1N0YXJ0GAogASgJUgpwcm9tb1N0'
    'YXJ0EhoKCHByb21vRW5kGAsgASgJUghwcm9tb0VuZBJqChVhZGRpdGlvbmFsX2F0dHJpYnV0ZX'
    'MYYyADKAsyNC53ZWViaS5ib3V0aXF1ZS5Cb3V0aXF1ZVBiLkFkZGl0aW9uYWxBdHRyaWJ1dGVz'
    'RW50cnlSFWFkZGl0aW9uYWxfYXR0cmlidXRlcxpHChlBZGRpdGlvbmFsQXR0cmlidXRlc0VudH'
    'J5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAFKBAgMEGM=');

