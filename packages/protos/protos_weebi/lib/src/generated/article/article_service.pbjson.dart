//
//  Generated code. Do not modify.
//  source: article/article_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use readCalibreRequestDescriptor instead')
const ReadCalibreRequest$json = {
  '1': 'ReadCalibreRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'calibreId', '3': 3, '4': 1, '5': 5, '10': 'calibreId'},
  ],
};

/// Descriptor for `ReadCalibreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readCalibreRequestDescriptor = $convert.base64Decode(
    'ChJSZWFkQ2FsaWJyZVJlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZBIUCgV0aXRsZR'
    'gCIAEoCVIFdGl0bGUSHAoJY2FsaWJyZUlkGAMgASgFUgljYWxpYnJlSWQ=');

@$core.Deprecated('Use readAllRequestDescriptor instead')
const ReadAllRequest$json = {
  '1': 'ReadAllRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'lastFetchTimestampUTC', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastFetchTimestampUTC'},
  ],
};

/// Descriptor for `ReadAllRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readAllRequestDescriptor = $convert.base64Decode(
    'Cg5SZWFkQWxsUmVxdWVzdBIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklkElAKFWxhc3RGZXRjaF'
    'RpbWVzdGFtcFVUQxgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFWxhc3RGZXRj'
    'aFRpbWVzdGFtcFVUQw==');

@$core.Deprecated('Use calibreRequestDescriptor instead')
const CalibreRequest$json = {
  '1': 'CalibreRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'calibre', '3': 2, '4': 1, '5': 11, '6': '.weebi.article.CalibrePb', '10': 'calibre'},
  ],
};

/// Descriptor for `CalibreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calibreRequestDescriptor = $convert.base64Decode(
    'Cg5DYWxpYnJlUmVxdWVzdBIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklkEjIKB2NhbGlicmUYAi'
    'ABKAsyGC53ZWViaS5hcnRpY2xlLkNhbGlicmVQYlIHY2FsaWJyZQ==');

@$core.Deprecated('Use calibresRequestDescriptor instead')
const CalibresRequest$json = {
  '1': 'CalibresRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'calibres', '3': 2, '4': 3, '5': 11, '6': '.weebi.article.CalibrePb', '10': 'calibres'},
  ],
};

/// Descriptor for `CalibresRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calibresRequestDescriptor = $convert.base64Decode(
    'Cg9DYWxpYnJlc1JlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZBI0CghjYWxpYnJlcx'
    'gCIAMoCzIYLndlZWJpLmFydGljbGUuQ2FsaWJyZVBiUghjYWxpYnJlcw==');

@$core.Deprecated('Use calibresResponseDescriptor instead')
const CalibresResponse$json = {
  '1': 'CalibresResponse',
  '2': [
    {'1': 'calibres', '3': 1, '4': 3, '5': 11, '6': '.weebi.article.CalibrePb', '10': 'calibres'},
  ],
};

/// Descriptor for `CalibresResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calibresResponseDescriptor = $convert.base64Decode(
    'ChBDYWxpYnJlc1Jlc3BvbnNlEjQKCGNhbGlicmVzGAEgAygLMhgud2VlYmkuYXJ0aWNsZS5DYW'
    'xpYnJlUGJSCGNhbGlicmVz');

@$core.Deprecated('Use readIdsRequestDescriptor instead')
const ReadIdsRequest$json = {
  '1': 'ReadIdsRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
  ],
};

/// Descriptor for `ReadIdsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readIdsRequestDescriptor = $convert.base64Decode(
    'Cg5SZWFkSWRzUmVxdWVzdBIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklk');

@$core.Deprecated('Use calibresIdsResponseDescriptor instead')
const CalibresIdsResponse$json = {
  '1': 'CalibresIdsResponse',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 5, '10': 'ids'},
  ],
};

/// Descriptor for `CalibresIdsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calibresIdsResponseDescriptor = $convert.base64Decode(
    'ChNDYWxpYnJlc0lkc1Jlc3BvbnNlEhAKA2lkcxgBIAMoBVIDaWRz');

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

@$core.Deprecated('Use findPhotoRequestDescriptor instead')
const FindPhotoRequest$json = {
  '1': 'FindPhotoRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'calibreId', '3': 2, '4': 1, '5': 9, '10': 'calibreId'},
    {'1': 'id', '3': 3, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `FindPhotoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findPhotoRequestDescriptor = $convert.base64Decode(
    'ChBGaW5kUGhvdG9SZXF1ZXN0EhgKB2NoYWluSWQYASABKAlSB2NoYWluSWQSHAoJY2FsaWJyZU'
    'lkGAIgASgJUgljYWxpYnJlSWQSDgoCaWQYAyABKAlSAmlk');

@$core.Deprecated('Use readPhotosRequestDescriptor instead')
const ReadPhotosRequest$json = {
  '1': 'ReadPhotosRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'lastFetchTimestampUTC', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastFetchTimestampUTC'},
  ],
};

/// Descriptor for `ReadPhotosRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readPhotosRequestDescriptor = $convert.base64Decode(
    'ChFSZWFkUGhvdG9zUmVxdWVzdBIYCgdjaGFpbklkGAEgASgJUgdjaGFpbklkElAKFWxhc3RGZX'
    'RjaFRpbWVzdGFtcFVUQxgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFWxhc3RG'
    'ZXRjaFRpbWVzdGFtcFVUQw==');

@$core.Deprecated('Use photoRequestDescriptor instead')
const PhotoRequest$json = {
  '1': 'PhotoRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'photo', '3': 2, '4': 1, '5': 11, '6': '.weebi.photo.ArticlePhotoPb', '10': 'photo'},
  ],
};

/// Descriptor for `PhotoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List photoRequestDescriptor = $convert.base64Decode(
    'CgxQaG90b1JlcXVlc3QSGAoHY2hhaW5JZBgBIAEoCVIHY2hhaW5JZBIxCgVwaG90bxgCIAEoCz'
    'IbLndlZWJpLnBob3RvLkFydGljbGVQaG90b1BiUgVwaG90bw==');

@$core.Deprecated('Use photosRequestDescriptor instead')
const PhotosRequest$json = {
  '1': 'PhotosRequest',
  '2': [
    {'1': 'chainId', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'photos', '3': 2, '4': 3, '5': 11, '6': '.weebi.photo.ArticlePhotoPb', '10': 'photos'},
  ],
};

/// Descriptor for `PhotosRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List photosRequestDescriptor = $convert.base64Decode(
    'Cg1QaG90b3NSZXF1ZXN0EhgKB2NoYWluSWQYASABKAlSB2NoYWluSWQSMwoGcGhvdG9zGAIgAy'
    'gLMhsud2VlYmkucGhvdG8uQXJ0aWNsZVBob3RvUGJSBnBob3Rvcw==');

@$core.Deprecated('Use photosResponseDescriptor instead')
const PhotosResponse$json = {
  '1': 'PhotosResponse',
  '2': [
    {'1': 'photos', '3': 1, '4': 3, '5': 11, '6': '.weebi.photo.ArticlePhotoPb', '10': 'photos'},
  ],
};

/// Descriptor for `PhotosResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List photosResponseDescriptor = $convert.base64Decode(
    'Cg5QaG90b3NSZXNwb25zZRIzCgZwaG90b3MYASADKAsyGy53ZWViaS5waG90by5BcnRpY2xlUG'
    'hvdG9QYlIGcGhvdG9z');

