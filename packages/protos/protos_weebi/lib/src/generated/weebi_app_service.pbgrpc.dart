//
//  Generated code. Do not modify.
//  source: weebi_app_service.proto
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

import 'weebi_app_service.pb.dart' as $16;

export 'weebi_app_service.pb.dart';

@$pb.GrpcServiceName('weebi.weebi_app.service.WeebiAppService')
class WeebiAppServiceClient extends $grpc.Client {
  static final _$readAppMinimumVersion = $grpc.ClientMethod<$16.AppMinVersionRequest, $16.AppMinVersionResponse>(
      '/weebi.weebi_app.service.WeebiAppService/readAppMinimumVersion',
      ($16.AppMinVersionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $16.AppMinVersionResponse.fromBuffer(value));

  WeebiAppServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$16.AppMinVersionResponse> readAppMinimumVersion($16.AppMinVersionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAppMinimumVersion, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.weebi_app.service.WeebiAppService')
abstract class WeebiAppServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.weebi_app.service.WeebiAppService';

  WeebiAppServiceBase() {
    $addMethod($grpc.ServiceMethod<$16.AppMinVersionRequest, $16.AppMinVersionResponse>(
        'readAppMinimumVersion',
        readAppMinimumVersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $16.AppMinVersionRequest.fromBuffer(value),
        ($16.AppMinVersionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$16.AppMinVersionResponse> readAppMinimumVersion_Pre($grpc.ServiceCall call, $async.Future<$16.AppMinVersionRequest> request) async {
    return readAppMinimumVersion(call, await request);
  }

  $async.Future<$16.AppMinVersionResponse> readAppMinimumVersion($grpc.ServiceCall call, $16.AppMinVersionRequest request);
}
