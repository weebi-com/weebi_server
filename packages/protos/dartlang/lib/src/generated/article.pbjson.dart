//
//  Generated code. Do not modify.
//  source: article.proto
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
    {'1': 'outOfCatalogue', '2': 3},
  ],
};

/// Descriptor for `ArticleKindPb`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List articleKindPbDescriptor = $convert.base64Decode(
    'Cg1BcnRpY2xlS2luZFBiEgsKB3Vua25vd24QABIKCgZyZXRhaWwQARIKCgZiYXNrZXQQAhISCg'
    '5vdXRPZkNhdGFsb2d1ZRAD');

@$core.Deprecated('Use calibreMongoDescriptor instead')
const CalibreMongo$json = {
  '1': 'CalibreMongo',
  '2': [
    {'1': 'calibre', '3': 1, '4': 1, '5': 11, '6': '.weebi.article.CalibrePb', '10': 'calibre'},
    {'1': 'calibreUniqueId', '3': 2, '4': 1, '5': 5, '10': 'calibreUniqueId'},
    {'1': 'firmOid', '3': 3, '4': 1, '5': 9, '10': 'firmOid'},
    {'1': 'chainOid', '3': 4, '4': 1, '5': 9, '10': 'chainOid'},
    {'1': 'userOid', '3': 5, '4': 1, '5': 9, '10': 'userOid'},
  ],
};

/// Descriptor for `CalibreMongo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calibreMongoDescriptor = $convert.base64Decode(
    'CgxDYWxpYnJlTW9uZ28SMgoHY2FsaWJyZRgBIAEoCzIYLndlZWJpLmFydGljbGUuQ2FsaWJyZV'
    'BiUgdjYWxpYnJlEigKD2NhbGlicmVVbmlxdWVJZBgCIAEoBVIPY2FsaWJyZVVuaXF1ZUlkEhgK'
    'B2Zpcm1PaWQYAyABKAlSB2Zpcm1PaWQSGgoIY2hhaW5PaWQYBCABKAlSCGNoYWluT2lkEhgKB3'
    'VzZXJPaWQYBSABKAlSB3VzZXJPaWQ=');

