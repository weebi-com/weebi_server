//
//  Generated code. Do not modify.
//  source: boutique.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use commerceTypePbDescriptor instead')
const CommerceTypePb$json = {
  '1': 'CommerceTypePb',
  '2': [
    {'1': 'unknown', '2': 0},
    {'1': 'negoce', '2': 1},
    {'1': 'artisanat', '2': 2},
    {'1': 'services', '2': 3},
  ],
};

/// Descriptor for `CommerceTypePb`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List commerceTypePbDescriptor = $convert.base64Decode(
    'Cg5Db21tZXJjZVR5cGVQYhILCgd1bmtub3duEAASCgoGbmVnb2NlEAESDQoJYXJ0aXNhbmF0EA'
    'ISDAoIc2VydmljZXMQAw==');

@$core.Deprecated('Use businessClassificationDescriptor instead')
const BusinessClassification$json = {
  '1': 'BusinessClassification',
  '2': [
    {'1': 'isic_code', '3': 1, '4': 1, '5': 9, '10': 'isicCode'},
    {'1': 'sub_code', '3': 2, '4': 1, '5': 9, '10': 'subCode'},
    {'1': 'emoji', '3': 3, '4': 1, '5': 9, '10': 'emoji'},
    {'1': 'label_fr', '3': 4, '4': 1, '5': 9, '10': 'labelFr'},
    {'1': 'isic_label_fr', '3': 5, '4': 1, '5': 9, '10': 'isicLabelFr'},
    {'1': 'isic_label_en', '3': 6, '4': 1, '5': 9, '10': 'isicLabelEn'},
    {'1': 'isic_label_es', '3': 7, '4': 1, '5': 9, '10': 'isicLabelEs'},
    {'1': 'smt_regime', '3': 8, '4': 1, '5': 14, '6': '.weebi.boutique.CommerceTypePb', '10': 'smtRegime'},
  ],
};

/// Descriptor for `BusinessClassification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessClassificationDescriptor = $convert.base64Decode(
    'ChZCdXNpbmVzc0NsYXNzaWZpY2F0aW9uEhsKCWlzaWNfY29kZRgBIAEoCVIIaXNpY0NvZGUSGQ'
    'oIc3ViX2NvZGUYAiABKAlSB3N1YkNvZGUSFAoFZW1vamkYAyABKAlSBWVtb2ppEhkKCGxhYmVs'
    'X2ZyGAQgASgJUgdsYWJlbEZyEiIKDWlzaWNfbGFiZWxfZnIYBSABKAlSC2lzaWNMYWJlbEZyEi'
    'IKDWlzaWNfbGFiZWxfZW4YBiABKAlSC2lzaWNMYWJlbEVuEiIKDWlzaWNfbGFiZWxfZXMYByAB'
    'KAlSC2lzaWNMYWJlbEVzEj0KCnNtdF9yZWdpbWUYCCABKA4yHi53ZWViaS5ib3V0aXF1ZS5Db2'
    '1tZXJjZVR5cGVQYlIJc210UmVnaW1l');

