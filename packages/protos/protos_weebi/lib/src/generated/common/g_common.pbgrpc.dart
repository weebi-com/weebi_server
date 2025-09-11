//
//  Generated code. Do not modify.
//  source: common/g_common.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'empty.pb.dart' as $5;
import 'g_common.pb.dart' as $1;

export 'g_common.pb.dart';

@$pb.GrpcServiceName('google.retail.common.Status')
class StatusClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  static final _$get = $grpc.ClientMethod<$5.Empty, $1.HealthCheckResponse>(
      '/google.retail.common.Status/Get',
      ($5.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.HealthCheckResponse.fromBuffer(value));

  StatusClient(super.channel, {super.options, super.interceptors});

  ///
  ///  Gets service status
  $grpc.ResponseFuture<$1.HealthCheckResponse> get($5.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }
}

@$pb.GrpcServiceName('google.retail.common.Status')
abstract class StatusServiceBase extends $grpc.Service {
  $core.String get $name => 'google.retail.common.Status';

  StatusServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.Empty, $1.HealthCheckResponse>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.Empty.fromBuffer(value),
        ($1.HealthCheckResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.HealthCheckResponse> get_Pre($grpc.ServiceCall $call, $async.Future<$5.Empty> $request) async {
    return get($call, await $request);
  }

  $async.Future<$1.HealthCheckResponse> get($grpc.ServiceCall call, $5.Empty request);
}
