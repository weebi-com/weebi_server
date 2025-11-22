// This is a generated file - do not edit.
//
// Generated from weebi_app_service.proto.

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

import 'weebi_app_service.pb.dart' as $0;

export 'weebi_app_service.pb.dart';

@$pb.GrpcServiceName('weebi.weebi_app.service.WeebiAppService')
class WeebiAppServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  WeebiAppServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.AppMinVersionResponse> readAppMinimumVersion(
    $0.AppMinVersionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readAppMinimumVersion, request, options: options);
  }

  // method descriptors

  static final _$readAppMinimumVersion =
      $grpc.ClientMethod<$0.AppMinVersionRequest, $0.AppMinVersionResponse>(
          '/weebi.weebi_app.service.WeebiAppService/readAppMinimumVersion',
          ($0.AppMinVersionRequest value) => value.writeToBuffer(),
          $0.AppMinVersionResponse.fromBuffer);
}

@$pb.GrpcServiceName('weebi.weebi_app.service.WeebiAppService')
abstract class WeebiAppServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.weebi_app.service.WeebiAppService';

  WeebiAppServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.AppMinVersionRequest, $0.AppMinVersionResponse>(
            'readAppMinimumVersion',
            readAppMinimumVersion_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AppMinVersionRequest.fromBuffer(value),
            ($0.AppMinVersionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AppMinVersionResponse> readAppMinimumVersion_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AppMinVersionRequest> $request) async {
    return readAppMinimumVersion($call, await $request);
  }

  $async.Future<$0.AppMinVersionResponse> readAppMinimumVersion(
      $grpc.ServiceCall call, $0.AppMinVersionRequest request);
}
