//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userPublicDescriptor instead')
const UserPublic$json = {
  '1': 'UserPublic',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'mail', '3': 2, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'firstname', '3': 3, '4': 1, '5': 9, '10': 'firstname'},
    {'1': 'lastname', '3': 4, '4': 1, '5': 9, '10': 'lastname'},
    {'1': 'phone', '3': 5, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '10': 'phone'},
    {'1': 'lastSignIn', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastSignIn'},
    {'1': 'permissions', '3': 7, '4': 1, '5': 11, '6': '.weebi.user.permissions.UserPermissions', '10': 'permissions'},
    {'1': 'mustChangePassword', '3': 8, '4': 1, '5': 8, '10': 'mustChangePassword'},
    {'1': 'othersAttributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.user.UserPublic.OthersAttributesEntry', '10': 'othersAttributes'},
  ],
  '3': [UserPublic_OthersAttributesEntry$json],
  '9': [
    {'1': 9, '2': 99},
  ],
};

@$core.Deprecated('Use userPublicDescriptor instead')
const UserPublic_OthersAttributesEntry$json = {
  '1': 'OthersAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `UserPublic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userPublicDescriptor = $convert.base64Decode(
    'CgpVc2VyUHVibGljEhYKBnVzZXJJZBgBIAEoCVIGdXNlcklkEhIKBG1haWwYAiABKAlSBG1haW'
    'wSHAoJZmlyc3RuYW1lGAMgASgJUglmaXJzdG5hbWUSGgoIbGFzdG5hbWUYBCABKAlSCGxhc3Ru'
    'YW1lEi8KBXBob25lGAUgASgLMhkud2VlYmkuY29tbW9uLnBob25lLlBob25lUgVwaG9uZRI6Cg'
    'psYXN0U2lnbkluGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKbGFzdFNpZ25J'
    'bhJJCgtwZXJtaXNzaW9ucxgHIAEoCzInLndlZWJpLnVzZXIucGVybWlzc2lvbnMuVXNlclBlcm'
    '1pc3Npb25zUgtwZXJtaXNzaW9ucxIuChJtdXN0Q2hhbmdlUGFzc3dvcmQYCCABKAhSEm11c3RD'
    'aGFuZ2VQYXNzd29yZBJYChBvdGhlcnNBdHRyaWJ1dGVzGGMgAygLMiwud2VlYmkudXNlci5Vc2'
    'VyUHVibGljLk90aGVyc0F0dHJpYnV0ZXNFbnRyeVIQb3RoZXJzQXR0cmlidXRlcxpDChVPdGhl'
    'cnNBdHRyaWJ1dGVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbH'
    'VlOgI4AUoECAkQYw==');

@$core.Deprecated('Use userPrivateDescriptor instead')
const UserPrivate$json = {
  '1': 'UserPrivate',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'mail', '3': 2, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'firstname', '3': 3, '4': 1, '5': 9, '10': 'firstname'},
    {'1': 'lastname', '3': 4, '4': 1, '5': 9, '10': 'lastname'},
    {'1': 'phone', '3': 5, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '10': 'phone'},
    {'1': 'passwordEncrypted', '3': 6, '4': 1, '5': 9, '10': 'password'},
    {'1': 'firmId', '3': 7, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'permissions', '3': 8, '4': 1, '5': 11, '6': '.weebi.user.permissions.UserPermissions', '10': 'permissions'},
    {'1': 'lastSignIn', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastSignIn'},
    {'1': 'lastUpdatedByuserId', '3': 10, '4': 1, '5': 9, '10': 'lastUpdatedByuserId'},
    {'1': 'lastUpdateTimestampUTC', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdateTimestampUTC'},
    {'1': 'creationDateUTC', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'creationDateUTC'},
    {'1': 'mustChangePassword', '3': 13, '4': 1, '5': 8, '10': 'mustChangePassword'},
    {'1': 'emailVerificationSent', '3': 14, '4': 1, '5': 8, '10': 'emailVerificationSent'},
    {'1': 'subscriberId', '3': 15, '4': 1, '5': 9, '10': 'subscriberId'},
    {'1': 'othersAttributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.user.UserPrivate.OthersAttributesEntry', '10': 'othersAttributes'},
  ],
  '3': [UserPrivate_OthersAttributesEntry$json],
  '9': [
    {'1': 16, '2': 99},
  ],
};