@$core.Deprecated('Use calibrePbDescriptor instead')
const CalibrePb$json = {
  '1': 'CalibrePb',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'dateCreation', '3': 2, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'dateUpdate', '3': 3, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'dateStatus', '3': 4, '4': 1, '5': 9, '10': 'statusUpdateDate'},
    {'1': 'status', '3': 5, '4': 1, '5': 8, '10': 'status'},
    {'1': 'title', '3': 6, '4': 1, '5': 9, '10': 'title'},
    {'1': 'stockUnit', '3': 7, '4': 1, '5': 14, '6': '.weebi.article.CalibrePb.StockUnit', '10': 'stockUnit'},
    {'1': 'kind', '3': 8, '4': 1, '5': 14, '6': '.weebi.article.ArticleKindPb', '10': 'kind'},
    {'1': 'categories', '3': 9, '4': 3, '5': 9, '10': 'categories'},
    {'1': 'articlesRetail', '3': 10, '4': 3, '5': 11, '6': '.weebi.article.ArticleRetailPb', '10': 'articlesRetail'},
    {'1': 'articlesBasket', '3': 11, '4': 3, '5': 11, '6': '.weebi.article.ArticleBasketPb', '10': 'articlesBasket'},
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
    'CglDYWxpYnJlUGISDgoCaWQYASABKAVSAmlkEiIKDGRhdGVDcmVhdGlvbhgCIAEoCVIMY3JlYX'
    'Rpb25EYXRlEh4KCmRhdGVVcGRhdGUYAyABKAlSCnVwZGF0ZURhdGUSJAoKZGF0ZVN0YXR1cxgE'
    'IAEoCVIQc3RhdHVzVXBkYXRlRGF0ZRIWCgZzdGF0dXMYBSABKAhSBnN0YXR1cxIUCgV0aXRsZR'
    'gGIAEoCVIFdGl0bGUSQAoJc3RvY2tVbml0GAcgASgOMiIud2VlYmkuYXJ0aWNsZS5DYWxpYnJl'
    'UGIuU3RvY2tVbml0UglzdG9ja1VuaXQSMAoEa2luZBgIIAEoDjIcLndlZWJpLmFydGljbGUuQX'
    'J0aWNsZUtpbmRQYlIEa2luZBIeCgpjYXRlZ29yaWVzGAkgAygJUgpjYXRlZ29yaWVzEkYKDmFy'
    'dGljbGVzUmV0YWlsGAogAygLMh4ud2VlYmkuYXJ0aWNsZS5BcnRpY2xlUmV0YWlsUGJSDmFydG'
    'ljbGVzUmV0YWlsEkYKDmFydGljbGVzQmFza2V0GAsgAygLMh4ud2VlYmkuYXJ0aWNsZS5BcnRp'
    'Y2xlQmFza2V0UGJSDmFydGljbGVzQmFza2V0InAKCVN0b2NrVW5pdBILCgd1bmtub3duEAASDg'
    'oKY2VudGlsaXRlchABEg4KCmNlbnRpbWV0ZXIQAhIICgRncmFtEAMSDAoIa2lsb2dyYW0QBBIJ'
    'CgVsaXRlchAFEgkKBW1ldGVyEAYSCAoEdW5pdBAHSgQIDRBj');

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
    {'1': 'dateCreation', '3': 7, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'dateUpdate', '3': 8, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'dateStatus', '3': 9, '4': 1, '5': 9, '10': 'statusUpdateDate'},
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
    'RhdHVzEiEKDGNvZGVTaG9ydGN1dBgGIAEoBVILYXJ0aWNsZUNvZGUSIgoMZGF0ZUNyZWF0aW9u'
    'GAcgASgJUgxjcmVhdGlvbkRhdGUSHgoKZGF0ZVVwZGF0ZRgIIAEoCVIKdXBkYXRlRGF0ZRIkCg'
    'pkYXRlU3RhdHVzGAkgASgJUhBzdGF0dXNVcGRhdGVEYXRlEhQKBXByaWNlGAogASgBUgVwcmlj'
    'ZRISCgRjb3N0GAsgASgBUgRjb3N0EigKD3VuaXRzSW5PbmVQaWVjZRgMIAEoAVIPdW5pdHNJbk'
    '9uZVBpZWNlEh4KCmJhcmNvZGVFQU4YDSABKAlSCmJhcmNvZGVFQU4=');

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
    {'1': 'dateCreation', '3': 7, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'dateUpdate', '3': 8, '4': 1, '5': 9, '10': 'updateDate'},
    {'1': 'dateStatus', '3': 9, '4': 1, '5': 9, '10': 'statusUpdateDate'},
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
    'RhdHVzEiEKDGNvZGVTaG9ydGN1dBgGIAEoBVILYXJ0aWNsZUNvZGUSIgoMZGF0ZUNyZWF0aW9u'
    'GAcgASgJUgxjcmVhdGlvbkRhdGUSHgoKZGF0ZVVwZGF0ZRgIIAEoCVIKdXBkYXRlRGF0ZRIkCg'
    'pkYXRlU3RhdHVzGAkgASgJUhBzdGF0dXNVcGRhdGVEYXRlEjcKB3Byb3hpZXMYCiADKAsyHS53'
    'ZWViaS5hcnRpY2xlLlByb3h5QXJ0aWNsZVBiUgdwcm94aWVzEi8KDmRpc2NvdW50QW1vdW50GA'
    'sgASgBUhdkaXNjb3VudEFtb3VudFNhbGVzT25seRIrCgxtYXJrdXBBbW91bnQYDCABKAFSFW1h'
    'cmt1cEFtb3VudFNhbGVzT25seQ==');

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

