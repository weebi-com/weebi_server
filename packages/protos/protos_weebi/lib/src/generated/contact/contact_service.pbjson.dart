//
//  Generated code. Do not modify.
//  source: contact/contact_service.proto
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
    {'1': 'contactChainId', '3': 1, '4': 1, '5': 9, '10': 'contactChainId'},
    {'1': 'contactUserId', '3': 2, '4': 1, '5': 9, '10': 'contactUserId'},
    {'1': 'contactNonUniqueId', '3': 3, '4': 1, '5': 5, '10': 'contactNonUniqueId'},
    {'1': 'firstName', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'firstName', '17': true},
    {'1': 'lastName', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'lastName', '17': true},
    {'1': 'mail', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'mail', '17': true},
    {'1': 'phone', '3': 7, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '9': 3, '10': 'phone', '17': true},
    {'1': 'address', '3': 8, '4': 1, '5': 11, '6': '.weebi.common.address.Address', '9': 4, '10': 'addressFull', '17': true},
  ],
  '8': [
    {'1': '_firstName'},
    {'1': '_lastName'},
    {'1': '_mail'},
    {'1': '_phone'},
    {'1': '_address'},
  ],
};

/// Descriptor for `FindContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findContactRequestDescriptor = $convert.base64Decode(
    'ChJGaW5kQ29udGFjdFJlcXVlc3QSJgoOY29udGFjdENoYWluSWQYASABKAlSDmNvbnRhY3RDaG'
    'FpbklkEiQKDWNvbnRhY3RVc2VySWQYAiABKAlSDWNvbnRhY3RVc2VySWQSLgoSY29udGFjdE5v'
    'blVuaXF1ZUlkGAMgASgFUhJjb250YWN0Tm9uVW5pcXVlSWQSIQoJZmlyc3ROYW1lGAQgASgJSA'
    'BSCWZpcnN0TmFtZYgBARIfCghsYXN0TmFtZRgFIAEoCUgBUghsYXN0TmFtZYgBARIXCgRtYWls'
    'GAYgASgJSAJSBG1haWyIAQESNAoFcGhvbmUYByABKAsyGS53ZWViaS5jb21tb24ucGhvbmUuUG'
    'hvbmVIA1IFcGhvbmWIAQESQAoHYWRkcmVzcxgIIAEoCzIdLndlZWJpLmNvbW1vbi5hZGRyZXNz'
    'LkFkZHJlc3NIBFILYWRkcmVzc0Z1bGyIAQFCDAoKX2ZpcnN0TmFtZUILCglfbGFzdE5hbWVCBw'
    'oFX21haWxCCAoGX3Bob25lQgoKCF9hZGRyZXNz');

@$core.Deprecated('Use readAllContactsRequestDescriptor instead')
const ReadAllContactsRequest$json = {
  '1': 'ReadAllContactsRequest',
  '2': [
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 2, '4': 1, '5': 9, '10': 'chainId'},
  ],
};

/// Descriptor for `ReadAllContactsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readAllContactsRequestDescriptor = $convert.base64Decode(
    'ChZSZWFkQWxsQ29udGFjdHNSZXF1ZXN0EhYKBmZpcm1JZBgBIAEoCVIGZmlybUlkEhgKB2NoYW'
    'luSWQYAiABKAlSB2NoYWluSWQ=');

@$core.Deprecated('Use contactRequestDescriptor instead')
const ContactRequest$json = {
  '1': 'ContactRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'contactUserId', '3': 2, '4': 1, '5': 9, '10': 'contactUserId'},
    {'1': 'contact', '3': 3, '4': 1, '5': 11, '6': '.weebi.contact.ContactPb', '10': 'contact'},
  ],
};

/// Descriptor for `ContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactRequestDescriptor = $convert.base64Decode(
    'Cg5Db250YWN0UmVxdWVzdBIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklkEiQKDWNvbnRhY3RVc2'
    'VySWQYAiABKAlSDWNvbnRhY3RVc2VySWQSMgoHY29udGFjdBgDIAEoCzIYLndlZWJpLmNvbnRh'
    'Y3QuQ29udGFjdFBiUgdjb250YWN0');

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