@$core.Deprecated('Use boutiqueMongoDescriptor instead')
const BoutiqueMongo$json = {
  '1': 'BoutiqueMongo',
  '2': [
    {'1': 'boutique', '3': 1, '4': 1, '5': 11, '6': '.weebi.boutique.BoutiquePb', '10': 'boutique'},
    {'1': 'boutiqueId', '3': 2, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'firmId', '3': 3, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 4, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'creationTimestampUTC', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'creationTimestampUTC'},
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    {'1': 'devices', '3': 7, '4': 3, '5': 11, '6': '.weebi.device.Device', '10': 'devices'},
    {'1': 'lastTouchTimestampUTC', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastTouchTimestampUTC'},
    {'1': 'logo', '3': 9, '4': 1, '5': 12, '10': 'logo'},
    {'1': 'logoExtension', '3': 10, '4': 1, '5': 9, '10': 'logoExtension'},
    {'1': 'isDeleted', '3': 11, '4': 1, '5': 8, '10': 'isDeleted'},
    {'1': 'deletedBy', '3': 12, '4': 1, '5': 9, '10': 'deletedBy'},
    {'1': 'restoredBy', '3': 13, '4': 1, '5': 9, '10': 'restoredBy'},
    {'1': 'additional_attributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.boutique.BoutiqueMongo.AdditionalAttributesEntry', '10': 'additional_attributes'},
  ],
  '3': [BoutiqueMongo_AdditionalAttributesEntry$json],
  '9': [
    {'1': 14, '2': 99},
  ],
};

@$core.Deprecated('Use boutiqueMongoDescriptor instead')
const BoutiqueMongo_AdditionalAttributesEntry$json = {
  '1': 'AdditionalAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `BoutiqueMongo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boutiqueMongoDescriptor = $convert.base64Decode(
    'Cg1Cb3V0aXF1ZU1vbmdvEjYKCGJvdXRpcXVlGAEgASgLMhoud2VlYmkuYm91dGlxdWUuQm91dG'
    'lxdWVQYlIIYm91dGlxdWUSHgoKYm91dGlxdWVJZBgCIAEoCVIKYm91dGlxdWVJZBIWCgZmaXJt'
    'SWQYAyABKAlSBmZpcm1JZBIYCgdjaGFpbklkGAQgASgJUgdjaGFpbklkEk4KFGNyZWF0aW9uVG'
    'ltZXN0YW1wVVRDGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIUY3JlYXRpb25U'
    'aW1lc3RhbXBVVEMSEgoEbmFtZRgGIAEoCVIEbmFtZRIuCgdkZXZpY2VzGAcgAygLMhQud2VlYm'
    'kuZGV2aWNlLkRldmljZVIHZGV2aWNlcxJQChVsYXN0VG91Y2hUaW1lc3RhbXBVVEMYCCABKAsy'
    'Gi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUhVsYXN0VG91Y2hUaW1lc3RhbXBVVEMSEgoEbG'
    '9nbxgJIAEoDFIEbG9nbxIkCg1sb2dvRXh0ZW5zaW9uGAogASgJUg1sb2dvRXh0ZW5zaW9uEhwK'
    'CWlzRGVsZXRlZBgLIAEoCFIJaXNEZWxldGVkEhwKCWRlbGV0ZWRCeRgMIAEoCVIJZGVsZXRlZE'
    'J5Eh4KCnJlc3RvcmVkQnkYDSABKAlSCnJlc3RvcmVkQnkSbQoVYWRkaXRpb25hbF9hdHRyaWJ1'
    'dGVzGGMgAygLMjcud2VlYmkuYm91dGlxdWUuQm91dGlxdWVNb25nby5BZGRpdGlvbmFsQXR0cm'
    'lidXRlc0VudHJ5UhVhZGRpdGlvbmFsX2F0dHJpYnV0ZXMaRwoZQWRkaXRpb25hbEF0dHJpYnV0'
    'ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBSgQIDh'
    'Bj');

@$core.Deprecated('Use boutiquePbDescriptor instead')
const BoutiquePb$json = {
  '1': 'BoutiquePb',
  '2': [
    {'1': 'boutiqueId', '3': 1, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'creationDate', '3': 2, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'updateDate', '3': 3, '4': 1, '5': 9, '10': 'updateDate'},
    {
      '1': 'statusUpdateDate',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'statusUpdateDate',
    },
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'status',
    },
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone', '3': 7, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '10': 'phone'},
    {'1': 'addressFull', '3': 8, '4': 1, '5': 11, '6': '.weebi.common.address.Address', '10': 'addressFull'},
    {'1': 'promo', '3': 9, '4': 1, '5': 1, '10': 'promo'},
    {'1': 'promoStart', '3': 10, '4': 1, '5': 9, '10': 'promoStart'},
    {'1': 'promoEnd', '3': 11, '4': 1, '5': 9, '10': 'promoEnd'},
    {'1': 'isDeleted', '3': 12, '4': 1, '5': 8, '10': 'isDeleted'},
    {'1': 'deletedBy', '3': 13, '4': 1, '5': 9, '10': 'deletedBy'},
    {'1': 'restoredBy', '3': 14, '4': 1, '5': 9, '10': 'restoredBy'},
    {'1': 'mail', '3': 15, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'currency', '3': 16, '4': 1, '5': 9, '9': 0, '10': 'currency', '17': true},
    {'1': 'isDualCurrencyEnabled', '3': 17, '4': 1, '5': 8, '9': 1, '10': 'dualCurrencyEnabled', '17': true},
    {'1': 'secondaryDisplayCurrency', '3': 18, '4': 1, '5': 9, '9': 2, '10': 'secondaryDisplayCurrency', '17': true},
    {'1': 'businessRules', '3': 19, '4': 1, '5': 11, '6': '.weebi.boutique.BusinessRules', '9': 3, '10': 'businessRules', '17': true},
    {'1': 'closed_years', '3': 20, '4': 3, '5': 11, '6': '.weebi.boutique.ClosedYearPb', '10': 'closedYears'},
    {'1': 'commercial_register_number', '3': 21, '4': 1, '5': 9, '9': 4, '10': 'commercialRegisterNumber', '17': true},
    {'1': 'commerce_type', '3': 22, '4': 1, '5': 14, '6': '.weebi.boutique.CommerceTypePb', '9': 5, '10': 'commerceType', '17': true},
    {'1': 'isic_code', '3': 23, '4': 1, '5': 9, '9': 6, '10': 'isicCode', '17': true},
    {'1': 'isic_sub_code', '3': 24, '4': 1, '5': 9, '9': 7, '10': 'isicSubCode', '17': true},
  ],
  '8': [
    {'1': '_currency'},
    {'1': '_isDualCurrencyEnabled'},
    {'1': '_secondaryDisplayCurrency'},
    {'1': '_businessRules'},
    {'1': '_commercial_register_number'},
    {'1': '_commerce_type'},
    {'1': '_isic_code'},
    {'1': '_isic_sub_code'},
  ],
  '9': [
    {'1': 25, '2': 101},
  ],
};