@$core.Deprecated('Use userPrivateDescriptor instead')
const UserPrivate_OthersAttributesEntry$json = {
  '1': 'OthersAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `UserPrivate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userPrivateDescriptor = $convert.base64Decode(
    'CgtVc2VyUHJpdmF0ZRIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBISCgRtYWlsGAIgASgJUgRtYW'
    'lsEhwKCWZpcnN0bmFtZRgDIAEoCVIJZmlyc3RuYW1lEhoKCGxhc3RuYW1lGAQgASgJUghsYXN0'
    'bmFtZRIvCgVwaG9uZRgFIAEoCzIZLndlZWJpLmNvbW1vbi5waG9uZS5QaG9uZVIFcGhvbmUSIw'
    'oRcGFzc3dvcmRFbmNyeXB0ZWQYBiABKAlSCHBhc3N3b3JkEhYKBmZpcm1JZBgHIAEoCVIGZmly'
    'bUlkEkkKC3Blcm1pc3Npb25zGAggASgLMicud2VlYmkudXNlci5wZXJtaXNzaW9ucy5Vc2VyUG'
    'VybWlzc2lvbnNSC3Blcm1pc3Npb25zEjoKCmxhc3RTaWduSW4YCSABKAsyGi5nb29nbGUucHJv'
    'dG9idWYuVGltZXN0YW1wUgpsYXN0U2lnbkluEjAKE2xhc3RVcGRhdGVkQnl1c2VySWQYCiABKA'
    'lSE2xhc3RVcGRhdGVkQnl1c2VySWQSUgoWbGFzdFVwZGF0ZVRpbWVzdGFtcFVUQxgLIAEoCzIa'
    'Lmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFmxhc3RVcGRhdGVUaW1lc3RhbXBVVEMSRAoPY3'
    'JlYXRpb25EYXRlVVRDGAwgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIPY3JlYXRp'
    'b25EYXRlVVRDEi4KEm11c3RDaGFuZ2VQYXNzd29yZBgNIAEoCFISbXVzdENoYW5nZVBhc3N3b3'
    'JkEjQKFWVtYWlsVmVyaWZpY2F0aW9uU2VudBgOIAEoCFIVZW1haWxWZXJpZmljYXRpb25TZW50'
    'EiIKDHN1YnNjcmliZXJJZBgPIAEoCVIMc3Vic2NyaWJlcklkElkKEG90aGVyc0F0dHJpYnV0ZX'
    'MYYyADKAsyLS53ZWViaS51c2VyLlVzZXJQcml2YXRlLk90aGVyc0F0dHJpYnV0ZXNFbnRyeVIQ'
    'b3RoZXJzQXR0cmlidXRlcxpDChVPdGhlcnNBdHRyaWJ1dGVzRW50cnkSEAoDa2V5GAEgASgJUg'
    'NrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AUoECBAQYw==');

@$core.Deprecated('Use signUpRequestDescriptor instead')
const SignUpRequest$json = {
  '1': 'SignUpRequest',
  '2': [
    {'1': 'mail', '3': 1, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'firstname', '3': 2, '4': 1, '5': 9, '10': 'firstname'},
    {'1': 'lastname', '3': 3, '4': 1, '5': 9, '10': 'lastname'},
    {'1': 'password', '3': 4, '4': 1, '5': 9, '10': 'pwd'},
  ],
};

/// Descriptor for `SignUpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpRequestDescriptor = $convert.base64Decode(
    'Cg1TaWduVXBSZXF1ZXN0EhIKBG1haWwYASABKAlSBG1haWwSHAoJZmlyc3RuYW1lGAIgASgJUg'
    'lmaXJzdG5hbWUSGgoIbGFzdG5hbWUYAyABKAlSCGxhc3RuYW1lEhUKCHBhc3N3b3JkGAQgASgJ'
    'UgNwd2Q=');

@$core.Deprecated('Use signUpResponseDescriptor instead')
const SignUpResponse$json = {
  '1': 'SignUpResponse',
  '2': [
    {'1': 'statusResponse', '3': 1, '4': 1, '5': 11, '6': '.google.retail.common.StatusResponse', '10': 'statusResponse'},
    {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'string'},
  ],
};

