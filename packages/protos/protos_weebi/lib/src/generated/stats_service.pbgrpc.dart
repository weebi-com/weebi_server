//
//  Generated code. Do not modify.
//  source: stats_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'stats_service.pb.dart' as $15;

export 'stats_service.pb.dart';

@$pb.GrpcServiceName('weebi.stats.service.StatsService')
class StatsServiceClient extends $grpc.Client {
  static final _$getFinancialChart = $grpc.ClientMethod<$15.FinancialChartRequest, $15.FinancialChartResponse>(
      '/weebi.stats.service.StatsService/getFinancialChart',
      ($15.FinancialChartRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $15.FinancialChartResponse.fromBuffer(value));

  StatsServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$15.FinancialChartResponse> getFinancialChart($15.FinancialChartRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFinancialChart, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.stats.service.StatsService')
abstract class StatsServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.stats.service.StatsService';

  StatsServiceBase() {
    $addMethod($grpc.ServiceMethod<$15.FinancialChartRequest, $15.FinancialChartResponse>(
        'getFinancialChart',
        getFinancialChart_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.FinancialChartRequest.fromBuffer(value),
        ($15.FinancialChartResponse value) => value.writeToBuffer()));
  }

  $async.Future<$15.FinancialChartResponse> getFinancialChart_Pre($grpc.ServiceCall call, $async.Future<$15.FinancialChartRequest> request) async {
    return getFinancialChart(call, await request);
  }

  $async.Future<$15.FinancialChartResponse> getFinancialChart($grpc.ServiceCall call, $15.FinancialChartRequest request);
}
