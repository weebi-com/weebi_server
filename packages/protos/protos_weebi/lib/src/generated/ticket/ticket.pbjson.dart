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
    {'1': 'nonUniqueId', '3': 2, '4': 1, '5': 5, '10': 'nonUniqueId'},
    {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'boutiqueId', '3': 4, '4': 1, '5': 9, '10': 'boutiqueId'},
    {'1': 'firmId', '3': 5, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 6, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'creationDate', '3': 7, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'lastTouchTimestampUTC', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastTouchTimestampUTC'},
    {'1': 'isDeleted', '3': 9, '4': 1, '5': 8, '10': 'isDeleted'},
    {'1': 'contactId', '3': 10, '4': 1, '5': 5, '10': 'contactId'},
    {'1': 'additional_attributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.ticket.TicketMongo.AdditionalAttributesEntry', '10': 'additional_attributes'},
  ],
  '3': [TicketMongo_AdditionalAttributesEntry$json],
  '9': [
    {'1': 11, '2': 99},
  ],
};

@$core.Deprecated('Use ticketMongoDescriptor instead')
const TicketMongo_AdditionalAttributesEntry$json = {
  '1': 'AdditionalAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `TicketMongo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketMongoDescriptor = $convert.base64Decode(
    'CgtUaWNrZXRNb25nbxIuCgZ0aWNrZXQYASABKAsyFi53ZWViaS50aWNrZXQuVGlja2V0UGJSBn'
    'RpY2tldBIgCgtub25VbmlxdWVJZBgCIAEoBVILbm9uVW5pcXVlSWQSFgoGdXNlcklkGAMgASgJ'
    'UgZ1c2VySWQSHgoKYm91dGlxdWVJZBgEIAEoCVIKYm91dGlxdWVJZBIWCgZmaXJtSWQYBSABKA'
    'lSBmZpcm1JZBIYCgdjaGFpbklkGAYgASgJUgdjaGFpbklkEiIKDGNyZWF0aW9uRGF0ZRgHIAEo'
    'CVIMY3JlYXRpb25EYXRlElAKFWxhc3RUb3VjaFRpbWVzdGFtcFVUQxgIIAEoCzIaLmdvb2dsZS'
    '5wcm90b2J1Zi5UaW1lc3RhbXBSFWxhc3RUb3VjaFRpbWVzdGFtcFVUQxIcCglpc0RlbGV0ZWQY'
    'CSABKAhSCWlzRGVsZXRlZBIcCgljb250YWN0SWQYCiABKAVSCWNvbnRhY3RJZBJpChVhZGRpdG'
    'lvbmFsX2F0dHJpYnV0ZXMYYyADKAsyMy53ZWViaS50aWNrZXQuVGlja2V0TW9uZ28uQWRkaXRp'
    'b25hbEF0dHJpYnV0ZXNFbnRyeVIVYWRkaXRpb25hbF9hdHRyaWJ1dGVzGkcKGUFkZGl0aW9uYW'
    'xBdHRyaWJ1dGVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVl'
    'OgI4AUoECAsQYw==');

@$core.Deprecated('Use ticketSellTotalsPbDescriptor instead')
const TicketSellTotalsPb$json = {
  '1': 'TicketSellTotalsPb',
  '2': [
    {'1': 'items_only', '3': 1, '4': 1, '5': 1, '8': {}, '10': 'itemsOnly'},
    {'1': 'promo_val', '3': 2, '4': 1, '5': 1, '8': {}, '10': 'promoVal'},
    {'1': 'markdowns_val', '3': 3, '4': 1, '5': 1, '8': {}, '10': 'markdownsVal'},
    {'1': 'markdowns_included_tax_excluded', '3': 4, '4': 1, '5': 1, '8': {}, '10': 'markdownsIncludedTaxExcluded'},
    {'1': 'taxes_value', '3': 5, '4': 1, '5': 1, '8': {}, '10': 'taxesValue'},
    {'1': 'markdowns_and_tax_included', '3': 6, '4': 1, '5': 1, '8': {}, '10': 'markdownsAndTaxIncluded'},
    {'1': 'change', '3': 7, '4': 1, '5': 1, '8': {}, '10': 'change'},
  ],
};

