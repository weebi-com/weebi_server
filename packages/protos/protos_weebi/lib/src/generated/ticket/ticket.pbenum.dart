// This is a generated file - do not edit.
//
// Generated from ticket/ticket.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TicketPb_PaymentTypePb extends $pb.ProtobufEnum {
  static const TicketPb_PaymentTypePb unknown =
      TicketPb_PaymentTypePb._(0, _omitEnumNames ? '' : 'unknown');
  static const TicketPb_PaymentTypePb cash =
      TicketPb_PaymentTypePb._(1, _omitEnumNames ? '' : 'cash');
  static const TicketPb_PaymentTypePb nope =
      TicketPb_PaymentTypePb._(2, _omitEnumNames ? '' : 'nope');
  static const TicketPb_PaymentTypePb mobileMoney =
      TicketPb_PaymentTypePb._(3, _omitEnumNames ? '' : 'mobileMoney');
  static const TicketPb_PaymentTypePb cheque =
      TicketPb_PaymentTypePb._(4, _omitEnumNames ? '' : 'cheque');
  static const TicketPb_PaymentTypePb creditCard =
      TicketPb_PaymentTypePb._(5, _omitEnumNames ? '' : 'creditCard');
  static const TicketPb_PaymentTypePb goods =
      TicketPb_PaymentTypePb._(6, _omitEnumNames ? '' : 'goods');

  static const $core.List<TicketPb_PaymentTypePb> values =
      <TicketPb_PaymentTypePb>[
    unknown,
    cash,
    nope,
    mobileMoney,
    cheque,
    creditCard,
    goods,
  ];

  static final $core.List<TicketPb_PaymentTypePb?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static TicketPb_PaymentTypePb? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TicketPb_PaymentTypePb._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
