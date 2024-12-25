//
//  Generated code. Do not modify.
//  source: article/article.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use articleKindPbDescriptor instead')
const ArticleKindPb$json = {
  '1': 'ArticleKindPb',
  '2': [
    {'1': 'unknown', '2': 0},
    {'1': 'retail', '2': 1},
    {'1': 'basket', '2': 2},
    {'1': 'uncountable', '2': 3},
  ],
};

/// Descriptor for `ArticleKindPb`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List articleKindPbDescriptor = $convert.base64Decode(
    'Cg1BcnRpY2xlS2luZFBiEgsKB3Vua25vd24QABIKCgZyZXRhaWwQARIKCgZiYXNrZXQQAhIPCg'
    't1bmNvdW50YWJsZRAD');

@$core.Deprecated('Use calibreMongoDescriptor instead')
const CalibreMongo$json = {
  '1': 'CalibreMongo',
  '2': [
    {'1': 'calibre', '3': 1, '4': 1, '5': 11, '6': '.weebi.article.CalibrePb', '10': 'calibre'},
    {'1': 'calibreId', '3': 2, '4': 1, '5': 5, '10': 'calibreId'},
    {'1': 'firmId', '3': 3, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 4, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'userId', '3': 5, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'creationDate', '3': 6, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'lastTouchTimestampUTC', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastTouchTimestampUTC'},
    {'1': 'additional_attributes', '3': 99, '4': 3, '5': 11, '6': '.weebi.article.CalibreMongo.AdditionalAttributesEntry', '10': 'additional_attributes'},
  ],
  '3': [CalibreMongo_AdditionalAttributesEntry$json],
  '9': [
    {'1': 8, '2': 99},
  ],
};

@$core.Deprecated('Use calibreMongoDescriptor instead')
const CalibreMongo_AdditionalAttributesEntry$json = {
  '1': 'AdditionalAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `CalibreMongo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calibreMongoDescriptor = $convert.base64Decode(
    'CgxDYWxpYnJlTW9uZ28SMgoHY2FsaWJyZRgBIAEoCzIYLndlZWJpLmFydGljbGUuQ2FsaWJyZV'
    'BiUgdjYWxpYnJlEhwKCWNhbGlicmVJZBgCIAEoBVIJY2FsaWJyZUlkEhYKBmZpcm1JZBgDIAEo'
    'CVIGZmlybUlkEhgKB2NoYWluSWQYBCABKAlSB2NoYWluSWQSFgoGdXNlcklkGAUgASgJUgZ1c2'
    'VySWQSIgoMY3JlYXRpb25EYXRlGAYgASgJUgxjcmVhdGlvbkRhdGUSUAoVbGFzdFRvdWNoVGlt'
    'ZXN0YW1wVVRDGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIVbGFzdFRvdWNoVG'
    'ltZXN0YW1wVVRDEmsKFWFkZGl0aW9uYWxfYXR0cmlidXRlcxhjIAMoCzI1LndlZWJpLmFydGlj'
    'bGUuQ2FsaWJyZU1vbmdvLkFkZGl0aW9uYWxBdHRyaWJ1dGVzRW50cnlSFWFkZGl0aW9uYWxfYX'
    'R0cmlidXRlcxpHChlBZGRpdGlvbmFsQXR0cmlidXRlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5'
    'EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAFKBAgIEGM=');

@$core.Deprecated('Use calibrePbDescriptor instead')
const CalibrePb$json = {
  '1': 'CalibrePb',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'creationDate', '3': 2, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'updateDate', '3': 3, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'statusUpdateDate', '3': 4, '4': 1, '5': 9, '10': 'statusUpdateDate'},
    {'1': 'status', '3': 5, '4': 1, '5': 8, '10': 'status'},
    {'1': 'title', '3': 6, '4': 1, '5': 9, '10': 'title'},
    {'1': 'stockUnit', '3': 7, '4': 1, '5': 14, '6': '.weebi.article.CalibrePb.StockUnit', '10': 'stockUnit'},
    {'1': 'kind', '3': 8, '4': 1, '5': 14, '6': '.weebi.article.ArticleKindPb', '10': 'kind'},
    {'1': 'articlesRetail', '3': 9, '4': 3, '5': 11, '6': '.weebi.article.ArticleRetailPb', '10': 'articlesRetail'},
    {'1': 'articlesBasket', '3': 10, '4': 3, '5': 11, '6': '.weebi.article.ArticleBasketPb', '10': 'articlesBasket'},
    {'1': 'articlesUncountable', '3': 11, '4': 3, '5': 11, '6': '.weebi.article.ArticleUncountablePb', '10': 'articlesUncountable'},
  ],
  '4': [CalibrePb_StockUnit$json],
  '9': [
    {'1': 13, '2': 99},
  ],
};