/// Descriptor for `TicketSellTotalsPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketSellTotalsPbDescriptor = $convert.base64Decode(
    'ChJUaWNrZXRTZWxsVG90YWxzUGISPgoKaXRlbXNfb25seRgBIAEoAUIfirUYG2l0ZW1zLnN1bS'
    'hpLCBpLnRvdGFsX3ByaWNlKVIJaXRlbXNPbmx5EkEKCXByb21vX3ZhbBgCIAEoAUIkirUYIHJv'
    'dW5kNChpdGVtc19vbmx5ICogcHJvbW8gLyAxMDApUghwcm9tb1ZhbBJDCg1tYXJrZG93bnNfdm'
    'FsGAMgASgBQh6KtRgacHJvbW9fdmFsICsgZGlzY291bnRBbW91bnRSDG1hcmtkb3duc1ZhbBJl'
    'Ch9tYXJrZG93bnNfaW5jbHVkZWRfdGF4X2V4Y2x1ZGVkGAQgASgBQh6KtRgaaXRlbXNfb25seS'
    'AtIG1hcmtkb3duc192YWxSHG1hcmtkb3duc0luY2x1ZGVkVGF4RXhjbHVkZWQShAEKC3RheGVz'
    'X3ZhbHVlGAUgASgBQmOKtRhfdGF4ZS5wZXJjZW50YWdlID4gMC4wID8gcm91bmQ0KG1hcmtkb3'
    'duc19pbmNsdWRlZF90YXhfZXhjbHVkZWQgKiAodGF4ZS5wZXJjZW50YWdlIC8gMTAwKSkgOiAw'
    'LjBSCnRheGVzVmFsdWUSbgoabWFya2Rvd25zX2FuZF90YXhfaW5jbHVkZWQYBiABKAFCMYq1GC'
    '1tYXJrZG93bnNfaW5jbHVkZWRfdGF4X2V4Y2x1ZGVkICsgdGF4ZXNfdmFsdWVSF21hcmtkb3du'
    'c0FuZFRheEluY2x1ZGVkEl4KBmNoYW5nZRgHIAEoAUJGirUYQnRpY2tldFR5cGUgPT0gJ3NlbG'
    'wnID8gcmVjZWl2ZWQgLSBtYXJrZG93bnNfYW5kX3RheF9pbmNsdWRlZCA6IDAuMFIGY2hhbmdl');

@$core.Deprecated('Use ticketSpendTotalsPbDescriptor instead')
const TicketSpendTotalsPb$json = {
  '1': 'TicketSpendTotalsPb',
  '2': [
    {'1': 'items_only', '3': 1, '4': 1, '5': 1, '8': {}, '10': 'itemsOnly'},
    {'1': 'promo_val', '3': 2, '4': 1, '5': 1, '8': {}, '10': 'promoVal'},
    {'1': 'markdowns_val', '3': 3, '4': 1, '5': 1, '8': {}, '10': 'markdownsVal'},
    {'1': 'markdowns_included_tax_excluded', '3': 4, '4': 1, '5': 1, '8': {}, '10': 'markdownsIncludedTaxExcluded'},
    {'1': 'taxes_value', '3': 5, '4': 1, '5': 1, '8': {}, '10': 'taxesValue'},
    {'1': 'markdowns_and_tax_included', '3': 6, '4': 1, '5': 1, '8': {}, '10': 'markdownsAndTaxIncluded'},
    {'1': 'change', '3': 7, '4': 1, '5': 1, '8': {}, '10': 'change'},
  ],
};

