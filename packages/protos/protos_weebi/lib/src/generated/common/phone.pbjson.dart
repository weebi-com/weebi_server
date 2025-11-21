// This is a generated file - do not edit.
//
// Generated from common/phone.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use phoneDescriptor instead')
const Phone$json = {
  '1': 'Phone',
  '2': [
    {'1': 'countryCode', '3': 1, '4': 1, '5': 5, '10': 'countryCode'},
    {'1': 'number', '3': 2, '4': 1, '5': 9, '10': 'number'},
  ],
};

/// Descriptor for `Phone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List phoneDescriptor = $convert.base64Decode(
    'CgVQaG9uZRIgCgtjb3VudHJ5Q29kZRgBIAEoBVILY291bnRyeUNvZGUSFgoGbnVtYmVyGAIgAS'
    'gJUgZudW1iZXI=');