/// Descriptor for `BoutiquePb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boutiquePbDescriptor = $convert.base64Decode(
    'CgpCb3V0aXF1ZVBiEh4KCmJvdXRpcXVlSWQYASABKAlSCmJvdXRpcXVlSWQSIgoMY3JlYXRpb2'
    '5EYXRlGAIgASgJUgxjcmVhdGlvbkRhdGUSHgoKdXBkYXRlRGF0ZRgDIAEoCVIKdXBkYXRlRGF0'
    'ZRIuChBzdGF0dXNVcGRhdGVEYXRlGAQgASgJQgIYAVIQc3RhdHVzVXBkYXRlRGF0ZRIaCgZzdG'
    'F0dXMYBSABKAhCAhgBUgZzdGF0dXMSEgoEbmFtZRgGIAEoCVIEbmFtZRIvCgVwaG9uZRgHIAEo'
    'CzIZLndlZWJpLmNvbW1vbi5waG9uZS5QaG9uZVIFcGhvbmUSPwoLYWRkcmVzc0Z1bGwYCCABKA'
    'syHS53ZWViaS5jb21tb24uYWRkcmVzcy5BZGRyZXNzUgthZGRyZXNzRnVsbBIUCgVwcm9tbxgJ'
    'IAEoAVIFcHJvbW8SHgoKcHJvbW9TdGFydBgKIAEoCVIKcHJvbW9TdGFydBIaCghwcm9tb0VuZB'
    'gLIAEoCVIIcHJvbW9FbmQSHAoJaXNEZWxldGVkGAwgASgIUglpc0RlbGV0ZWQSHAoJZGVsZXRl'
    'ZEJ5GA0gASgJUglkZWxldGVkQnkSHgoKcmVzdG9yZWRCeRgOIAEoCVIKcmVzdG9yZWRCeRISCg'
    'RtYWlsGA8gASgJUgRtYWlsEh8KCGN1cnJlbmN5GBAgASgJSABSCGN1cnJlbmN5iAEBEjcKFWlz'
    'RHVhbEN1cnJlbmN5RW5hYmxlZBgRIAEoCEgBUhNkdWFsQ3VycmVuY3lFbmFibGVkiAEBEj8KGH'
    'NlY29uZGFyeURpc3BsYXlDdXJyZW5jeRgSIAEoCUgCUhhzZWNvbmRhcnlEaXNwbGF5Q3VycmVu'
    'Y3mIAQESSAoNYnVzaW5lc3NSdWxlcxgTIAEoCzIdLndlZWJpLmJvdXRpcXVlLkJ1c2luZXNzUn'
    'VsZXNIA1INYnVzaW5lc3NSdWxlc4gBARI/CgxjbG9zZWRfeWVhcnMYFCADKAsyHC53ZWViaS5i'
    'b3V0aXF1ZS5DbG9zZWRZZWFyUGJSC2Nsb3NlZFllYXJzEkEKGmNvbW1lcmNpYWxfcmVnaXN0ZX'
    'JfbnVtYmVyGBUgASgJSARSGGNvbW1lcmNpYWxSZWdpc3Rlck51bWJlcogBARJICg1jb21tZXJj'
    'ZV90eXBlGBYgASgOMh4ud2VlYmkuYm91dGlxdWUuQ29tbWVyY2VUeXBlUGJIBVIMY29tbWVyY2'
    'VUeXBliAEBEiAKCWlzaWNfY29kZRgXIAEoCUgGUghpc2ljQ29kZYgBARInCg1pc2ljX3N1Yl9j'
    'b2RlGBggASgJSAdSC2lzaWNTdWJDb2RliAEBQgsKCV9jdXJyZW5jeUIYChZfaXNEdWFsQ3Vycm'
    'VuY3lFbmFibGVkQhsKGV9zZWNvbmRhcnlEaXNwbGF5Q3VycmVuY3lCEAoOX2J1c2luZXNzUnVs'
    'ZXNCHQobX2NvbW1lcmNpYWxfcmVnaXN0ZXJfbnVtYmVyQhAKDl9jb21tZXJjZV90eXBlQgwKCl'
    '9pc2ljX2NvZGVCEAoOX2lzaWNfc3ViX2NvZGVKBAgZEGU=');

