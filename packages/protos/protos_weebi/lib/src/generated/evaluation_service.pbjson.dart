// This is a generated file - do not edit.
//
// Generated from evaluation_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use shopTenureDescriptor instead')
const ShopTenure$json = {
  '1': 'ShopTenure',
  '2': [
    {'1': 'SHOP_TENURE_UNSPECIFIED', '2': 0},
    {'1': 'UNDER_ONE_YEAR', '2': 1},
    {'1': 'ONE_TO_THREE_YEARS', '2': 2},
    {'1': 'OVER_THREE_YEARS', '2': 3},
  ],
};

/// Descriptor for `ShopTenure`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List shopTenureDescriptor = $convert.base64Decode(
    'CgpTaG9wVGVudXJlEhsKF1NIT1BfVEVOVVJFX1VOU1BFQ0lGSUVEEAASEgoOVU5ERVJfT05FX1'
    'lFQVIQARIWChJPTkVfVE9fVEhSRUVfWUVBUlMQAhIUChBPVkVSX1RIUkVFX1lFQVJTEAM=');

@$core.Deprecated('Use supplierCreditDescriptor instead')
const SupplierCredit$json = {
  '1': 'SupplierCredit',
  '2': [
    {'1': 'SUPPLIER_CREDIT_UNSPECIFIED', '2': 0},
    {'1': 'CASH_ONLY', '2': 1},
    {'1': 'SHORT_TERM', '2': 2},
    {'1': 'REGULAR_CONSIGNMENT', '2': 3},
  ],
};

/// Descriptor for `SupplierCredit`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List supplierCreditDescriptor = $convert.base64Decode(
    'Cg5TdXBwbGllckNyZWRpdBIfChtTVVBQTElFUl9DUkVESVRfVU5TUEVDSUZJRUQQABINCglDQV'
    'NIX09OTFkQARIOCgpTSE9SVF9URVJNEAISFwoTUkVHVUxBUl9DT05TSUdOTUVOVBAD');

@$core.Deprecated('Use cashSeparationDescriptor instead')
const CashSeparation$json = {
  '1': 'CashSeparation',
  '2': [
    {'1': 'CASH_SEPARATION_UNSPECIFIED', '2': 0},
    {'1': 'MIXED_HOUSEHOLD', '2': 1},
    {'1': 'FIXED_SALARY_OR_LOGGED', '2': 2},
    {'1': 'FULLY_SEPARATED', '2': 3},
  ],
};

/// Descriptor for `CashSeparation`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cashSeparationDescriptor = $convert.base64Decode(
    'Cg5DYXNoU2VwYXJhdGlvbhIfChtDQVNIX1NFUEFSQVRJT05fVU5TUEVDSUZJRUQQABITCg9NSV'
    'hFRF9IT1VTRUhPTEQQARIaChZGSVhFRF9TQUxBUllfT1JfTE9HR0VEEAISEwoPRlVMTFlfU0VQ'
    'QVJBVEVEEAM=');

@$core.Deprecated('Use customerCreditTrackingDescriptor instead')
const CustomerCreditTracking$json = {
  '1': 'CustomerCreditTracking',
  '2': [
    {'1': 'CUSTOMER_CREDIT_TRACKING_UNSPECIFIED', '2': 0},
    {'1': 'MEMORY_ONLY', '2': 1},
    {'1': 'PAPER_NOTEBOOK', '2': 2},
    {'1': 'DEDICATED_OR_APP', '2': 3},
  ],
};

/// Descriptor for `CustomerCreditTracking`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List customerCreditTrackingDescriptor = $convert.base64Decode(
    'ChZDdXN0b21lckNyZWRpdFRyYWNraW5nEigKJENVU1RPTUVSX0NSRURJVF9UUkFDS0lOR19VTl'
    'NQRUNJRklFRBAAEg8KC01FTU9SWV9PTkxZEAESEgoOUEFQRVJfTk9URUJPT0sQAhIUChBERURJ'
    'Q0FURURfT1JfQVBQEAM=');

