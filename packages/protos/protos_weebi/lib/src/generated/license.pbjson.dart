//
//  Generated code. Do not modify.
//  source: license.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use licensePlanDescriptor instead')
const LicensePlan$json = {
  '1': 'LicensePlan',
  '2': [
    {'1': 'LICENSE_PLAN_UNKNOWN', '2': 0},
    {'1': 'STARTER', '2': 1},
    {'1': 'BOUTIQUE_3X3', '2': 2},
    {'1': 'PRO', '2': 3},
  ],
};

/// Descriptor for `LicensePlan`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List licensePlanDescriptor = $convert.base64Decode(
    'CgtMaWNlbnNlUGxhbhIYChRMSUNFTlNFX1BMQU5fVU5LTk9XThAAEgsKB1NUQVJURVIQARIQCg'
    'xCT1VUSVFVRV8zWDMQAhIHCgNQUk8QAw==');

@$core.Deprecated('Use licenseDescriptor instead')
const License$json = {
  '1': 'License',
  '2': [
    {'1': 'licenseId', '3': 1, '4': 1, '5': 9, '10': 'licenseId'},
    {'1': 'licensePlan', '3': 2, '4': 1, '5': 14, '6': '.weebi.license.LicensePlan', '10': 'licensePlan'},
    {'1': 'providerProductId', '3': 3, '4': 1, '5': 9, '10': 'providerProductId'},
    {'1': 'providerPriceId', '3': 4, '4': 1, '5': 9, '10': 'providerPriceId'},
    {'1': 'maxUsers', '3': 5, '4': 1, '5': 5, '10': 'maxUsers'},
    {'1': 'validFrom', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'validFrom'},
    {'1': 'validUntil', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'validUntil'},
    {'1': 'seats', '3': 8, '4': 3, '5': 11, '6': '.weebi.license.LicenseSeat', '10': 'seats'},
    {'1': 'paymentProvider', '3': 9, '4': 1, '5': 9, '10': 'paymentProvider'},
  ],
};

/// Descriptor for `License`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List licenseDescriptor = $convert.base64Decode(
    'CgdMaWNlbnNlEhwKCWxpY2Vuc2VJZBgBIAEoCVIJbGljZW5zZUlkEjwKC2xpY2Vuc2VQbGFuGA'
    'IgASgOMhoud2VlYmkubGljZW5zZS5MaWNlbnNlUGxhblILbGljZW5zZVBsYW4SLAoRcHJvdmlk'
    'ZXJQcm9kdWN0SWQYAyABKAlSEXByb3ZpZGVyUHJvZHVjdElkEigKD3Byb3ZpZGVyUHJpY2VJZB'
    'gEIAEoCVIPcHJvdmlkZXJQcmljZUlkEhoKCG1heFVzZXJzGAUgASgFUghtYXhVc2VycxI4Cgl2'
    'YWxpZEZyb20YBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl2YWxpZEZyb20SOg'
    'oKdmFsaWRVbnRpbBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCnZhbGlkVW50'
    'aWwSMAoFc2VhdHMYCCADKAsyGi53ZWViaS5saWNlbnNlLkxpY2Vuc2VTZWF0UgVzZWF0cxIoCg'
    '9wYXltZW50UHJvdmlkZXIYCSABKAlSD3BheW1lbnRQcm92aWRlcg==');

@$core.Deprecated('Use licenseSeatDescriptor instead')
const LicenseSeat$json = {
  '1': 'LicenseSeat',
  '2': [
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'validFrom', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'validFrom'},
    {'1': 'validUntil', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'validUntil'},
  ],
};

/// Descriptor for `LicenseSeat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List licenseSeatDescriptor = $convert.base64Decode(
    'CgtMaWNlbnNlU2VhdBIWCgZmaXJtSWQYASABKAlSBmZpcm1JZBIWCgZ1c2VySWQYAiABKAlSBn'
    'VzZXJJZBI4Cgl2YWxpZEZyb20YAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl2'
    'YWxpZEZyb20SOgoKdmFsaWRVbnRpbBgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbX'
    'BSCnZhbGlkVW50aWw=');