/// Descriptor for `TicketSpendTotalsPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketSpendTotalsPbDescriptor = $convert.base64Decode(
    'ChNUaWNrZXRTcGVuZFRvdGFsc1BiEj0KCml0ZW1zX29ubHkYASABKAFCHoq1GBppdGVtcy5zdW'
    '0oaSwgaS50b3RhbF9jb3N0KVIJaXRlbXNPbmx5EkEKCXByb21vX3ZhbBgCIAEoAUIkirUYIHJv'
    'dW5kNChpdGVtc19vbmx5ICogcHJvbW8gLyAxMDApUghwcm9tb1ZhbBJDCg1tYXJrZG93bnNfdm'
    'FsGAMgASgBQh6KtRgacHJvbW9fdmFsICsgZGlzY291bnRBbW91bnRSDG1hcmtkb3duc1ZhbBJl'
    'Ch9tYXJrZG93bnNfaW5jbHVkZWRfdGF4X2V4Y2x1ZGVkGAQgASgBQh6KtRgaaXRlbXNfb25seS'
    'AtIG1hcmtkb3duc192YWxSHG1hcmtkb3duc0luY2x1ZGVkVGF4RXhjbHVkZWQShAEKC3RheGVz'
    'X3ZhbHVlGAUgASgBQmOKtRhfdGF4ZS5wZXJjZW50YWdlID4gMC4wID8gcm91bmQ0KG1hcmtkb3'
    'duc19pbmNsdWRlZF90YXhfZXhjbHVkZWQgKiAodGF4ZS5wZXJjZW50YWdlIC8gMTAwKSkgOiAw'
    'LjBSCnRheGVzVmFsdWUSbgoabWFya2Rvd25zX2FuZF90YXhfaW5jbHVkZWQYBiABKAFCMYq1GC'
    '1tYXJrZG93bnNfaW5jbHVkZWRfdGF4X2V4Y2x1ZGVkICsgdGF4ZXNfdmFsdWVSF21hcmtkb3du'
    'c0FuZFRheEluY2x1ZGVkEl8KBmNoYW5nZRgHIAEoAUJHirUYQ3RpY2tldFR5cGUgPT0gJ3NwZW'
    '5kJyA/IHJlY2VpdmVkIC0gbWFya2Rvd25zX2FuZF90YXhfaW5jbHVkZWQgOiAwLjBSBmNoYW5n'
    'ZQ==');

@$core.Deprecated('Use ticketCoverTotalPbDescriptor instead')
const TicketCoverTotalPb$json = {
  '1': 'TicketCoverTotalPb',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 1, '8': {}, '10': 'total'},
  ],
};

/// Descriptor for `TicketCoverTotalPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketCoverTotalPbDescriptor = $convert.base64Decode(
    'ChJUaWNrZXRDb3ZlclRvdGFsUGISIgoFdG90YWwYASABKAFCDIq1GAhyZWNlaXZlZFIFdG90YW'
    'w=');

