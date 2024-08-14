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
    {'1': 'contactChainOid', '3': 1, '4': 1, '5': 9, '10': 'contactChainOid'},
    {'1': 'contactUserOid', '3': 2, '4': 1, '5': 9, '10': 'contactUserOid'},
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
    'ChJGaW5kQ29udGFjdFJlcXVlc3QSKAoPY29udGFjdENoYWluT2lkGAEgASgJUg9jb250YWN0Q2'
    'hhaW5PaWQSJgoOY29udGFjdFVzZXJPaWQYAiABKAlSDmNvbnRhY3RVc2VyT2lkEi4KEmNvbnRh'
    'Y3ROb25VbmlxdWVJZBgDIAEoBVISY29udGFjdE5vblVuaXF1ZUlkEiEKCWZpcnN0TmFtZRgEIA'
    'EoCUgAUglmaXJzdE5hbWWIAQESHwoIbGFzdE5hbWUYBSABKAlIAVIIbGFzdE5hbWWIAQESFwoE'
    'bWFpbBgGIAEoCUgCUgRtYWlsiAEBEjQKBXBob25lGAcgASgLMhkud2VlYmkuY29tbW9uLnBob2'
    '5lLlBob25lSANSBXBob25liAEBEkAKB2FkZHJlc3MYCCABKAsyHS53ZWViaS5jb21tb24uYWRk'
    'cmVzcy5BZGRyZXNzSARSC2FkZHJlc3NGdWxsiAEBQgwKCl9maXJzdE5hbWVCCwoJX2xhc3ROYW'
    '1lQgcKBV9tYWlsQggKBl9waG9uZUIKCghfYWRkcmVzcw==');

@$core.Deprecated('Use readAllContactsRequestDescriptor instead')
const ReadAllContactsRequest$json = {
  '1': 'ReadAllContactsRequest',
  '2': [
    {'1': 'firmOid', '3': 1, '4': 1, '5': 9, '10': 'firmOid'},
    {'1': 'chainOid', '3': 2, '4': 1, '5': 9, '10': 'chainOid'},
  ],
};

/// Descriptor for `ReadAllContactsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readAllContactsRequestDescriptor = $convert.base64Decode(
    'ChZSZWFkQWxsQ29udGFjdHNSZXF1ZXN0EhgKB2Zpcm1PaWQYASABKAlSB2Zpcm1PaWQSGgoIY2'
    'hhaW5PaWQYAiABKAlSCGNoYWluT2lk');

@$core.Deprecated('Use contactRequestDescriptor instead')
const ContactRequest$json = {
  '1': 'ContactRequest',
  '2': [
    {'1': 'chainOid', '3': 1, '4': 1, '5': 9, '10': 'chainOid'},
    {'1': 'contactUserOid', '3': 2, '4': 1, '5': 9, '10': 'contactUserOid'},
    {'1': 'contact', '3': 3, '4': 1, '5': 11, '6': '.weebi.contact.ContactPb', '10': 'contact'},
  ],
};

/// Descriptor for `ContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactRequestDescriptor = $convert.base64Decode(
    'Cg5Db250YWN0UmVxdWVzdBIaCghjaGFpbk9pZBgBIAEoCVIIY2hhaW5PaWQSJgoOY29udGFjdF'
    'VzZXJPaWQYAiABKAlSDmNvbnRhY3RVc2VyT2lkEjIKB2NvbnRhY3QYAyABKAsyGC53ZWViaS5j'
    'b250YWN0LkNvbnRhY3RQYlIHY29udGFjdA==');

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

