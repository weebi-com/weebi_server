//
//  Generated code. Do not modify.
//  source: ticket/ticket.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use ticketMongoDescriptor instead')
const TicketMongo$json = {
  '1': 'TicketMongo',
  '2': [
    {'1': 'ticket', '3': 1, '4': 1, '5': 11, '6': '.weebi.ticket.TicketPb', '10': 'ticket'},
    {'1': 'ticketNonUniqueId', '3': 2, '4': 1, '5': 5, '10': 'ticketNonUniqueId'},
    {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'boutiqueId', '3': 4, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'firmId', '3': 5, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 6, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'creationDate', '3': 7, '4': 1, '5': 9, '10': 'creationDate'},
  ],
};

/// Descriptor for `TicketMongo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketMongoDescriptor = $convert.base64Decode(
    'CgtUaWNrZXRNb25nbxIuCgZ0aWNrZXQYASABKAsyFi53ZWViaS50aWNrZXQuVGlja2V0UGJSBn'
    'RpY2tldBIsChF0aWNrZXROb25VbmlxdWVJZBgCIAEoBVIRdGlja2V0Tm9uVW5pcXVlSWQSFgoG'
    'dXNlcklkGAMgASgJUgZ1c2VySWQSHgoKYm91dGlxdWVJZBgEIAEoCVIKYm91dGlxdWVJZBIWCg'
    'ZmaXJtSWQYBSABKAlSBmZpcm1JZBIYCgdjaGFpbklkGAYgASgJUgdjaGFpbklkEiIKDGNyZWF0'
    'aW9uRGF0ZRgHIAEoCVIMY3JlYXRpb25EYXRl');

@$core.Deprecated('Use ticketPbDescriptor instead')
const TicketPb$json = {
  '1': 'TicketPb',
  '2': [
    {'1': 'ticketNonUniqueId', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'counterfoil', '3': 2, '4': 1, '5': 11, '6': '.weebi.ticket.Counterfoil', '10': 'counterfoil'},
    {'1': 'date', '3': 3, '4': 1, '5': 9, '10': 'date'},
    {'1': 'statusUpdateDate', '3': 4, '4': 1, '5': 9, '10': 'statusUpdateDate'},
    {'1': 'status', '3': 5, '4': 1, '5': 8, '10': 'status'},
    {'1': 'items', '3': 6, '4': 3, '5': 11, '6': '.weebi.ticket.ItemCartPb', '10': 'items'},
    {'1': 'ticketType', '3': 7, '4': 1, '5': 14, '6': '.weebi.ticket_type.TicketTypePb', '10': 'ticketType'},
    {'1': 'paymentType', '3': 8, '4': 1, '5': 14, '6': '.weebi.ticket.TicketPb.PaymentTypePb', '10': 'paymentType'},
    {'1': 'contactId', '3': 9, '4': 1, '5': 5, '10': 'contactId'},
    {'1': 'taxe', '3': 10, '4': 1, '5': 11, '6': '.weebi.ticket.TaxPb', '10': 'taxe'},
    {'1': 'promo', '3': 11, '4': 1, '5': 1, '10': 'promo'},
    {'1': 'received', '3': 12, '4': 1, '5': 1, '10': 'received'},
    {'1': 'discountAmount', '3': 13, '4': 1, '5': 1, '10': 'discountAmount'},
    {'1': 'comment', '3': 14, '4': 1, '5': 9, '10': 'comment'},
  ],
  '4': [TicketPb_PaymentTypePb$json],
};

@$core.Deprecated('Use ticketPbDescriptor instead')
const TicketPb_PaymentTypePb$json = {
  '1': 'PaymentTypePb',
  '2': [
    {'1': 'unknown', '2': 0},
    {'1': 'cash', '2': 1},
    {'1': 'nope', '2': 2},
    {'1': 'mobileMoney', '2': 3},
    {'1': 'cheque', '2': 4},
    {'1': 'creditCard', '2': 5},
    {'1': 'goods', '2': 6},
  ],
};

