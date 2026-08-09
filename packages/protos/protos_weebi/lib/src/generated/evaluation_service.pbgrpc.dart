// This is a generated file - do not edit.
//
// Generated from evaluation_service.proto.

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

import 'evaluation_service.pb.dart' as $0;

export 'evaluation_service.pb.dart';

/// / Lead capture for BoutiqueScore auto-évaluation.
/// / Scoring is client-side (WASM / boutiquescore); this RPC only persists structured data
/// / (Turso later — not MongoDB).
@$pb.GrpcServiceName('weebi.evaluation.service.EvaluationService')
class EvaluationServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  EvaluationServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.SubmitEvaluationResponse> submitEvaluation(
    $0.SubmitEvaluationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$submitEvaluation, request, options: options);
  }

  // method descriptors

  static final _$submitEvaluation = $grpc.ClientMethod<
          $0.SubmitEvaluationRequest, $0.SubmitEvaluationResponse>(
      '/weebi.evaluation.service.EvaluationService/SubmitEvaluation',
      ($0.SubmitEvaluationRequest value) => value.writeToBuffer(),
      $0.SubmitEvaluationResponse.fromBuffer);
}

@$pb.GrpcServiceName('weebi.evaluation.service.EvaluationService')
abstract class EvaluationServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.evaluation.service.EvaluationService';

  EvaluationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SubmitEvaluationRequest,
            $0.SubmitEvaluationResponse>(
        'SubmitEvaluation',
        submitEvaluation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SubmitEvaluationRequest.fromBuffer(value),
        ($0.SubmitEvaluationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SubmitEvaluationResponse> submitEvaluation_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SubmitEvaluationRequest> $request) async {
    return submitEvaluation($call, await $request);
  }

  $async.Future<$0.SubmitEvaluationResponse> submitEvaluation(
      $grpc.ServiceCall call, $0.SubmitEvaluationRequest request);
}
