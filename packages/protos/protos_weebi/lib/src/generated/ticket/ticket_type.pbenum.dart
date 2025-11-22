// This is a generated file - do not edit.
//
// Generated from ticket/ticket_type.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TicketTypePb extends $pb.ProtobufEnum {
  static const TicketTypePb unknown =
      TicketTypePb._(0, _omitEnumNames ? '' : 'unknown');
  static const TicketTypePb sell =
      TicketTypePb._(1, _omitEnumNames ? '' : 'sell');
  static const TicketTypePb sellDeferred =
      TicketTypePb._(2, _omitEnumNames ? '' : 'sellDeferred');
  static const TicketTypePb sellCovered =
      TicketTypePb._(3, _omitEnumNames ? '' : 'sellCovered');
  static const TicketTypePb spend =
      TicketTypePb._(4, _omitEnumNames ? '' : 'spend');
  static const TicketTypePb spendDeferred =
      TicketTypePb._(5, _omitEnumNames ? '' : 'spendDeferred');
  static const TicketTypePb spendCovered =
      TicketTypePb._(6, _omitEnumNames ? '' : 'spendCovered');
  static const TicketTypePb stockIn =
      TicketTypePb._(7, _omitEnumNames ? '' : 'stockIn');
  static const TicketTypePb stockOut =
      TicketTypePb._(8, _omitEnumNames ? '' : 'stockOut');
  static const TicketTypePb inventory =
      TicketTypePb._(9, _omitEnumNames ? '' : 'inventory');
  static const TicketTypePb wage =
      TicketTypePb._(10, _omitEnumNames ? '' : 'wage');

  static const $core.List<TicketTypePb> values = <TicketTypePb>[
    unknown,
    sell,
    sellDeferred,
    sellCovered,
    spend,
    spendDeferred,
    spendCovered,
    stockIn,
    stockOut,
    inventory,
    wage,
  ];

  static final $core.List<TicketTypePb?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static TicketTypePb? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TicketTypePb._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
