//
//  Generated code. Do not modify.
//  source: firm.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use firmDescriptor instead')
const Firm$json = {
  '1': 'Firm',
  '2': [
    {'1': '_id', '3': 1, '4': 1, '5': 11, '6': '.weebi.common.mongo.ObjectIdProto', '10': '_id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'chains', '3': 3, '4': 3, '5': 11, '6': '.weebi.chain.Chain', '10': 'chains'},
    {'1': 'subscriptionPlan', '3': 4, '4': 1, '5': 9, '10': 'subscriptionPlan'},
    {'1': 'subscriptionSeats', '3': 5, '4': 1, '5': 5, '10': 'subscriptionSeats'},
    {'1': 'subscriptionStartTimestampUTC', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'subscriptionStartTimestampUTC'},
    {'1': 'subscriptionEndTimestampUTC', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'subscriptionEndTimestampUTC'},
    {'1': 'status', '3': 8, '4': 1, '5': 8, '10': 'status'},
    {'1': 'statusUpdateTimestampUTC', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'statusUpdateTimestampUTC'},
    {'1': 'lastUpdateTimestampUTC', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdateTimestampUTC'},
    {'1': 'lastUpdatedByUserOid', '3': 11, '4': 1, '5': 9, '10': 'lastUpdatedByUserOid'},
    {'1': 'isMailVerified', '3': 12, '4': 1, '5': 8, '10': 'isMailVerified'},
  ],
};

/// Descriptor for `Firm`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List firmDescriptor = $convert.base64Decode(
    'CgRGaXJtEjMKA19pZBgBIAEoCzIhLndlZWJpLmNvbW1vbi5tb25nby5PYmplY3RJZFByb3RvUg'
    'NfaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIqCgZjaGFpbnMYAyADKAsyEi53ZWViaS5jaGFpbi5D'
    'aGFpblIGY2hhaW5zEioKEHN1YnNjcmlwdGlvblBsYW4YBCABKAlSEHN1YnNjcmlwdGlvblBsYW'
    '4SLAoRc3Vic2NyaXB0aW9uU2VhdHMYBSABKAVSEXN1YnNjcmlwdGlvblNlYXRzEmAKHXN1YnNj'
    'cmlwdGlvblN0YXJ0VGltZXN0YW1wVVRDGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcFIdc3Vic2NyaXB0aW9uU3RhcnRUaW1lc3RhbXBVVEMSXAobc3Vic2NyaXB0aW9uRW5kVGlt'
    'ZXN0YW1wVVRDGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIbc3Vic2NyaXB0aW'
    '9uRW5kVGltZXN0YW1wVVRDEhYKBnN0YXR1cxgIIAEoCFIGc3RhdHVzElYKGHN0YXR1c1VwZGF0'
    'ZVRpbWVzdGFtcFVUQxgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSGHN0YXR1c1'
    'VwZGF0ZVRpbWVzdGFtcFVUQxJSChZsYXN0VXBkYXRlVGltZXN0YW1wVVRDGAogASgLMhouZ29v'
    'Z2xlLnByb3RvYnVmLlRpbWVzdGFtcFIWbGFzdFVwZGF0ZVRpbWVzdGFtcFVUQxIyChRsYXN0VX'
    'BkYXRlZEJ5VXNlck9pZBgLIAEoCVIUbGFzdFVwZGF0ZWRCeVVzZXJPaWQSJgoOaXNNYWlsVmVy'
    'aWZpZWQYDCABKAhSDmlzTWFpbFZlcmlmaWVk');

