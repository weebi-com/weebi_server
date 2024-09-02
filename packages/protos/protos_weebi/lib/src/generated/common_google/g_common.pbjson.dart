//
//  Generated code. Do not modify.
//  source: common/g_common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use statusResponseDescriptor instead')
const StatusResponse$json = {
  '1': 'StatusResponse',
  '2': [
    {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.google.retail.common.StatusResponse.Type', '10': 'type'},
    {'1': 'id', '3': 3, '4': 1, '5': 9, '10': 'id'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
  ],
  '4': [StatusResponse_Type$json],
};

@$core.Deprecated('Use statusResponseDescriptor instead')
const StatusResponse_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'SUCCESS', '2': 0},
    {'1': 'ERROR', '2': 1},
    {'1': 'CREATED', '2': 2},
    {'1': 'UPDATED', '2': 3},
    {'1': 'DELETED', '2': 4},
  ],
};

/// Descriptor for `StatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusResponseDescriptor = $convert.base64Decode(
    'Cg5TdGF0dXNSZXNwb25zZRIcCgl0aW1lc3RhbXAYASABKANSCXRpbWVzdGFtcBI9CgR0eXBlGA'
    'IgASgOMikuZ29vZ2xlLnJldGFpbC5jb21tb24uU3RhdHVzUmVzcG9uc2UuVHlwZVIEdHlwZRIO'
    'CgJpZBgDIAEoCVICaWQSGAoHbWVzc2FnZRgEIAEoCVIHbWVzc2FnZSJFCgRUeXBlEgsKB1NVQ0'
    'NFU1MQABIJCgVFUlJPUhABEgsKB0NSRUFURUQQAhILCgdVUERBVEVEEAMSCwoHREVMRVRFRBAE');

@$core.Deprecated('Use healthCheckResponseDescriptor instead')
const HealthCheckResponse$json = {
  '1': 'HealthCheckResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.google.retail.common.HealthCheckResponse.ServingStatus', '10': 'status'},
  ],
  '4': [HealthCheckResponse_ServingStatus$json],
};

@$core.Deprecated('Use healthCheckResponseDescriptor instead')
const HealthCheckResponse_ServingStatus$json = {
  '1': 'ServingStatus',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'SERVING', '2': 1},
    {'1': 'NOT_SERVING', '2': 2},
    {'1': 'SERVICE_UNKNOWN', '2': 3},
  ],
};

/// Descriptor for `HealthCheckResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List healthCheckResponseDescriptor = $convert.base64Decode(
    'ChNIZWFsdGhDaGVja1Jlc3BvbnNlEk8KBnN0YXR1cxgBIAEoDjI3Lmdvb2dsZS5yZXRhaWwuY2'
    '9tbW9uLkhlYWx0aENoZWNrUmVzcG9uc2UuU2VydmluZ1N0YXR1c1IGc3RhdHVzIk8KDVNlcnZp'
    'bmdTdGF0dXMSCwoHVU5LTk9XThAAEgsKB1NFUlZJTkcQARIPCgtOT1RfU0VSVklORxACEhMKD1'
    'NFUlZJQ0VfVU5LTk9XThAD');

