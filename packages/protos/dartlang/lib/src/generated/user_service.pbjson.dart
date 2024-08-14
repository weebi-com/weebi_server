//
//  Generated code. Do not modify.
//  source: user_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use mailAndEncyptedPasswordRequestDescriptor instead')
const MailAndEncyptedPasswordRequest$json = {
  '1': 'MailAndEncyptedPasswordRequest',
  '2': [
    {'1': 'mail', '3': 1, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'passwordEncrypted', '3': 2, '4': 1, '5': 9, '10': 'passwordEncrypted'},
  ],
};

/// Descriptor for `MailAndEncyptedPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mailAndEncyptedPasswordRequestDescriptor = $convert.base64Decode(
    'Ch5NYWlsQW5kRW5jeXB0ZWRQYXNzd29yZFJlcXVlc3QSEgoEbWFpbBgBIAEoCVIEbWFpbBIsCh'
    'FwYXNzd29yZEVuY3J5cHRlZBgCIAEoCVIRcGFzc3dvcmRFbmNyeXB0ZWQ=');

@$core.Deprecated('Use userOidDescriptor instead')
const UserOid$json = {
  '1': 'UserOid',
  '2': [
    {'1': 'oid', '3': 1, '4': 1, '5': 9, '10': 'oid'},
  ],
};

/// Descriptor for `UserOid`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userOidDescriptor = $convert.base64Decode(
    'CgdVc2VyT2lkEhAKA29pZBgBIAEoCVIDb2lk');

@$core.Deprecated('Use accessDescriptor instead')
const Access$json = {
  '1': 'Access',
  '2': [
    {'1': 'chainsAccessible', '3': 1, '4': 1, '5': 11, '6': '.weebi.user.Oids', '10': 'chainsAccessible'},
    {'1': 'boutiquesAccessible', '3': 2, '4': 1, '5': 11, '6': '.weebi.user.Oids', '10': 'boutiquesAccessible'},
  ],
};

/// Descriptor for `Access`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accessDescriptor = $convert.base64Decode(
    'CgZBY2Nlc3MSPAoQY2hhaW5zQWNjZXNzaWJsZRgBIAEoCzIQLndlZWJpLnVzZXIuT2lkc1IQY2'
    'hhaW5zQWNjZXNzaWJsZRJCChNib3V0aXF1ZXNBY2Nlc3NpYmxlGAIgASgLMhAud2VlYmkudXNl'
    'ci5PaWRzUhNib3V0aXF1ZXNBY2Nlc3NpYmxl');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'mail', '3': 1, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSEgoEbWFpbBgBIAEoCVIEbWFpbBIaCghwYXNzd29yZBgCIAEoCVIIcG'
    'Fzc3dvcmQ=');