/// Descriptor for `TicketPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketPbDescriptor = $convert.base64Decode(
    'CghUaWNrZXRQYhIdChF0aWNrZXROb25VbmlxdWVJZBgBIAEoBVICaWQSOwoLY291bnRlcmZvaW'
    'wYAiABKAsyGS53ZWViaS50aWNrZXQuQ291bnRlcmZvaWxSC2NvdW50ZXJmb2lsEhIKBGRhdGUY'
    'AyABKAlSBGRhdGUSKgoQc3RhdHVzVXBkYXRlRGF0ZRgEIAEoCVIQc3RhdHVzVXBkYXRlRGF0ZR'
    'IWCgZzdGF0dXMYBSABKAhSBnN0YXR1cxIuCgVpdGVtcxgGIAMoCzIYLndlZWJpLnRpY2tldC5J'
    'dGVtQ2FydFBiUgVpdGVtcxI/Cgp0aWNrZXRUeXBlGAcgASgOMh8ud2VlYmkudGlja2V0X3R5cG'
    'UuVGlja2V0VHlwZVBiUgp0aWNrZXRUeXBlEkYKC3BheW1lbnRUeXBlGAggASgOMiQud2VlYmku'
    'dGlja2V0LlRpY2tldFBiLlBheW1lbnRUeXBlUGJSC3BheW1lbnRUeXBlEhwKCWNvbnRhY3RJZB'
    'gJIAEoBVIJY29udGFjdElkEicKBHRheGUYCiABKAsyEy53ZWViaS50aWNrZXQuVGF4UGJSBHRh'
    'eGUSFAoFcHJvbW8YCyABKAFSBXByb21vEhoKCHJlY2VpdmVkGAwgASgBUghyZWNlaXZlZBImCg'
    '5kaXNjb3VudEFtb3VudBgNIAEoAVIOZGlzY291bnRBbW91bnQSGAoHY29tbWVudBgOIAEoCVIH'
    'Y29tbWVudCJoCg1QYXltZW50VHlwZVBiEgsKB3Vua25vd24QABIICgRjYXNoEAESCAoEbm9wZR'
    'ACEg8KC21vYmlsZU1vbmV5EAMSCgoGY2hlcXVlEAQSDgoKY3JlZGl0Q2FyZBAFEgkKBWdvb2Rz'
    'EAY=');

@$core.Deprecated('Use counterfoilDescriptor instead')
const Counterfoil$json = {
  '1': 'Counterfoil',
  '2': [
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'firmName', '3': 2, '4': 1, '5': 9, '10': 'firmName'},
    {'1': 'chainId', '3': 3, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'chainName', '3': 4, '4': 1, '5': 9, '10': 'chainName'},
    {'1': 'deviceOid', '3': 5, '4': 1, '5': 9, '10': 'deviceOid'},
    {'1': 'deviceName', '3': 6, '4': 1, '5': 9, '10': 'deviceName'},
    {'1': 'boutiqueId', '3': 7, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'boutiqueName', '3': 8, '4': 1, '5': 9, '10': 'boutiqueName'},
    {'1': 'userId', '3': 9, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'userName', '3': 10, '4': 1, '5': 9, '10': 'userName'},
  ],
};

/// Descriptor for `Counterfoil`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List counterfoilDescriptor = $convert.base64Decode(
    'CgtDb3VudGVyZm9pbBIWCgZmaXJtSWQYASABKAlSBmZpcm1JZBIaCghmaXJtTmFtZRgCIAEoCV'
    'IIZmlybU5hbWUSGAoHY2hhaW5JZBgDIAEoCVIHY2hhaW5JZBIcCgljaGFpbk5hbWUYBCABKAlS'
    'CWNoYWluTmFtZRIcCglkZXZpY2VPaWQYBSABKAlSCWRldmljZU9pZBIeCgpkZXZpY2VOYW1lGA'
    'YgASgJUgpkZXZpY2VOYW1lEh4KCmJvdXRpcXVlSWQYByABKAlSCmJvdXRpcXVlSWQSIgoMYm91'
    'dGlxdWVOYW1lGAggASgJUgxib3V0aXF1ZU5hbWUSFgoGdXNlcklkGAkgASgJUgZ1c2VySWQSGg'
    'oIdXNlck5hbWUYCiABKAlSCHVzZXJOYW1l');

@$core.Deprecated('Use taxPbDescriptor instead')
const TaxPb$json = {
  '1': 'TaxPb',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'percentage', '3': 3, '4': 1, '5': 1, '10': 'percentage'},
  ],
};

/// Descriptor for `TaxPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taxPbDescriptor = $convert.base64Decode(
    'CgVUYXhQYhIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIeCgpwZXJjZW50YW'
    'dlGAMgASgBUgpwZXJjZW50YWdl');

