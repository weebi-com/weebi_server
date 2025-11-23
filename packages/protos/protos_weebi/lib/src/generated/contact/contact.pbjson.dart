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
    {'1': 'contactId', '3': 2, '4': 1, '5': 5, '10': 'contactId'},
    {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'firmId', '3': 4, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 5, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'creationDate', '3': 6, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'lastTouchTimestampUTC', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastTouchTimestampUTC'},
    {'1': 'additional_attributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.contact.ContactMongo.AdditionalAttributesEntry', '10': 'additional_attributes'},
  ],
  '3': [ContactMongo_AdditionalAttributesEntry$json],
  '9': [
    {'1': 8, '2': 99},
  ],
};

@$core.Deprecated('Use contactMongoDescriptor instead')
const ContactMongo_AdditionalAttributesEntry$json = {
  '1': 'AdditionalAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ContactMongo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactMongoDescriptor = $convert.base64Decode(
    'CgxDb250YWN0TW9uZ28SMgoHY29udGFjdBgBIAEoCzIYLndlZWJpLmNvbnRhY3QuQ29udGFjdF'
    'BiUgdjb250YWN0EhwKCWNvbnRhY3RJZBgCIAEoBVIJY29udGFjdElkEhYKBnVzZXJJZBgDIAEo'
    'CVIGdXNlcklkEhYKBmZpcm1JZBgEIAEoCVIGZmlybUlkEhgKB2NoYWluSWQYBSABKAlSB2NoYW'
    'luSWQSIgoMY3JlYXRpb25EYXRlGAYgASgJUgxjcmVhdGlvbkRhdGUSUAoVbGFzdFRvdWNoVGlt'
    'ZXN0YW1wVVRDGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIVbGFzdFRvdWNoVG'
    'ltZXN0YW1wVVRDEmsKFWFkZGl0aW9uYWxfYXR0cmlidXRlcxhjIAMoCzI1LndlZWJpLmNvbnRh'
    'Y3QuQ29udGFjdE1vbmdvLkFkZGl0aW9uYWxBdHRyaWJ1dGVzRW50cnlSFWFkZGl0aW9uYWxfYX'
    'R0cmlidXRlcxpHChlBZGRpdGlvbmFsQXR0cmlidXRlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5'
    'EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAFKBAgIEGM=');

@$core.Deprecated('Use contactPbDescriptor instead')
const ContactPb$json = {
  '1': 'ContactPb',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'creationDate', '3': 2, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'updateDate', '3': 3, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'statusUpdateDate', '3': 4, '4': 1, '5': 9, '10': 'statusUpdateDate'},
    {'1': 'status', '3': 5, '4': 1, '5': 8, '10': 'status'},
    {'1': 'firstName', '3': 6, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'lastName', '3': 7, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'mail', '3': 8, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'phone', '3': 9, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '10': 'phone'},
    {'1': 'addressFull', '3': 10, '4': 1, '5': 11, '6': '.weebi.common.address.Address', '10': 'addressFull'},
    {'1': 'overdraft', '3': 11, '4': 1, '5': 3, '10': 'overdraft'},
    {'1': 'tags', '3': 12, '4': 3, '5': 9, '10': 'categories'},
    {'1': 'isClient', '3': 13, '4': 1, '5': 8, '10': 'isClient'},
    {'1': 'isSupplier', '3': 14, '4': 1, '5': 8, '10': 'isSupplier'},
    {'1': 'othersAttributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.contact.ContactPb.OthersAttributesEntry', '10': 'othersAttributes'},
  ],
  '3': [ContactPb_OthersAttributesEntry$json],
  '9': [
    {'1': 15, '2': 99},
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
    'CglDb250YWN0UGISDgoCaWQYASABKAVSAmlkEiIKDGNyZWF0aW9uRGF0ZRgCIAEoCVIMY3JlYX'
    'Rpb25EYXRlEh4KCnVwZGF0ZURhdGUYAyABKAlSCnVwZGF0ZURhdGUSKgoQc3RhdHVzVXBkYXRl'
    'RGF0ZRgEIAEoCVIQc3RhdHVzVXBkYXRlRGF0ZRIWCgZzdGF0dXMYBSABKAhSBnN0YXR1cxIcCg'
    'lmaXJzdE5hbWUYBiABKAlSCWZpcnN0TmFtZRIaCghsYXN0TmFtZRgHIAEoCVIIbGFzdE5hbWUS'
    'EgoEbWFpbBgIIAEoCVIEbWFpbBIvCgVwaG9uZRgJIAEoCzIZLndlZWJpLmNvbW1vbi5waG9uZS'
    '5QaG9uZVIFcGhvbmUSPwoLYWRkcmVzc0Z1bGwYCiABKAsyHS53ZWViaS5jb21tb24uYWRkcmVz'
    'cy5BZGRyZXNzUgthZGRyZXNzRnVsbBIcCglvdmVyZHJhZnQYCyABKANSCW92ZXJkcmFmdBIYCg'
    'R0YWdzGAwgAygJUgpjYXRlZ29yaWVzEhoKCGlzQ2xpZW50GA0gASgIUghpc0NsaWVudBIeCgpp'
    'c1N1cHBsaWVyGA4gASgIUgppc1N1cHBsaWVyEloKEG90aGVyc0F0dHJpYnV0ZXMYYyADKAsyLi'
    '53ZWViaS5jb250YWN0LkNvbnRhY3RQYi5PdGhlcnNBdHRyaWJ1dGVzRW50cnlSEG90aGVyc0F0'
    'dHJpYnV0ZXMaQwoVT3RoZXJzQXR0cmlidXRlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBX'
    'ZhbHVlGAIgASgJUgV2YWx1ZToCOAFKBAgPEGM=');

