//
//  Generated code. Do not modify.
//  source: common/mongo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chainOidAndBoutiqueOidDescriptor instead')
const ChainOidAndBoutiqueOid$json = {
  '1': 'ChainOidAndBoutiqueOid',
  '2': [
    {'1': 'chainOid', '3': 1, '4': 1, '5': 9, '10': 'chainOid'},
    {'1': 'boutiqueOid', '3': 2, '4': 1, '5': 9, '10': 'boutiqueOid'},
  ],
};

/// Descriptor for `ChainOidAndBoutiqueOid`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainOidAndBoutiqueOidDescriptor = $convert.base64Decode(
    'ChZDaGFpbk9pZEFuZEJvdXRpcXVlT2lkEhoKCGNoYWluT2lkGAEgASgJUghjaGFpbk9pZBIgCg'
    'tib3V0aXF1ZU9pZBgCIAEoCVILYm91dGlxdWVPaWQ=');

@$core.Deprecated('Use testingDescriptor instead')
const Testing$json = {
  '1': 'Testing',
  '2': [
    {'1': '_id', '3': 1, '4': 1, '5': 11, '6': '.weebi.common.mongo.ObjectIdProto', '10': 'Id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Testing`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testingDescriptor = $convert.base64Decode(
    'CgdUZXN0aW5nEjIKA19pZBgBIAEoCzIhLndlZWJpLmNvbW1vbi5tb25nby5PYmplY3RJZFByb3'
    'RvUgJJZBISCgRuYW1lGAIgASgJUgRuYW1l');

@$core.Deprecated('Use objectIdProtoDescriptor instead')
const ObjectIdProto$json = {
  '1': 'ObjectIdProto',
  '2': [
    {'1': 'oid', '3': 1, '4': 1, '5': 9, '10': 'oid'},
  ],
};

/// Descriptor for `ObjectIdProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List objectIdProtoDescriptor = $convert.base64Decode(
    'Cg1PYmplY3RJZFByb3RvEhAKA29pZBgBIAEoCVIDb2lk');

