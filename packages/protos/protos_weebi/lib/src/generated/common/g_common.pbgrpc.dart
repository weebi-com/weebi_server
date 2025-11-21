// This is a generated file - do not edit.
//
// Generated from common/g_common.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'empty.pb.dart' as $0;
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

  StatusClient(super.channel, {super.options, super.interceptors});

  ///
  ///  Gets service status
  $grpc.ResponseFuture<$1.HealthCheckResponse> get(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$get, request, options: options);
  }

  // method descriptors

  static final _$get = $grpc.ClientMethod<$0.Empty, $1.HealthCheckResponse>(
      '/google.retail.common.Status/Get',
      ($0.Empty value) => value.writeToBuffer(),
      $1.HealthCheckResponse.fromBuffer);
}

@$pb.GrpcServiceName('google.retail.common.Status')
abstract class StatusServiceBase extends $grpc.Service {
  $core.String get $name => 'google.retail.common.Status';

  StatusServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.HealthCheckResponse>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.HealthCheckResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.HealthCheckResponse> get_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return get($call, await $request);
  }

  $async.Future<$1.HealthCheckResponse> get(
      $grpc.ServiceCall call, $0.Empty request);
}
