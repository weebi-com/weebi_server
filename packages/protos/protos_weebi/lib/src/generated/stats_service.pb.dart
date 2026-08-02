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

import 'common/g_timestamp.pb.dart' as $1;
import 'stats_service.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'stats_service.pbenum.dart';

class FinancialChartRequest extends $pb.GeneratedMessage {
  factory FinancialChartRequest({
    $core.String? firmId,
    $core.Iterable<$core.String>? boutiqueIds,
    $1.Timestamp? start,
    $1.Timestamp? end,
    ChartTimePeriod? timePeriod,
    FinancialChartMetric? metric,
    $core.bool? stackedByBoutique,
  }) {
    final result = create();
    if (firmId != null) result.firmId = firmId;
    if (boutiqueIds != null) result.boutiqueIds.addAll(boutiqueIds);
    if (start != null) result.start = start;
    if (end != null) result.end = end;
    if (timePeriod != null) result.timePeriod = timePeriod;
    if (metric != null) result.metric = metric;
    if (stackedByBoutique != null) result.stackedByBoutique = stackedByBoutique;
    return result;
  }

  FinancialChartRequest._();

  factory FinancialChartRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinancialChartRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinancialChartRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.stats.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..pPS(2, _omitFieldNames ? '' : 'boutiqueIds', protoName: 'boutiqueIds')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'start',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'end',
        subBuilder: $1.Timestamp.create)
    ..aE<ChartTimePeriod>(5, _omitFieldNames ? '' : 'timePeriod',
        protoName: 'timePeriod', enumValues: ChartTimePeriod.values)
    ..aE<FinancialChartMetric>(6, _omitFieldNames ? '' : 'metric',
        enumValues: FinancialChartMetric.values)
    ..aOB(7, _omitFieldNames ? '' : 'stackedByBoutique',
        protoName: 'stackedByBoutique')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinancialChartRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinancialChartRequest copyWith(
          void Function(FinancialChartRequest) updates) =>
      super.copyWith((message) => updates(message as FinancialChartRequest))
          as FinancialChartRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinancialChartRequest create() => FinancialChartRequest._();
  @$core.override
  FinancialChartRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinancialChartRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinancialChartRequest>(create);
  static FinancialChartRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get boutiqueIds => $_getList(1);

  @$pb.TagNumber(3)
  $1.Timestamp get start => $_getN(2);
  @$pb.TagNumber(3)
  set start($1.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStart() => $_has(2);
  @$pb.TagNumber(3)
  void clearStart() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureStart() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Timestamp get end => $_getN(3);
  @$pb.TagNumber(4)
  set end($1.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnd() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureEnd() => $_ensure(3);

  @$pb.TagNumber(5)
  ChartTimePeriod get timePeriod => $_getN(4);
  @$pb.TagNumber(5)
  set timePeriod(ChartTimePeriod value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTimePeriod() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimePeriod() => $_clearField(5);

  @$pb.TagNumber(6)
  FinancialChartMetric get metric => $_getN(5);
  @$pb.TagNumber(6)
  set metric(FinancialChartMetric value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasMetric() => $_has(5);
  @$pb.TagNumber(6)
  void clearMetric() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get stackedByBoutique => $_getBF(6);
  @$pb.TagNumber(7)
  set stackedByBoutique($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStackedByBoutique() => $_has(6);
  @$pb.TagNumber(7)
  void clearStackedByBoutique() => $_clearField(7);
}

class FinancialChartResponse extends $pb.GeneratedMessage {
  factory FinancialChartResponse({
    $core.String? svgContent,
  }) {
    final result = create();
    if (svgContent != null) result.svgContent = svgContent;
    return result;
  }

  FinancialChartResponse._();

  factory FinancialChartResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinancialChartResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinancialChartResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.stats.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'svgContent', protoName: 'svgContent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinancialChartResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinancialChartResponse copyWith(
          void Function(FinancialChartResponse) updates) =>
      super.copyWith((message) => updates(message as FinancialChartResponse))
          as FinancialChartResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinancialChartResponse create() => FinancialChartResponse._();
  @$core.override
  FinancialChartResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinancialChartResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinancialChartResponse>(create);
  static FinancialChartResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get svgContent => $_getSZ(0);
  @$pb.TagNumber(1)
  set svgContent($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSvgContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearSvgContent() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
