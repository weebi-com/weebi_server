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
    {'1': 'referralCode', '3': 2, '4': 1, '5': 9, '10': 'referralCode'},
    {'1': 'creditAppliedCents', '3': 3, '4': 1, '5': 5, '10': 'creditAppliedCents'},
  ],
};

/// Descriptor for `CreateLicenseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLicenseRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVMaWNlbnNlUmVxdWVzdBIwCgdsaWNlbnNlGAEgASgLMhYud2VlYmkubGljZW5zZS'
    '5MaWNlbnNlUgdsaWNlbnNlEiIKDHJlZmVycmFsQ29kZRgCIAEoCVIMcmVmZXJyYWxDb2RlEi4K'
    'EmNyZWRpdEFwcGxpZWRDZW50cxgDIAEoBVISY3JlZGl0QXBwbGllZENlbnRz');

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

@$core.Deprecated('Use getReferralInfoResponseDescriptor instead')
const GetReferralInfoResponse$json = {
  '1': 'GetReferralInfoResponse',
  '2': [
    {'1': 'referralCode', '3': 1, '4': 1, '5': 9, '10': 'referralCode'},
    {'1': 'creditBalanceCents', '3': 2, '4': 1, '5': 5, '10': 'creditBalanceCents'},
    {'1': 'minPayoutCents', '3': 3, '4': 1, '5': 5, '10': 'minPayoutCents'},
  ],
};

/// Descriptor for `GetReferralInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getReferralInfoResponseDescriptor = $convert.base64Decode(
    'ChdHZXRSZWZlcnJhbEluZm9SZXNwb25zZRIiCgxyZWZlcnJhbENvZGUYASABKAlSDHJlZmVycm'
    'FsQ29kZRIuChJjcmVkaXRCYWxhbmNlQ2VudHMYAiABKAVSEmNyZWRpdEJhbGFuY2VDZW50cxIm'
    'Cg5taW5QYXlvdXRDZW50cxgDIAEoBVIObWluUGF5b3V0Q2VudHM=');

@$core.Deprecated('Use requestReferralPayoutResponseDescriptor instead')
const RequestReferralPayoutResponse$json = {
  '1': 'RequestReferralPayoutResponse',
  '2': [
    {'1': 'statusResponse', '3': 1, '4': 1, '5': 11, '6': '.google.retail.common.StatusResponse', '10': 'statusResponse'},
    {'1': 'amountCents', '3': 2, '4': 1, '5': 5, '10': 'amountCents'},
  ],
};

/// Descriptor for `RequestReferralPayoutResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestReferralPayoutResponseDescriptor = $convert.base64Decode(
    'Ch1SZXF1ZXN0UmVmZXJyYWxQYXlvdXRSZXNwb25zZRJMCg5zdGF0dXNSZXNwb25zZRgBIAEoCz'
    'IkLmdvb2dsZS5yZXRhaWwuY29tbW9uLlN0YXR1c1Jlc3BvbnNlUg5zdGF0dXNSZXNwb25zZRIg'
    'CgthbW91bnRDZW50cxgCIAEoBVILYW1vdW50Q2VudHM=');

@$core.Deprecated('Use createCheckoutSessionRequestDescriptor instead')
const CreateCheckoutSessionRequest$json = {
  '1': 'CreateCheckoutSessionRequest',
  '2': [
    {'1': 'priceId', '3': 1, '4': 1, '5': 9, '10': 'priceId'},
    {'1': 'successUrl', '3': 2, '4': 1, '5': 9, '10': 'successUrl'},
    {'1': 'cancelUrl', '3': 3, '4': 1, '5': 9, '10': 'cancelUrl'},
    {'1': 'referralCode', '3': 4, '4': 1, '5': 9, '10': 'referralCode'},
    {'1': 'creditAppliedCents', '3': 5, '4': 1, '5': 5, '10': 'creditAppliedCents'},
  ],
};