@$core.Deprecated('Use ticketPbDescriptor instead')
const TicketPb$json = {
  '1': 'TicketPb',
  '2': [
    {'1': 'nonUniqueId', '3': 1, '4': 1, '5': 5, '10': 'id'},
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
    {'1': 'creationDate', '3': 15, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'contactFirstName', '3': 16, '4': 1, '5': 9, '10': 'contactFirstName'},
    {'1': 'contactLastName', '3': 17, '4': 1, '5': 9, '10': 'contactLastName'},
    {'1': 'contactPhone', '3': 18, '4': 1, '5': 9, '10': 'contactPhone'},
    {'1': 'contactMail', '3': 19, '4': 1, '5': 9, '10': 'contactMail'},
    {'1': 'currency', '3': 20, '4': 1, '5': 9, '9': 1, '10': 'currency', '17': true},
    {'1': 'snapshot_secondary_currency', '3': 21, '4': 1, '5': 9, '9': 2, '10': 'snapshotSecondaryCurrency', '17': true},
    {'1': 'snapshot_local_per_secondary', '3': 22, '4': 1, '5': 1, '9': 3, '10': 'snapshotLocalPerSecondary', '17': true},
    {'1': 'sell_totals', '3': 23, '4': 1, '5': 11, '6': '.weebi.ticket.TicketSellTotalsPb', '9': 0, '10': 'sellTotals'},
    {'1': 'spend_totals', '3': 24, '4': 1, '5': 11, '6': '.weebi.ticket.TicketSpendTotalsPb', '9': 0, '10': 'spendTotals'},
    {'1': 'cover_totals', '3': 25, '4': 1, '5': 11, '6': '.weebi.ticket.TicketCoverTotalPb', '9': 0, '10': 'coverTotals'},
    {'1': 'replaced_ticket_id', '3': 26, '4': 1, '5': 9, '9': 4, '10': 'replacedTicketId', '17': true},
  ],
  '4': [TicketPb_PaymentTypePb$json],
  '8': [
    {'1': 'totals'},
    {'1': '_currency'},
    {'1': '_snapshot_secondary_currency'},
    {'1': '_snapshot_local_per_secondary'},
    {'1': '_replaced_ticket_id'},
  ],
  '9': [
    {'1': 27, '2': 99},
  ],
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
    'CghUaWNrZXRQYhIXCgtub25VbmlxdWVJZBgBIAEoBVICaWQSOwoLY291bnRlcmZvaWwYAiABKA'
    'syGS53ZWViaS50aWNrZXQuQ291bnRlcmZvaWxSC2NvdW50ZXJmb2lsEhIKBGRhdGUYAyABKAlS'
    'BGRhdGUSKgoQc3RhdHVzVXBkYXRlRGF0ZRgEIAEoCVIQc3RhdHVzVXBkYXRlRGF0ZRIWCgZzdG'
    'F0dXMYBSABKAhSBnN0YXR1cxIuCgVpdGVtcxgGIAMoCzIYLndlZWJpLnRpY2tldC5JdGVtQ2Fy'
    'dFBiUgVpdGVtcxI/Cgp0aWNrZXRUeXBlGAcgASgOMh8ud2VlYmkudGlja2V0X3R5cGUuVGlja2'
    'V0VHlwZVBiUgp0aWNrZXRUeXBlEkYKC3BheW1lbnRUeXBlGAggASgOMiQud2VlYmkudGlja2V0'
    'LlRpY2tldFBiLlBheW1lbnRUeXBlUGJSC3BheW1lbnRUeXBlEhwKCWNvbnRhY3RJZBgJIAEoBV'
    'IJY29udGFjdElkEicKBHRheGUYCiABKAsyEy53ZWViaS50aWNrZXQuVGF4UGJSBHRheGUSFAoF'
    'cHJvbW8YCyABKAFSBXByb21vEhoKCHJlY2VpdmVkGAwgASgBUghyZWNlaXZlZBImCg5kaXNjb3'
    'VudEFtb3VudBgNIAEoAVIOZGlzY291bnRBbW91bnQSGAoHY29tbWVudBgOIAEoCVIHY29tbWVu'
    'dBIiCgxjcmVhdGlvbkRhdGUYDyABKAlSDGNyZWF0aW9uRGF0ZRIqChBjb250YWN0Rmlyc3ROYW'
    '1lGBAgASgJUhBjb250YWN0Rmlyc3ROYW1lEigKD2NvbnRhY3RMYXN0TmFtZRgRIAEoCVIPY29u'
    'dGFjdExhc3ROYW1lEiIKDGNvbnRhY3RQaG9uZRgSIAEoCVIMY29udGFjdFBob25lEiAKC2Nvbn'
    'RhY3RNYWlsGBMgASgJUgtjb250YWN0TWFpbBIfCghjdXJyZW5jeRgUIAEoCUgBUghjdXJyZW5j'
    'eYgBARJDChtzbmFwc2hvdF9zZWNvbmRhcnlfY3VycmVuY3kYFSABKAlIAlIZc25hcHNob3RTZW'
    'NvbmRhcnlDdXJyZW5jeYgBARJEChxzbmFwc2hvdF9sb2NhbF9wZXJfc2Vjb25kYXJ5GBYgASgB'
    'SANSGXNuYXBzaG90TG9jYWxQZXJTZWNvbmRhcnmIAQESQwoLc2VsbF90b3RhbHMYFyABKAsyIC'
    '53ZWViaS50aWNrZXQuVGlja2V0U2VsbFRvdGFsc1BiSABSCnNlbGxUb3RhbHMSRgoMc3BlbmRf'
    'dG90YWxzGBggASgLMiEud2VlYmkudGlja2V0LlRpY2tldFNwZW5kVG90YWxzUGJIAFILc3Blbm'
    'RUb3RhbHMSRQoMY292ZXJfdG90YWxzGBkgASgLMiAud2VlYmkudGlja2V0LlRpY2tldENvdmVy'
    'VG90YWxQYkgAUgtjb3ZlclRvdGFscxIxChJyZXBsYWNlZF90aWNrZXRfaWQYGiABKAlIBFIQcm'
    'VwbGFjZWRUaWNrZXRJZIgBASJoCg1QYXltZW50VHlwZVBiEgsKB3Vua25vd24QABIICgRjYXNo'
    'EAESCAoEbm9wZRACEg8KC21vYmlsZU1vbmV5EAMSCgoGY2hlcXVlEAQSDgoKY3JlZGl0Q2FyZB'
    'AFEgkKBWdvb2RzEAZCCAoGdG90YWxzQgsKCV9jdXJyZW5jeUIeChxfc25hcHNob3Rfc2Vjb25k'
    'YXJ5X2N1cnJlbmN5Qh8KHV9zbmFwc2hvdF9sb2NhbF9wZXJfc2Vjb25kYXJ5QhUKE19yZXBsYW'
    'NlZF90aWNrZXRfaWRKBAgbEGM=');

