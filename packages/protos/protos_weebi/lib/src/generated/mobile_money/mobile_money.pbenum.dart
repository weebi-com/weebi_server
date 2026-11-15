// This is a generated file - do not edit.
//
// Generated from mobile_money/mobile_money.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MobileMoneyOperatorPb_LogoExtensionPb extends $pb.ProtobufEnum {
  static const MobileMoneyOperatorPb_LogoExtensionPb unknown =
      MobileMoneyOperatorPb_LogoExtensionPb._(
          0, _omitEnumNames ? '' : 'unknown');
  static const MobileMoneyOperatorPb_LogoExtensionPb png =
      MobileMoneyOperatorPb_LogoExtensionPb._(1, _omitEnumNames ? '' : 'png');
  static const MobileMoneyOperatorPb_LogoExtensionPb jpeg =
      MobileMoneyOperatorPb_LogoExtensionPb._(2, _omitEnumNames ? '' : 'jpeg');

  static const $core.List<MobileMoneyOperatorPb_LogoExtensionPb> values =
      <MobileMoneyOperatorPb_LogoExtensionPb>[
    unknown,
    png,
    jpeg,
  ];

  static final $core.List<MobileMoneyOperatorPb_LogoExtensionPb?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static MobileMoneyOperatorPb_LogoExtensionPb? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MobileMoneyOperatorPb_LogoExtensionPb._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