/// Descriptor for `CreateCheckoutSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCheckoutSessionRequestDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVDaGVja291dFNlc3Npb25SZXF1ZXN0EhgKB3ByaWNlSWQYASABKAlSB3ByaWNlSW'
    'QSHgoKc3VjY2Vzc1VybBgCIAEoCVIKc3VjY2Vzc1VybBIcCgljYW5jZWxVcmwYAyABKAlSCWNh'
    'bmNlbFVybBIiCgxyZWZlcnJhbENvZGUYBCABKAlSDHJlZmVycmFsQ29kZRIuChJjcmVkaXRBcH'
    'BsaWVkQ2VudHMYBSABKAVSEmNyZWRpdEFwcGxpZWRDZW50cw==');

@$core.Deprecated('Use createCheckoutSessionResponseDescriptor instead')
const CreateCheckoutSessionResponse$json = {
  '1': 'CreateCheckoutSessionResponse',
  '2': [
    {'1': 'checkoutUrl', '3': 1, '4': 1, '5': 9, '10': 'checkoutUrl'},
  ],
};

/// Descriptor for `CreateCheckoutSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCheckoutSessionResponseDescriptor = $convert.base64Decode(
    'Ch1DcmVhdGVDaGVja291dFNlc3Npb25SZXNwb25zZRIgCgtjaGVja291dFVybBgBIAEoCVILY2'
    'hlY2tvdXRVcmw=');

@$core.Deprecated('Use fulfillLicenseFromStripeRequestDescriptor instead')
const FulfillLicenseFromStripeRequest$json = {
  '1': 'FulfillLicenseFromStripeRequest',
  '2': [
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'licenseId', '3': 2, '4': 1, '5': 9, '10': 'licenseId'},
    {'1': 'priceId', '3': 3, '4': 1, '5': 9, '10': 'priceId'},
    {'1': 'stripeCustomerId', '3': 4, '4': 1, '5': 9, '10': 'stripeCustomerId'},
    {'1': 'referralCode', '3': 5, '4': 1, '5': 9, '10': 'referralCode'},
    {'1': 'creditAppliedCents', '3': 6, '4': 1, '5': 5, '10': 'creditAppliedCents'},
  ],
};

/// Descriptor for `FulfillLicenseFromStripeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fulfillLicenseFromStripeRequestDescriptor = $convert.base64Decode(
    'Ch9GdWxmaWxsTGljZW5zZUZyb21TdHJpcGVSZXF1ZXN0EhYKBmZpcm1JZBgBIAEoCVIGZmlybU'
    'lkEhwKCWxpY2Vuc2VJZBgCIAEoCVIJbGljZW5zZUlkEhgKB3ByaWNlSWQYAyABKAlSB3ByaWNl'
    'SWQSKgoQc3RyaXBlQ3VzdG9tZXJJZBgEIAEoCVIQc3RyaXBlQ3VzdG9tZXJJZBIiCgxyZWZlcn'
    'JhbENvZGUYBSABKAlSDHJlZmVycmFsQ29kZRIuChJjcmVkaXRBcHBsaWVkQ2VudHMYBiABKAVS'
    'EmNyZWRpdEFwcGxpZWRDZW50cw==');

@$core.Deprecated('Use fulfillFromStripeCheckoutSessionRequestDescriptor instead')
const FulfillFromStripeCheckoutSessionRequest$json = {
  '1': 'FulfillFromStripeCheckoutSessionRequest',
  '2': [
    {'1': 'checkoutSessionId', '3': 1, '4': 1, '5': 9, '10': 'checkoutSessionId'},
  ],
};

/// Descriptor for `FulfillFromStripeCheckoutSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fulfillFromStripeCheckoutSessionRequestDescriptor = $convert.base64Decode(
    'CidGdWxmaWxsRnJvbVN0cmlwZUNoZWNrb3V0U2Vzc2lvblJlcXVlc3QSLAoRY2hlY2tvdXRTZX'
    'NzaW9uSWQYASABKAlSEWNoZWNrb3V0U2Vzc2lvbklk');

