//
//  Generated code. Do not modify.
//  source: contact/contact.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use contactMongoDescriptor instead')
const ContactMongo$json = {
  '1': 'ContactMongo',
  '2': [
    {'1': 'contact', '3': 1, '4': 1, '5': 11, '6': '.weebi.contact.ContactPb', '10': 'contact'},
    {'1': 'contactNonUniqueId', '3': 2, '4': 1, '5': 5, '10': 'contactNonUniqueId'},
    {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'firmId', '3': 4, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 5, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'creationDate', '3': 6, '4': 1, '5': 9, '10': 'creationDate'},
  ],
};

/// Descriptor for `ContactMongo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactMongoDescriptor = $convert.base64Decode(
    'CgxDb250YWN0TW9uZ28SMgoHY29udGFjdBgBIAEoCzIYLndlZWJpLmNvbnRhY3QuQ29udGFjdF'
    'BiUgdjb250YWN0Ei4KEmNvbnRhY3ROb25VbmlxdWVJZBgCIAEoBVISY29udGFjdE5vblVuaXF1'
    'ZUlkEhYKBnVzZXJJZBgDIAEoCVIGdXNlcklkEhYKBmZpcm1JZBgEIAEoCVIGZmlybUlkEhgKB2'
    'NoYWluSWQYBSABKAlSB2NoYWluSWQSIgoMY3JlYXRpb25EYXRlGAYgASgJUgxjcmVhdGlvbkRh'
    'dGU=');

@$core.Deprecated('Use contactPbDescriptor instead')
const ContactPb$json = {
  '1': 'ContactPb',
  '2': [
    {'1': 'contactNonUniqueId', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'creationDate', '3': 2, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'updateDate', '3': 3, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'statusUpdateDate', '3': 4, '4': 1, '5': 9, '10': 'statusUpdateDate'},
    {'1': 'status', '3': 5, '4': 1, '5': 8, '10': 'status'},
    {'1': 'firstName', '3': 6, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'lastName', '3': 7, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'mail', '3': 8, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'phone', '3': 9, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '10': 'phone'},
    {'1': 'addressFull', '3': 10, '4': 1, '5': 11, '6': '.weebi.common.address.Address', '10': 'addressFull'},
    {'1': 'overdraft', '3': 11, '4': 1, '5': 5, '10': 'overdraft'},
    {'1': 'tags', '3': 12, '4': 3, '5': 9, '10': 'categories'},
    {'1': 'othersAttributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.contact.ContactPb.OthersAttributesEntry', '10': 'othersAttributes'},
  ],
  '3': [ContactPb_OthersAttributesEntry$json],
  '9': [
    {'1': 13, '2': 99},
  ],
};

@$core.Deprecated('Use contactPbDescriptor instead')
const ContactPb_OthersAttributesEntry$json = {
  '1': 'OthersAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ContactPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactPbDescriptor = $convert.base64Decode(
    'CglDb250YWN0UGISHgoSY29udGFjdE5vblVuaXF1ZUlkGAEgASgFUgJpZBIiCgxjcmVhdGlvbk'
    'RhdGUYAiABKAlSDGNyZWF0aW9uRGF0ZRIeCgp1cGRhdGVEYXRlGAMgASgJUgp1cGRhdGVEYXRl'
    'EioKEHN0YXR1c1VwZGF0ZURhdGUYBCABKAlSEHN0YXR1c1VwZGF0ZURhdGUSFgoGc3RhdHVzGA'
    'UgASgIUgZzdGF0dXMSHAoJZmlyc3ROYW1lGAYgASgJUglmaXJzdE5hbWUSGgoIbGFzdE5hbWUY'
    'ByABKAlSCGxhc3ROYW1lEhIKBG1haWwYCCABKAlSBG1haWwSLwoFcGhvbmUYCSABKAsyGS53ZW'
    'ViaS5jb21tb24ucGhvbmUuUGhvbmVSBXBob25lEj8KC2FkZHJlc3NGdWxsGAogASgLMh0ud2Vl'
    'YmkuY29tbW9uLmFkZHJlc3MuQWRkcmVzc1ILYWRkcmVzc0Z1bGwSHAoJb3ZlcmRyYWZ0GAsgAS'
    'gFUglvdmVyZHJhZnQSGAoEdGFncxgMIAMoCVIKY2F0ZWdvcmllcxJaChBvdGhlcnNBdHRyaWJ1'
    'dGVzGGMgAygLMi4ud2VlYmkuY29udGFjdC5Db250YWN0UGIuT3RoZXJzQXR0cmlidXRlc0VudH'
    'J5UhBvdGhlcnNBdHRyaWJ1dGVzGkMKFU90aGVyc0F0dHJpYnV0ZXNFbnRyeRIQCgNrZXkYASAB'
    'KAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBSgQIDRBj');

