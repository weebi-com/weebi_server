//
//  Generated code. Do not modify.
//  source: btq_firm.proto
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
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'chains', '3': 3, '4': 3, '5': 11, '6': '.weebi.chain.Chain', '10': 'chains'},
    {'1': 'subscriptionPlan', '3': 4, '4': 1, '5': 9, '10': 'subscriptionPlan'},
    {'1': 'subscriptionSeats', '3': 5, '4': 1, '5': 5, '10': 'subscriptionSeats'},
    {'1': 'subscriptionStartTimestampUTC', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'subscriptionStartTimestampUTC'},
    {'1': 'subscriptionEndTimestampUTC', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'subscriptionEndTimestampUTC'},
    {'1': 'status', '3': 8, '4': 1, '5': 8, '10': 'status'},
    {'1': 'statusUpdateTimestampUTC', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'statusUpdateTimestampUTC'},
    {'1': 'lastUpdateTimestampUTC', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdateTimestampUTC'},
    {'1': 'lastUpdatedByuserId', '3': 11, '4': 1, '5': 9, '10': 'lastUpdatedByuserId'},
    {'1': 'isMailVerified', '3': 12, '4': 1, '5': 8, '10': 'isMailVerified'},
  ],
};

/// Descriptor for `Firm`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List firmDescriptor = $convert.base64Decode(
    'CgRGaXJtEhYKBmZpcm1JZBgBIAEoCVIGZmlybUlkEhIKBG5hbWUYAiABKAlSBG5hbWUSKgoGY2'
    'hhaW5zGAMgAygLMhIud2VlYmkuY2hhaW4uQ2hhaW5SBmNoYWlucxIqChBzdWJzY3JpcHRpb25Q'
    'bGFuGAQgASgJUhBzdWJzY3JpcHRpb25QbGFuEiwKEXN1YnNjcmlwdGlvblNlYXRzGAUgASgFUh'
    'FzdWJzY3JpcHRpb25TZWF0cxJgCh1zdWJzY3JpcHRpb25TdGFydFRpbWVzdGFtcFVUQxgGIAEo'
    'CzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSHXN1YnNjcmlwdGlvblN0YXJ0VGltZXN0YW'
    '1wVVRDElwKG3N1YnNjcmlwdGlvbkVuZFRpbWVzdGFtcFVUQxgHIAEoCzIaLmdvb2dsZS5wcm90'
    'b2J1Zi5UaW1lc3RhbXBSG3N1YnNjcmlwdGlvbkVuZFRpbWVzdGFtcFVUQxIWCgZzdGF0dXMYCC'
    'ABKAhSBnN0YXR1cxJWChhzdGF0dXNVcGRhdGVUaW1lc3RhbXBVVEMYCSABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wUhhzdGF0dXNVcGRhdGVUaW1lc3RhbXBVVEMSUgoWbGFzdFVwZG'
    'F0ZVRpbWVzdGFtcFVUQxgKIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFmxhc3RV'
    'cGRhdGVUaW1lc3RhbXBVVEMSMAoTbGFzdFVwZGF0ZWRCeXVzZXJJZBgLIAEoCVITbGFzdFVwZG'
    'F0ZWRCeXVzZXJJZBImCg5pc01haWxWZXJpZmllZBgMIAEoCFIOaXNNYWlsVmVyaWZpZWQ=');

@$core.Deprecated('Use createFirmRequestDescriptor instead')
const CreateFirmRequest$json = {
  '1': 'CreateFirmRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `CreateFirmRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFirmRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVGaXJtUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1l');

@$core.Deprecated('Use createFirmResponseDescriptor instead')
const CreateFirmResponse$json = {
  '1': 'CreateFirmResponse',
  '2': [
    {'1': 'statusResponse', '3': 1, '4': 1, '5': 11, '6': '.google.retail.common.StatusResponse', '10': 'statusResponse'},
    {'1': 'firm', '3': 2, '4': 1, '5': 11, '6': '.weebi.firm.Firm', '10': 'firm'},
  ],
};

/// Descriptor for `CreateFirmResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFirmResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVGaXJtUmVzcG9uc2USTAoOc3RhdHVzUmVzcG9uc2UYASABKAsyJC5nb29nbGUucm'
    'V0YWlsLmNvbW1vbi5TdGF0dXNSZXNwb25zZVIOc3RhdHVzUmVzcG9uc2USJAoEZmlybRgCIAEo'
    'CzIQLndlZWJpLmZpcm0uRmlybVIEZmlybQ==');