@$core.Deprecated('Use billingProductDescriptor instead')
const BillingProduct$json = {
  '1': 'BillingProduct',
  '2': [
    {'1': 'productId', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'licensePlan', '3': 2, '4': 1, '5': 14, '6': '.weebi.license.LicensePlan', '10': 'licensePlan'},
    {'1': 'maxUsers', '3': 3, '4': 1, '5': 5, '10': 'maxUsers'},
    {'1': 'amountCents', '3': 4, '4': 1, '5': 5, '10': 'amountCents'},
    {'1': 'currency', '3': 5, '4': 1, '5': 9, '10': 'currency'},
    {'1': 'stripeProductId', '3': 6, '4': 1, '5': 9, '10': 'stripeProductId'},
    {'1': 'stripePriceId', '3': 7, '4': 1, '5': 9, '10': 'stripePriceId'},
    {'1': 'pawapayProductId', '3': 8, '4': 1, '5': 9, '10': 'pawapayProductId'},
    {'1': 'creationDateUTC', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'creationDateUTC'},
    {'1': 'updateDateUTC', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updateDateUTC'},
    {'1': 'deletionDateUTC', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'deletionDateUTC'},
    {'1': 'isDeleted', '3': 12, '4': 1, '5': 8, '10': 'isDeleted'},
  ],
};

/// Descriptor for `BillingProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List billingProductDescriptor = $convert.base64Decode(
    'Cg5CaWxsaW5nUHJvZHVjdBIcCglwcm9kdWN0SWQYASABKAlSCXByb2R1Y3RJZBI8CgtsaWNlbn'
    'NlUGxhbhgCIAEoDjIaLndlZWJpLmxpY2Vuc2UuTGljZW5zZVBsYW5SC2xpY2Vuc2VQbGFuEhoK'
    'CG1heFVzZXJzGAMgASgFUghtYXhVc2VycxIgCgthbW91bnRDZW50cxgEIAEoBVILYW1vdW50Q2'
    'VudHMSGgoIY3VycmVuY3kYBSABKAlSCGN1cnJlbmN5EigKD3N0cmlwZVByb2R1Y3RJZBgGIAEo'
    'CVIPc3RyaXBlUHJvZHVjdElkEiQKDXN0cmlwZVByaWNlSWQYByABKAlSDXN0cmlwZVByaWNlSW'
    'QSKgoQcGF3YXBheVByb2R1Y3RJZBgIIAEoCVIQcGF3YXBheVByb2R1Y3RJZBJECg9jcmVhdGlv'
    'bkRhdGVVVEMYCSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg9jcmVhdGlvbkRhdG'
    'VVVEMSQAoNdXBkYXRlRGF0ZVVUQxgKIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBS'
    'DXVwZGF0ZURhdGVVVEMSRAoPZGVsZXRpb25EYXRlVVRDGAsgASgLMhouZ29vZ2xlLnByb3RvYn'
    'VmLlRpbWVzdGFtcFIPZGVsZXRpb25EYXRlVVRDEhwKCWlzRGVsZXRlZBgMIAEoCFIJaXNEZWxl'
    'dGVk');

@$core.Deprecated('Use readBillingProductsResponseDescriptor instead')
const ReadBillingProductsResponse$json = {
  '1': 'ReadBillingProductsResponse',
  '2': [
    {'1': 'products', '3': 1, '4': 3, '5': 11, '6': '.weebi.billing.service.BillingProduct', '10': 'products'},
  ],
};

/// Descriptor for `ReadBillingProductsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readBillingProductsResponseDescriptor = $convert.base64Decode(
    'ChtSZWFkQmlsbGluZ1Byb2R1Y3RzUmVzcG9uc2USQQoIcHJvZHVjdHMYASADKAsyJS53ZWViaS'
    '5iaWxsaW5nLnNlcnZpY2UuQmlsbGluZ1Byb2R1Y3RSCHByb2R1Y3Rz');