@$core.Deprecated('Use proxyArticleWorthPbDescriptor instead')
const ProxyArticleWorthPb$json = {
  '1': 'ProxyArticleWorthPb',
  '2': [
    {'1': 'calibreId', '3': 1, '4': 1, '5': 5, '10': 'calibreId'},
    {'1': 'articleId', '3': 2, '4': 1, '5': 5, '10': 'articleId'},
    {'1': 'id', '3': 3, '4': 1, '5': 5, '10': 'id'},
    {'1': 'status', '3': 4, '4': 1, '5': 8, '10': 'status'},
    {'1': 'proxyCalibreId', '3': 5, '4': 1, '5': 5, '10': 'proxyCalibreId'},
    {'1': 'proxyArticleId', '3': 6, '4': 1, '5': 5, '10': 'proxyArticleId'},
    {'1': 'minimumUnitPerBasket', '3': 7, '4': 1, '5': 1, '10': 'minimumUnitPerBasket'},
    {'1': 'articleWeight', '3': 8, '4': 1, '5': 1, '10': 'articleWeight'},
    {'1': 'price', '3': 9, '4': 1, '5': 1, '10': 'price'},
    {'1': 'cost', '3': 10, '4': 1, '5': 1, '10': 'cost'},
  ],
};

/// Descriptor for `ProxyArticleWorthPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proxyArticleWorthPbDescriptor = $convert.base64Decode(
    'ChNQcm94eUFydGljbGVXb3J0aFBiEhwKCWNhbGlicmVJZBgBIAEoBVIJY2FsaWJyZUlkEhwKCW'
    'FydGljbGVJZBgCIAEoBVIJYXJ0aWNsZUlkEg4KAmlkGAMgASgFUgJpZBIWCgZzdGF0dXMYBCAB'
    'KAhSBnN0YXR1cxImCg5wcm94eUNhbGlicmVJZBgFIAEoBVIOcHJveHlDYWxpYnJlSWQSJgoOcH'
    'JveHlBcnRpY2xlSWQYBiABKAVSDnByb3h5QXJ0aWNsZUlkEjIKFG1pbmltdW1Vbml0UGVyQmFz'
    'a2V0GAcgASgBUhRtaW5pbXVtVW5pdFBlckJhc2tldBIkCg1hcnRpY2xlV2VpZ2h0GAggASgBUg'
    '1hcnRpY2xlV2VpZ2h0EhQKBXByaWNlGAkgASgBUgVwcmljZRISCgRjb3N0GAogASgBUgRjb3N0');

@$core.Deprecated('Use itemCartPbDescriptor instead')
const ItemCartPb$json = {
  '1': 'ItemCartPb',
  '2': [
    {'1': 'articleRetail', '3': 1, '4': 1, '5': 11, '6': '.weebi.article.ArticleRetailOnTicketPb', '10': 'articleRetail'},
    {'1': 'articleBasket', '3': 2, '4': 1, '5': 11, '6': '.weebi.article.ArticleBasketOnTicketPb', '10': 'articleBasket'},
    {'1': 'quantity', '3': 3, '4': 1, '5': 1, '10': 'quantity'},
    {'1': 'proxies_worth', '3': 4, '4': 3, '5': 11, '6': '.weebi.ticket.ProxyArticleWorthPb', '10': 'proxiesWorth'},
    {'1': 'inventoryAbsoluteQt', '3': 5, '4': 1, '5': 1, '10': 'inventoryAbsoluteQt'},
  ],
};

/// Descriptor for `ItemCartPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List itemCartPbDescriptor = $convert.base64Decode(
    'CgpJdGVtQ2FydFBiEkwKDWFydGljbGVSZXRhaWwYASABKAsyJi53ZWViaS5hcnRpY2xlLkFydG'
    'ljbGVSZXRhaWxPblRpY2tldFBiUg1hcnRpY2xlUmV0YWlsEkwKDWFydGljbGVCYXNrZXQYAiAB'
    'KAsyJi53ZWViaS5hcnRpY2xlLkFydGljbGVCYXNrZXRPblRpY2tldFBiUg1hcnRpY2xlQmFza2'
    'V0EhoKCHF1YW50aXR5GAMgASgBUghxdWFudGl0eRJGCg1wcm94aWVzX3dvcnRoGAQgAygLMiEu'
    'd2VlYmkudGlja2V0LlByb3h5QXJ0aWNsZVdvcnRoUGJSDHByb3hpZXNXb3J0aBIwChNpbnZlbn'
    'RvcnlBYnNvbHV0ZVF0GAUgASgBUhNpbnZlbnRvcnlBYnNvbHV0ZVF0');

