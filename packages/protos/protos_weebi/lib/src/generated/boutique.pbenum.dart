// This is a generated file - do not edit.
//
// Generated from boutique.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// / SYSCOHADA SMT regime (A/B/C) — drives annual cash-turnover ceiling.
/// / UI shows BusinessClassification rows, not these labels.
/// / A = negoce (≤60M CFA), B = artisanat (≤40M), C = services (≤30M).
class CommerceTypePb extends $pb.ProtobufEnum {
  static const CommerceTypePb unknown =
      CommerceTypePb._(0, _omitEnumNames ? '' : 'unknown');
  static const CommerceTypePb negoce =
      CommerceTypePb._(1, _omitEnumNames ? '' : 'negoce');
  static const CommerceTypePb artisanat =
      CommerceTypePb._(2, _omitEnumNames ? '' : 'artisanat');
  static const CommerceTypePb services =
      CommerceTypePb._(3, _omitEnumNames ? '' : 'services');

  static const $core.List<CommerceTypePb> values = <CommerceTypePb>[
    unknown,
    negoce,
    artisanat,
    services,
  ];

  static final $core.List<CommerceTypePb?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static CommerceTypePb? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CommerceTypePb._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