@$core.Deprecated('Use calibrePbDescriptor instead')
const CalibrePb_StockUnit$json = {
  '1': 'StockUnit',
  '2': [
    {'1': 'unknown', '2': 0},
    {'1': 'centiliter', '2': 1},
    {'1': 'centimeter', '2': 2},
    {'1': 'gram', '2': 3},
    {'1': 'kilogram', '2': 4},
    {'1': 'liter', '2': 5},
    {'1': 'meter', '2': 6},
    {'1': 'unit', '2': 7},
  ],
};

/// Descriptor for `CalibrePb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calibrePbDescriptor = $convert.base64Decode(
    'CglDYWxpYnJlUGISDgoCaWQYASABKAVSAmlkEiIKDGNyZWF0aW9uRGF0ZRgCIAEoCVIMY3JlYX'
    'Rpb25EYXRlEh4KCnVwZGF0ZURhdGUYAyABKAlSCnVwZGF0ZURhdGUSKgoQc3RhdHVzVXBkYXRl'
    'RGF0ZRgEIAEoCVIQc3RhdHVzVXBkYXRlRGF0ZRIWCgZzdGF0dXMYBSABKAhSBnN0YXR1cxIUCg'
    'V0aXRsZRgGIAEoCVIFdGl0bGUSQAoJc3RvY2tVbml0GAcgASgOMiIud2VlYmkuYXJ0aWNsZS5D'
    'YWxpYnJlUGIuU3RvY2tVbml0UglzdG9ja1VuaXQSMAoEa2luZBgIIAEoDjIcLndlZWJpLmFydG'
    'ljbGUuQXJ0aWNsZUtpbmRQYlIEa2luZBJGCg5hcnRpY2xlc1JldGFpbBgJIAMoCzIeLndlZWJp'
    'LmFydGljbGUuQXJ0aWNsZVJldGFpbFBiUg5hcnRpY2xlc1JldGFpbBJGCg5hcnRpY2xlc0Jhc2'
    'tldBgKIAMoCzIeLndlZWJpLmFydGljbGUuQXJ0aWNsZUJhc2tldFBiUg5hcnRpY2xlc0Jhc2tl'
    'dBJVChNhcnRpY2xlc1VuY291bnRhYmxlGAsgAygLMiMud2VlYmkuYXJ0aWNsZS5BcnRpY2xlVW'
    '5jb3VudGFibGVQYlITYXJ0aWNsZXNVbmNvdW50YWJsZSJwCglTdG9ja1VuaXQSCwoHdW5rbm93'
    'bhAAEg4KCmNlbnRpbGl0ZXIQARIOCgpjZW50aW1ldGVyEAISCAoEZ3JhbRADEgwKCGtpbG9ncm'
    'FtEAQSCQoFbGl0ZXIQBRIJCgVtZXRlchAGEggKBHVuaXQQB0oECA0QYw==');

