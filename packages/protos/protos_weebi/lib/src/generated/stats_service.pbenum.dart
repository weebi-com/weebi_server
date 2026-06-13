//
//  Generated code. Do not modify.
//  source: stats_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ChartTimePeriod extends $pb.ProtobufEnum {
  static const ChartTimePeriod DAY = ChartTimePeriod._(0, _omitEnumNames ? '' : 'DAY');
  static const ChartTimePeriod WEEK = ChartTimePeriod._(1, _omitEnumNames ? '' : 'WEEK');
  static const ChartTimePeriod MONTH = ChartTimePeriod._(2, _omitEnumNames ? '' : 'MONTH');

  static const $core.List<ChartTimePeriod> values = <ChartTimePeriod> [
    DAY,
    WEEK,
    MONTH,
  ];

  static final $core.Map<$core.int, ChartTimePeriod> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChartTimePeriod? valueOf($core.int value) => _byValue[value];

  const ChartTimePeriod._($core.int v, $core.String n) : super(v, n);
}

class FinancialChartMetric extends $pb.ProtobufEnum {
  static const FinancialChartMetric CASHFLOW_INCOME = FinancialChartMetric._(0, _omitEnumNames ? '' : 'CASHFLOW_INCOME');
  static const FinancialChartMetric CASHFLOW_SPENDING = FinancialChartMetric._(1, _omitEnumNames ? '' : 'CASHFLOW_SPENDING');
  static const FinancialChartMetric ALL_INCOME = FinancialChartMetric._(2, _omitEnumNames ? '' : 'ALL_INCOME');
  static const FinancialChartMetric ALL_SPENDING = FinancialChartMetric._(3, _omitEnumNames ? '' : 'ALL_SPENDING');

  static const $core.List<FinancialChartMetric> values = <FinancialChartMetric> [
    CASHFLOW_INCOME,
    CASHFLOW_SPENDING,
    ALL_INCOME,
    ALL_SPENDING,
  ];

  static final $core.Map<$core.int, FinancialChartMetric> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FinancialChartMetric? valueOf($core.int value) => _byValue[value];

  const FinancialChartMetric._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
