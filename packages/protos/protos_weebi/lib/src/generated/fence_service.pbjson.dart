// This is a generated file - do not edit.
//
// Generated from fence_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chainRequestDescriptor instead')
const ChainRequest$json = {
  '1': 'ChainRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `ChainRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainRequestDescriptor = $convert.base64Decode(
    'CgxDaGFpblJlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZBISCgRuYW1lGAIgASgJUg'
    'RuYW1l');

@$core.Deprecated('Use boutiqueRequestDescriptor instead')
const BoutiqueRequest$json = {
  '1': 'BoutiqueRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {
      '1': 'boutique',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.weebi.boutique.BoutiquePb',
      '10': 'boutique'
    },
    {'1': 'logo', '3': 3, '4': 1, '5': 12, '10': 'logo'},
    {'1': 'logoExtension', '3': 4, '4': 1, '5': 9, '10': 'logoExtension'},
  ],
};

/// Descriptor for `BoutiqueRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boutiqueRequestDescriptor = $convert.base64Decode(
    'Cg9Cb3V0aXF1ZVJlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZBI2Cghib3V0aXF1ZR'
    'gCIAEoCzIaLndlZWJpLmJvdXRpcXVlLkJvdXRpcXVlUGJSCGJvdXRpcXVlEhIKBGxvZ28YAyAB'
    'KAxSBGxvZ28SJAoNbG9nb0V4dGVuc2lvbhgEIAEoCVINbG9nb0V4dGVuc2lvbg==');

@$core.Deprecated('Use boutiqueResponseDescriptor instead')
const BoutiqueResponse$json = {
  '1': 'BoutiqueResponse',
  '2': [
    {
      '1': 'boutique',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.weebi.boutique.BoutiquePb',
      '10': 'boutique'
    },
    {'1': 'logo', '3': 2, '4': 1, '5': 12, '10': 'logo'},
    {'1': 'logoExtension', '3': 3, '4': 1, '5': 9, '10': 'logoExtension'},
  ],
};

/// Descriptor for `BoutiqueResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boutiqueResponseDescriptor = $convert.base64Decode(
    'ChBCb3V0aXF1ZVJlc3BvbnNlEjYKCGJvdXRpcXVlGAEgASgLMhoud2VlYmkuYm91dGlxdWUuQm'
    '91dGlxdWVQYlIIYm91dGlxdWUSEgoEbG9nbxgCIAEoDFIEbG9nbxIkCg1sb2dvRXh0ZW5zaW9u'
    'GAMgASgJUg1sb2dvRXh0ZW5zaW9u');