@$core.Deprecated('Use restockFrequencyDescriptor instead')
const RestockFrequency$json = {
  '1': 'RestockFrequency',
  '2': [
    {'1': 'RESTOCK_FREQUENCY_UNSPECIFIED', '2': 0},
    {'1': 'LESS_THAN_WEEKLY', '2': 1},
    {'1': 'ONE_TO_TWO_PER_WEEK', '2': 2},
    {'1': 'MORE_THAN_TWICE_WEEKLY', '2': 3},
  ],
};

/// Descriptor for `RestockFrequency`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List restockFrequencyDescriptor = $convert.base64Decode(
    'ChBSZXN0b2NrRnJlcXVlbmN5EiEKHVJFU1RPQ0tfRlJFUVVFTkNZX1VOU1BFQ0lGSUVEEAASFA'
    'oQTEVTU19USEFOX1dFRUtMWRABEhcKE09ORV9UT19UV09fUEVSX1dFRUsQAhIaChZNT1JFX1RI'
    'QU5fVFdJQ0VfV0VFS0xZEAM=');

@$core.Deprecated('Use legalFormDescriptor instead')
const LegalForm$json = {
  '1': 'LegalForm',
  '2': [
    {'1': 'LEGAL_FORM_UNSPECIFIED', '2': 0},
    {'1': 'EI', '2': 1},
    {'1': 'ENTREPRENANT', '2': 2},
    {'1': 'SARL', '2': 3},
    {'1': 'SA', '2': 4},
    {'1': 'SAS', '2': 5},
    {'1': 'GIE', '2': 6},
    {'1': 'OTHER', '2': 7},
  ],
};

/// Descriptor for `LegalForm`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List legalFormDescriptor = $convert.base64Decode(
    'CglMZWdhbEZvcm0SGgoWTEVHQUxfRk9STV9VTlNQRUNJRklFRBAAEgYKAkVJEAESEAoMRU5UUk'
    'VQUkVOQU5UEAISCAoEU0FSTBADEgYKAlNBEAQSBwoDU0FTEAUSBwoDR0lFEAYSCQoFT1RIRVIQ'
    'Bw==');

@$core.Deprecated('Use moneyAmountDescriptor instead')
const MoneyAmount$json = {
  '1': 'MoneyAmount',
  '2': [
    {'1': 'amount_minor', '3': 1, '4': 1, '5': 3, '10': 'amountMinor'},
    {'1': 'currency', '3': 2, '4': 1, '5': 9, '10': 'currency'},
  ],
};

/// Descriptor for `MoneyAmount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moneyAmountDescriptor = $convert.base64Decode(
    'CgtNb25leUFtb3VudBIhCgxhbW91bnRfbWlub3IYASABKANSC2Ftb3VudE1pbm9yEhoKCGN1cn'
    'JlbmN5GAIgASgJUghjdXJyZW5jeQ==');

@$core.Deprecated('Use phoneContactDescriptor instead')
const PhoneContact$json = {
  '1': 'PhoneContact',
  '2': [
    {
      '1': 'phone',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.weebi.common.phone.Phone',
      '10': 'phone'
    },
    {
      '1': 'country',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.weebi.common.country.Country',
      '10': 'country'
    },
    {'1': 'city', '3': 3, '4': 1, '5': 9, '10': 'city'},
    {'1': 'merchant_name', '3': 4, '4': 1, '5': 9, '10': 'merchantName'},
  ],
};

/// Descriptor for `PhoneContact`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List phoneContactDescriptor = $convert.base64Decode(
    'CgxQaG9uZUNvbnRhY3QSLwoFcGhvbmUYASABKAsyGS53ZWViaS5jb21tb24ucGhvbmUuUGhvbm'
    'VSBXBob25lEjcKB2NvdW50cnkYAiABKAsyHS53ZWViaS5jb21tb24uY291bnRyeS5Db3VudHJ5'
    'Ugdjb3VudHJ5EhIKBGNpdHkYAyABKAlSBGNpdHkSIwoNbWVyY2hhbnRfbmFtZRgEIAEoCVIMbW'
    'VyY2hhbnROYW1l');

@$core.Deprecated('Use registrationDetailsDescriptor instead')
const RegistrationDetails$json = {
  '1': 'RegistrationDetails',
  '2': [
    {
      '1': 'commercial_register_number',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'commercialRegisterNumber'
    },
    {
      '1': 'legal_form',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.weebi.evaluation.service.LegalForm',
      '10': 'legalForm'
    },
  ],
};

