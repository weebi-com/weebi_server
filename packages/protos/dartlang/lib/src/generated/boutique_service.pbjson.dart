//
//  Generated code. Do not modify.
//  source: boutique_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use readRequestDescriptor instead')
const ReadRequest$json = {
  '1': 'ReadRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
  ],
};

/// Descriptor for `ReadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readRequestDescriptor = $convert.base64Decode(
    'CgtSZWFkUmVxdWVzdBIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklk');

@$core.Deprecated('Use deleteDeviceRequestDescriptor instead')
const DeleteDeviceRequest$json = {
  '1': 'DeleteDeviceRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'device', '3': 2, '4': 1, '5': 11, '6': '.weebi.chain.Device', '10': 'device'},
  ],
};

/// Descriptor for `DeleteDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDeviceRequestDescriptor = $convert.base64Decode(
    'ChNEZWxldGVEZXZpY2VSZXF1ZXN0EhgKB2NoYWluSWQYASABKAlSB2NoYWluSWQSKwoGZGV2aW'
    'NlGAIgASgLMhMud2VlYmkuY2hhaW4uRGV2aWNlUgZkZXZpY2U=');