@$core.Deprecated('Use createDeviceResponseDescriptor instead')
const CreateDeviceResponse$json = {
  '1': 'CreateDeviceResponse',
  '2': [
    {
      '1': 'statusResponse',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.retail.common.StatusResponse',
      '10': 'statusResponse'
    },
    {'1': 'firmId', '3': 2, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 3, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'boutiqueId', '3': 4, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'deviceId', '3': 5, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `CreateDeviceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDeviceResponseDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVEZXZpY2VSZXNwb25zZRJMCg5zdGF0dXNSZXNwb25zZRgBIAEoCzIkLmdvb2dsZS'
    '5yZXRhaWwuY29tbW9uLlN0YXR1c1Jlc3BvbnNlUg5zdGF0dXNSZXNwb25zZRIWCgZmaXJtSWQY'
    'AiABKAlSBmZpcm1JZBIYCgdjaGFpbklkGAMgASgJUgdjaGFpbklkEh4KCmJvdXRpcXVlSWQYBC'
    'ABKAlSCmJvdXRpcXVlSWQSGgoIZGV2aWNlSWQYBSABKAlSCGRldmljZUlk');

@$core.Deprecated('Use readOneUserResponseDescriptor instead')
const ReadOneUserResponse$json = {
  '1': 'ReadOneUserResponse',
  '2': [
    {
      '1': 'statusResponse',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.retail.common.StatusResponse',
      '10': 'statusResponse'
    },
    {
      '1': 'user',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.weebi.user.UserPublic',
      '10': 'user'
    },
  ],
};

/// Descriptor for `ReadOneUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readOneUserResponseDescriptor = $convert.base64Decode(
    'ChNSZWFkT25lVXNlclJlc3BvbnNlEkwKDnN0YXR1c1Jlc3BvbnNlGAEgASgLMiQuZ29vZ2xlLn'
    'JldGFpbC5jb21tb24uU3RhdHVzUmVzcG9uc2VSDnN0YXR1c1Jlc3BvbnNlEioKBHVzZXIYAiAB'
    'KAsyFi53ZWViaS51c2VyLlVzZXJQdWJsaWNSBHVzZXI=');

@$core.Deprecated('Use usersPublicDescriptor instead')
const UsersPublic$json = {
  '1': 'UsersPublic',
  '2': [
    {
      '1': 'users',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.weebi.user.UserPublic',
      '10': 'users'
    },
  ],
};

/// Descriptor for `UsersPublic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usersPublicDescriptor = $convert.base64Decode(
    'CgtVc2Vyc1B1YmxpYxIsCgV1c2VycxgBIAMoCzIWLndlZWJpLnVzZXIuVXNlclB1YmxpY1IFdX'
    'NlcnM=');

@$core.Deprecated('Use readAllChainsResponseDescriptor instead')
const ReadAllChainsResponse$json = {
  '1': 'ReadAllChainsResponse',
  '2': [
    {
      '1': 'chains',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.weebi.chain.Chain',
      '10': 'chains'
    },
  ],
};

/// Descriptor for `ReadAllChainsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readAllChainsResponseDescriptor = $convert.base64Decode(
    'ChVSZWFkQWxsQ2hhaW5zUmVzcG9uc2USKgoGY2hhaW5zGAEgAygLMhIud2VlYmkuY2hhaW4uQ2'
    'hhaW5SBmNoYWlucw==');

@$core.Deprecated('Use readAllBoutiquesResponseDescriptor instead')
const ReadAllBoutiquesResponse$json = {
  '1': 'ReadAllBoutiquesResponse',
  '2': [
    {
      '1': 'boutiques',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.weebi.boutique.BoutiquePb',
      '10': 'boutiques'
    },
  ],
};

/// Descriptor for `ReadAllBoutiquesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readAllBoutiquesResponseDescriptor =
    $convert.base64Decode(
        'ChhSZWFkQWxsQm91dGlxdWVzUmVzcG9uc2USOAoJYm91dGlxdWVzGAEgAygLMhoud2VlYmkuYm'
        '91dGlxdWUuQm91dGlxdWVQYlIJYm91dGlxdWVz');

@$core.Deprecated('Use readDevicesRequestDescriptor instead')
const ReadDevicesRequest$json = {
  '1': 'ReadDevicesRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
  ],
};

/// Descriptor for `ReadDevicesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readDevicesRequestDescriptor =
    $convert.base64Decode(
        'ChJSZWFkRGV2aWNlc1JlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZA==');

@$core.Deprecated('Use isADeviceInChainResponseDescriptor instead')
const IsADeviceInChainResponse$json = {
  '1': 'IsADeviceInChainResponse',
  '2': [
    {'1': 'isADevice', '3': 1, '4': 1, '5': 8, '10': 'isADevice'},
  ],
};

/// Descriptor for `IsADeviceInChainResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isADeviceInChainResponseDescriptor =
    $convert.base64Decode(
        'ChhJc0FEZXZpY2VJbkNoYWluUmVzcG9uc2USHAoJaXNBRGV2aWNlGAEgASgIUglpc0FEZXZpY2'
        'U=');

@$core.Deprecated('Use readDeviceBtqRequestDescriptor instead')
const ReadDeviceBtqRequest$json = {
  '1': 'ReadDeviceBtqRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'boutiqueId', '3': 2, '4': 1, '5': 9, '10': 'boutiqueId'},
  ],
};

/// Descriptor for `ReadDeviceBtqRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readDeviceBtqRequestDescriptor = $convert.base64Decode(
    'ChRSZWFkRGV2aWNlQnRxUmVxdWVzdBIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklkEh4KCmJvdX'
    'RpcXVlSWQYAiABKAlSCmJvdXRpcXVlSWQ=');

@$core.Deprecated('Use deleteDeviceRequestDescriptor instead')
const DeleteDeviceRequest$json = {
  '1': 'DeleteDeviceRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {
      '1': 'device',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.weebi.device.Device',
      '10': 'device'
    },
  ],
};

/// Descriptor for `DeleteDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDeviceRequestDescriptor = $convert.base64Decode(
    'ChNEZWxldGVEZXZpY2VSZXF1ZXN0EhgKB2NoYWluSWQYASABKAlSB2NoYWluSWQSLAoGZGV2aW'
    'NlGAIgASgLMhQud2VlYmkuZGV2aWNlLkRldmljZVIGZGV2aWNl');