/// Descriptor for `RegistrationDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registrationDetailsDescriptor = $convert.base64Decode(
    'ChNSZWdpc3RyYXRpb25EZXRhaWxzEjwKGmNvbW1lcmNpYWxfcmVnaXN0ZXJfbnVtYmVyGAEgAS'
    'gJUhhjb21tZXJjaWFsUmVnaXN0ZXJOdW1iZXISQgoKbGVnYWxfZm9ybRgCIAEoDjIjLndlZWJp'
    'LmV2YWx1YXRpb24uc2VydmljZS5MZWdhbEZvcm1SCWxlZ2FsRm9ybQ==');

@$core.Deprecated('Use businessDiagnosticDescriptor instead')
const BusinessDiagnostic$json = {
  '1': 'BusinessDiagnostic',
  '2': [
    {
      '1': 'activity_isic_code',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'activityIsicCode'
    },
    {'1': 'activity_sub_code', '3': 2, '4': 1, '5': 9, '10': 'activitySubCode'},
    {'1': 'is_registered', '3': 3, '4': 1, '5': 8, '10': 'isRegistered'},
    {
      '1': 'shop_tenure',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.weebi.evaluation.service.ShopTenure',
      '10': 'shopTenure'
    },
    {
      '1': 'supplier_credit',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.weebi.evaluation.service.SupplierCredit',
      '10': 'supplierCredit'
    },
    {
      '1': 'cash_separation',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.weebi.evaluation.service.CashSeparation',
      '10': 'cashSeparation'
    },
    {
      '1': 'customer_credit_tracking',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.weebi.evaluation.service.CustomerCreditTracking',
      '10': 'customerCreditTracking'
    },
    {
      '1': 'restock_frequency',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.weebi.evaluation.service.RestockFrequency',
      '10': 'restockFrequency'
    },
    {'1': 'wants_loan', '3': 9, '4': 1, '5': 8, '10': 'wantsLoan'},
    {
      '1': 'requested_loan_amount',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.weebi.evaluation.service.MoneyAmount',
      '10': 'requestedLoanAmount'
    },
    {
      '1': 'registration',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.weebi.evaluation.service.RegistrationDetails',
      '10': 'registration'
    },
    {
      '1': 'client_extras',
      '3': 12,
      '4': 3,
      '5': 11,
      '6': '.weebi.evaluation.service.BusinessDiagnostic.ClientExtrasEntry',
      '10': 'clientExtras'
    },
  ],
  '3': [BusinessDiagnostic_ClientExtrasEntry$json],
};

