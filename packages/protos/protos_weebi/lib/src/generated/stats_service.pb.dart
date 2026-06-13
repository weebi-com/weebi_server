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

import 'common/g_timestamp.pb.dart' as $20;
import 'stats_service.pbenum.dart';

export 'stats_service.pbenum.dart';

class FinancialChartRequest extends $pb.GeneratedMessage {
  factory FinancialChartRequest({
    $core.String? firmId,
    $core.Iterable<$core.String>? boutiqueIds,
    $20.Timestamp? start,
    $20.Timestamp? end,
    ChartTimePeriod? timePeriod,
    FinancialChartMetric? metric,
    $core.bool? stackedByBoutique,
  }) {
    final result = create();
    if (firmId != null) {
      result.firmId = firmId;
    }
    if (boutiqueIds != null) {
      result.boutiqueIds.addAll(boutiqueIds);
    }
    if (start != null) {
      result.start = start;
    }
    if (end != null) {
      result.end = end;
    }
    if (timePeriod != null) {
      result.timePeriod = timePeriod;
    }
    if (metric != null) {
      result.metric = metric;
    }
    if (stackedByBoutique != null) {
      result.stackedByBoutique = stackedByBoutique;
    }
    return result;
  }
  FinancialChartRequest._() : super();
  factory FinancialChartRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FinancialChartRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FinancialChartRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.stats.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..pPS(2, _omitFieldNames ? '' : 'boutiqueIds', protoName: 'boutiqueIds')
    ..aOM<$20.Timestamp>(3, _omitFieldNames ? '' : 'start', subBuilder: $20.Timestamp.create)
    ..aOM<$20.Timestamp>(4, _omitFieldNames ? '' : 'end', subBuilder: $20.Timestamp.create)
    ..e<ChartTimePeriod>(5, _omitFieldNames ? '' : 'timePeriod', $pb.PbFieldType.OE, protoName: 'timePeriod', defaultOrMaker: ChartTimePeriod.DAY, valueOf: ChartTimePeriod.valueOf, enumValues: ChartTimePeriod.values)
    ..e<FinancialChartMetric>(6, _omitFieldNames ? '' : 'metric', $pb.PbFieldType.OE, defaultOrMaker: FinancialChartMetric.CASHFLOW_INCOME, valueOf: FinancialChartMetric.valueOf, enumValues: FinancialChartMetric.values)
    ..aOB(7, _omitFieldNames ? '' : 'stackedByBoutique', protoName: 'stackedByBoutique')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FinancialChartRequest clone() => FinancialChartRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FinancialChartRequest copyWith(void Function(FinancialChartRequest) updates) => super.copyWith((message) => updates(message as FinancialChartRequest)) as FinancialChartRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinancialChartRequest create() => FinancialChartRequest._();
  FinancialChartRequest createEmptyInstance() => create();
  static $pb.PbList<FinancialChartRequest> createRepeated() => $pb.PbList<FinancialChartRequest>();
  @$core.pragma('dart2js:noInline')
  static FinancialChartRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FinancialChartRequest>(create);
  static FinancialChartRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get boutiqueIds => $_getList(1);

  @$pb.TagNumber(3)
  $20.Timestamp get start => $_getN(2);
  @$pb.TagNumber(3)
  set start($20.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStart() => $_has(2);
  @$pb.TagNumber(3)
  void clearStart() => clearField(3);
  @$pb.TagNumber(3)
  $20.Timestamp ensureStart() => $_ensure(2);

  @$pb.TagNumber(4)
  $20.Timestamp get end => $_getN(3);
  @$pb.TagNumber(4)
  set end($20.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnd() => clearField(4);
  @$pb.TagNumber(4)
  $20.Timestamp ensureEnd() => $_ensure(3);

  @$pb.TagNumber(5)
  ChartTimePeriod get timePeriod => $_getN(4);
  @$pb.TagNumber(5)
  set timePeriod(ChartTimePeriod v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimePeriod() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimePeriod() => clearField(5);

  @$pb.TagNumber(6)
  FinancialChartMetric get metric => $_getN(5);
  @$pb.TagNumber(6)
  set metric(FinancialChartMetric v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasMetric() => $_has(5);
  @$pb.TagNumber(6)
  void clearMetric() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get stackedByBoutique => $_getBF(6);
  @$pb.TagNumber(7)
  set stackedByBoutique($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStackedByBoutique() => $_has(6);
  @$pb.TagNumber(7)
  void clearStackedByBoutique() => clearField(7);
}

class FinancialChartResponse extends $pb.GeneratedMessage {
  factory FinancialChartResponse({
    $core.String? svgContent,
  }) {
    final result = create();
    if (svgContent != null) {
      result.svgContent = svgContent;
    }
    return result;
  }
  FinancialChartResponse._() : super();
  factory FinancialChartResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FinancialChartResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FinancialChartResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.stats.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'svgContent', protoName: 'svgContent')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FinancialChartResponse clone() => FinancialChartResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FinancialChartResponse copyWith(void Function(FinancialChartResponse) updates) => super.copyWith((message) => updates(message as FinancialChartResponse)) as FinancialChartResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinancialChartResponse create() => FinancialChartResponse._();
  FinancialChartResponse createEmptyInstance() => create();
  static $pb.PbList<FinancialChartResponse> createRepeated() => $pb.PbList<FinancialChartResponse>();
  @$core.pragma('dart2js:noInline')
  static FinancialChartResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FinancialChartResponse>(create);
  static FinancialChartResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get svgContent => $_getSZ(0);
  @$pb.TagNumber(1)
  set svgContent($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSvgContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearSvgContent() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
