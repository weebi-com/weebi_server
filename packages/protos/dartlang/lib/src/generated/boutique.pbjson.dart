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

@$core.Deprecated('Use boutiqueDescriptor instead')
const Boutique$json = {
  '1': 'Boutique',
  '2': [
    {'1': '_id', '3': 1, '4': 1, '5': 11, '6': '.weebi.common.mongo.ObjectIdProto', '10': '_id'},
    {'1': 'firmOid', '3': 2, '4': 1, '5': 9, '10': 'firmOid'},
    {'1': 'chainOid', '3': 3, '4': 1, '5': 9, '10': 'chainOid'},
    {'1': 'dateCreation', '3': 4, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'dateUpdate', '3': 5, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'dateStatus', '3': 6, '4': 1, '5': 9, '10': 'statusUpdateDate'},
    {'1': 'status', '3': 7, '4': 1, '5': 8, '10': 'status'},
    {'1': 'name', '3': 8, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone', '3': 9, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '10': 'phone'},
    {'1': 'address', '3': 10, '4': 1, '5': 11, '6': '.weebi.common.address.Address', '10': 'addressFull'},
    {'1': 'promo', '3': 11, '4': 1, '5': 1, '10': 'promo'},
    {'1': 'promoStart', '3': 12, '4': 1, '5': 9, '10': 'promoStart'},
    {'1': 'promoEnd', '3': 13, '4': 1, '5': 9, '10': 'promoEnd'},
    {'1': 'additional_attributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.boutique.Boutique.AdditionalAttributesEntry', '10': 'additional_attributes'},
  ],
  '3': [Boutique_AdditionalAttributesEntry$json],
  '9': [
    {'1': 14, '2': 99},
  ],
};

@$core.Deprecated('Use boutiqueDescriptor instead')
const Boutique_AdditionalAttributesEntry$json = {
  '1': 'AdditionalAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Boutique`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boutiqueDescriptor = $convert.base64Decode(
    'CghCb3V0aXF1ZRIzCgNfaWQYASABKAsyIS53ZWViaS5jb21tb24ubW9uZ28uT2JqZWN0SWRQcm'
    '90b1IDX2lkEhgKB2Zpcm1PaWQYAiABKAlSB2Zpcm1PaWQSGgoIY2hhaW5PaWQYAyABKAlSCGNo'
    'YWluT2lkEiIKDGRhdGVDcmVhdGlvbhgEIAEoCVIMY3JlYXRpb25EYXRlEh4KCmRhdGVVcGRhdG'
    'UYBSABKAlSCnVwZGF0ZURhdGUSJAoKZGF0ZVN0YXR1cxgGIAEoCVIQc3RhdHVzVXBkYXRlRGF0'
    'ZRIWCgZzdGF0dXMYByABKAhSBnN0YXR1cxISCgRuYW1lGAggASgJUgRuYW1lEi8KBXBob25lGA'
    'kgASgLMhkud2VlYmkuY29tbW9uLnBob25lLlBob25lUgVwaG9uZRI7CgdhZGRyZXNzGAogASgL'
    'Mh0ud2VlYmkuY29tbW9uLmFkZHJlc3MuQWRkcmVzc1ILYWRkcmVzc0Z1bGwSFAoFcHJvbW8YCy'
    'ABKAFSBXByb21vEh4KCnByb21vU3RhcnQYDCABKAlSCnByb21vU3RhcnQSGgoIcHJvbW9FbmQY'
    'DSABKAlSCHByb21vRW5kEmgKFWFkZGl0aW9uYWxfYXR0cmlidXRlcxhjIAMoCzIyLndlZWJpLm'
    'JvdXRpcXVlLkJvdXRpcXVlLkFkZGl0aW9uYWxBdHRyaWJ1dGVzRW50cnlSFWFkZGl0aW9uYWxf'
    'YXR0cmlidXRlcxpHChlBZGRpdGlvbmFsQXR0cmlidXRlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2'
    'V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAFKBAgOEGM=');

