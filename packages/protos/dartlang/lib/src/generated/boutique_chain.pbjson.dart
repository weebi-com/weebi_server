//
//  Generated code. Do not modify.
//  source: boutique_chain.proto
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
    {'1': '_id', '3': 1, '4': 1, '5': 11, '6': '.weebi.common.mongo.ObjectIdProto', '10': '_id'},
    {'1': 'firmOid', '3': 2, '4': 1, '5': 9, '10': 'firmOid'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'boutiques', '3': 4, '4': 3, '5': 11, '6': '.weebi.boutique.Boutique', '10': 'boutiques'},
    {'1': 'devices', '3': 5, '4': 3, '5': 11, '6': '.weebi.chain.Device', '10': 'devices'},
    {'1': 'lastUpdateTimestampUTC', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdateTimestampUTC'},
    {'1': 'lastUpdatedByUserOid', '3': 7, '4': 1, '5': 9, '10': 'lastUpdatedByUserOid'},
  ],
};

/// Descriptor for `Chain`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainDescriptor = $convert.base64Decode(
    'CgVDaGFpbhIzCgNfaWQYASABKAsyIS53ZWViaS5jb21tb24ubW9uZ28uT2JqZWN0SWRQcm90b1'
    'IDX2lkEhgKB2Zpcm1PaWQYAiABKAlSB2Zpcm1PaWQSEgoEbmFtZRgDIAEoCVIEbmFtZRI2Cgli'
    'b3V0aXF1ZXMYBCADKAsyGC53ZWViaS5ib3V0aXF1ZS5Cb3V0aXF1ZVIJYm91dGlxdWVzEi0KB2'
    'RldmljZXMYBSADKAsyEy53ZWViaS5jaGFpbi5EZXZpY2VSB2RldmljZXMSUgoWbGFzdFVwZGF0'
    'ZVRpbWVzdGFtcFVUQxgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFmxhc3RVcG'
    'RhdGVUaW1lc3RhbXBVVEMSMgoUbGFzdFVwZGF0ZWRCeVVzZXJPaWQYByABKAlSFGxhc3RVcGRh'
    'dGVkQnlVc2VyT2lk');

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
    {'1': '_id', '3': 1, '4': 1, '5': 11, '6': '.weebi.common.mongo.ObjectIdProto', '10': '_id'},
    {'1': 'chainOid', '3': 2, '4': 1, '5': 9, '10': 'chainOid'},
    {'1': 'boutiqueOid', '3': 3, '4': 1, '5': 9, '10': 'boutiqueOid'},
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
    'CgZEZXZpY2USMwoDX2lkGAEgASgLMiEud2VlYmkuY29tbW9uLm1vbmdvLk9iamVjdElkUHJvdG'
    '9SA19pZBIaCghjaGFpbk9pZBgCIAEoCVIIY2hhaW5PaWQSIAoLYm91dGlxdWVPaWQYAyABKAlS'
    'C2JvdXRpcXVlT2lkEhYKBnN0YXR1cxgEIAEoCFIGc3RhdHVzEhoKCHBhc3N3b3JkGAUgASgJUg'
    'hwYXNzd29yZBISCgRuYW1lGAYgASgJUgRuYW1lEiIKDHNlcmlhbE51bWJlchgHIAEoCVIMc2Vy'
    'aWFsTnVtYmVyEhYKBmJhc2VPUxgIIAEoCVIGYmFzZU9TEhQKBWJyYW5kGAkgASgJUgVicmFuZA'
    '==');

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

