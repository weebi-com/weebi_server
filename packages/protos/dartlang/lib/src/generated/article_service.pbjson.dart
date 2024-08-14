//
//  Generated code. Do not modify.
//  source: article_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use findArticleRequestDescriptor instead')
const FindArticleRequest$json = {
  '1': 'FindArticleRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `FindArticleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findArticleRequestDescriptor = $convert.base64Decode(
    'ChJGaW5kQXJ0aWNsZVJlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZBIUCgV0aXRsZR'
    'gCIAEoCVIFdGl0bGU=');

@$core.Deprecated('Use readAllRequestDescriptor instead')
const ReadAllRequest$json = {
  '1': 'ReadAllRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
  ],
};

/// Descriptor for `ReadAllRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readAllRequestDescriptor = $convert.base64Decode(
    'Cg5SZWFkQWxsUmVxdWVzdBIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklk');

@$core.Deprecated('Use articleRequestDescriptor instead')
const ArticleRequest$json = {
  '1': 'ArticleRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'calibre', '3': 2, '4': 1, '5': 11, '6': '.weebi.article.CalibrePb', '10': 'calibre'},
  ],
};

/// Descriptor for `ArticleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleRequestDescriptor = $convert.base64Decode(
    'Cg5BcnRpY2xlUmVxdWVzdBIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklkEjIKB2NhbGlicmUYAi'
    'ABKAsyGC53ZWViaS5hcnRpY2xlLkNhbGlicmVQYlIHY2FsaWJyZQ==');

@$core.Deprecated('Use articlesResponseDescriptor instead')
const ArticlesResponse$json = {
  '1': 'ArticlesResponse',
  '2': [
    {'1': 'calibres', '3': 1, '4': 3, '5': 11, '6': '.weebi.article.CalibrePb', '10': 'calibres'},
  ],
};

/// Descriptor for `ArticlesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articlesResponseDescriptor = $convert.base64Decode(
    'ChBBcnRpY2xlc1Jlc3BvbnNlEjQKCGNhbGlicmVzGAEgAygLMhgud2VlYmkuYXJ0aWNsZS5DYW'
    'xpYnJlUGJSCGNhbGlicmVz');

