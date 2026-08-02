// This is a generated file - do not edit.
//
// Generated from license.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// / License plan tiers. Maps to payment provider products (billing_products).
class LicensePlan extends $pb.ProtobufEnum {
  static const LicensePlan LICENSE_PLAN_UNKNOWN =
      LicensePlan._(0, _omitEnumNames ? '' : 'LICENSE_PLAN_UNKNOWN');
  static const LicensePlan ENTERPRISE =
      LicensePlan._(1, _omitEnumNames ? '' : 'ENTERPRISE');
  static const LicensePlan PREMIUM =
      LicensePlan._(2, _omitEnumNames ? '' : 'PREMIUM');

  static const $core.List<LicensePlan> values = <LicensePlan>[
    LICENSE_PLAN_UNKNOWN,
    ENTERPRISE,
    PREMIUM,
  ];

  static final $core.List<LicensePlan?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static LicensePlan? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LicensePlan._(super.value, super.name);
}

/// / Payment provider that processed the purchase.
class PaymentProvider extends $pb.ProtobufEnum {
  static const PaymentProvider PAYMENT_PROVIDER_UNKNOWN =
      PaymentProvider._(0, _omitEnumNames ? '' : 'PAYMENT_PROVIDER_UNKNOWN');
  static const PaymentProvider PAYMENT_PROVIDER_STRIPE =
      PaymentProvider._(1, _omitEnumNames ? '' : 'PAYMENT_PROVIDER_STRIPE');
  static const PaymentProvider PAYMENT_PROVIDER_PAWAPAY =
      PaymentProvider._(2, _omitEnumNames ? '' : 'PAYMENT_PROVIDER_PAWAPAY');

  static const $core.List<PaymentProvider> values = <PaymentProvider>[
    PAYMENT_PROVIDER_UNKNOWN,
    PAYMENT_PROVIDER_STRIPE,
    PAYMENT_PROVIDER_PAWAPAY,
  ];

  static final $core.List<PaymentProvider?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static PaymentProvider? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PaymentProvider._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
