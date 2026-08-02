// This is a generated file - do not edit.
//
// Generated from stats_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ChartTimePeriod extends $pb.ProtobufEnum {
  static const ChartTimePeriod DAY =
      ChartTimePeriod._(0, _omitEnumNames ? '' : 'DAY');
  static const ChartTimePeriod WEEK =
      ChartTimePeriod._(1, _omitEnumNames ? '' : 'WEEK');
  static const ChartTimePeriod MONTH =
      ChartTimePeriod._(2, _omitEnumNames ? '' : 'MONTH');

  static const $core.List<ChartTimePeriod> values = <ChartTimePeriod>[
    DAY,
    WEEK,
    MONTH,
  ];

  static final $core.List<ChartTimePeriod?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ChartTimePeriod? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChartTimePeriod._(super.value, super.name);
}

class FinancialChartMetric extends $pb.ProtobufEnum {
  static const FinancialChartMetric CASHFLOW_INCOME =
      FinancialChartMetric._(0, _omitEnumNames ? '' : 'CASHFLOW_INCOME');
  static const FinancialChartMetric CASHFLOW_SPENDING =
      FinancialChartMetric._(1, _omitEnumNames ? '' : 'CASHFLOW_SPENDING');
  static const FinancialChartMetric ALL_INCOME =
      FinancialChartMetric._(2, _omitEnumNames ? '' : 'ALL_INCOME');
  static const FinancialChartMetric ALL_SPENDING =
      FinancialChartMetric._(3, _omitEnumNames ? '' : 'ALL_SPENDING');

  static const $core.List<FinancialChartMetric> values = <FinancialChartMetric>[
    CASHFLOW_INCOME,
    CASHFLOW_SPENDING,
    ALL_INCOME,
    ALL_SPENDING,
  ];

  static final $core.List<FinancialChartMetric?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static FinancialChartMetric? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FinancialChartMetric._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
