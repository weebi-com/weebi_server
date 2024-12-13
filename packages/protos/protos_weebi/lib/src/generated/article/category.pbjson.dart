//
//  Generated code. Do not modify.
//  source: article/category.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use categoryPbDescriptor instead')
const CategoryPb$json = {
  '1': 'CategoryPb',
  '2': [
    {'1': 'calibresIds', '3': 1, '4': 3, '5': 13, '10': 'calibresIds'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'color', '3': 3, '4': 1, '5': 13, '10': 'color'},
    {'1': 'creationDate', '3': 4, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'updateDate', '3': 5, '4': 1, '5': 9, '10': 'updateDate'},
  ],
};

/// Descriptor for `CategoryPb`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List categoryPbDescriptor = $convert.base64Decode(
    'CgpDYXRlZ29yeVBiEiAKC2NhbGlicmVzSWRzGAEgAygNUgtjYWxpYnJlc0lkcxIUCgV0aXRsZR'
    'gCIAEoCVIFdGl0bGUSFAoFY29sb3IYAyABKA1SBWNvbG9yEiIKDGNyZWF0aW9uRGF0ZRgEIAEo'
    'CVIMY3JlYXRpb25EYXRlEh4KCnVwZGF0ZURhdGUYBSABKAlSCnVwZGF0ZURhdGU=');

@$core.Deprecated('Use categoryMongoDescriptor instead')
const CategoryMongo$json = {
  '1': 'CategoryMongo',
  '2': [
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainId', '3': 2, '4': 1, '5': 9, '10': 'chainId'},
    {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    {'1': 'category', '3': 5, '4': 1, '5': 11, '6': '.weebi.category.CategoryPb', '10': 'category'},
  ],
};

/// Descriptor for `CategoryMongo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List categoryMongoDescriptor = $convert.base64Decode(
    'Cg1DYXRlZ29yeU1vbmdvEhYKBmZpcm1JZBgBIAEoCVIGZmlybUlkEhgKB2NoYWluSWQYAiABKA'
    'lSB2NoYWluSWQSFgoGdXNlcklkGAMgASgJUgZ1c2VySWQSFAoFdGl0bGUYBCABKAlSBXRpdGxl'
    'EjYKCGNhdGVnb3J5GAUgASgLMhoud2VlYmkuY2F0ZWdvcnkuQ2F0ZWdvcnlQYlIIY2F0ZWdvcn'
    'k=');

