//
//  Generated code. Do not modify.
//  source: stats_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chartTimePeriodDescriptor instead')
const ChartTimePeriod$json = {
  '1': 'ChartTimePeriod',
  '2': [
    {'1': 'DAY', '2': 0},
    {'1': 'WEEK', '2': 1},
    {'1': 'MONTH', '2': 2},
  ],
};

/// Descriptor for `ChartTimePeriod`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List chartTimePeriodDescriptor = $convert.base64Decode(
    'Cg9DaGFydFRpbWVQZXJpb2QSBwoDREFZEAASCAoEV0VFSxABEgkKBU1PTlRIEAI=');

@$core.Deprecated('Use financialChartMetricDescriptor instead')
const FinancialChartMetric$json = {
  '1': 'FinancialChartMetric',
  '2': [
    {'1': 'CASHFLOW_INCOME', '2': 0},
    {'1': 'CASHFLOW_SPENDING', '2': 1},
    {'1': 'ALL_INCOME', '2': 2},
    {'1': 'ALL_SPENDING', '2': 3},
  ],
};

/// Descriptor for `FinancialChartMetric`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List financialChartMetricDescriptor = $convert.base64Decode(
    'ChRGaW5hbmNpYWxDaGFydE1ldHJpYxITCg9DQVNIRkxPV19JTkNPTUUQABIVChFDQVNIRkxPV1'
    '9TUEVORElORxABEg4KCkFMTF9JTkNPTUUQAhIQCgxBTExfU1BFTkRJTkcQAw==');

@$core.Deprecated('Use financialChartRequestDescriptor instead')
const FinancialChartRequest$json = {
  '1': 'FinancialChartRequest',
  '2': [
    {'1': 'firmId', '3': 1, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'boutiqueIds', '3': 2, '4': 3, '5': 9, '10': 'boutiqueIds'},
    {'1': 'start', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'start'},
    {'1': 'end', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'end'},
    {'1': 'timePeriod', '3': 5, '4': 1, '5': 14, '6': '.weebi.stats.service.ChartTimePeriod', '10': 'timePeriod'},
    {'1': 'metric', '3': 6, '4': 1, '5': 14, '6': '.weebi.stats.service.FinancialChartMetric', '10': 'metric'},
    {'1': 'stackedByBoutique', '3': 7, '4': 1, '5': 8, '10': 'stackedByBoutique'},
  ],
};

/// Descriptor for `FinancialChartRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List financialChartRequestDescriptor = $convert.base64Decode(
    'ChVGaW5hbmNpYWxDaGFydFJlcXVlc3QSFgoGZmlybUlkGAEgASgJUgZmaXJtSWQSIAoLYm91dG'
    'lxdWVJZHMYAiADKAlSC2JvdXRpcXVlSWRzEjAKBXN0YXJ0GAMgASgLMhouZ29vZ2xlLnByb3Rv'
    'YnVmLlRpbWVzdGFtcFIFc3RhcnQSLAoDZW5kGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbW'
    'VzdGFtcFIDZW5kEkQKCnRpbWVQZXJpb2QYBSABKA4yJC53ZWViaS5zdGF0cy5zZXJ2aWNlLkNo'
    'YXJ0VGltZVBlcmlvZFIKdGltZVBlcmlvZBJBCgZtZXRyaWMYBiABKA4yKS53ZWViaS5zdGF0cy'
    '5zZXJ2aWNlLkZpbmFuY2lhbENoYXJ0TWV0cmljUgZtZXRyaWMSLAoRc3RhY2tlZEJ5Qm91dGlx'
    'dWUYByABKAhSEXN0YWNrZWRCeUJvdXRpcXVl');

@$core.Deprecated('Use financialChartResponseDescriptor instead')
const FinancialChartResponse$json = {
  '1': 'FinancialChartResponse',
  '2': [
    {'1': 'svgContent', '3': 1, '4': 1, '5': 9, '10': 'svgContent'},
  ],
};

/// Descriptor for `FinancialChartResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List financialChartResponseDescriptor = $convert.base64Decode(
    'ChZGaW5hbmNpYWxDaGFydFJlc3BvbnNlEh4KCnN2Z0NvbnRlbnQYASABKAlSCnN2Z0NvbnRlbn'
    'Q=');

