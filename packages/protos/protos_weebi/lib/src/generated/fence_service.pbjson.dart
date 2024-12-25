//
//  Generated code. Do not modify.
//  source: fence_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use boutiqueRequestDescriptor instead')
const BoutiqueRequest$json = {
  '1': 'BoutiqueRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'boutique', '3': 2, '4': 1, '5': 11, '6': '.weebi.boutique.BoutiquePb', '10': 'boutique'},
  ],
};

/// Descriptor for `BoutiqueRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boutiqueRequestDescriptor = $convert.base64Decode(
    'Cg9Cb3V0aXF1ZVJlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZBI2Cghib3V0aXF1ZR'
    'gCIAEoCzIaLndlZWJpLmJvdXRpcXVlLkJvdXRpcXVlUGJSCGJvdXRpcXVl');

@$core.Deprecated('Use createDeviceResponseDescriptor instead')
const CreateDeviceResponse$json = {
  '1': 'CreateDeviceResponse',
  '2': [
    {'1': 'statusResponse', '3': 1, '4': 1, '5': 11, '6': '.google.retail.common.StatusResponse', '10': 'statusResponse'},
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
    {'1': 'statusResponse', '3': 1, '4': 1, '5': 11, '6': '.google.retail.common.StatusResponse', '10': 'statusResponse'},
    {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.weebi.user.UserPublic', '10': 'user'},
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
    {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.weebi.user.UserPublic', '10': 'users'},
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
    {'1': 'chains', '3': 1, '4': 3, '5': 11, '6': '.weebi.chain.Chain', '10': 'chains'},
  ],
};

/// Descriptor for `ReadAllChainsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readAllChainsResponseDescriptor = $convert.base64Decode(
    'ChVSZWFkQWxsQ2hhaW5zUmVzcG9uc2USKgoGY2hhaW5zGAEgAygLMhIud2VlYmkuY2hhaW4uQ2'
    'hhaW5SBmNoYWlucw==');

@$core.Deprecated('Use readDevicesRequestDescriptor instead')
const ReadDevicesRequest$json = {
  '1': 'ReadDevicesRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
  ],
};

/// Descriptor for `ReadDevicesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readDevicesRequestDescriptor = $convert.base64Decode(
    'ChJSZWFkRGV2aWNlc1JlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZA==');

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
    {'1': 'device', '3': 2, '4': 1, '5': 11, '6': '.weebi.device.Device', '10': 'device'},
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
    {'1': 'passwordEncrypted', '3': 2, '4': 1, '5': 9, '10': 'passwordEncrypted'},
  ],
};

/// Descriptor for `MailAndEncyptedPassword`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mailAndEncyptedPasswordDescriptor = $convert.base64Decode(
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
final $typed_data.Uint8List userIdDescriptor = $convert.base64Decode(
    'CgZVc2VySWQSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use accessDescriptor instead')
const Access$json = {
  '1': 'Access',
  '2': [
    {'1': 'chainIds', '3': 1, '4': 1, '5': 11, '6': '.weebi.user.permissions.ChainIds', '10': 'chainIds'},
    {'1': 'boutiqueIds', '3': 2, '4': 1, '5': 11, '6': '.weebi.user.permissions.BoutiqueIds', '10': 'boutiqueIds'},
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
  ],
};

/// Descriptor for `Tokens`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokensDescriptor = $convert.base64Decode(
    'CgZUb2tlbnMSIAoLYWNjZXNzVG9rZW4YASABKAlSC2FjY2Vzc1Rva2VuEiIKDHJlZnJlc2hUb2'
    'tlbhgCIAEoCVIMcmVmcmVzaFRva2Vu');

@$core.Deprecated('Use updateDevicePasswordRequestDescriptor instead')
const UpdateDevicePasswordRequest$json = {
  '1': 'UpdateDevicePasswordRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'device', '3': 2, '4': 1, '5': 11, '6': '.weebi.device.Device', '10': 'device'},
  ],
};

/// Descriptor for `UpdateDevicePasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDevicePasswordRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVEZXZpY2VQYXNzd29yZFJlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZB'
    'IsCgZkZXZpY2UYAiABKAsyFC53ZWViaS5kZXZpY2UuRGV2aWNlUgZkZXZpY2U=');

@$core.Deprecated('Use passwordUpdateRequestDescriptor instead')
const PasswordUpdateRequest$json = {
  '1': 'PasswordUpdateRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'firmId', '3': 2, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `PasswordUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passwordUpdateRequestDescriptor = $convert.base64Decode(
    'ChVQYXNzd29yZFVwZGF0ZVJlcXVlc3QSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSFgoGZmlybU'
    'lkGAIgASgJUgZmaXJtSWQSGgoIcGFzc3dvcmQYAyABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use pendingDeviceRequestDescriptor instead')
const PendingDeviceRequest$json = {
  '1': 'PendingDeviceRequest',
  '2': [
    {'1': 'hardwareInfo', '3': 1, '4': 1, '5': 11, '6': '.weebi.device.HardwareInfo', '10': 'hardwareInfo'},
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
    {'1': 'timestampUTC', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestampUTC'},
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
    {'1': 'device', '3': 1, '4': 1, '5': 11, '6': '.weebi.device.Device', '10': 'device'},
  ],
};

/// Descriptor for `ApproveDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveDeviceRequestDescriptor = $convert.base64Decode(
    'ChRBcHByb3ZlRGV2aWNlUmVxdWVzdBIsCgZkZXZpY2UYASABKAsyFC53ZWViaS5kZXZpY2UuRG'
    'V2aWNlUgZkZXZpY2U=');

