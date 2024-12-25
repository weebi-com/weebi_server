//
//  Generated code. Do not modify.
//  source: ticket/ticket_service.proto
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

import '../common/g_common.pb.dart' as $1;
import 'ticket.pb.dart' as $16;
import 'ticket_service.pb.dart' as $15;

export 'ticket_service.pb.dart';

@$pb.GrpcServiceName('weebi.ticket.service.TicketService')
class TicketServiceClient extends $grpc.Client {
  static final _$readAll = $grpc.ClientMethod<$15.ReadAllTicketsRequest, $15.TicketsResponse>(
      '/weebi.ticket.service.TicketService/readAll',
      ($15.ReadAllTicketsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $15.TicketsResponse.fromBuffer(value));
  static final _$readOne = $grpc.ClientMethod<$15.FindTicketRequest, $16.TicketPb>(
      '/weebi.ticket.service.TicketService/readOne',
      ($15.FindTicketRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $16.TicketPb.fromBuffer(value));
  static final _$createOne = $grpc.ClientMethod<$15.TicketRequest, $1.StatusResponse>(
      '/weebi.ticket.service.TicketService/createOne',
      ($15.TicketRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createMany = $grpc.ClientMethod<$15.TicketsRequest, $1.StatusResponse>(
      '/weebi.ticket.service.TicketService/createMany',
      ($15.TicketsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updateStatusOne = $grpc.ClientMethod<$15.TicketRequest, $1.StatusResponse>(
      '/weebi.ticket.service.TicketService/updateStatusOne',
      ($15.TicketRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOne = $grpc.ClientMethod<$15.TicketRequest, $1.StatusResponse>(
      '/weebi.ticket.service.TicketService/deleteOne',
      ($15.TicketRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  TicketServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$15.TicketsResponse> readAll($15.ReadAllTicketsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAll, request, options: options);
  }

  $grpc.ResponseFuture<$16.TicketPb> readOne($15.FindTicketRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOne($15.TicketRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createMany($15.TicketsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMany, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateStatusOne($15.TicketRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateStatusOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOne($15.TicketRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOne, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.ticket.service.TicketService')
abstract class TicketServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.ticket.service.TicketService';

  TicketServiceBase() {
    $addMethod($grpc.ServiceMethod<$15.ReadAllTicketsRequest, $15.TicketsResponse>(
        'readAll',
        readAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.ReadAllTicketsRequest.fromBuffer(value),
        ($15.TicketsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.FindTicketRequest, $16.TicketPb>(
        'readOne',
        readOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.FindTicketRequest.fromBuffer(value),
        ($16.TicketPb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.TicketRequest, $1.StatusResponse>(
        'createOne',
        createOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.TicketRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.TicketsRequest, $1.StatusResponse>(
        'createMany',
        createMany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.TicketsRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.TicketRequest, $1.StatusResponse>(
        'updateStatusOne',
        updateStatusOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.TicketRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.TicketRequest, $1.StatusResponse>(
        'deleteOne',
        deleteOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.TicketRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$15.TicketsResponse> readAll_Pre($grpc.ServiceCall call, $async.Future<$15.ReadAllTicketsRequest> request) async {
    return readAll(call, await request);
  }

  $async.Future<$16.TicketPb> readOne_Pre($grpc.ServiceCall call, $async.Future<$15.FindTicketRequest> request) async {
    return readOne(call, await request);
  }

  $async.Future<$1.StatusResponse> createOne_Pre($grpc.ServiceCall call, $async.Future<$15.TicketRequest> request) async {
    return createOne(call, await request);
  }

  $async.Future<$1.StatusResponse> createMany_Pre($grpc.ServiceCall call, $async.Future<$15.TicketsRequest> request) async {
    return createMany(call, await request);
  }

  $async.Future<$1.StatusResponse> updateStatusOne_Pre($grpc.ServiceCall call, $async.Future<$15.TicketRequest> request) async {
    return updateStatusOne(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOne_Pre($grpc.ServiceCall call, $async.Future<$15.TicketRequest> request) async {
    return deleteOne(call, await request);
  }

  $async.Future<$15.TicketsResponse> readAll($grpc.ServiceCall call, $15.ReadAllTicketsRequest request);
  $async.Future<$16.TicketPb> readOne($grpc.ServiceCall call, $15.FindTicketRequest request);
  $async.Future<$1.StatusResponse> createOne($grpc.ServiceCall call, $15.TicketRequest request);
  $async.Future<$1.StatusResponse> createMany($grpc.ServiceCall call, $15.TicketsRequest request);
  $async.Future<$1.StatusResponse> updateStatusOne($grpc.ServiceCall call, $15.TicketRequest request);
  $async.Future<$1.StatusResponse> deleteOne($grpc.ServiceCall call, $15.TicketRequest request);
}
