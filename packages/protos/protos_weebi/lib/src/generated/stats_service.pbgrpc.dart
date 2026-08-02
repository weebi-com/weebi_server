// This is a generated file - do not edit.
//
// Generated from stats_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'stats_service.pb.dart' as $0;

export 'stats_service.pb.dart';

@$pb.GrpcServiceName('weebi.stats.service.StatsService')
class StatsServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  StatsServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.FinancialChartResponse> getFinancialChart(
    $0.FinancialChartRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getFinancialChart, request, options: options);
  }

  // method descriptors

  static final _$getFinancialChart =
      $grpc.ClientMethod<$0.FinancialChartRequest, $0.FinancialChartResponse>(
          '/weebi.stats.service.StatsService/getFinancialChart',
          ($0.FinancialChartRequest value) => value.writeToBuffer(),
          $0.FinancialChartResponse.fromBuffer);
}

@$pb.GrpcServiceName('weebi.stats.service.StatsService')
abstract class StatsServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.stats.service.StatsService';

  StatsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FinancialChartRequest,
            $0.FinancialChartResponse>(
        'getFinancialChart',
        getFinancialChart_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FinancialChartRequest.fromBuffer(value),
        ($0.FinancialChartResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.FinancialChartResponse> getFinancialChart_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FinancialChartRequest> $request) async {
    return getFinancialChart($call, await $request);
  }

  $async.Future<$0.FinancialChartResponse> getFinancialChart(
      $grpc.ServiceCall call, $0.FinancialChartRequest request);
}
