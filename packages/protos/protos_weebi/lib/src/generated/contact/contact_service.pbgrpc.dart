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
import 'contact.pb.dart' as $7;
import 'contact_service.pb.dart' as $6;

export 'contact_service.pb.dart';

@$pb.GrpcServiceName('weebi.contact.service.ContactService')
class ContactServiceClient extends $grpc.Client {
  static final _$createOne = $grpc.ClientMethod<$6.ContactRequest, $1.StatusResponse>(
      '/weebi.contact.service.ContactService/createOne',
      ($6.ContactRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createMany = $grpc.ClientMethod<$6.ContactsRequest, $1.StatusResponse>(
      '/weebi.contact.service.ContactService/createMany',
      ($6.ContactsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readOne = $grpc.ClientMethod<$6.ReadContactRequest, $7.ContactPb>(
      '/weebi.contact.service.ContactService/readOne',
      ($6.ReadContactRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.ContactPb.fromBuffer(value));
  static final _$readAll = $grpc.ClientMethod<$6.ReadAllContactsRequest, $6.ContactsResponse>(
      '/weebi.contact.service.ContactService/readAll',
      ($6.ReadAllContactsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.ContactsResponse.fromBuffer(value));
  static final _$readAllIds = $grpc.ClientMethod<$6.ReadContactsIdsRequest, $6.ContactsIdsResponse>(
      '/weebi.contact.service.ContactService/readAllIds',
      ($6.ReadContactsIdsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.ContactsIdsResponse.fromBuffer(value));
  static final _$updateOne = $grpc.ClientMethod<$6.ContactRequest, $1.StatusResponse>(
      '/weebi.contact.service.ContactService/updateOne',
      ($6.ContactRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOne = $grpc.ClientMethod<$6.ContactRequest, $1.StatusResponse>(
      '/weebi.contact.service.ContactService/deleteOne',
      ($6.ContactRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  ContactServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.StatusResponse> createOne($6.ContactRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createMany($6.ContactsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMany, request, options: options);
  }

  $grpc.ResponseFuture<$7.ContactPb> readOne($6.ReadContactRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOne, request, options: options);
  }

  $grpc.ResponseFuture<$6.ContactsResponse> readAll($6.ReadAllContactsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAll, request, options: options);
  }

  $grpc.ResponseFuture<$6.ContactsIdsResponse> readAllIds($6.ReadContactsIdsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllIds, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOne($6.ContactRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOne($6.ContactRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOne, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.contact.service.ContactService')
abstract class ContactServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.contact.service.ContactService';

  ContactServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.ContactRequest, $1.StatusResponse>(
        'createOne',
        createOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.ContactRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.ContactsRequest, $1.StatusResponse>(
        'createMany',
        createMany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.ContactsRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.ReadContactRequest, $7.ContactPb>(
        'readOne',
        readOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.ReadContactRequest.fromBuffer(value),
        ($7.ContactPb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.ReadAllContactsRequest, $6.ContactsResponse>(
        'readAll',
        readAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.ReadAllContactsRequest.fromBuffer(value),
        ($6.ContactsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.ReadContactsIdsRequest, $6.ContactsIdsResponse>(
        'readAllIds',
        readAllIds_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.ReadContactsIdsRequest.fromBuffer(value),
        ($6.ContactsIdsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.ContactRequest, $1.StatusResponse>(
        'updateOne',
        updateOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.ContactRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.ContactRequest, $1.StatusResponse>(
        'deleteOne',
        deleteOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.ContactRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.StatusResponse> createOne_Pre($grpc.ServiceCall call, $async.Future<$6.ContactRequest> request) async {
    return createOne(call, await request);
  }

  $async.Future<$1.StatusResponse> createMany_Pre($grpc.ServiceCall call, $async.Future<$6.ContactsRequest> request) async {
    return createMany(call, await request);
  }

  $async.Future<$7.ContactPb> readOne_Pre($grpc.ServiceCall call, $async.Future<$6.ReadContactRequest> request) async {
    return readOne(call, await request);
  }

  $async.Future<$6.ContactsResponse> readAll_Pre($grpc.ServiceCall call, $async.Future<$6.ReadAllContactsRequest> request) async {
    return readAll(call, await request);
  }

  $async.Future<$6.ContactsIdsResponse> readAllIds_Pre($grpc.ServiceCall call, $async.Future<$6.ReadContactsIdsRequest> request) async {
    return readAllIds(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOne_Pre($grpc.ServiceCall call, $async.Future<$6.ContactRequest> request) async {
    return updateOne(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOne_Pre($grpc.ServiceCall call, $async.Future<$6.ContactRequest> request) async {
    return deleteOne(call, await request);
  }

  $async.Future<$1.StatusResponse> createOne($grpc.ServiceCall call, $6.ContactRequest request);
  $async.Future<$1.StatusResponse> createMany($grpc.ServiceCall call, $6.ContactsRequest request);
  $async.Future<$7.ContactPb> readOne($grpc.ServiceCall call, $6.ReadContactRequest request);
  $async.Future<$6.ContactsResponse> readAll($grpc.ServiceCall call, $6.ReadAllContactsRequest request);
  $async.Future<$6.ContactsIdsResponse> readAllIds($grpc.ServiceCall call, $6.ReadContactsIdsRequest request);
  $async.Future<$1.StatusResponse> updateOne($grpc.ServiceCall call, $6.ContactRequest request);
  $async.Future<$1.StatusResponse> deleteOne($grpc.ServiceCall call, $6.ContactRequest request);
}
