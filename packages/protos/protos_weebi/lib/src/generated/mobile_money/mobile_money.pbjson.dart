// This is a generated file - do not edit.
//
// Generated from mobile_money/mobile_money.proto.

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

@$core.Deprecated('Use mobileMoneyOperatorPbDescriptor instead')
const MobileMoneyOperatorPb$json = {
  '1': 'MobileMoneyOperatorPb',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'country_codes', '3': 3, '4': 3, '5': 9, '10': 'countryCodes'},
    {'1': 'logo', '3': 4, '4': 1, '5': 12, '10': 'logo'},
    {
      '1': 'logo_extension',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.weebi.mobile_money.service.MobileMoneyOperatorPb.LogoExtensionPb',
      '10': 'logoExtension'
    },
    {'1': 'active', '3': 6, '4': 1, '5': 8, '10': 'active'},
  ],
  '4': [MobileMoneyOperatorPb_LogoExtensionPb$json],
};

@$core.Deprecated('Use mobileMoneyOperatorPbDescriptor instead')
const MobileMoneyOperatorPb_LogoExtensionPb$json = {
  '1': 'LogoExtensionPb',
  '2': [
    {'1': 'unknown', '2': 0},
    {'1': 'png', '2': 1},
    {'1': 'jpeg', '2': 2},
  ],
};

/// Descriptor for `MobileMoneyOperatorPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mobileMoneyOperatorPbDescriptor = $convert.base64Decode(
    'ChVNb2JpbGVNb25leU9wZXJhdG9yUGISEgoEY29kZRgBIAEoCVIEY29kZRISCgRuYW1lGAIgAS'
    'gJUgRuYW1lEiMKDWNvdW50cnlfY29kZXMYAyADKAlSDGNvdW50cnlDb2RlcxISCgRsb2dvGAQg'
    'ASgMUgRsb2dvEmgKDmxvZ29fZXh0ZW5zaW9uGAUgASgOMkEud2VlYmkubW9iaWxlX21vbmV5Ln'
    'NlcnZpY2UuTW9iaWxlTW9uZXlPcGVyYXRvclBiLkxvZ29FeHRlbnNpb25QYlINbG9nb0V4dGVu'
    'c2lvbhIWCgZhY3RpdmUYBiABKAhSBmFjdGl2ZSIxCg9Mb2dvRXh0ZW5zaW9uUGISCwoHdW5rbm'
    '93bhAAEgcKA3BuZxABEggKBGpwZWcQAg==');

@$core.Deprecated('Use listMobileMoneyOperatorsRequestDescriptor instead')
const ListMobileMoneyOperatorsRequest$json = {
  '1': 'ListMobileMoneyOperatorsRequest',
  '2': [
    {'1': 'country_code', '3': 1, '4': 1, '5': 9, '10': 'countryCode'},
  ],
};

/// Descriptor for `ListMobileMoneyOperatorsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMobileMoneyOperatorsRequestDescriptor =
    $convert.base64Decode(
        'Ch9MaXN0TW9iaWxlTW9uZXlPcGVyYXRvcnNSZXF1ZXN0EiEKDGNvdW50cnlfY29kZRgBIAEoCV'
        'ILY291bnRyeUNvZGU=');

@$core.Deprecated('Use listMobileMoneyOperatorsResponseDescriptor instead')
const ListMobileMoneyOperatorsResponse$json = {
  '1': 'ListMobileMoneyOperatorsResponse',
  '2': [
    {
      '1': 'operators',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.weebi.mobile_money.service.MobileMoneyOperatorPb',
      '10': 'operators'
    },
  ],
};

/// Descriptor for `ListMobileMoneyOperatorsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMobileMoneyOperatorsResponseDescriptor =
    $convert.base64Decode(
        'CiBMaXN0TW9iaWxlTW9uZXlPcGVyYXRvcnNSZXNwb25zZRJPCglvcGVyYXRvcnMYASADKAsyMS'
        '53ZWViaS5tb2JpbGVfbW9uZXkuc2VydmljZS5Nb2JpbGVNb25leU9wZXJhdG9yUGJSCW9wZXJh'
        'dG9ycw==');
