//
//  Generated code. Do not modify.
//  source: g_common.proto
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

import 'common/empty.pb.dart' as $4;
import 'g_common.pb.dart' as $9;

export 'g_common.pb.dart';

@$pb.GrpcServiceName('google.retail.common.pb.Status')
class StatusClient extends $grpc.Client {
  static final _$get = $grpc.ClientMethod<$4.Empty, $9.HealthCheckResponse>(
      '/google.retail.common.pb.Status/Get',
      ($4.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.HealthCheckResponse.fromBuffer(value));

  StatusClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$9.HealthCheckResponse> get($4.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }
}

@$pb.GrpcServiceName('google.retail.common.pb.Status')
abstract class StatusServiceBase extends $grpc.Service {
  $core.String get $name => 'google.retail.common.pb.Status';

  StatusServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.Empty, $9.HealthCheckResponse>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.Empty.fromBuffer(value),
        ($9.HealthCheckResponse value) => value.writeToBuffer()));
  }

  $async.Future<$9.HealthCheckResponse> get_Pre($grpc.ServiceCall call, $async.Future<$4.Empty> request) async {
    return get(call, await request);
  }

  $async.Future<$9.HealthCheckResponse> get($grpc.ServiceCall call, $4.Empty request);
}
