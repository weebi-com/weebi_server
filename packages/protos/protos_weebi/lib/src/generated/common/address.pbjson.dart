//
//  Generated code. Do not modify.
//  source: common/address.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use addressDescriptor instead')
const Address$json = {
  '1': 'Address',
  '2': [
    {'1': 'street', '3': 1, '4': 1, '5': 9, '10': 'street'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    {'1': 'city', '3': 3, '4': 1, '5': 9, '10': 'city'},
    {'1': 'country', '3': 4, '4': 1, '5': 11, '6': '.weebi.common.country.Country', '10': 'country'},
    {'1': 'latitude', '3': 5, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 6, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `Address`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addressDescriptor = $convert.base64Decode(
    'CgdBZGRyZXNzEhYKBnN0cmVldBgBIAEoCVIGc3RyZWV0EhIKBGNvZGUYAiABKAlSBGNvZGUSEg'
    'oEY2l0eRgDIAEoCVIEY2l0eRI3Cgdjb3VudHJ5GAQgASgLMh0ud2VlYmkuY29tbW9uLmNvdW50'
    'cnkuQ291bnRyeVIHY291bnRyeRIaCghsYXRpdHVkZRgFIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2'
    'l0dWRlGAYgASgBUglsb25naXR1ZGU=');

