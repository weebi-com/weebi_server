//
//  Generated code. Do not modify.
//  source: article/photo.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ArticlePhotoPb_ExtensionPb extends $pb.ProtobufEnum {
  static const ArticlePhotoPb_ExtensionPb unknown = ArticlePhotoPb_ExtensionPb._(0, _omitEnumNames ? '' : 'unknown');
  static const ArticlePhotoPb_ExtensionPb png = ArticlePhotoPb_ExtensionPb._(1, _omitEnumNames ? '' : 'png');
  static const ArticlePhotoPb_ExtensionPb jpeg = ArticlePhotoPb_ExtensionPb._(2, _omitEnumNames ? '' : 'jpeg');

  static const $core.List<ArticlePhotoPb_ExtensionPb> values = <ArticlePhotoPb_ExtensionPb> [
    unknown,
    png,
    jpeg,
  ];

  static final $core.List<ArticlePhotoPb_ExtensionPb?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ArticlePhotoPb_ExtensionPb? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ArticlePhotoPb_ExtensionPb._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
