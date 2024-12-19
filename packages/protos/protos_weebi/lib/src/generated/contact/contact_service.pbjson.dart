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
    {'1': 'contactId', '3': 3, '4': 1, '5': 5, '10': 'contactId'},
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
    'FpbklkEhwKCWNvbnRhY3RJZBgDIAEoBVIJY29udGFjdElkEiEKCWZpcnN0TmFtZRgEIAEoCUgA'
    'UglmaXJzdE5hbWWIAQESHwoIbGFzdE5hbWUYBSABKAlIAVIIbGFzdE5hbWWIAQESFwoEbWFpbB'
    'gGIAEoCUgCUgRtYWlsiAEBEjQKBXBob25lGAcgASgLMhkud2VlYmkuY29tbW9uLnBob25lLlBo'
    'b25lSANSBXBob25liAEBEkAKB2FkZHJlc3MYCCABKAsyHS53ZWViaS5jb21tb24uYWRkcmVzcy'
    '5BZGRyZXNzSARSC2FkZHJlc3NGdWxsiAEBQgwKCl9maXJzdE5hbWVCCwoJX2xhc3ROYW1lQgcK'
    'BV9tYWlsQggKBl9waG9uZUIKCghfYWRkcmVzcw==');

@$core.Deprecated('Use readAllContactsRequestDescriptor instead')
const ReadAllContactsRequest$json = {
  '1': 'ReadAllContactsRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'lastFetchTimestampUTC', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastFetchTimestampUTC'},
  ],
};

/// Descriptor for `ReadAllContactsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readAllContactsRequestDescriptor = $convert.base64Decode(
    'ChZSZWFkQWxsQ29udGFjdHNSZXF1ZXN0EhgKB2NoYWluSWQYASABKAlSB2NoYWluSWQSUAoVbG'
    'FzdEZldGNoVGltZXN0YW1wVVRDGAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIV'
    'bGFzdEZldGNoVGltZXN0YW1wVVRD');

@$core.Deprecated('Use contactRequestDescriptor instead')
const ContactRequest$json = {
  '1': 'ContactRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'contact', '3': 2, '4': 1, '5': 11, '6': '.weebi.contact.ContactPb', '10': 'contact'},
  ],
};

/// Descriptor for `ContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactRequestDescriptor = $convert.base64Decode(
    'Cg5Db250YWN0UmVxdWVzdBIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklkEjIKB2NvbnRhY3QYAi'
    'ABKAsyGC53ZWViaS5jb250YWN0LkNvbnRhY3RQYlIHY29udGFjdA==');

@$core.Deprecated('Use contactsRequestDescriptor instead')
const ContactsRequest$json = {
  '1': 'ContactsRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'contacts', '3': 2, '4': 3, '5': 11, '6': '.weebi.contact.ContactPb', '10': 'contacts'},
  ],
};

/// Descriptor for `ContactsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactsRequestDescriptor = $convert.base64Decode(
    'Cg9Db250YWN0c1JlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZBI0Cghjb250YWN0cx'
    'gCIAMoCzIYLndlZWJpLmNvbnRhY3QuQ29udGFjdFBiUghjb250YWN0cw==');

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

