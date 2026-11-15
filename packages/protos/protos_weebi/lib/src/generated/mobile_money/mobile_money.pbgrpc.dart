// This is a generated file - do not edit.
//
// Generated from mobile_money/mobile_money.proto.

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

import 'mobile_money.pb.dart' as $0;

export 'mobile_money.pb.dart';

/// / Global catalog. Not chain-scoped.
@$pb.GrpcServiceName('weebi.mobile_money.service.MobileMoneyService')
class MobileMoneyServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  MobileMoneyServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.ListMobileMoneyOperatorsResponse> listOperators(
    $0.ListMobileMoneyOperatorsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listOperators, request, options: options);
  }

  // method descriptors

  static final _$listOperators = $grpc.ClientMethod<
          $0.ListMobileMoneyOperatorsRequest,
          $0.ListMobileMoneyOperatorsResponse>(
      '/weebi.mobile_money.service.MobileMoneyService/listOperators',
      ($0.ListMobileMoneyOperatorsRequest value) => value.writeToBuffer(),
      $0.ListMobileMoneyOperatorsResponse.fromBuffer);
}

@$pb.GrpcServiceName('weebi.mobile_money.service.MobileMoneyService')
abstract class MobileMoneyServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.mobile_money.service.MobileMoneyService';

  MobileMoneyServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListMobileMoneyOperatorsRequest,
            $0.ListMobileMoneyOperatorsResponse>(
        'listOperators',
        listOperators_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListMobileMoneyOperatorsRequest.fromBuffer(value),
        ($0.ListMobileMoneyOperatorsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListMobileMoneyOperatorsResponse> listOperators_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListMobileMoneyOperatorsRequest> $request) async {
    return listOperators($call, await $request);
  }

  $async.Future<$0.ListMobileMoneyOperatorsResponse> listOperators(
      $grpc.ServiceCall call, $0.ListMobileMoneyOperatorsRequest request);
}
