//
//  Generated code. Do not modify.
//  source: contact.proto
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
    {'1': 'contactId', '3': 1, '4': 1, '5': 5, '10': 'contactId'},
    {'1': 'contact', '3': 2, '4': 1, '5': 11, '6': '.weebi.contact.ContactPb', '10': 'contact'},
    {'1': 'chainOid', '3': 3, '4': 1, '5': 9, '10': 'chainOid'},
    {'1': 'firmOid', '3': 4, '4': 1, '5': 9, '10': 'firmOid'},
    {'1': 'userOid', '3': 5, '4': 1, '5': 9, '10': 'userOid'},
  ],
};

/// Descriptor for `ContactMongo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactMongoDescriptor = $convert.base64Decode(
    'CgxDb250YWN0TW9uZ28SHAoJY29udGFjdElkGAEgASgFUgljb250YWN0SWQSMgoHY29udGFjdB'
    'gCIAEoCzIYLndlZWJpLmNvbnRhY3QuQ29udGFjdFBiUgdjb250YWN0EhoKCGNoYWluT2lkGAMg'
    'ASgJUghjaGFpbk9pZBIYCgdmaXJtT2lkGAQgASgJUgdmaXJtT2lkEhgKB3VzZXJPaWQYBSABKA'
    'lSB3VzZXJPaWQ=');

@$core.Deprecated('Use contactPbDescriptor instead')
const ContactPb$json = {
  '1': 'ContactPb',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'dateCreation', '3': 2, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'dateUpdate', '3': 3, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'dateStatus', '3': 4, '4': 1, '5': 9, '10': 'statusUpdateDate'},
    {'1': 'status', '3': 5, '4': 1, '5': 8, '10': 'status'},
    {'1': 'firstName', '3': 6, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'lastName', '3': 7, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'mail', '3': 8, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'phone', '3': 9, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '10': 'phone'},
    {'1': 'address', '3': 10, '4': 1, '5': 11, '6': '.weebi.common.address.Address', '10': 'addressFull'},
    {'1': 'overdraft', '3': 11, '4': 1, '5': 5, '10': 'overdraft'},
    {'1': 'tags', '3': 12, '4': 3, '5': 9, '10': 'categories'},
    {'1': 'other_attributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.contact.ContactPb.OtherAttributesEntry', '10': 'other_attributes'},
  ],
  '3': [ContactPb_OtherAttributesEntry$json],
  '9': [
    {'1': 13, '2': 99},
  ],
};

@$core.Deprecated('Use contactPbDescriptor instead')
const ContactPb_OtherAttributesEntry$json = {
  '1': 'OtherAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ContactPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactPbDescriptor = $convert.base64Decode(
    'CglDb250YWN0UGISDgoCaWQYASABKAVSAmlkEiIKDGRhdGVDcmVhdGlvbhgCIAEoCVIMY3JlYX'
    'Rpb25EYXRlEh4KCmRhdGVVcGRhdGUYAyABKAlSCnVwZGF0ZURhdGUSJAoKZGF0ZVN0YXR1cxgE'
    'IAEoCVIQc3RhdHVzVXBkYXRlRGF0ZRIWCgZzdGF0dXMYBSABKAhSBnN0YXR1cxIcCglmaXJzdE'
    '5hbWUYBiABKAlSCWZpcnN0TmFtZRIaCghsYXN0TmFtZRgHIAEoCVIIbGFzdE5hbWUSEgoEbWFp'
    'bBgIIAEoCVIEbWFpbBIvCgVwaG9uZRgJIAEoCzIZLndlZWJpLmNvbW1vbi5waG9uZS5QaG9uZV'
    'IFcGhvbmUSOwoHYWRkcmVzcxgKIAEoCzIdLndlZWJpLmNvbW1vbi5hZGRyZXNzLkFkZHJlc3NS'
    'C2FkZHJlc3NGdWxsEhwKCW92ZXJkcmFmdBgLIAEoBVIJb3ZlcmRyYWZ0EhgKBHRhZ3MYDCADKA'
    'lSCmNhdGVnb3JpZXMSWQoQb3RoZXJfYXR0cmlidXRlcxhjIAMoCzItLndlZWJpLmNvbnRhY3Qu'
    'Q29udGFjdFBiLk90aGVyQXR0cmlidXRlc0VudHJ5UhBvdGhlcl9hdHRyaWJ1dGVzGkIKFE90aG'
    'VyQXR0cmlidXRlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1'
    'ZToCOAFKBAgNEGM=');

