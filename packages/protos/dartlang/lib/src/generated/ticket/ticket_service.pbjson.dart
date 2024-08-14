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
    {'1': 'ticketChainOid', '3': 1, '4': 1, '5': 9, '10': 'ticketChainOid'},
    {'1': 'ticketUserOid', '3': 2, '4': 1, '5': 9, '10': 'ticketUserOid'},
    {'1': 'ticketNonUniqueId', '3': 3, '4': 1, '5': 5, '10': 'ticketNonUniqueId'},
  ],
};

/// Descriptor for `FindTicketRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findTicketRequestDescriptor = $convert.base64Decode(
    'ChFGaW5kVGlja2V0UmVxdWVzdBImCg50aWNrZXRDaGFpbk9pZBgBIAEoCVIOdGlja2V0Q2hhaW'
    '5PaWQSJAoNdGlja2V0VXNlck9pZBgCIAEoCVINdGlja2V0VXNlck9pZBIsChF0aWNrZXROb25V'
    'bmlxdWVJZBgDIAEoBVIRdGlja2V0Tm9uVW5pcXVlSWQ=');

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