@$core.Deprecated('Use counterfoilDescriptor instead')
const Counterfoil$json = {
  '1': 'Counterfoil',
  '2': [
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'firmName', '3': 2, '4': 1, '5': 9, '10': 'firmName'},
    {'1': 'chainId', '3': 3, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'chainName', '3': 4, '4': 1, '5': 9, '10': 'chainName'},
    {'1': 'deviceId', '3': 5, '4': 1, '5': 9, '10': 'deviceId'},
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
    'CWNoYWluTmFtZRIaCghkZXZpY2VJZBgFIAEoCVIIZGV2aWNlSWQSHgoKZGV2aWNlTmFtZRgGIA'
    'EoCVIKZGV2aWNlTmFtZRIeCgpib3V0aXF1ZUlkGAcgASgJUgpib3V0aXF1ZUlkEiIKDGJvdXRp'
    'cXVlTmFtZRgIIAEoCVIMYm91dGlxdWVOYW1lEhYKBnVzZXJJZBgJIAEoCVIGdXNlcklkEhoKCH'
    'VzZXJOYW1lGAogASgJUgh1c2VyTmFtZQ==');

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
    {'1': 'articleUncountable', '3': 3, '4': 1, '5': 11, '6': '.weebi.article.ArticleUncountableOnTicketPb', '10': 'articleUncountable'},
    {'1': 'quantity', '3': 4, '4': 1, '5': 1, '10': 'quantity'},
    {'1': 'proxies_worth', '3': 5, '4': 3, '5': 11, '6': '.weebi.ticket.ProxyArticleWorthPb', '10': 'proxiesWorth'},
    {'1': 'inventoryAbsoluteQt', '3': 6, '4': 1, '5': 1, '10': 'inventoryAbsoluteQt'},
    {'1': 'total_price', '3': 7, '4': 1, '5': 1, '8': {}, '10': 'totalPrice'},
    {'1': 'total_cost', '3': 8, '4': 1, '5': 1, '8': {}, '10': 'totalCost'},
  ],
};

/// Descriptor for `ItemCartPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List itemCartPbDescriptor = $convert.base64Decode(
    'CgpJdGVtQ2FydFBiEkwKDWFydGljbGVSZXRhaWwYASABKAsyJi53ZWViaS5hcnRpY2xlLkFydG'
    'ljbGVSZXRhaWxPblRpY2tldFBiUg1hcnRpY2xlUmV0YWlsEkwKDWFydGljbGVCYXNrZXQYAiAB'
    'KAsyJi53ZWViaS5hcnRpY2xlLkFydGljbGVCYXNrZXRPblRpY2tldFBiUg1hcnRpY2xlQmFza2'
    'V0ElsKEmFydGljbGVVbmNvdW50YWJsZRgDIAEoCzIrLndlZWJpLmFydGljbGUuQXJ0aWNsZVVu'
    'Y291bnRhYmxlT25UaWNrZXRQYlISYXJ0aWNsZVVuY291bnRhYmxlEhoKCHF1YW50aXR5GAQgAS'
    'gBUghxdWFudGl0eRJGCg1wcm94aWVzX3dvcnRoGAUgAygLMiEud2VlYmkudGlja2V0LlByb3h5'
    'QXJ0aWNsZVdvcnRoUGJSDHByb3hpZXNXb3J0aBIwChNpbnZlbnRvcnlBYnNvbHV0ZVF0GAYgAS'
    'gBUhNpbnZlbnRvcnlBYnNvbHV0ZVF0EjwKC3RvdGFsX3ByaWNlGAcgASgBQhuKtRgXcXVhbnRp'
    'dHkgKiBhcnRpY2xlUHJpY2VSCnRvdGFsUHJpY2USOQoKdG90YWxfY29zdBgIIAEoAUIairUYFn'
    'F1YW50aXR5ICogYXJ0aWNsZUNvc3RSCXRvdGFsQ29zdA==');

