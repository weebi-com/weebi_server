//
//  Generated code. Do not modify.
//  source: contact/contact_service.proto
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
import 'contact.pb.dart' as $6;
import 'contact_service.pb.dart' as $5;

export 'contact_service.pb.dart';

@$pb.GrpcServiceName('weebi.contact.service.ContactService')
class ContactServiceClient extends $grpc.Client {
  static final _$readAll = $grpc.ClientMethod<$5.ReadAllContactsRequest, $5.ContactsResponse>(
      '/weebi.contact.service.ContactService/readAll',
      ($5.ReadAllContactsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.ContactsResponse.fromBuffer(value));
  static final _$readOne = $grpc.ClientMethod<$5.FindContactRequest, $6.ContactPb>(
      '/weebi.contact.service.ContactService/readOne',
      ($5.FindContactRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.ContactPb.fromBuffer(value));
  static final _$createOne = $grpc.ClientMethod<$5.ContactRequest, $1.StatusResponse>(
      '/weebi.contact.service.ContactService/createOne',
      ($5.ContactRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$replaceOne = $grpc.ClientMethod<$5.ContactRequest, $1.StatusResponse>(
      '/weebi.contact.service.ContactService/replaceOne',
      ($5.ContactRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOne = $grpc.ClientMethod<$5.ContactRequest, $1.StatusResponse>(
      '/weebi.contact.service.ContactService/deleteOne',
      ($5.ContactRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  ContactServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$5.ContactsResponse> readAll($5.ReadAllContactsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAll, request, options: options);
  }

  $grpc.ResponseFuture<$6.ContactPb> readOne($5.FindContactRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOne($5.ContactRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> replaceOne($5.ContactRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$replaceOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOne($5.ContactRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOne, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.contact.service.ContactService')
abstract class ContactServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.contact.service.ContactService';

  ContactServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.ReadAllContactsRequest, $5.ContactsResponse>(
        'readAll',
        readAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.ReadAllContactsRequest.fromBuffer(value),
        ($5.ContactsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.FindContactRequest, $6.ContactPb>(
        'readOne',
        readOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.FindContactRequest.fromBuffer(value),
        ($6.ContactPb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ContactRequest, $1.StatusResponse>(
        'createOne',
        createOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.ContactRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ContactRequest, $1.StatusResponse>(
        'replaceOne',
        replaceOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.ContactRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ContactRequest, $1.StatusResponse>(
        'deleteOne',
        deleteOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.ContactRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$5.ContactsResponse> readAll_Pre($grpc.ServiceCall call, $async.Future<$5.ReadAllContactsRequest> request) async {
    return readAll(call, await request);
  }

  $async.Future<$6.ContactPb> readOne_Pre($grpc.ServiceCall call, $async.Future<$5.FindContactRequest> request) async {
    return readOne(call, await request);
  }

  $async.Future<$1.StatusResponse> createOne_Pre($grpc.ServiceCall call, $async.Future<$5.ContactRequest> request) async {
    return createOne(call, await request);
  }

  $async.Future<$1.StatusResponse> replaceOne_Pre($grpc.ServiceCall call, $async.Future<$5.ContactRequest> request) async {
    return replaceOne(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOne_Pre($grpc.ServiceCall call, $async.Future<$5.ContactRequest> request) async {
    return deleteOne(call, await request);
  }

  $async.Future<$5.ContactsResponse> readAll($grpc.ServiceCall call, $5.ReadAllContactsRequest request);
  $async.Future<$6.ContactPb> readOne($grpc.ServiceCall call, $5.FindContactRequest request);
  $async.Future<$1.StatusResponse> createOne($grpc.ServiceCall call, $5.ContactRequest request);
  $async.Future<$1.StatusResponse> replaceOne($grpc.ServiceCall call, $5.ContactRequest request);
  $async.Future<$1.StatusResponse> deleteOne($grpc.ServiceCall call, $5.ContactRequest request);
}
