//
//  Generated code. Do not modify.
//  source: ticket/ticket.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TicketPb_PaymentTypePb extends $pb.ProtobufEnum {
  static const TicketPb_PaymentTypePb unknown = TicketPb_PaymentTypePb._(0, _omitEnumNames ? '' : 'unknown');
  static const TicketPb_PaymentTypePb cash = TicketPb_PaymentTypePb._(1, _omitEnumNames ? '' : 'cash');
  static const TicketPb_PaymentTypePb nope = TicketPb_PaymentTypePb._(2, _omitEnumNames ? '' : 'nope');
  static const TicketPb_PaymentTypePb mobileMoney = TicketPb_PaymentTypePb._(3, _omitEnumNames ? '' : 'mobileMoney');
  static const TicketPb_PaymentTypePb cheque = TicketPb_PaymentTypePb._(4, _omitEnumNames ? '' : 'cheque');
  static const TicketPb_PaymentTypePb creditCard = TicketPb_PaymentTypePb._(5, _omitEnumNames ? '' : 'creditCard');
  static const TicketPb_PaymentTypePb goods = TicketPb_PaymentTypePb._(6, _omitEnumNames ? '' : 'goods');

  static const $core.List<TicketPb_PaymentTypePb> values = <TicketPb_PaymentTypePb> [
    unknown,
    cash,
    nope,
    mobileMoney,
    cheque,
    creditCard,
    goods,
  ];

  static final $core.Map<$core.int, TicketPb_PaymentTypePb> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TicketPb_PaymentTypePb? valueOf($core.int value) => _byValue[value];

  const TicketPb_PaymentTypePb._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