@$core.Deprecated('Use mailAndEncyptedPasswordDescriptor instead')
const MailAndEncyptedPassword$json = {
  '1': 'MailAndEncyptedPassword',
  '2': [
    {'1': 'mail', '3': 1, '4': 1, '5': 9, '10': 'mail'},
    {
      '1': 'passwordEncrypted',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'passwordEncrypted'
    },
  ],
};

/// Descriptor for `MailAndEncyptedPassword`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mailAndEncyptedPasswordDescriptor =
    $convert.base64Decode(
        'ChdNYWlsQW5kRW5jeXB0ZWRQYXNzd29yZBISCgRtYWlsGAEgASgJUgRtYWlsEiwKEXBhc3N3b3'
        'JkRW5jcnlwdGVkGAIgASgJUhFwYXNzd29yZEVuY3J5cHRlZA==');

@$core.Deprecated('Use userIdDescriptor instead')
const UserId$json = {
  '1': 'UserId',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `UserId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userIdDescriptor =
    $convert.base64Decode('CgZVc2VySWQSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use accessDescriptor instead')
const Access$json = {
  '1': 'Access',
  '2': [
    {
      '1': 'chainIds',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.weebi.user.permissions.ChainIds',
      '10': 'chainIds'
    },
    {
      '1': 'boutiqueIds',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.weebi.user.permissions.BoutiqueIds',
      '10': 'boutiqueIds'
    },
  ],
};

/// Descriptor for `Access`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accessDescriptor = $convert.base64Decode(
    'CgZBY2Nlc3MSPAoIY2hhaW5JZHMYASABKAsyIC53ZWViaS51c2VyLnBlcm1pc3Npb25zLkNoYW'
    'luSWRzUghjaGFpbklkcxJFCgtib3V0aXF1ZUlkcxgCIAEoCzIjLndlZWJpLnVzZXIucGVybWlz'
    'c2lvbnMuQm91dGlxdWVJZHNSC2JvdXRpcXVlSWRz');

@$core.Deprecated('Use credentialsDescriptor instead')
const Credentials$json = {
  '1': 'Credentials',
  '2': [
    {'1': 'mail', '3': 1, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `Credentials`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List credentialsDescriptor = $convert.base64Decode(
    'CgtDcmVkZW50aWFscxISCgRtYWlsGAEgASgJUgRtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYX'
    'Nzd29yZA==');

@$core.Deprecated('Use deviceCredentialsDescriptor instead')
const DeviceCredentials$json = {
  '1': 'DeviceCredentials',
  '2': [
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 2, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'boutiqueId', '3': 3, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'deviceId', '3': 4, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `DeviceCredentials`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceCredentialsDescriptor = $convert.base64Decode(
    'ChFEZXZpY2VDcmVkZW50aWFscxIWCgZmaXJtSWQYASABKAlSBmZpcm1JZBIYCgdjaGFpbklkGA'
    'IgASgJUgdjaGFpbklkEh4KCmJvdXRpcXVlSWQYAyABKAlSCmJvdXRpcXVlSWQSGgoIZGV2aWNl'
    'SWQYBCABKAlSCGRldmljZUlkEhoKCHBhc3N3b3JkGAUgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use refreshTokenDescriptor instead')
const RefreshToken$json = {
  '1': 'RefreshToken',
  '2': [
    {'1': 'refreshToken', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenDescriptor = $convert.base64Decode(
    'CgxSZWZyZXNoVG9rZW4SIgoMcmVmcmVzaFRva2VuGAEgASgJUgxyZWZyZXNoVG9rZW4=');

@$core.Deprecated('Use tokensDescriptor instead')
const Tokens$json = {
  '1': 'Tokens',
  '2': [
    {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refreshToken', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {
      '1': 'mustChangePassword',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'mustChangePassword'
    },
  ],
};

/// Descriptor for `Tokens`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokensDescriptor = $convert.base64Decode(
    'CgZUb2tlbnMSIAoLYWNjZXNzVG9rZW4YASABKAlSC2FjY2Vzc1Rva2VuEiIKDHJlZnJlc2hUb2'
    'tlbhgCIAEoCVIMcmVmcmVzaFRva2VuEi4KEm11c3RDaGFuZ2VQYXNzd29yZBgDIAEoCFISbXVz'
    'dENoYW5nZVBhc3N3b3Jk');

@$core.Deprecated('Use updateDevicePasswordRequestDescriptor instead')
const UpdateDevicePasswordRequest$json = {
  '1': 'UpdateDevicePasswordRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {
      '1': 'device',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.weebi.device.Device',
      '10': 'device'
    },
  ],
};

/// Descriptor for `UpdateDevicePasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDevicePasswordRequestDescriptor =
    $convert.base64Decode(
        'ChtVcGRhdGVEZXZpY2VQYXNzd29yZFJlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZB'
        'IsCgZkZXZpY2UYAiABKAsyFC53ZWViaS5kZXZpY2UuRGV2aWNlUgZkZXZpY2U=');

@$core.Deprecated('Use passwordUpdateRequestDescriptor instead')
const PasswordUpdateRequest$json = {
  '1': 'PasswordUpdateRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'firmId', '3': 2, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'passwordCurrent', '3': 3, '4': 1, '5': 9, '10': 'passwordCurrent'},
    {'1': 'passwordNew', '3': 4, '4': 1, '5': 9, '10': 'passwordNew'},
  ],
};

