//
//  Generated code. Do not modify.
//  source: contact_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use findContactRequestDescriptor instead')
const FindContactRequest$json = {
  '1': 'FindContactRequest',
  '2': [
    {'1': 'chainOid', '3': 1, '4': 1, '5': 9, '10': 'chainOid'},
    {'1': 'firstName', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'lastName', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'mail', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'mail', '17': true},
    {'1': 'phone', '3': 5, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '9': 1, '10': 'phone', '17': true},
    {'1': 'address', '3': 6, '4': 1, '5': 11, '6': '.weebi.common.address.Address', '9': 2, '10': 'addressFull', '17': true},
  ],
  '8': [
    {'1': '_mail'},
    {'1': '_phone'},
    {'1': '_address'},
  ],
};

/// Descriptor for `FindContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findContactRequestDescriptor = $convert.base64Decode(
    'ChJGaW5kQ29udGFjdFJlcXVlc3QSGgoIY2hhaW5PaWQYASABKAlSCGNoYWluT2lkEhwKCWZpcn'
    'N0TmFtZRgCIAEoCVIJZmlyc3ROYW1lEhoKCGxhc3ROYW1lGAMgASgJUghsYXN0TmFtZRIXCgRt'
    'YWlsGAQgASgJSABSBG1haWyIAQESNAoFcGhvbmUYBSABKAsyGS53ZWViaS5jb21tb24ucGhvbm'
    'UuUGhvbmVIAVIFcGhvbmWIAQESQAoHYWRkcmVzcxgGIAEoCzIdLndlZWJpLmNvbW1vbi5hZGRy'
    'ZXNzLkFkZHJlc3NIAlILYWRkcmVzc0Z1bGyIAQFCBwoFX21haWxCCAoGX3Bob25lQgoKCF9hZG'
    'RyZXNz');

@$core.Deprecated('Use readAllContactsRequestDescriptor instead')
const ReadAllContactsRequest$json = {
  '1': 'ReadAllContactsRequest',
  '2': [
    {'1': 'chainOid', '3': 1, '4': 1, '5': 9, '10': 'chainOid'},
  ],
};

/// Descriptor for `ReadAllContactsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readAllContactsRequestDescriptor = $convert.base64Decode(
    'ChZSZWFkQWxsQ29udGFjdHNSZXF1ZXN0EhoKCGNoYWluT2lkGAEgASgJUghjaGFpbk9pZA==');

@$core.Deprecated('Use contactRequestDescriptor instead')
const ContactRequest$json = {
  '1': 'ContactRequest',
  '2': [
    {'1': 'chainOid', '3': 1, '4': 1, '5': 9, '10': 'chainOid'},
    {'1': 'contact', '3': 2, '4': 1, '5': 11, '6': '.weebi.contact.ContactPb', '10': 'contact'},
  ],
};

/// Descriptor for `ContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactRequestDescriptor = $convert.base64Decode(
    'Cg5Db250YWN0UmVxdWVzdBIaCghjaGFpbk9pZBgBIAEoCVIIY2hhaW5PaWQSMgoHY29udGFjdB'
    'gCIAEoCzIYLndlZWJpLmNvbnRhY3QuQ29udGFjdFBiUgdjb250YWN0');

@$core.Deprecated('Use contactsResponseDescriptor instead')
const ContactsResponse$json = {
  '1': 'ContactsResponse',
  '2': [
    {'1': 'contacts', '3': 1, '4': 3, '5': 11, '6': '.weebi.contact.ContactPb', '10': 'contacts'},
  ],
};

/// Descriptor for `ContactsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactsResponseDescriptor = $convert.base64Decode(
    'ChBDb250YWN0c1Jlc3BvbnNlEjQKCGNvbnRhY3RzGAEgAygLMhgud2VlYmkuY29udGFjdC5Db2'
    '50YWN0UGJSCGNvbnRhY3Rz');

