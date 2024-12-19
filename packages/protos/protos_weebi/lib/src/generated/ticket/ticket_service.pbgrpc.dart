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
import 'ticket.pb.dart' as $17;
import 'ticket_service.pb.dart' as $16;

export 'ticket_service.pb.dart';

@$pb.GrpcServiceName('weebi.ticket.service.TicketService')
class TicketServiceClient extends $grpc.Client {
  static final _$readAll = $grpc.ClientMethod<$16.ReadAllTicketsRequest, $16.TicketsResponse>(
      '/weebi.ticket.service.TicketService/readAll',
      ($16.ReadAllTicketsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $16.TicketsResponse.fromBuffer(value));
  static final _$readOne = $grpc.ClientMethod<$16.FindTicketRequest, $17.TicketPb>(
      '/weebi.ticket.service.TicketService/readOne',
      ($16.FindTicketRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $17.TicketPb.fromBuffer(value));
  static final _$createOne = $grpc.ClientMethod<$16.TicketRequest, $1.StatusResponse>(
      '/weebi.ticket.service.TicketService/createOne',
      ($16.TicketRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createMany = $grpc.ClientMethod<$16.TicketsRequest, $1.StatusResponse>(
      '/weebi.ticket.service.TicketService/createMany',
      ($16.TicketsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updateStatusOne = $grpc.ClientMethod<$16.TicketRequest, $1.StatusResponse>(
      '/weebi.ticket.service.TicketService/updateStatusOne',
      ($16.TicketRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOne = $grpc.ClientMethod<$16.TicketRequest, $1.StatusResponse>(
      '/weebi.ticket.service.TicketService/deleteOne',
      ($16.TicketRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  TicketServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$16.TicketsResponse> readAll($16.ReadAllTicketsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAll, request, options: options);
  }

  $grpc.ResponseFuture<$17.TicketPb> readOne($16.FindTicketRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOne($16.TicketRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createMany($16.TicketsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMany, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateStatusOne($16.TicketRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateStatusOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOne($16.TicketRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOne, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.ticket.service.TicketService')
abstract class TicketServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.ticket.service.TicketService';

  TicketServiceBase() {
    $addMethod($grpc.ServiceMethod<$16.ReadAllTicketsRequest, $16.TicketsResponse>(
        'readAll',
        readAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $16.ReadAllTicketsRequest.fromBuffer(value),
        ($16.TicketsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$16.FindTicketRequest, $17.TicketPb>(
        'readOne',
        readOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $16.FindTicketRequest.fromBuffer(value),
        ($17.TicketPb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$16.TicketRequest, $1.StatusResponse>(
        'createOne',
        createOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $16.TicketRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$16.TicketsRequest, $1.StatusResponse>(
        'createMany',
        createMany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $16.TicketsRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$16.TicketRequest, $1.StatusResponse>(
        'updateStatusOne',
        updateStatusOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $16.TicketRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$16.TicketRequest, $1.StatusResponse>(
        'deleteOne',
        deleteOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $16.TicketRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$16.TicketsResponse> readAll_Pre($grpc.ServiceCall call, $async.Future<$16.ReadAllTicketsRequest> request) async {
    return readAll(call, await request);
  }

  $async.Future<$17.TicketPb> readOne_Pre($grpc.ServiceCall call, $async.Future<$16.FindTicketRequest> request) async {
    return readOne(call, await request);
  }

  $async.Future<$1.StatusResponse> createOne_Pre($grpc.ServiceCall call, $async.Future<$16.TicketRequest> request) async {
    return createOne(call, await request);
  }

  $async.Future<$1.StatusResponse> createMany_Pre($grpc.ServiceCall call, $async.Future<$16.TicketsRequest> request) async {
    return createMany(call, await request);
  }

  $async.Future<$1.StatusResponse> updateStatusOne_Pre($grpc.ServiceCall call, $async.Future<$16.TicketRequest> request) async {
    return updateStatusOne(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOne_Pre($grpc.ServiceCall call, $async.Future<$16.TicketRequest> request) async {
    return deleteOne(call, await request);
  }

  $async.Future<$16.TicketsResponse> readAll($grpc.ServiceCall call, $16.ReadAllTicketsRequest request);
  $async.Future<$17.TicketPb> readOne($grpc.ServiceCall call, $16.FindTicketRequest request);
  $async.Future<$1.StatusResponse> createOne($grpc.ServiceCall call, $16.TicketRequest request);
  $async.Future<$1.StatusResponse> createMany($grpc.ServiceCall call, $16.TicketsRequest request);
  $async.Future<$1.StatusResponse> updateStatusOne($grpc.ServiceCall call, $16.TicketRequest request);
  $async.Future<$1.StatusResponse> deleteOne($grpc.ServiceCall call, $16.TicketRequest request);
}
