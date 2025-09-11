//
//  Generated code. Do not modify.
//  source: ticket/ticket_service.proto
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

import '../common/g_common.pb.dart' as $1;
import 'ticket.pb.dart' as $15;
import 'ticket_service.pb.dart' as $14;

export 'ticket_service.pb.dart';

@$pb.GrpcServiceName('weebi.ticket.service.TicketService')
class TicketServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  static final _$readAll = $grpc.ClientMethod<$14.ReadAllTicketsRequest, $14.TicketsResponse>(
      '/weebi.ticket.service.TicketService/readAll',
      ($14.ReadAllTicketsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.TicketsResponse.fromBuffer(value));
  static final _$readOne = $grpc.ClientMethod<$14.FindTicketRequest, $15.TicketPb>(
      '/weebi.ticket.service.TicketService/readOne',
      ($14.FindTicketRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $15.TicketPb.fromBuffer(value));
  static final _$createOne = $grpc.ClientMethod<$14.TicketRequest, $1.StatusResponse>(
      '/weebi.ticket.service.TicketService/createOne',
      ($14.TicketRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createMany = $grpc.ClientMethod<$14.TicketsRequest, $1.StatusResponse>(
      '/weebi.ticket.service.TicketService/createMany',
      ($14.TicketsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updateStatusOne = $grpc.ClientMethod<$14.TicketRequest, $1.StatusResponse>(
      '/weebi.ticket.service.TicketService/updateStatusOne',
      ($14.TicketRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOne = $grpc.ClientMethod<$14.TicketRequest, $1.StatusResponse>(
      '/weebi.ticket.service.TicketService/deleteOne',
      ($14.TicketRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  TicketServiceClient(super.channel, {super.options, super.interceptors});

  /// / allows to read tickets from all accessible boutiques
  /// / no need to paginate yet, will conisder streaming
  $grpc.ResponseFuture<$14.TicketsResponse> readAll($14.ReadAllTicketsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAll, request, options: options);
  }

  $grpc.ResponseFuture<$15.TicketPb> readOne($14.FindTicketRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOne($14.TicketRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createMany($14.TicketsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMany, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateStatusOne($14.TicketRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateStatusOne, request, options: options);
  }

  /// / soft delete
  $grpc.ResponseFuture<$1.StatusResponse> deleteOne($14.TicketRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOne, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.ticket.service.TicketService')
abstract class TicketServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.ticket.service.TicketService';

  TicketServiceBase() {
    $addMethod($grpc.ServiceMethod<$14.ReadAllTicketsRequest, $14.TicketsResponse>(
        'readAll',
        readAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.ReadAllTicketsRequest.fromBuffer(value),
        ($14.TicketsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.FindTicketRequest, $15.TicketPb>(
        'readOne',
        readOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.FindTicketRequest.fromBuffer(value),
        ($15.TicketPb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.TicketRequest, $1.StatusResponse>(
        'createOne',
        createOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.TicketRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.TicketsRequest, $1.StatusResponse>(
        'createMany',
        createMany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.TicketsRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.TicketRequest, $1.StatusResponse>(
        'updateStatusOne',
        updateStatusOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.TicketRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.TicketRequest, $1.StatusResponse>(
        'deleteOne',
        deleteOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.TicketRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$14.TicketsResponse> readAll_Pre($grpc.ServiceCall $call, $async.Future<$14.ReadAllTicketsRequest> $request) async {
    return readAll($call, await $request);
  }

  $async.Future<$15.TicketPb> readOne_Pre($grpc.ServiceCall $call, $async.Future<$14.FindTicketRequest> $request) async {
    return readOne($call, await $request);
  }

  $async.Future<$1.StatusResponse> createOne_Pre($grpc.ServiceCall $call, $async.Future<$14.TicketRequest> $request) async {
    return createOne($call, await $request);
  }

  $async.Future<$1.StatusResponse> createMany_Pre($grpc.ServiceCall $call, $async.Future<$14.TicketsRequest> $request) async {
    return createMany($call, await $request);
  }

  $async.Future<$1.StatusResponse> updateStatusOne_Pre($grpc.ServiceCall $call, $async.Future<$14.TicketRequest> $request) async {
    return updateStatusOne($call, await $request);
  }

  $async.Future<$1.StatusResponse> deleteOne_Pre($grpc.ServiceCall $call, $async.Future<$14.TicketRequest> $request) async {
    return deleteOne($call, await $request);
  }

  $async.Future<$14.TicketsResponse> readAll($grpc.ServiceCall call, $14.ReadAllTicketsRequest request);
  $async.Future<$15.TicketPb> readOne($grpc.ServiceCall call, $14.FindTicketRequest request);
  $async.Future<$1.StatusResponse> createOne($grpc.ServiceCall call, $14.TicketRequest request);
  $async.Future<$1.StatusResponse> createMany($grpc.ServiceCall call, $14.TicketsRequest request);
  $async.Future<$1.StatusResponse> updateStatusOne($grpc.ServiceCall call, $14.TicketRequest request);
  $async.Future<$1.StatusResponse> deleteOne($grpc.ServiceCall call, $14.TicketRequest request);
}