@$core.Deprecated('Use closedYearPbDescriptor instead')
const ClosedYearPb$json = {
  '1': 'ClosedYearPb',
  '2': [
    {'1': 'year', '3': 1, '4': 1, '5': 5, '10': 'year'},
    {'1': 'resultat', '3': 2, '4': 1, '5': 1, '10': 'resultat'},
    {'1': 'treasury_total', '3': 3, '4': 1, '5': 1, '10': 'treasuryTotal'},
    {'1': 'closed_at', '3': 4, '4': 1, '5': 9, '10': 'closedAt'},
    {'1': 'commercial_register_number', '3': 5, '4': 1, '5': 9, '10': 'commercialRegisterNumber'},
    {'1': 'commerce_type', '3': 6, '4': 1, '5': 14, '6': '.weebi.boutique.CommerceTypePb', '10': 'commerceType'},
    {'1': 'isic_code', '3': 7, '4': 1, '5': 9, '10': 'isicCode'},
    {'1': 'isic_sub_code', '3': 8, '4': 1, '5': 9, '10': 'isicSubCode'},
  ],
};

/// Descriptor for `ClosedYearPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List closedYearPbDescriptor = $convert.base64Decode(
    'CgxDbG9zZWRZZWFyUGISEgoEeWVhchgBIAEoBVIEeWVhchIaCghyZXN1bHRhdBgCIAEoAVIIcm'
    'VzdWx0YXQSJQoOdHJlYXN1cnlfdG90YWwYAyABKAFSDXRyZWFzdXJ5VG90YWwSGwoJY2xvc2Vk'
    'X2F0GAQgASgJUghjbG9zZWRBdBI8Chpjb21tZXJjaWFsX3JlZ2lzdGVyX251bWJlchgFIAEoCV'
    'IYY29tbWVyY2lhbFJlZ2lzdGVyTnVtYmVyEkMKDWNvbW1lcmNlX3R5cGUYBiABKA4yHi53ZWVi'
    'aS5ib3V0aXF1ZS5Db21tZXJjZVR5cGVQYlIMY29tbWVyY2VUeXBlEhsKCWlzaWNfY29kZRgHIA'
    'EoCVIIaXNpY0NvZGUSIgoNaXNpY19zdWJfY29kZRgIIAEoCVILaXNpY1N1YkNvZGU=');

@$core.Deprecated('Use businessRulesDescriptor instead')
const BusinessRules$json = {
  '1': 'BusinessRules',
  '2': [
    {'1': 'isNegativeStockGuardEnabled', '3': 1, '4': 1, '5': 8, '10': 'isNegativeStockGuardEnabled'},
    {'1': 'isRecentTicketEditEnabled', '3': 2, '4': 1, '5': 8, '10': 'isRecentTicketEditEnabled'},
    {'1': 'recentTicketEditWindowMinutes', '3': 3, '4': 1, '5': 5, '10': 'recentTicketEditWindowMinutes'},
    {'1': 'isVatSelectionEnabled', '3': 4, '4': 1, '5': 8, '10': 'isVatSelectionEnabled'},
  ],
};

/// Descriptor for `BusinessRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessRulesDescriptor = $convert.base64Decode(
    'Cg1CdXNpbmVzc1J1bGVzEkAKG2lzTmVnYXRpdmVTdG9ja0d1YXJkRW5hYmxlZBgBIAEoCFIbaX'
    'NOZWdhdGl2ZVN0b2NrR3VhcmRFbmFibGVkEjwKGWlzUmVjZW50VGlja2V0RWRpdEVuYWJsZWQY'
    'AiABKAhSGWlzUmVjZW50VGlja2V0RWRpdEVuYWJsZWQSRAodcmVjZW50VGlja2V0RWRpdFdpbm'
    'Rvd01pbnV0ZXMYAyABKAVSHXJlY2VudFRpY2tldEVkaXRXaW5kb3dNaW51dGVzEjQKFWlzVmF0'
    'U2VsZWN0aW9uRW5hYmxlZBgEIAEoCFIVaXNWYXRTZWxlY3Rpb25FbmFibGVk');

