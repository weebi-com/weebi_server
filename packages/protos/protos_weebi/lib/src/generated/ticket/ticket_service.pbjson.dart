//
//  Generated code. Do not modify.
//  source: ticket/ticket_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use readAllTicketsRequestDescriptor instead')
const ReadAllTicketsRequest$json = {
  '1': 'ReadAllTicketsRequest',
  '2': [
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 2, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'boutiqueId', '3': 3, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'lastFetchTimestampUTC', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastFetchTimestampUTC'},
  ],
};

/// Descriptor for `ReadAllTicketsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readAllTicketsRequestDescriptor = $convert.base64Decode(
    'ChVSZWFkQWxsVGlja2V0c1JlcXVlc3QSFgoGZmlybUlkGAEgASgJUgZmaXJtSWQSGAoHY2hhaW'
    '5JZBgCIAEoCVIHY2hhaW5JZBIeCgpib3V0aXF1ZUlkGAMgASgJUgpib3V0aXF1ZUlkElAKFWxh'
    'c3RGZXRjaFRpbWVzdGFtcFVUQxgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFW'
    'xhc3RGZXRjaFRpbWVzdGFtcFVUQw==');

@$core.Deprecated('Use findTicketRequestDescriptor instead')
const FindTicketRequest$json = {
  '1': 'FindTicketRequest',
  '2': [
    {'1': 'ticketChainId', '3': 1, '4': 1, '5': 9, '10': 'ticketChainId'},
    {'1': 'ticketBoutiqueId', '3': 2, '4': 1, '5': 9, '10': 'ticketBoutiqueId'},
    {'1': 'creationDate', '3': 3, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'ticketUserId', '3': 4, '4': 1, '5': 9, '10': 'ticketUserId'},
    {'1': 'nonUniqueId', '3': 5, '4': 1, '5': 5, '10': 'nonUniqueId'},
  ],
};

/// Descriptor for `FindTicketRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findTicketRequestDescriptor = $convert.base64Decode(
    'ChFGaW5kVGlja2V0UmVxdWVzdBIkCg10aWNrZXRDaGFpbklkGAEgASgJUg10aWNrZXRDaGFpbk'
    'lkEioKEHRpY2tldEJvdXRpcXVlSWQYAiABKAlSEHRpY2tldEJvdXRpcXVlSWQSIgoMY3JlYXRp'
    'b25EYXRlGAMgASgJUgxjcmVhdGlvbkRhdGUSIgoMdGlja2V0VXNlcklkGAQgASgJUgx0aWNrZX'
    'RVc2VySWQSIAoLbm9uVW5pcXVlSWQYBSABKAVSC25vblVuaXF1ZUlk');

@$core.Deprecated('Use ticketRequestDescriptor instead')
const TicketRequest$json = {
  '1': 'TicketRequest',
  '2': [
    {'1': 'ticket', '3': 1, '4': 1, '5': 11, '6': '.weebi.ticket.TicketPb', '10': 'ticket'},
  ],
};

/// Descriptor for `TicketRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketRequestDescriptor = $convert.base64Decode(
    'Cg1UaWNrZXRSZXF1ZXN0Ei4KBnRpY2tldBgBIAEoCzIWLndlZWJpLnRpY2tldC5UaWNrZXRQYl'
    'IGdGlja2V0');

@$core.Deprecated('Use ticketsRequestDescriptor instead')
const TicketsRequest$json = {
  '1': 'TicketsRequest',
  '2': [
    {'1': 'tickets', '3': 1, '4': 3, '5': 11, '6': '.weebi.ticket.TicketPb', '10': 'tickets'},
  ],
};

/// Descriptor for `TicketsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketsRequestDescriptor = $convert.base64Decode(
    'Cg5UaWNrZXRzUmVxdWVzdBIwCgd0aWNrZXRzGAEgAygLMhYud2VlYmkudGlja2V0LlRpY2tldF'
    'BiUgd0aWNrZXRz');

@$core.Deprecated('Use ticketsResponseDescriptor instead')
const TicketsResponse$json = {
  '1': 'TicketsResponse',
  '2': [
    {'1': 'tickets', '3': 1, '4': 3, '5': 11, '6': '.weebi.ticket.TicketPb', '10': 'tickets'},
  ],
};

/// Descriptor for `TicketsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketsResponseDescriptor = $convert.base64Decode(
    'Cg9UaWNrZXRzUmVzcG9uc2USMAoHdGlja2V0cxgBIAMoCzIWLndlZWJpLnRpY2tldC5UaWNrZX'
    'RQYlIHdGlja2V0cw==');