/// Descriptor for `PasswordUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passwordUpdateRequestDescriptor = $convert.base64Decode(
    'ChVQYXNzd29yZFVwZGF0ZVJlcXVlc3QSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSFgoGZmlybU'
    'lkGAIgASgJUgZmaXJtSWQSKAoPcGFzc3dvcmRDdXJyZW50GAMgASgJUg9wYXNzd29yZEN1cnJl'
    'bnQSIAoLcGFzc3dvcmROZXcYBCABKAlSC3Bhc3N3b3JkTmV3');

@$core.Deprecated('Use pendingDeviceRequestDescriptor instead')
const PendingDeviceRequest$json = {
  '1': 'PendingDeviceRequest',
  '2': [
    {
      '1': 'hardwareInfo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.weebi.device.HardwareInfo',
      '10': 'hardwareInfo'
    },
    {'1': 'code', '3': 2, '4': 1, '5': 5, '10': 'code'},
  ],
};

/// Descriptor for `PendingDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pendingDeviceRequestDescriptor = $convert.base64Decode(
    'ChRQZW5kaW5nRGV2aWNlUmVxdWVzdBI+CgxoYXJkd2FyZUluZm8YASABKAsyGi53ZWViaS5kZX'
    'ZpY2UuSGFyZHdhcmVJbmZvUgxoYXJkd2FyZUluZm8SEgoEY29kZRgCIAEoBVIEY29kZQ==');

@$core.Deprecated('Use codeForPairingDeviceDescriptor instead')
const CodeForPairingDevice$json = {
  '1': 'CodeForPairingDevice',
  '2': [
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 2, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'boutiqueId', '3': 3, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'userId', '3': 4, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'code', '3': 5, '4': 1, '5': 5, '10': 'code'},
    {
      '1': 'timestampUTC',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestampUTC'
    },
  ],
};

/// Descriptor for `CodeForPairingDevice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List codeForPairingDeviceDescriptor = $convert.base64Decode(
    'ChRDb2RlRm9yUGFpcmluZ0RldmljZRIWCgZmaXJtSWQYASABKAlSBmZpcm1JZBIYCgdjaGFpbk'
    'lkGAIgASgJUgdjaGFpbklkEh4KCmJvdXRpcXVlSWQYAyABKAlSCmJvdXRpcXVlSWQSFgoGdXNl'
    'cklkGAQgASgJUgZ1c2VySWQSEgoEY29kZRgFIAEoBVIEY29kZRI+Cgx0aW1lc3RhbXBVVEMYBi'
    'ABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgx0aW1lc3RhbXBVVEM=');

@$core.Deprecated('Use approveDeviceRequestDescriptor instead')
const ApproveDeviceRequest$json = {
  '1': 'ApproveDeviceRequest',
  '2': [
    {
      '1': 'device',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.weebi.device.Device',
      '10': 'device'
    },
  ],
};

/// Descriptor for `ApproveDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveDeviceRequestDescriptor = $convert.base64Decode(
    'ChRBcHByb3ZlRGV2aWNlUmVxdWVzdBIsCgZkZXZpY2UYASABKAsyFC53ZWViaS5kZXZpY2UuRG'
    'V2aWNlUgZkZXZpY2U=');

@$core.Deprecated('Use passwordResetRequestDescriptor instead')
const PasswordResetRequest$json = {
  '1': 'PasswordResetRequest',
  '2': [
    {'1': 'mail', '3': 1, '4': 1, '5': 9, '10': 'mail'},
  ],
};

/// Descriptor for `PasswordResetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passwordResetRequestDescriptor = $convert
    .base64Decode('ChRQYXNzd29yZFJlc2V0UmVxdWVzdBISCgRtYWlsGAEgASgJUgRtYWls');