@$core.Deprecated('Use articleIdDescriptor instead')
const ArticleId$json = {
  '1': 'ArticleId',
  '2': [
    {'1': 'calibreId', '3': 1, '4': 1, '5': 5, '10': 'calibreId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `ArticleId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleIdDescriptor = $convert.base64Decode(
    'CglBcnRpY2xlSWQSHAoJY2FsaWJyZUlkGAEgASgFUgljYWxpYnJlSWQSDgoCaWQYAiABKAVSAm'
    'lk');

@$core.Deprecated('Use articleRetailOnTicketPbDescriptor instead')
const ArticleRetailOnTicketPb$json = {
  '1': 'ArticleRetailOnTicketPb',
  '2': [
    {'1': 'calibreId', '3': 1, '4': 1, '5': 5, '10': 'calibreId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'designation', '3': 3, '4': 1, '5': 9, '10': 'designation'},
    {'1': 'price', '3': 4, '4': 1, '5': 1, '10': 'price'},
    {'1': 'cost', '3': 5, '4': 1, '5': 1, '10': 'cost'},
    {'1': 'unitsInOnePiece', '3': 6, '4': 1, '5': 1, '10': 'unitsInOnePiece'},
  ],
};

/// Descriptor for `ArticleRetailOnTicketPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleRetailOnTicketPbDescriptor = $convert.base64Decode(
    'ChdBcnRpY2xlUmV0YWlsT25UaWNrZXRQYhIcCgljYWxpYnJlSWQYASABKAVSCWNhbGlicmVJZB'
    'IOCgJpZBgCIAEoBVICaWQSIAoLZGVzaWduYXRpb24YAyABKAlSC2Rlc2lnbmF0aW9uEhQKBXBy'
    'aWNlGAQgASgBUgVwcmljZRISCgRjb3N0GAUgASgBUgRjb3N0EigKD3VuaXRzSW5PbmVQaWVjZR'
    'gGIAEoAVIPdW5pdHNJbk9uZVBpZWNl');

@$core.Deprecated('Use articleRetailPbDescriptor instead')
const ArticleRetailPb$json = {
  '1': 'ArticleRetailPb',
  '2': [
    {'1': 'calibreId', '3': 1, '4': 1, '5': 5, '10': 'calibreId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'designation', '3': 3, '4': 1, '5': 9, '10': 'designation'},
    {'1': 'kind', '3': 4, '4': 1, '5': 14, '6': '.weebi.article.ArticleKindPb', '10': 'kind'},
    {'1': 'status', '3': 5, '4': 1, '5': 8, '10': 'status'},
    {'1': 'codeShortcut', '3': 6, '4': 1, '5': 5, '10': 'articleCode'},
    {'1': 'creationDate', '3': 7, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'updateDate', '3': 8, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'statusUpdateDate', '3': 9, '4': 1, '5': 9, '10': 'statusUpdateDate'},
    {'1': 'price', '3': 10, '4': 1, '5': 1, '10': 'price'},
    {'1': 'cost', '3': 11, '4': 1, '5': 1, '10': 'cost'},
    {'1': 'unitsInOnePiece', '3': 12, '4': 1, '5': 1, '10': 'unitsInOnePiece'},
    {'1': 'barcodeEAN', '3': 13, '4': 1, '5': 9, '10': 'barcodeEAN'},
  ],
};

/// Descriptor for `ArticleRetailPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleRetailPbDescriptor = $convert.base64Decode(
    'Cg9BcnRpY2xlUmV0YWlsUGISHAoJY2FsaWJyZUlkGAEgASgFUgljYWxpYnJlSWQSDgoCaWQYAi'
    'ABKAVSAmlkEiAKC2Rlc2lnbmF0aW9uGAMgASgJUgtkZXNpZ25hdGlvbhIwCgRraW5kGAQgASgO'
    'Mhwud2VlYmkuYXJ0aWNsZS5BcnRpY2xlS2luZFBiUgRraW5kEhYKBnN0YXR1cxgFIAEoCFIGc3'
    'RhdHVzEiEKDGNvZGVTaG9ydGN1dBgGIAEoBVILYXJ0aWNsZUNvZGUSIgoMY3JlYXRpb25EYXRl'
    'GAcgASgJUgxjcmVhdGlvbkRhdGUSHgoKdXBkYXRlRGF0ZRgIIAEoCVIKdXBkYXRlRGF0ZRIqCh'
    'BzdGF0dXNVcGRhdGVEYXRlGAkgASgJUhBzdGF0dXNVcGRhdGVEYXRlEhQKBXByaWNlGAogASgB'
    'UgVwcmljZRISCgRjb3N0GAsgASgBUgRjb3N0EigKD3VuaXRzSW5PbmVQaWVjZRgMIAEoAVIPdW'
    '5pdHNJbk9uZVBpZWNlEh4KCmJhcmNvZGVFQU4YDSABKAlSCmJhcmNvZGVFQU4=');

@$core.Deprecated('Use articleBasketPbDescriptor instead')
const ArticleBasketPb$json = {
  '1': 'ArticleBasketPb',
  '2': [
    {'1': 'calibreId', '3': 1, '4': 1, '5': 5, '10': 'calibreId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'designation', '3': 3, '4': 1, '5': 9, '10': 'designation'},
    {'1': 'kind', '3': 4, '4': 1, '5': 14, '6': '.weebi.article.ArticleKindPb', '10': 'kind'},
    {'1': 'status', '3': 5, '4': 1, '5': 8, '10': 'status'},
    {'1': 'codeShortcut', '3': 6, '4': 1, '5': 5, '10': 'articleCode'},
    {'1': 'creationDate', '3': 7, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'updateDate', '3': 8, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'statusUpdateDate', '3': 9, '4': 1, '5': 9, '10': 'statusUpdateDate'},
    {'1': 'proxies', '3': 10, '4': 3, '5': 11, '6': '.weebi.article.ProxyArticlePb', '10': 'proxies'},
    {'1': 'discountAmount', '3': 11, '4': 1, '5': 1, '10': 'discountAmountSalesOnly'},
    {'1': 'markupAmount', '3': 12, '4': 1, '5': 1, '10': 'markupAmountSalesOnly'},
  ],
};

/// Descriptor for `ArticleBasketPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleBasketPbDescriptor = $convert.base64Decode(
    'Cg9BcnRpY2xlQmFza2V0UGISHAoJY2FsaWJyZUlkGAEgASgFUgljYWxpYnJlSWQSDgoCaWQYAi'
    'ABKAVSAmlkEiAKC2Rlc2lnbmF0aW9uGAMgASgJUgtkZXNpZ25hdGlvbhIwCgRraW5kGAQgASgO'
    'Mhwud2VlYmkuYXJ0aWNsZS5BcnRpY2xlS2luZFBiUgRraW5kEhYKBnN0YXR1cxgFIAEoCFIGc3'
    'RhdHVzEiEKDGNvZGVTaG9ydGN1dBgGIAEoBVILYXJ0aWNsZUNvZGUSIgoMY3JlYXRpb25EYXRl'
    'GAcgASgJUgxjcmVhdGlvbkRhdGUSHgoKdXBkYXRlRGF0ZRgIIAEoCVIKdXBkYXRlRGF0ZRIqCh'
    'BzdGF0dXNVcGRhdGVEYXRlGAkgASgJUhBzdGF0dXNVcGRhdGVEYXRlEjcKB3Byb3hpZXMYCiAD'
    'KAsyHS53ZWViaS5hcnRpY2xlLlByb3h5QXJ0aWNsZVBiUgdwcm94aWVzEi8KDmRpc2NvdW50QW'
    '1vdW50GAsgASgBUhdkaXNjb3VudEFtb3VudFNhbGVzT25seRIrCgxtYXJrdXBBbW91bnQYDCAB'
    'KAFSFW1hcmt1cEFtb3VudFNhbGVzT25seQ==');

@$core.Deprecated('Use articleBasketOnTicketPbDescriptor instead')
const ArticleBasketOnTicketPb$json = {
  '1': 'ArticleBasketOnTicketPb',
  '2': [
    {'1': 'calibreId', '3': 1, '4': 1, '5': 5, '10': 'calibreId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'designation', '3': 3, '4': 1, '5': 9, '10': 'designation'},
    {'1': 'proxies', '3': 4, '4': 3, '5': 11, '6': '.weebi.article.ProxyArticlePb', '10': 'proxies'},
    {'1': 'discountAmount', '3': 5, '4': 1, '5': 1, '10': 'discountAmountSalesOnly'},
    {'1': 'markupAmount', '3': 6, '4': 1, '5': 1, '10': 'markupAmountSalesOnly'},
  ],
};

/// Descriptor for `ArticleBasketOnTicketPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleBasketOnTicketPbDescriptor = $convert.base64Decode(
    'ChdBcnRpY2xlQmFza2V0T25UaWNrZXRQYhIcCgljYWxpYnJlSWQYASABKAVSCWNhbGlicmVJZB'
    'IOCgJpZBgCIAEoBVICaWQSIAoLZGVzaWduYXRpb24YAyABKAlSC2Rlc2lnbmF0aW9uEjcKB3By'
    'b3hpZXMYBCADKAsyHS53ZWViaS5hcnRpY2xlLlByb3h5QXJ0aWNsZVBiUgdwcm94aWVzEi8KDm'
    'Rpc2NvdW50QW1vdW50GAUgASgBUhdkaXNjb3VudEFtb3VudFNhbGVzT25seRIrCgxtYXJrdXBB'
    'bW91bnQYBiABKAFSFW1hcmt1cEFtb3VudFNhbGVzT25seQ==');

@$core.Deprecated('Use proxyArticlePbDescriptor instead')
const ProxyArticlePb$json = {
  '1': 'ProxyArticlePb',
  '2': [
    {'1': 'calibreId', '3': 1, '4': 1, '5': 5, '10': 'calibreId'},
    {'1': 'articleId', '3': 2, '4': 1, '5': 5, '10': 'articleId'},
    {'1': 'id', '3': 3, '4': 1, '5': 5, '10': 'id'},
    {'1': 'status', '3': 4, '4': 1, '5': 8, '10': 'status'},
    {'1': 'proxyCalibreId', '3': 5, '4': 1, '5': 5, '10': 'proxyCalibreId'},
    {'1': 'proxyArticleId', '3': 6, '4': 1, '5': 5, '10': 'proxyArticleId'},
    {'1': 'minimumUnitPerBasket', '3': 7, '4': 1, '5': 1, '10': 'minimumUnitPerBasket'},
    {'1': 'articleWeight', '3': 8, '4': 1, '5': 1, '10': 'articleWeight'},
  ],
};

/// Descriptor for `ProxyArticlePb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proxyArticlePbDescriptor = $convert.base64Decode(
    'Cg5Qcm94eUFydGljbGVQYhIcCgljYWxpYnJlSWQYASABKAVSCWNhbGlicmVJZBIcCglhcnRpY2'
    'xlSWQYAiABKAVSCWFydGljbGVJZBIOCgJpZBgDIAEoBVICaWQSFgoGc3RhdHVzGAQgASgIUgZz'
    'dGF0dXMSJgoOcHJveHlDYWxpYnJlSWQYBSABKAVSDnByb3h5Q2FsaWJyZUlkEiYKDnByb3h5QX'
    'J0aWNsZUlkGAYgASgFUg5wcm94eUFydGljbGVJZBIyChRtaW5pbXVtVW5pdFBlckJhc2tldBgH'
    'IAEoAVIUbWluaW11bVVuaXRQZXJCYXNrZXQSJAoNYXJ0aWNsZVdlaWdodBgIIAEoAVINYXJ0aW'
    'NsZVdlaWdodA==');

@$core.Deprecated('Use articleUncountableOnTicketPbDescriptor instead')
const ArticleUncountableOnTicketPb$json = {
  '1': 'ArticleUncountableOnTicketPb',
  '2': [
    {'1': 'calibreId', '3': 1, '4': 1, '5': 5, '10': 'calibreId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'designation', '3': 3, '4': 1, '5': 9, '10': 'designation'},
    {'1': 'price', '3': 4, '4': 1, '5': 1, '10': 'price'},
    {'1': 'cost', '3': 5, '4': 1, '5': 1, '10': 'cost'},
  ],
};

/// Descriptor for `ArticleUncountableOnTicketPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleUncountableOnTicketPbDescriptor = $convert.base64Decode(
    'ChxBcnRpY2xlVW5jb3VudGFibGVPblRpY2tldFBiEhwKCWNhbGlicmVJZBgBIAEoBVIJY2FsaW'
    'JyZUlkEg4KAmlkGAIgASgFUgJpZBIgCgtkZXNpZ25hdGlvbhgDIAEoCVILZGVzaWduYXRpb24S'
    'FAoFcHJpY2UYBCABKAFSBXByaWNlEhIKBGNvc3QYBSABKAFSBGNvc3Q=');

@$core.Deprecated('Use articleUncountablePbDescriptor instead')
const ArticleUncountablePb$json = {
  '1': 'ArticleUncountablePb',
  '2': [
    {'1': 'calibreId', '3': 1, '4': 1, '5': 5, '10': 'calibreId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'designation', '3': 3, '4': 1, '5': 9, '10': 'designation'},
    {'1': 'kind', '3': 4, '4': 1, '5': 14, '6': '.weebi.article.ArticleKindPb', '10': 'kind'},
    {'1': 'status', '3': 5, '4': 1, '5': 8, '10': 'status'},
    {'1': 'codeShortcut', '3': 6, '4': 1, '5': 5, '10': 'articleCode'},
    {'1': 'creationDate', '3': 7, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'updateDate', '3': 8, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'statusUpdateDate', '3': 9, '4': 1, '5': 9, '10': 'statusUpdateDate'},
    {'1': 'price', '3': 10, '4': 1, '5': 1, '10': 'price'},
    {'1': 'cost', '3': 11, '4': 1, '5': 1, '10': 'cost'},
    {'1': 'unitsInOnePiece', '3': 12, '4': 1, '5': 1, '10': 'unitsInOnePiece'},
    {'1': 'barcodeEAN', '3': 13, '4': 1, '5': 9, '10': 'barcodeEAN'},
  ],
};

/// Descriptor for `ArticleUncountablePb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleUncountablePbDescriptor = $convert.base64Decode(
    'ChRBcnRpY2xlVW5jb3VudGFibGVQYhIcCgljYWxpYnJlSWQYASABKAVSCWNhbGlicmVJZBIOCg'
    'JpZBgCIAEoBVICaWQSIAoLZGVzaWduYXRpb24YAyABKAlSC2Rlc2lnbmF0aW9uEjAKBGtpbmQY'
    'BCABKA4yHC53ZWViaS5hcnRpY2xlLkFydGljbGVLaW5kUGJSBGtpbmQSFgoGc3RhdHVzGAUgAS'
    'gIUgZzdGF0dXMSIQoMY29kZVNob3J0Y3V0GAYgASgFUgthcnRpY2xlQ29kZRIiCgxjcmVhdGlv'
    'bkRhdGUYByABKAlSDGNyZWF0aW9uRGF0ZRIeCgp1cGRhdGVEYXRlGAggASgJUgp1cGRhdGVEYX'
    'RlEioKEHN0YXR1c1VwZGF0ZURhdGUYCSABKAlSEHN0YXR1c1VwZGF0ZURhdGUSFAoFcHJpY2UY'
    'CiABKAFSBXByaWNlEhIKBGNvc3QYCyABKAFSBGNvc3QSKAoPdW5pdHNJbk9uZVBpZWNlGAwgAS'
    'gBUg91bml0c0luT25lUGllY2USHgoKYmFyY29kZUVBThgNIAEoCVIKYmFyY29kZUVBTg==');

