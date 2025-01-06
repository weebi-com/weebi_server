//
//  Generated code. Do not modify.
//  source: article/photo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use articlePhotoMongoDescriptor instead')
const ArticlePhotoMongo$json = {
  '1': 'ArticlePhotoMongo',
  '2': [
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 2, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'calibreId', '3': 4, '4': 1, '5': 5, '10': 'calibreId'},
    {'1': 'photo', '3': 5, '4': 1, '5': 11, '6': '.weebi.photo.ArticlePhotoPb', '10': 'photo'},
    {'1': 'lastTouchTimestampUTC', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastTouchTimestampUTC'},
  ],
};

/// Descriptor for `ArticlePhotoMongo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articlePhotoMongoDescriptor = $convert.base64Decode(
    'ChFBcnRpY2xlUGhvdG9Nb25nbxIWCgZmaXJtSWQYASABKAlSBmZpcm1JZBIYCgdjaGFpbklkGA'
    'IgASgJUgdjaGFpbklkEhYKBnVzZXJJZBgDIAEoCVIGdXNlcklkEhwKCWNhbGlicmVJZBgEIAEo'
    'BVIJY2FsaWJyZUlkEjEKBXBob3RvGAUgASgLMhsud2VlYmkucGhvdG8uQXJ0aWNsZVBob3RvUG'
    'JSBXBob3RvElAKFWxhc3RUb3VjaFRpbWVzdGFtcFVUQxgGIAEoCzIaLmdvb2dsZS5wcm90b2J1'
    'Zi5UaW1lc3RhbXBSFWxhc3RUb3VjaFRpbWVzdGFtcFVUQw==');

@$core.Deprecated('Use articlePhotoPbDescriptor instead')
const ArticlePhotoPb$json = {
  '1': 'ArticlePhotoPb',
  '2': [
    {'1': 'calibreId', '3': 1, '4': 1, '5': 5, '10': 'calibreId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `ArticlePhotoPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articlePhotoPbDescriptor = $convert.base64Decode(
    'Cg5BcnRpY2xlUGhvdG9QYhIcCgljYWxpYnJlSWQYASABKAVSCWNhbGlicmVJZBIOCgJpZBgCIA'
    'EoBVICaWQSEgoEZGF0YRgDIAEoDFIEZGF0YQ==');

