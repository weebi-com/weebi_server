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
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'subscriptionPlan',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'subscriptionPlan',
    },
    {
      '1': 'subscriptionSeats',
      '3': 4,
      '4': 1,
      '5': 5,
      '8': {'3': true},
      '10': 'subscriptionSeats',
    },
    {
      '1': 'subscriptionStartTimestampUTC',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {'3': true},
      '10': 'subscriptionStartTimestampUTC',
    },
    {
      '1': 'subscriptionEndTimestampUTC',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {'3': true},
      '10': 'subscriptionEndTimestampUTC',
    },
    {'1': 'status', '3': 7, '4': 1, '5': 8, '10': 'status'},
    {'1': 'statusUpdateTimestampUTC', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'statusUpdateTimestampUTC'},
    {'1': 'lastUpdateTimestampUTC', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdateTimestampUTC'},
    {'1': 'lastUpdatedByuserId', '3': 10, '4': 1, '5': 9, '10': 'lastUpdatedByuserId'},
    {'1': 'isMailVerified', '3': 11, '4': 1, '5': 8, '10': 'isMailVerified'},
    {'1': 'creationDateUTC', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'creationDateUTC'},
    {'1': 'stripeCustomerId', '3': 13, '4': 1, '5': 9, '10': 'stripeCustomerId'},
    {'1': 'licenses', '3': 14, '4': 3, '5': 11, '6': '.weebi.license.License', '10': 'licenses'},
    {'1': 'providerCustomerIds', '3': 15, '4': 3, '5': 11, '6': '.weebi.firm.Firm.ProviderCustomerIdsEntry', '10': 'providerCustomerIds'},
    {'1': 'referralCode', '3': 16, '4': 1, '5': 9, '10': 'referralCode'},
    {'1': 'referralCreditBalanceCents', '3': 17, '4': 1, '5': 5, '10': 'referralCreditBalanceCents'},
    {'1': 'default_currency', '3': 18, '4': 1, '5': 9, '9': 0, '10': 'defaultCurrency', '17': true},
    {'1': 'dual_currency_enabled', '3': 19, '4': 1, '5': 8, '9': 1, '10': 'dualCurrencyEnabled', '17': true},
    {'1': 'secondary_display_currency', '3': 20, '4': 1, '5': 9, '9': 2, '10': 'secondaryDisplayCurrency', '17': true},
  ],
  '3': [Firm_ProviderCustomerIdsEntry$json],
  '8': [
    {'1': '_default_currency'},
    {'1': '_dual_currency_enabled'},
    {'1': '_secondary_display_currency'},
  ],
};

@$core.Deprecated('Use firmDescriptor instead')
const Firm_ProviderCustomerIdsEntry$json = {
  '1': 'ProviderCustomerIdsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Firm`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List firmDescriptor = $convert.base64Decode(
    'CgRGaXJtEhYKBmZpcm1JZBgBIAEoCVIGZmlybUlkEhIKBG5hbWUYAiABKAlSBG5hbWUSLgoQc3'
    'Vic2NyaXB0aW9uUGxhbhgDIAEoCUICGAFSEHN1YnNjcmlwdGlvblBsYW4SMAoRc3Vic2NyaXB0'
    'aW9uU2VhdHMYBCABKAVCAhgBUhFzdWJzY3JpcHRpb25TZWF0cxJkCh1zdWJzY3JpcHRpb25TdG'
    'FydFRpbWVzdGFtcFVUQxgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBCAhgBUh1z'
    'dWJzY3JpcHRpb25TdGFydFRpbWVzdGFtcFVUQxJgChtzdWJzY3JpcHRpb25FbmRUaW1lc3RhbX'
    'BVVEMYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQgIYAVIbc3Vic2NyaXB0aW9u'
    'RW5kVGltZXN0YW1wVVRDEhYKBnN0YXR1cxgHIAEoCFIGc3RhdHVzElYKGHN0YXR1c1VwZGF0ZV'
    'RpbWVzdGFtcFVUQxgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSGHN0YXR1c1Vw'
    'ZGF0ZVRpbWVzdGFtcFVUQxJSChZsYXN0VXBkYXRlVGltZXN0YW1wVVRDGAkgASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcFIWbGFzdFVwZGF0ZVRpbWVzdGFtcFVUQxIwChNsYXN0VXBk'
    'YXRlZEJ5dXNlcklkGAogASgJUhNsYXN0VXBkYXRlZEJ5dXNlcklkEiYKDmlzTWFpbFZlcmlmaW'
    'VkGAsgASgIUg5pc01haWxWZXJpZmllZBJECg9jcmVhdGlvbkRhdGVVVEMYDCABKAsyGi5nb29n'
    'bGUucHJvdG9idWYuVGltZXN0YW1wUg9jcmVhdGlvbkRhdGVVVEMSKgoQc3RyaXBlQ3VzdG9tZX'
    'JJZBgNIAEoCVIQc3RyaXBlQ3VzdG9tZXJJZBIyCghsaWNlbnNlcxgOIAMoCzIWLndlZWJpLmxp'
    'Y2Vuc2UuTGljZW5zZVIIbGljZW5zZXMSWwoTcHJvdmlkZXJDdXN0b21lcklkcxgPIAMoCzIpLn'
    'dlZWJpLmZpcm0uRmlybS5Qcm92aWRlckN1c3RvbWVySWRzRW50cnlSE3Byb3ZpZGVyQ3VzdG9t'
    'ZXJJZHMSIgoMcmVmZXJyYWxDb2RlGBAgASgJUgxyZWZlcnJhbENvZGUSPgoacmVmZXJyYWxDcm'
    'VkaXRCYWxhbmNlQ2VudHMYESABKAVSGnJlZmVycmFsQ3JlZGl0QmFsYW5jZUNlbnRzEi4KEGRl'
    'ZmF1bHRfY3VycmVuY3kYEiABKAlIAFIPZGVmYXVsdEN1cnJlbmN5iAEBEjcKFWR1YWxfY3Vycm'
    'VuY3lfZW5hYmxlZBgTIAEoCEgBUhNkdWFsQ3VycmVuY3lFbmFibGVkiAEBEkEKGnNlY29uZGFy'
    'eV9kaXNwbGF5X2N1cnJlbmN5GBQgASgJSAJSGHNlY29uZGFyeURpc3BsYXlDdXJyZW5jeYgBAR'
    'pGChhQcm92aWRlckN1c3RvbWVySWRzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUY'
    'AiABKAlSBXZhbHVlOgI4AUITChFfZGVmYXVsdF9jdXJyZW5jeUIYChZfZHVhbF9jdXJyZW5jeV'
    '9lbmFibGVkQh0KG19zZWNvbmRhcnlfZGlzcGxheV9jdXJyZW5jeQ==');

@$core.Deprecated('Use createFirmRequestDescriptor instead')
const CreateFirmRequest$json = {
  '1': 'CreateFirmRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'default_currency', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'defaultCurrency', '17': true},
  ],
  '8': [
    {'1': '_default_currency'},
  ],
};

/// Descriptor for `CreateFirmRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFirmRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVGaXJtUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEi4KEGRlZmF1bHRfY3Vycm'
    'VuY3kYAiABKAlIAFIPZGVmYXVsdEN1cnJlbmN5iAEBQhMKEV9kZWZhdWx0X2N1cnJlbmN5');

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

