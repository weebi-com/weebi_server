// This is a generated file - do not edit.
//
// Generated from contact/contact_service.proto.

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

import '../common/g_common.pb.dart' as $1;
import 'contact.pb.dart' as $2;
import 'contact_service.pb.dart' as $0;

export 'contact_service.pb.dart';

@$pb.GrpcServiceName('weebi.contact.service.ContactService')
class ContactServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ContactServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.StatusResponse> createOne(
    $0.ContactRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createMany(
    $0.ContactsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createMany, request, options: options);
  }

  /// / use [lastFetchTimestampUTC] to only read the latest changes since last fetch
  $grpc.ResponseFuture<$2.ContactPb> readOne(
    $0.ReadContactRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readOne, request, options: options);
  }

  $grpc.ResponseFuture<$0.ContactsResponse> readAll(
    $0.ReadAllContactsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readAll, request, options: options);
  }

  $grpc.ResponseFuture<$0.ContactsIdsResponse> readAllIds(
    $0.ReadContactsIdsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readAllIds, request, options: options);
  }

  /// / == upsert
  $grpc.ResponseFuture<$1.StatusResponse> updateOne(
    $0.ContactRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateOne, request, options: options);
  }

  /// / hard delete
  $grpc.ResponseFuture<$1.StatusResponse> deleteOne(
    $0.ContactRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteOne, request, options: options);
  }

  // method descriptors

  static final _$createOne =
      $grpc.ClientMethod<$0.ContactRequest, $1.StatusResponse>(
          '/weebi.contact.service.ContactService/createOne',
          ($0.ContactRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$createMany =
      $grpc.ClientMethod<$0.ContactsRequest, $1.StatusResponse>(
          '/weebi.contact.service.ContactService/createMany',
          ($0.ContactsRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$readOne =
      $grpc.ClientMethod<$0.ReadContactRequest, $2.ContactPb>(
          '/weebi.contact.service.ContactService/readOne',
          ($0.ReadContactRequest value) => value.writeToBuffer(),
          $2.ContactPb.fromBuffer);
  static final _$readAll =
      $grpc.ClientMethod<$0.ReadAllContactsRequest, $0.ContactsResponse>(
          '/weebi.contact.service.ContactService/readAll',
          ($0.ReadAllContactsRequest value) => value.writeToBuffer(),
          $0.ContactsResponse.fromBuffer);
  static final _$readAllIds =
      $grpc.ClientMethod<$0.ReadContactsIdsRequest, $0.ContactsIdsResponse>(
          '/weebi.contact.service.ContactService/readAllIds',
          ($0.ReadContactsIdsRequest value) => value.writeToBuffer(),
          $0.ContactsIdsResponse.fromBuffer);
  static final _$updateOne =
      $grpc.ClientMethod<$0.ContactRequest, $1.StatusResponse>(
          '/weebi.contact.service.ContactService/updateOne',
          ($0.ContactRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$deleteOne =
      $grpc.ClientMethod<$0.ContactRequest, $1.StatusResponse>(
          '/weebi.contact.service.ContactService/deleteOne',
          ($0.ContactRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
}

@$pb.GrpcServiceName('weebi.contact.service.ContactService')
abstract class ContactServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.contact.service.ContactService';

  ContactServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ContactRequest, $1.StatusResponse>(
        'createOne',
        createOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ContactRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ContactsRequest, $1.StatusResponse>(
        'createMany',
        createMany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ContactsRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReadContactRequest, $2.ContactPb>(
        'readOne',
        readOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ReadContactRequest.fromBuffer(value),
        ($2.ContactPb value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ReadAllContactsRequest, $0.ContactsResponse>(
            'readAll',
            readAll_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ReadAllContactsRequest.fromBuffer(value),
            ($0.ContactsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ReadContactsIdsRequest, $0.ContactsIdsResponse>(
            'readAllIds',
            readAllIds_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ReadContactsIdsRequest.fromBuffer(value),
            ($0.ContactsIdsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ContactRequest, $1.StatusResponse>(
        'updateOne',
        updateOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ContactRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ContactRequest, $1.StatusResponse>(
        'deleteOne',
        deleteOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ContactRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.StatusResponse> createOne_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ContactRequest> $request) async {
    return createOne($call, await $request);
  }

  $async.Future<$1.StatusResponse> createOne(
      $grpc.ServiceCall call, $0.ContactRequest request);

  $async.Future<$1.StatusResponse> createMany_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ContactsRequest> $request) async {
    return createMany($call, await $request);
  }

  $async.Future<$1.StatusResponse> createMany(
      $grpc.ServiceCall call, $0.ContactsRequest request);

  $async.Future<$2.ContactPb> readOne_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ReadContactRequest> $request) async {
    return readOne($call, await $request);
  }

  $async.Future<$2.ContactPb> readOne(
      $grpc.ServiceCall call, $0.ReadContactRequest request);

  $async.Future<$0.ContactsResponse> readAll_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ReadAllContactsRequest> $request) async {
    return readAll($call, await $request);
  }

  $async.Future<$0.ContactsResponse> readAll(
      $grpc.ServiceCall call, $0.ReadAllContactsRequest request);

  $async.Future<$0.ContactsIdsResponse> readAllIds_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ReadContactsIdsRequest> $request) async {
    return readAllIds($call, await $request);
  }

  $async.Future<$0.ContactsIdsResponse> readAllIds(
      $grpc.ServiceCall call, $0.ReadContactsIdsRequest request);

  $async.Future<$1.StatusResponse> updateOne_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ContactRequest> $request) async {
    return updateOne($call, await $request);
  }

  $async.Future<$1.StatusResponse> updateOne(
      $grpc.ServiceCall call, $0.ContactRequest request);

  $async.Future<$1.StatusResponse> deleteOne_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ContactRequest> $request) async {
    return deleteOne($call, await $request);
  }

  $async.Future<$1.StatusResponse> deleteOne(
      $grpc.ServiceCall call, $0.ContactRequest request);
}
