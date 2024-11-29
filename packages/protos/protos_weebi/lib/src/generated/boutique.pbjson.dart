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
    {'1': 'boutiqueId', '3': 1, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'firmId', '3': 2, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 3, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'creationDate', '3': 4, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'updateDate', '3': 5, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'statusUpdateDate', '3': 6, '4': 1, '5': 9, '10': 'statusUpdateDate'},
    {'1': 'status', '3': 7, '4': 1, '5': 8, '10': 'status'},
    {'1': 'name', '3': 8, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone', '3': 9, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '10': 'phone'},
    {'1': 'addressFull', '3': 10, '4': 1, '5': 11, '6': '.weebi.common.address.Address', '10': 'addressFull'},
    {'1': 'promo', '3': 11, '4': 1, '5': 1, '10': 'promo'},
    {'1': 'promoStart', '3': 12, '4': 1, '5': 9, '10': 'promoStart'},
    {'1': 'promoEnd', '3': 13, '4': 1, '5': 9, '10': 'promoEnd'},
    {'1': 'devices', '3': 14, '4': 3, '5': 11, '6': '.weebi.device.Device', '10': 'devices'},
    {'1': 'additional_attributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.boutique.Boutique.AdditionalAttributesEntry', '10': 'additional_attributes'},
  ],
  '3': [Boutique_AdditionalAttributesEntry$json],
  '9': [
    {'1': 15, '2': 99},
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
    'CghCb3V0aXF1ZRIeCgpib3V0aXF1ZUlkGAEgASgJUgpib3V0aXF1ZUlkEhYKBmZpcm1JZBgCIA'
    'EoCVIGZmlybUlkEhgKB2NoYWluSWQYAyABKAlSB2NoYWluSWQSIgoMY3JlYXRpb25EYXRlGAQg'
    'ASgJUgxjcmVhdGlvbkRhdGUSHgoKdXBkYXRlRGF0ZRgFIAEoCVIKdXBkYXRlRGF0ZRIqChBzdG'
    'F0dXNVcGRhdGVEYXRlGAYgASgJUhBzdGF0dXNVcGRhdGVEYXRlEhYKBnN0YXR1cxgHIAEoCFIG'
    'c3RhdHVzEhIKBG5hbWUYCCABKAlSBG5hbWUSLwoFcGhvbmUYCSABKAsyGS53ZWViaS5jb21tb2'
    '4ucGhvbmUuUGhvbmVSBXBob25lEj8KC2FkZHJlc3NGdWxsGAogASgLMh0ud2VlYmkuY29tbW9u'
    'LmFkZHJlc3MuQWRkcmVzc1ILYWRkcmVzc0Z1bGwSFAoFcHJvbW8YCyABKAFSBXByb21vEh4KCn'
    'Byb21vU3RhcnQYDCABKAlSCnByb21vU3RhcnQSGgoIcHJvbW9FbmQYDSABKAlSCHByb21vRW5k'
    'Ei4KB2RldmljZXMYDiADKAsyFC53ZWViaS5kZXZpY2UuRGV2aWNlUgdkZXZpY2VzEmgKFWFkZG'
    'l0aW9uYWxfYXR0cmlidXRlcxhjIAMoCzIyLndlZWJpLmJvdXRpcXVlLkJvdXRpcXVlLkFkZGl0'
    'aW9uYWxBdHRyaWJ1dGVzRW50cnlSFWFkZGl0aW9uYWxfYXR0cmlidXRlcxpHChlBZGRpdGlvbm'
    'FsQXR0cmlidXRlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1'
    'ZToCOAFKBAgPEGM=');

