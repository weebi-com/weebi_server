//
//  Generated code. Do not modify.
//  source: user_permissions.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// / user CRUD rights on base models
class Right extends $pb.ProtobufEnum {
  static const Right unknown = Right._(0, _omitEnumNames ? '' : 'unknown');
  static const Right create = Right._(1, _omitEnumNames ? '' : 'create');
  static const Right read = Right._(2, _omitEnumNames ? '' : 'read');
  static const Right update = Right._(3, _omitEnumNames ? '' : 'update');
  static const Right delete = Right._(4, _omitEnumNames ? '' : 'delete');

  static const $core.List<Right> values = <Right> [
    unknown,
    create,
    read,
    update,
    delete,
  ];

  static final $core.List<Right?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 4);
  static Right? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Right._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
