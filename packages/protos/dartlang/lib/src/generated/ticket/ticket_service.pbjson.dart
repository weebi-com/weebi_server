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

@$core.Deprecated('Use findTicketRequestDescriptor instead')
const FindTicketRequest$json = {
  '1': 'FindTicketRequest',
  '2': [
    {'1': 'counterfoil', '3': 1, '4': 1, '5': 11, '6': '.weebi.ticket.Counterfoil', '10': 'counterfoil'},
    {'1': 'ticketId', '3': 2, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `FindTicketRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findTicketRequestDescriptor = $convert.base64Decode(
    'ChFGaW5kVGlja2V0UmVxdWVzdBI7Cgtjb3VudGVyZm9pbBgBIAEoCzIZLndlZWJpLnRpY2tldC'
    '5Db3VudGVyZm9pbFILY291bnRlcmZvaWwSFAoIdGlja2V0SWQYAiABKAVSAmlk');

@$core.Deprecated('Use ticketRequestDescriptor instead')
const TicketRequest$json = {
  '1': 'TicketRequest',
  '2': [
    {'1': 'ticket', '3': 2, '4': 1, '5': 11, '6': '.weebi.ticket.TicketPb', '10': 'ticket'},
  ],
};

/// Descriptor for `TicketRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketRequestDescriptor = $convert.base64Decode(
    'Cg1UaWNrZXRSZXF1ZXN0Ei4KBnRpY2tldBgCIAEoCzIWLndlZWJpLnRpY2tldC5UaWNrZXRQYl'
    'IGdGlja2V0');

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