@$core.Deprecated('Use deviceLoginRequestDescriptor instead')
const DeviceLoginRequest$json = {
  '1': 'DeviceLoginRequest',
  '2': [
    {'1': 'firmOid', '3': 1, '4': 1, '5': 9, '10': 'firmOid'},
    {'1': 'chainOid', '3': 2, '4': 1, '5': 9, '10': 'chainOid'},
    {'1': 'boutiqueOid', '3': 3, '4': 1, '5': 9, '10': 'boutiqueOid'},
    {'1': 'deviceOid', '3': 4, '4': 1, '5': 9, '10': 'deviceOid'},
    {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `DeviceLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceLoginRequestDescriptor = $convert.base64Decode(
    'ChJEZXZpY2VMb2dpblJlcXVlc3QSGAoHZmlybU9pZBgBIAEoCVIHZmlybU9pZBIaCghjaGFpbk'
    '9pZBgCIAEoCVIIY2hhaW5PaWQSIAoLYm91dGlxdWVPaWQYAyABKAlSC2JvdXRpcXVlT2lkEhwK'
    'CWRldmljZU9pZBgEIAEoCVIJZGV2aWNlT2lkEhoKCHBhc3N3b3JkGAUgASgJUghwYXNzd29yZA'
    '==');

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

@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = {
  '1': 'UserInfo',
  '2': [
    {'1': 'userOid', '3': 1, '4': 1, '5': 9, '10': 'userOid'},
    {'1': 'firstname', '3': 2, '4': 1, '5': 9, '10': 'firstname'},
    {'1': 'lastname', '3': 3, '4': 1, '5': 9, '10': 'lastname'},
    {'1': 'mail', '3': 4, '4': 1, '5': 9, '10': 'mail'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode(
    'CghVc2VySW5mbxIYCgd1c2VyT2lkGAEgASgJUgd1c2VyT2lkEhwKCWZpcnN0bmFtZRgCIAEoCV'
    'IJZmlyc3RuYW1lEhoKCGxhc3RuYW1lGAMgASgJUghsYXN0bmFtZRISCgRtYWlsGAQgASgJUgRt'
    'YWls');

@$core.Deprecated('Use updateDevicePasswordRequestDescriptor instead')
const UpdateDevicePasswordRequest$json = {
  '1': 'UpdateDevicePasswordRequest',
  '2': [
    {'1': 'chainOid', '3': 1, '4': 1, '5': 9, '10': 'chainOid'},
    {'1': 'device', '3': 2, '4': 1, '5': 11, '6': '.weebi.chain.Device', '10': 'device'},
  ],
};

/// Descriptor for `UpdateDevicePasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDevicePasswordRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVEZXZpY2VQYXNzd29yZFJlcXVlc3QSGgoIY2hhaW5PaWQYASABKAlSCGNoYWluT2'
    'lkEisKBmRldmljZRgCIAEoCzITLndlZWJpLmNoYWluLkRldmljZVIGZGV2aWNl');

@$core.Deprecated('Use pendingDeviceRequestDescriptor instead')
const PendingDeviceRequest$json = {
  '1': 'PendingDeviceRequest',
  '2': [
    {'1': 'device', '3': 1, '4': 1, '5': 11, '6': '.weebi.chain.Device', '10': 'device'},
    {'1': 'code', '3': 2, '4': 1, '5': 5, '10': 'code'},
  ],
};

/// Descriptor for `PendingDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pendingDeviceRequestDescriptor = $convert.base64Decode(
    'ChRQZW5kaW5nRGV2aWNlUmVxdWVzdBIrCgZkZXZpY2UYASABKAsyEy53ZWViaS5jaGFpbi5EZX'
    'ZpY2VSBmRldmljZRISCgRjb2RlGAIgASgFUgRjb2Rl');

@$core.Deprecated('Use devicePairingResponseDescriptor instead')
const DevicePairingResponse$json = {
  '1': 'DevicePairingResponse',
  '2': [
    {'1': 'firmOid', '3': 1, '4': 1, '5': 9, '10': 'firmOid'},
    {'1': 'chainOid', '3': 2, '4': 1, '5': 9, '10': 'chainOid'},
    {'1': 'boutiqueOid', '3': 3, '4': 1, '5': 9, '10': 'boutiqueOid'},
    {'1': 'userOid', '3': 4, '4': 1, '5': 9, '10': 'userOid'},
    {'1': 'code', '3': 5, '4': 1, '5': 5, '10': 'code'},
    {'1': 'timestampUTC', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestampUTC'},
  ],
};

/// Descriptor for `DevicePairingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List devicePairingResponseDescriptor = $convert.base64Decode(
    'ChVEZXZpY2VQYWlyaW5nUmVzcG9uc2USGAoHZmlybU9pZBgBIAEoCVIHZmlybU9pZBIaCghjaG'
    'Fpbk9pZBgCIAEoCVIIY2hhaW5PaWQSIAoLYm91dGlxdWVPaWQYAyABKAlSC2JvdXRpcXVlT2lk'
    'EhgKB3VzZXJPaWQYBCABKAlSB3VzZXJPaWQSEgoEY29kZRgFIAEoBVIEY29kZRI+Cgx0aW1lc3'
    'RhbXBVVEMYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgx0aW1lc3RhbXBVVEM=');

@$core.Deprecated('Use approveDeviceRequestDescriptor instead')
const ApproveDeviceRequest$json = {
  '1': 'ApproveDeviceRequest',
  '2': [
    {'1': 'chainOidAndBoutiqueOid', '3': 1, '4': 1, '5': 11, '6': '.weebi.common.mongo.ChainOidAndBoutiqueOid', '10': 'chainOidAndBoutiqueOid'},
    {'1': 'device', '3': 2, '4': 1, '5': 11, '6': '.weebi.chain.Device', '10': 'device'},
  ],
};

/// Descriptor for `ApproveDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveDeviceRequestDescriptor = $convert.base64Decode(
    'ChRBcHByb3ZlRGV2aWNlUmVxdWVzdBJiChZjaGFpbk9pZEFuZEJvdXRpcXVlT2lkGAEgASgLMi'
    'oud2VlYmkuY29tbW9uLm1vbmdvLkNoYWluT2lkQW5kQm91dGlxdWVPaWRSFmNoYWluT2lkQW5k'
    'Qm91dGlxdWVPaWQSKwoGZGV2aWNlGAIgASgLMhMud2VlYmkuY2hhaW4uRGV2aWNlUgZkZXZpY2'
    'U=');