/// Descriptor for `SignUpResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpResponseDescriptor = $convert.base64Decode(
    'Cg5TaWduVXBSZXNwb25zZRJMCg5zdGF0dXNSZXNwb25zZRgBIAEoCzIkLmdvb2dsZS5yZXRhaW'
    'wuY29tbW9uLlN0YXR1c1Jlc3BvbnNlUg5zdGF0dXNSZXNwb25zZRIWCgZ1c2VySWQYAiABKAlS'
    'BnN0cmluZw==');

@$core.Deprecated('Use pendingUserRequestDescriptor instead')
const PendingUserRequest$json = {
  '1': 'PendingUserRequest',
  '2': [
    {'1': 'mail', '3': 1, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'firstname', '3': 2, '4': 1, '5': 9, '10': 'firstname'},
    {'1': 'lastname', '3': 3, '4': 1, '5': 9, '10': 'lastname'},
    {'1': 'permissions', '3': 4, '4': 1, '5': 11, '6': '.weebi.user.permissions.UserPermissions', '10': 'permissions'},
    {'1': 'phone', '3': 5, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '10': 'phone'},
    {'1': 'password', '3': 6, '4': 1, '5': 9, '10': 'password'},
    {'1': 'othersAttributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.user.PendingUserRequest.OthersAttributesEntry', '10': 'othersAttributes'},
  ],
  '3': [PendingUserRequest_OthersAttributesEntry$json],
  '9': [
    {'1': 7, '2': 99},
  ],
};

@$core.Deprecated('Use pendingUserRequestDescriptor instead')
const PendingUserRequest_OthersAttributesEntry$json = {
  '1': 'OthersAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PendingUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pendingUserRequestDescriptor = $convert.base64Decode(
    'ChJQZW5kaW5nVXNlclJlcXVlc3QSEgoEbWFpbBgBIAEoCVIEbWFpbBIcCglmaXJzdG5hbWUYAi'
    'ABKAlSCWZpcnN0bmFtZRIaCghsYXN0bmFtZRgDIAEoCVIIbGFzdG5hbWUSSQoLcGVybWlzc2lv'
    'bnMYBCABKAsyJy53ZWViaS51c2VyLnBlcm1pc3Npb25zLlVzZXJQZXJtaXNzaW9uc1ILcGVybW'
    'lzc2lvbnMSLwoFcGhvbmUYBSABKAsyGS53ZWViaS5jb21tb24ucGhvbmUuUGhvbmVSBXBob25l'
    'EhoKCHBhc3N3b3JkGAYgASgJUghwYXNzd29yZBJgChBvdGhlcnNBdHRyaWJ1dGVzGGMgAygLMj'
    'Qud2VlYmkudXNlci5QZW5kaW5nVXNlclJlcXVlc3QuT3RoZXJzQXR0cmlidXRlc0VudHJ5UhBv'
    'dGhlcnNBdHRyaWJ1dGVzGkMKFU90aGVyc0F0dHJpYnV0ZXNFbnRyeRIQCgNrZXkYASABKAlSA2'
    'tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBSgQIBxBj');

@$core.Deprecated('Use pendingUserResponseDescriptor instead')
const PendingUserResponse$json = {
  '1': 'PendingUserResponse',
  '2': [
    {'1': 'statusResponse', '3': 1, '4': 1, '5': 11, '6': '.google.retail.common.StatusResponse', '10': 'statusResponse'},
    {'1': 'userPublic', '3': 2, '4': 1, '5': 11, '6': '.weebi.user.UserPublic', '10': 'userPublic'},
  ],
};

/// Descriptor for `PendingUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pendingUserResponseDescriptor = $convert.base64Decode(
    'ChNQZW5kaW5nVXNlclJlc3BvbnNlEkwKDnN0YXR1c1Jlc3BvbnNlGAEgASgLMiQuZ29vZ2xlLn'
    'JldGFpbC5jb21tb24uU3RhdHVzUmVzcG9uc2VSDnN0YXR1c1Jlc3BvbnNlEjYKCnVzZXJQdWJs'
    'aWMYAiABKAsyFi53ZWViaS51c2VyLlVzZXJQdWJsaWNSCnVzZXJQdWJsaWM=');

