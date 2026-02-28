//
//  Generated code. Do not modify.
//  source: billing_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createLicenseRequestDescriptor instead')
const CreateLicenseRequest$json = {
  '1': 'CreateLicenseRequest',
  '2': [
    {'1': 'license', '3': 1, '4': 1, '5': 11, '6': '.weebi.license.License', '10': 'license'},
  ],
};

/// Descriptor for `CreateLicenseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLicenseRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVMaWNlbnNlUmVxdWVzdBIwCgdsaWNlbnNlGAEgASgLMhYud2VlYmkubGljZW5zZS'
    '5MaWNlbnNlUgdsaWNlbnNl');

@$core.Deprecated('Use createLicenseResponseDescriptor instead')
const CreateLicenseResponse$json = {
  '1': 'CreateLicenseResponse',
  '2': [
    {'1': 'statusResponse', '3': 1, '4': 1, '5': 11, '6': '.google.retail.common.StatusResponse', '10': 'statusResponse'},
    {'1': 'license', '3': 2, '4': 1, '5': 11, '6': '.weebi.license.License', '10': 'license'},
  ],
};

/// Descriptor for `CreateLicenseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLicenseResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVMaWNlbnNlUmVzcG9uc2USTAoOc3RhdHVzUmVzcG9uc2UYASABKAsyJC5nb29nbG'
    'UucmV0YWlsLmNvbW1vbi5TdGF0dXNSZXNwb25zZVIOc3RhdHVzUmVzcG9uc2USMAoHbGljZW5z'
    'ZRgCIAEoCzIWLndlZWJpLmxpY2Vuc2UuTGljZW5zZVIHbGljZW5zZQ==');

@$core.Deprecated('Use readLicensesResponseDescriptor instead')
const ReadLicensesResponse$json = {
  '1': 'ReadLicensesResponse',
  '2': [
    {'1': 'licenses', '3': 1, '4': 3, '5': 11, '6': '.weebi.license.License', '10': 'licenses'},
  ],
};

/// Descriptor for `ReadLicensesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readLicensesResponseDescriptor = $convert.base64Decode(
    'ChRSZWFkTGljZW5zZXNSZXNwb25zZRIyCghsaWNlbnNlcxgBIAMoCzIWLndlZWJpLmxpY2Vuc2'
    'UuTGljZW5zZVIIbGljZW5zZXM=');

@$core.Deprecated('Use updateLicenseRequestDescriptor instead')
const UpdateLicenseRequest$json = {
  '1': 'UpdateLicenseRequest',
  '2': [
    {'1': 'licenseId', '3': 1, '4': 1, '5': 9, '10': 'licenseId'},
    {'1': 'license', '3': 2, '4': 1, '5': 11, '6': '.weebi.license.License', '10': 'license'},
  ],
};

/// Descriptor for `UpdateLicenseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLicenseRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVMaWNlbnNlUmVxdWVzdBIcCglsaWNlbnNlSWQYASABKAlSCWxpY2Vuc2VJZBIwCg'
    'dsaWNlbnNlGAIgASgLMhYud2VlYmkubGljZW5zZS5MaWNlbnNlUgdsaWNlbnNl');

@$core.Deprecated('Use deleteLicenseRequestDescriptor instead')
const DeleteLicenseRequest$json = {
  '1': 'DeleteLicenseRequest',
  '2': [
    {'1': 'licenseId', '3': 1, '4': 1, '5': 9, '10': 'licenseId'},
  ],
};

/// Descriptor for `DeleteLicenseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteLicenseRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVMaWNlbnNlUmVxdWVzdBIcCglsaWNlbnNlSWQYASABKAlSCWxpY2Vuc2VJZA==');

@$core.Deprecated('Use updatePaymentCustomerIdRequestDescriptor instead')
const UpdatePaymentCustomerIdRequest$json = {
  '1': 'UpdatePaymentCustomerIdRequest',
  '2': [
    {'1': 'provider', '3': 1, '4': 1, '5': 9, '10': 'provider'},
    {'1': 'paymentCustomerId', '3': 2, '4': 1, '5': 9, '10': 'paymentCustomerId'},
  ],
};

/// Descriptor for `UpdatePaymentCustomerIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePaymentCustomerIdRequestDescriptor = $convert.base64Decode(
    'Ch5VcGRhdGVQYXltZW50Q3VzdG9tZXJJZFJlcXVlc3QSGgoIcHJvdmlkZXIYASABKAlSCHByb3'
    'ZpZGVyEiwKEXBheW1lbnRDdXN0b21lcklkGAIgASgJUhFwYXltZW50Q3VzdG9tZXJJZA==');

