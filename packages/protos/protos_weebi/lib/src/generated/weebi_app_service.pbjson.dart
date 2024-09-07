//
//  Generated code. Do not modify.
//  source: weebi_app_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use appMinVersionRequestDescriptor instead')
const AppMinVersionRequest$json = {
  '1': 'AppMinVersionRequest',
};

/// Descriptor for `AppMinVersionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appMinVersionRequestDescriptor = $convert.base64Decode(
    'ChRBcHBNaW5WZXJzaW9uUmVxdWVzdA==');

@$core.Deprecated('Use appMinVersionResponseDescriptor instead')
const AppMinVersionResponse$json = {
  '1': 'AppMinVersionResponse',
  '2': [
    {'1': 'minVersion', '3': 1, '4': 1, '5': 5, '10': 'minVersion'},
    {'1': 'isUpgradeImperative', '3': 2, '4': 1, '5': 8, '10': 'isUpgradeImperative'},
  ],
};

/// Descriptor for `AppMinVersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appMinVersionResponseDescriptor = $convert.base64Decode(
    'ChVBcHBNaW5WZXJzaW9uUmVzcG9uc2USHgoKbWluVmVyc2lvbhgBIAEoBVIKbWluVmVyc2lvbh'
    'IwChNpc1VwZ3JhZGVJbXBlcmF0aXZlGAIgASgIUhNpc1VwZ3JhZGVJbXBlcmF0aXZl');

