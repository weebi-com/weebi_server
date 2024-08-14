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

@$core.Deprecated('Use readDeviceRequestDescriptor instead')
const ReadDeviceRequest$json = {
  '1': 'ReadDeviceRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
  ],
};

/// Descriptor for `ReadDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readDeviceRequestDescriptor = $convert.base64Decode(
    'ChFSZWFkRGV2aWNlUmVxdWVzdBIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklk');

@$core.Deprecated('Use deleteDeviceRequestDescriptor instead')
const DeleteDeviceRequest$json = {
  '1': 'DeleteDeviceRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'device', '3': 2, '4': 1, '5': 11, '6': '.weebi.chain.Device', '10': 'device'},
  ],
};

/// Descriptor for `DeleteDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDeviceRequestDescriptor = $convert.base64Decode(
    'ChNEZWxldGVEZXZpY2VSZXF1ZXN0EhgKB2NoYWluSWQYASABKAlSB2NoYWluSWQSKwoGZGV2aW'
    'NlGAIgASgLMhMud2VlYmkuY2hhaW4uRGV2aWNlUgZkZXZpY2U=');

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
    {'1': 'chainIds', '3': 1, '4': 1, '5': 11, '6': '.weebi.user.Ids', '10': 'chainIds'},
    {'1': 'boutiqueIds', '3': 2, '4': 1, '5': 11, '6': '.weebi.user.Ids', '10': 'boutiqueIds'},
  ],
};

/// Descriptor for `Access`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accessDescriptor = $convert.base64Decode(
    'CgZBY2Nlc3MSKwoIY2hhaW5JZHMYASABKAsyDy53ZWViaS51c2VyLklkc1IIY2hhaW5JZHMSMQ'
    'oLYm91dGlxdWVJZHMYAiABKAsyDy53ZWViaS51c2VyLklkc1ILYm91dGlxdWVJZHM=');

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
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 2, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'boutiqueId', '3': 3, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'deviceOid', '3': 4, '4': 1, '5': 9, '10': 'deviceOid'},
    {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `DeviceLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceLoginRequestDescriptor = $convert.base64Decode(
    'ChJEZXZpY2VMb2dpblJlcXVlc3QSFgoGZmlybUlkGAEgASgJUgZmaXJtSWQSGAoHY2hhaW5JZB'
    'gCIAEoCVIHY2hhaW5JZBIeCgpib3V0aXF1ZUlkGAMgASgJUgpib3V0aXF1ZUlkEhwKCWRldmlj'
    'ZU9pZBgEIAEoCVIJZGV2aWNlT2lkEhoKCHBhc3N3b3JkGAUgASgJUghwYXNzd29yZA==');

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
    {'1': 'device', '3': 2, '4': 1, '5': 11, '6': '.weebi.chain.Device', '10': 'device'},
  ],
};

/// Descriptor for `UpdateDevicePasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDevicePasswordRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVEZXZpY2VQYXNzd29yZFJlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZB'
    'IrCgZkZXZpY2UYAiABKAsyEy53ZWViaS5jaGFpbi5EZXZpY2VSBmRldmljZQ==');

@$core.Deprecated('Use createOneUserRequestDescriptor instead')
const CreateOneUserRequest$json = {
  '1': 'CreateOneUserRequest',
  '2': [
    {'1': 'userInfo', '3': 1, '4': 1, '5': 11, '6': '.weebi.user.UserInfo', '10': 'userInfo'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `CreateOneUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOneUserRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVPbmVVc2VyUmVxdWVzdBIwCgh1c2VySW5mbxgBIAEoCzIULndlZWJpLnVzZXIuVX'
    'NlckluZm9SCHVzZXJJbmZvEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use passwordUpdateRequestDescriptor instead')
const PasswordUpdateRequest$json = {
  '1': 'PasswordUpdateRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'firmId', '3': 2, '4': 1, '5': 9, '10': 'firmId'},
  ],
};

/// Descriptor for `PasswordUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passwordUpdateRequestDescriptor = $convert.base64Decode(
    'ChVQYXNzd29yZFVwZGF0ZVJlcXVlc3QSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSFgoGZmlybU'
    'lkGAIgASgJUgZmaXJtSWQ=');

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
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 2, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'boutiqueId', '3': 3, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'userId', '3': 4, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'code', '3': 5, '4': 1, '5': 5, '10': 'code'},
    {'1': 'timestampUTC', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestampUTC'},
  ],
};

/// Descriptor for `DevicePairingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List devicePairingResponseDescriptor = $convert.base64Decode(
    'ChVEZXZpY2VQYWlyaW5nUmVzcG9uc2USFgoGZmlybUlkGAEgASgJUgZmaXJtSWQSGAoHY2hhaW'
    '5JZBgCIAEoCVIHY2hhaW5JZBIeCgpib3V0aXF1ZUlkGAMgASgJUgpib3V0aXF1ZUlkEhYKBnVz'
    'ZXJJZBgEIAEoCVIGdXNlcklkEhIKBGNvZGUYBSABKAVSBGNvZGUSPgoMdGltZXN0YW1wVVRDGA'
    'YgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIMdGltZXN0YW1wVVRD');

@$core.Deprecated('Use approveDeviceRequestDescriptor instead')
const ApproveDeviceRequest$json = {
  '1': 'ApproveDeviceRequest',
  '2': [
    {'1': 'chainIdAndboutiqueId', '3': 1, '4': 1, '5': 11, '6': '.weebi.common.mongo.chainIdAndboutiqueId', '10': 'chainIdAndboutiqueId'},
    {'1': 'device', '3': 2, '4': 1, '5': 11, '6': '.weebi.chain.Device', '10': 'device'},
  ],
};

/// Descriptor for `ApproveDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveDeviceRequestDescriptor = $convert.base64Decode(
    'ChRBcHByb3ZlRGV2aWNlUmVxdWVzdBJcChRjaGFpbklkQW5kYm91dGlxdWVJZBgBIAEoCzIoLn'
    'dlZWJpLmNvbW1vbi5tb25nby5jaGFpbklkQW5kYm91dGlxdWVJZFIUY2hhaW5JZEFuZGJvdXRp'
    'cXVlSWQSKwoGZGV2aWNlGAIgASgLMhMud2VlYmkuY2hhaW4uRGV2aWNlUgZkZXZpY2U=');

