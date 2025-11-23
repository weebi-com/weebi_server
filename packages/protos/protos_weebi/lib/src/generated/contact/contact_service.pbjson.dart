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

@$core.Deprecated('Use readContactRequestDescriptor instead')
const ReadContactRequest$json = {
  '1': 'ReadContactRequest',
  '2': [
    {'1': 'contactChainId', '3': 1, '4': 1, '5': 9, '10': 'contactChainId'},
    {'1': 'contactId', '3': 3, '4': 1, '5': 5, '10': 'contactId'},
    {'1': 'firstName', '3': 4, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'lastName', '3': 5, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'mail', '3': 6, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'phone', '3': 7, '4': 1, '5': 11, '6': '.weebi.common.phone.Phone', '10': 'phone'},
    {'1': 'address', '3': 8, '4': 1, '5': 11, '6': '.weebi.common.address.Address', '10': 'addressFull'},
  ],
};

/// Descriptor for `ReadContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readContactRequestDescriptor = $convert.base64Decode(
    'ChJSZWFkQ29udGFjdFJlcXVlc3QSJgoOY29udGFjdENoYWluSWQYASABKAlSDmNvbnRhY3RDaG'
    'FpbklkEhwKCWNvbnRhY3RJZBgDIAEoBVIJY29udGFjdElkEhwKCWZpcnN0TmFtZRgEIAEoCVIJ'
    'Zmlyc3ROYW1lEhoKCGxhc3ROYW1lGAUgASgJUghsYXN0TmFtZRISCgRtYWlsGAYgASgJUgRtYW'
    'lsEi8KBXBob25lGAcgASgLMhkud2VlYmkuY29tbW9uLnBob25lLlBob25lUgVwaG9uZRI7Cgdh'
    'ZGRyZXNzGAggASgLMh0ud2VlYmkuY29tbW9uLmFkZHJlc3MuQWRkcmVzc1ILYWRkcmVzc0Z1bG'
    'w=');

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

@$core.Deprecated('Use readContactsIdsRequestDescriptor instead')
const ReadContactsIdsRequest$json = {
  '1': 'ReadContactsIdsRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
  ],
};

/// Descriptor for `ReadContactsIdsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readContactsIdsRequestDescriptor = $convert.base64Decode(
    'ChZSZWFkQ29udGFjdHNJZHNSZXF1ZXN0EhgKB2NoYWluSWQYASABKAlSB2NoYWluSWQ=');

@$core.Deprecated('Use contactsIdsResponseDescriptor instead')
const ContactsIdsResponse$json = {
  '1': 'ContactsIdsResponse',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 5, '10': 'ids'},
  ],
};

/// Descriptor for `ContactsIdsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactsIdsResponseDescriptor = $convert.base64Decode(
    'ChNDb250YWN0c0lkc1Jlc3BvbnNlEhAKA2lkcxgBIAMoBVIDaWRz');