@$core.Deprecated('Use businessDiagnosticDescriptor instead')
const BusinessDiagnostic_ClientExtrasEntry$json = {
  '1': 'ClientExtrasEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `BusinessDiagnostic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessDiagnosticDescriptor = $convert.base64Decode(
    'ChJCdXNpbmVzc0RpYWdub3N0aWMSLAoSYWN0aXZpdHlfaXNpY19jb2RlGAEgASgJUhBhY3Rpdm'
    'l0eUlzaWNDb2RlEioKEWFjdGl2aXR5X3N1Yl9jb2RlGAIgASgJUg9hY3Rpdml0eVN1YkNvZGUS'
    'IwoNaXNfcmVnaXN0ZXJlZBgDIAEoCFIMaXNSZWdpc3RlcmVkEkUKC3Nob3BfdGVudXJlGAQgAS'
    'gOMiQud2VlYmkuZXZhbHVhdGlvbi5zZXJ2aWNlLlNob3BUZW51cmVSCnNob3BUZW51cmUSUQoP'
    'c3VwcGxpZXJfY3JlZGl0GAUgASgOMigud2VlYmkuZXZhbHVhdGlvbi5zZXJ2aWNlLlN1cHBsaW'
    'VyQ3JlZGl0Ug5zdXBwbGllckNyZWRpdBJRCg9jYXNoX3NlcGFyYXRpb24YBiABKA4yKC53ZWVi'
    'aS5ldmFsdWF0aW9uLnNlcnZpY2UuQ2FzaFNlcGFyYXRpb25SDmNhc2hTZXBhcmF0aW9uEmoKGG'
    'N1c3RvbWVyX2NyZWRpdF90cmFja2luZxgHIAEoDjIwLndlZWJpLmV2YWx1YXRpb24uc2Vydmlj'
    'ZS5DdXN0b21lckNyZWRpdFRyYWNraW5nUhZjdXN0b21lckNyZWRpdFRyYWNraW5nElcKEXJlc3'
    'RvY2tfZnJlcXVlbmN5GAggASgOMioud2VlYmkuZXZhbHVhdGlvbi5zZXJ2aWNlLlJlc3RvY2tG'
    'cmVxdWVuY3lSEHJlc3RvY2tGcmVxdWVuY3kSHQoKd2FudHNfbG9hbhgJIAEoCFIJd2FudHNMb2'
    'FuElkKFXJlcXVlc3RlZF9sb2FuX2Ftb3VudBgKIAEoCzIlLndlZWJpLmV2YWx1YXRpb24uc2Vy'
    'dmljZS5Nb25leUFtb3VudFITcmVxdWVzdGVkTG9hbkFtb3VudBJRCgxyZWdpc3RyYXRpb24YCy'
    'ABKAsyLS53ZWViaS5ldmFsdWF0aW9uLnNlcnZpY2UuUmVnaXN0cmF0aW9uRGV0YWlsc1IMcmVn'
    'aXN0cmF0aW9uEmMKDWNsaWVudF9leHRyYXMYDCADKAsyPi53ZWViaS5ldmFsdWF0aW9uLnNlcn'
    'ZpY2UuQnVzaW5lc3NEaWFnbm9zdGljLkNsaWVudEV4dHJhc0VudHJ5UgxjbGllbnRFeHRyYXMa'
    'PwoRQ2xpZW50RXh0cmFzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBX'
    'ZhbHVlOgI4AQ==');

@$core.Deprecated('Use submitEvaluationRequestDescriptor instead')
const SubmitEvaluationRequest$json = {
  '1': 'SubmitEvaluationRequest',
  '2': [
    {
      '1': 'contact',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.weebi.evaluation.service.PhoneContact',
      '10': 'contact'
    },
    {
      '1': 'diagnostic',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.weebi.evaluation.service.BusinessDiagnostic',
      '10': 'diagnostic'
    },
    {'1': 'campaign_id', '3': 3, '4': 1, '5': 9, '10': 'campaignId'},
  ],
};

/// Descriptor for `SubmitEvaluationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitEvaluationRequestDescriptor = $convert.base64Decode(
    'ChdTdWJtaXRFdmFsdWF0aW9uUmVxdWVzdBJACgdjb250YWN0GAEgASgLMiYud2VlYmkuZXZhbH'
    'VhdGlvbi5zZXJ2aWNlLlBob25lQ29udGFjdFIHY29udGFjdBJMCgpkaWFnbm9zdGljGAIgASgL'
    'Miwud2VlYmkuZXZhbHVhdGlvbi5zZXJ2aWNlLkJ1c2luZXNzRGlhZ25vc3RpY1IKZGlhZ25vc3'
    'RpYxIfCgtjYW1wYWlnbl9pZBgDIAEoCVIKY2FtcGFpZ25JZA==');

@$core.Deprecated('Use submitEvaluationResponseDescriptor instead')
const SubmitEvaluationResponse$json = {
  '1': 'SubmitEvaluationResponse',
  '2': [
    {'1': 'evaluation_id', '3': 1, '4': 1, '5': 9, '10': 'evaluationId'},
    {
      '1': 'created_at',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
  ],
};

/// Descriptor for `SubmitEvaluationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitEvaluationResponseDescriptor = $convert.base64Decode(
    'ChhTdWJtaXRFdmFsdWF0aW9uUmVzcG9uc2USIwoNZXZhbHVhdGlvbl9pZBgBIAEoCVIMZXZhbH'
    'VhdGlvbklkEjkKCmNyZWF0ZWRfYXQYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1w'
    'UgljcmVhdGVkQXQ=');