@$core.Deprecated('Use passwordResetConfirmRequestDescriptor instead')
const PasswordResetConfirmRequest$json = {
  '1': 'PasswordResetConfirmRequest',
  '2': [
    {'1': 'mail', '3': 1, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'resetToken', '3': 2, '4': 1, '5': 9, '10': 'resetToken'},
    {'1': 'newPassword', '3': 3, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `PasswordResetConfirmRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passwordResetConfirmRequestDescriptor =
    $convert.base64Decode(
        'ChtQYXNzd29yZFJlc2V0Q29uZmlybVJlcXVlc3QSEgoEbWFpbBgBIAEoCVIEbWFpbBIeCgpyZX'
        'NldFRva2VuGAIgASgJUgpyZXNldFRva2VuEiAKC25ld1Bhc3N3b3JkGAMgASgJUgtuZXdQYXNz'
        'd29yZA==');

@$core.Deprecated('Use markEmailVerifiedRequestDescriptor instead')
const MarkEmailVerifiedRequest$json = {
  '1': 'MarkEmailVerifiedRequest',
  '2': [
    {'1': 'mail', '3': 1, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `MarkEmailVerifiedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markEmailVerifiedRequestDescriptor =
    $convert.base64Decode(
        'ChhNYXJrRW1haWxWZXJpZmllZFJlcXVlc3QSEgoEbWFpbBgBIAEoCVIEbWFpbBIWCgZ1c2VySW'
        'QYAiABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use updateSubscriberIdRequestDescriptor instead')
const UpdateSubscriberIdRequest$json = {
  '1': 'UpdateSubscriberIdRequest',
  '2': [
    {'1': 'mail', '3': 1, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'subscriberId', '3': 2, '4': 1, '5': 9, '10': 'subscriberId'},
    {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `UpdateSubscriberIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSubscriberIdRequestDescriptor =
    $convert.base64Decode(
        'ChlVcGRhdGVTdWJzY3JpYmVySWRSZXF1ZXN0EhIKBG1haWwYASABKAlSBG1haWwSIgoMc3Vic2'
        'NyaWJlcklkGAIgASgJUgxzdWJzY3JpYmVySWQSFgoGdXNlcklkGAMgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use healthCheckWeebiResponseDescriptor instead')
const HealthCheckWeebiResponse$json = {
  '1': 'HealthCheckWeebiResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'timestamp', '3': 2, '4': 1, '5': 9, '10': 'timestamp'},
    {
      '1': 'versions',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.weebi.fence.service.ServiceVersions',
      '10': 'versions'
    },
    {'1': 'databaseHealthy', '3': 4, '4': 1, '5': 8, '10': 'databaseHealthy'},
  ],
};

/// Descriptor for `HealthCheckWeebiResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List healthCheckWeebiResponseDescriptor = $convert.base64Decode(
    'ChhIZWFsdGhDaGVja1dlZWJpUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSHAoJdG'
    'ltZXN0YW1wGAIgASgJUgl0aW1lc3RhbXASQAoIdmVyc2lvbnMYAyABKAsyJC53ZWViaS5mZW5j'
    'ZS5zZXJ2aWNlLlNlcnZpY2VWZXJzaW9uc1IIdmVyc2lvbnMSKAoPZGF0YWJhc2VIZWFsdGh5GA'
    'QgASgIUg9kYXRhYmFzZUhlYWx0aHk=');

@$core.Deprecated('Use serviceVersionsDescriptor instead')
const ServiceVersions$json = {
  '1': 'ServiceVersions',
  '2': [
    {'1': 'server', '3': 1, '4': 1, '5': 9, '10': 'server'},
    {'1': 'protos_weebi', '3': 2, '4': 1, '5': 9, '10': 'protos_weebi'},
    {'1': 'fence_service', '3': 3, '4': 1, '5': 9, '10': 'fence_service'},
    {'1': 'models_weebi', '3': 4, '4': 1, '5': 9, '10': 'models_weebi'},
  ],
};

/// Descriptor for `ServiceVersions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceVersionsDescriptor = $convert.base64Decode(
    'Cg9TZXJ2aWNlVmVyc2lvbnMSFgoGc2VydmVyGAEgASgJUgZzZXJ2ZXISIgoMcHJvdG9zX3dlZW'
    'JpGAIgASgJUgxwcm90b3Nfd2VlYmkSJAoNZmVuY2Vfc2VydmljZRgDIAEoCVINZmVuY2Vfc2Vy'
    'dmljZRIiCgxtb2RlbHNfd2VlYmkYBCABKAlSDG1vZGVsc193ZWViaQ==');
