// This is a generated file - do not edit.
//
// Generated from article/photo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ArticlePhotoPb_ExtensionPb extends $pb.ProtobufEnum {
  static const ArticlePhotoPb_ExtensionPb unknown =
      ArticlePhotoPb_ExtensionPb._(0, _omitEnumNames ? '' : 'unknown');
  static const ArticlePhotoPb_ExtensionPb png =
      ArticlePhotoPb_ExtensionPb._(1, _omitEnumNames ? '' : 'png');
  static const ArticlePhotoPb_ExtensionPb jpeg =
      ArticlePhotoPb_ExtensionPb._(2, _omitEnumNames ? '' : 'jpeg');

  static const $core.List<ArticlePhotoPb_ExtensionPb> values =
      <ArticlePhotoPb_ExtensionPb>[
    unknown,
    png,
    jpeg,
  ];

  static final $core.List<ArticlePhotoPb_ExtensionPb?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ArticlePhotoPb_ExtensionPb? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ArticlePhotoPb_ExtensionPb._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
