//
//  Generated code. Do not modify.
//  source: license.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// / License plan tiers. Maps to payment provider products.
class LicensePlan extends $pb.ProtobufEnum {
  static const LicensePlan LICENSE_PLAN_UNKNOWN = LicensePlan._(0, _omitEnumNames ? '' : 'LICENSE_PLAN_UNKNOWN');
  static const LicensePlan SOLO = LicensePlan._(1, _omitEnumNames ? '' : 'SOLO');
  static const LicensePlan TRIO = LicensePlan._(2, _omitEnumNames ? '' : 'TRIO');
  static const LicensePlan PRO = LicensePlan._(3, _omitEnumNames ? '' : 'PRO');

  static const $core.List<LicensePlan> values = <LicensePlan> [
    LICENSE_PLAN_UNKNOWN,
    SOLO,
    TRIO,
    PRO,
  ];

  static final $core.Map<$core.int, LicensePlan> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LicensePlan? valueOf($core.int value) => _byValue[value];

  const LicensePlan._($core.int v, $core.String n) : super(v, n);
}

/// / Payment provider that processed the purchase.
class PaymentProvider extends $pb.ProtobufEnum {
  static const PaymentProvider PAYMENT_PROVIDER_UNKNOWN = PaymentProvider._(0, _omitEnumNames ? '' : 'PAYMENT_PROVIDER_UNKNOWN');
  static const PaymentProvider PAYMENT_PROVIDER_STRIPE = PaymentProvider._(1, _omitEnumNames ? '' : 'PAYMENT_PROVIDER_STRIPE');
  static const PaymentProvider PAYMENT_PROVIDER_PAWAPAY = PaymentProvider._(2, _omitEnumNames ? '' : 'PAYMENT_PROVIDER_PAWAPAY');

  static const $core.List<PaymentProvider> values = <PaymentProvider> [
    PAYMENT_PROVIDER_UNKNOWN,
    PAYMENT_PROVIDER_STRIPE,
    PAYMENT_PROVIDER_PAWAPAY,
  ];

  static final $core.Map<$core.int, PaymentProvider> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PaymentProvider? valueOf($core.int value) => _byValue[value];

  const PaymentProvider._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
