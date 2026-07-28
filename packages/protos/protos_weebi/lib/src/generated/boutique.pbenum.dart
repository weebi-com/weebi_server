//
//  Generated code. Do not modify.
//  source: boutique.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// / SYSCOHADA SMT regime (A/B/C) — drives annual cash-turnover ceiling.
/// / UI shows BusinessClassification rows, not these labels.
/// / A = negoce (≤60M CFA), B = artisanat (≤40M), C = services (≤30M).
class CommerceTypePb extends $pb.ProtobufEnum {
  static const CommerceTypePb unknown = CommerceTypePb._(0, _omitEnumNames ? '' : 'unknown');
  static const CommerceTypePb negoce = CommerceTypePb._(1, _omitEnumNames ? '' : 'negoce');
  static const CommerceTypePb artisanat = CommerceTypePb._(2, _omitEnumNames ? '' : 'artisanat');
  static const CommerceTypePb services = CommerceTypePb._(3, _omitEnumNames ? '' : 'services');

  static const $core.List<CommerceTypePb> values = <CommerceTypePb> [
    unknown,
    negoce,
    artisanat,
    services,
  ];

  static final $core.Map<$core.int, CommerceTypePb> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CommerceTypePb? valueOf($core.int value) => _byValue[value];

  const CommerceTypePb._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
