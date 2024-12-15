//
//  Generated code. Do not modify.
//  source: article/article_service.proto
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

@$core.Deprecated('Use findCategoryRequestDescriptor instead')
const FindCategoryRequest$json = {
  '1': 'FindCategoryRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `FindCategoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findCategoryRequestDescriptor = $convert.base64Decode(
    'ChNGaW5kQ2F0ZWdvcnlSZXF1ZXN0EhgKB2NoYWluSWQYASABKAlSB2NoYWluSWQSFAoFdGl0bG'
    'UYAiABKAlSBXRpdGxl');

@$core.Deprecated('Use readCategoriesRequestDescriptor instead')
const ReadCategoriesRequest$json = {
  '1': 'ReadCategoriesRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
  ],
};

/// Descriptor for `ReadCategoriesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readCategoriesRequestDescriptor = $convert.base64Decode(
    'ChVSZWFkQ2F0ZWdvcmllc1JlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZA==');

@$core.Deprecated('Use categoryRequestDescriptor instead')
const CategoryRequest$json = {
  '1': 'CategoryRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'category', '3': 2, '4': 1, '5': 11, '6': '.weebi.category.CategoryPb', '10': 'category'},
  ],
};

/// Descriptor for `CategoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List categoryRequestDescriptor = $convert.base64Decode(
    'Cg9DYXRlZ29yeVJlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZBI2CghjYXRlZ29yeR'
    'gCIAEoCzIaLndlZWJpLmNhdGVnb3J5LkNhdGVnb3J5UGJSCGNhdGVnb3J5');

@$core.Deprecated('Use categoriesResponseDescriptor instead')
const CategoriesResponse$json = {
  '1': 'CategoriesResponse',
  '2': [
    {'1': 'categories', '3': 1, '4': 3, '5': 11, '6': '.weebi.category.CategoryPb', '10': 'categories'},
  ],
};

/// Descriptor for `CategoriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List categoriesResponseDescriptor = $convert.base64Decode(
    'ChJDYXRlZ29yaWVzUmVzcG9uc2USOgoKY2F0ZWdvcmllcxgBIAMoCzIaLndlZWJpLmNhdGVnb3'
    'J5LkNhdGVnb3J5UGJSCmNhdGVnb3JpZXM=');

