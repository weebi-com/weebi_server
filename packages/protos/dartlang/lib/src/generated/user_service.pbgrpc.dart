//
//  Generated code. Do not modify.
//  source: user_service.proto
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

import 'common/empty.pb.dart' as $0;
import 'common/g_common.pb.dart' as $1;
import 'common/mongo.pb.dart' as $11;
import 'user.pb.dart' as $12;
import 'user_permission.pb.dart' as $13;
import 'user_service.pb.dart' as $10;

export 'user_service.pb.dart';

@$pb.GrpcServiceName('weebi.user.service.UserService')
class UserServiceClient extends $grpc.Client {
  static final _$authenticateWithCredentials = $grpc.ClientMethod<$10.LoginRequest, $10.Tokens>(
      '/weebi.user.service.UserService/authenticateWithCredentials',
      ($10.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.Tokens.fromBuffer(value));
  static final _$authenticateWithRefreshToken = $grpc.ClientMethod<$10.RefreshToken, $10.Tokens>(
      '/weebi.user.service.UserService/authenticateWithRefreshToken',
      ($10.RefreshToken value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.Tokens.fromBuffer(value));
  static final _$generateCodeForPairingDevice = $grpc.ClientMethod<$11.ChainOidAndBoutiqueOid, $10.DevicePairingResponse>(
      '/weebi.user.service.UserService/generateCodeForPairingDevice',
      ($11.ChainOidAndBoutiqueOid value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.DevicePairingResponse.fromBuffer(value));
  static final _$addPendingDevice = $grpc.ClientMethod<$10.PendingDeviceRequest, $1.StatusResponse>(
      '/weebi.user.service.UserService/addPendingDevice',
      ($10.PendingDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$approveDevice = $grpc.ClientMethod<$10.ApproveDeviceRequest, $1.StatusResponse>(
      '/weebi.user.service.UserService/approveDevice',
      ($10.ApproveDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$authenticateWithDevice = $grpc.ClientMethod<$10.DeviceLoginRequest, $10.Tokens>(
      '/weebi.user.service.UserService/authenticateWithDevice',
      ($10.DeviceLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.Tokens.fromBuffer(value));
  static final _$updateDeviceDefaultPassword = $grpc.ClientMethod<$10.UpdateDevicePasswordRequest, $1.StatusResponse>(
      '/weebi.user.service.UserService/updateDeviceDefaultPassword',
      ($10.UpdateDevicePasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOne = $grpc.ClientMethod<$12.UserPrivate, $1.StatusResponse>(
      '/weebi.user.service.UserService/createOne',
      ($12.UserPrivate value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readUserPermissionsByToken = $grpc.ClientMethod<$0.Empty, $13.UserPermissions>(
      '/weebi.user.service.UserService/readUserPermissionsByToken',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $13.UserPermissions.fromBuffer(value));
  static final _$readOne = $grpc.ClientMethod<$10.UserOid, $10.UserInfo>(
      '/weebi.user.service.UserService/readOne',
      ($10.UserOid value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.UserInfo.fromBuffer(value));
  static final _$updateOne = $grpc.ClientMethod<$10.UserInfo, $1.StatusResponse>(
      '/weebi.user.service.UserService/updateOne',
      ($10.UserInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOne = $grpc.ClientMethod<$10.UserOid, $1.StatusResponse>(
      '/weebi.user.service.UserService/deleteOne',
      ($10.UserOid value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$10.Tokens> authenticateWithCredentials($10.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithCredentials, request, options: options);
  }

  $grpc.ResponseFuture<$10.Tokens> authenticateWithRefreshToken($10.RefreshToken request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithRefreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$10.DevicePairingResponse> generateCodeForPairingDevice($11.ChainOidAndBoutiqueOid request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateCodeForPairingDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> addPendingDevice($10.PendingDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addPendingDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> approveDevice($10.ApproveDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$approveDevice, request, options: options);
  }

  $grpc.ResponseFuture<$10.Tokens> authenticateWithDevice($10.DeviceLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateDeviceDefaultPassword($10.UpdateDevicePasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDeviceDefaultPassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOne($12.UserPrivate request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOne, request, options: options);
  }

  $grpc.ResponseFuture<$13.UserPermissions> readUserPermissionsByToken($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readUserPermissionsByToken, request, options: options);
  }

  $grpc.ResponseFuture<$10.UserInfo> readOne($10.UserOid request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOne($10.UserInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOne($10.UserOid request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOne, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.user.service.UserService')
abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.user.service.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$10.LoginRequest, $10.Tokens>(
        'authenticateWithCredentials',
        authenticateWithCredentials_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.LoginRequest.fromBuffer(value),
        ($10.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.RefreshToken, $10.Tokens>(
        'authenticateWithRefreshToken',
        authenticateWithRefreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.RefreshToken.fromBuffer(value),
        ($10.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.ChainOidAndBoutiqueOid, $10.DevicePairingResponse>(
        'generateCodeForPairingDevice',
        generateCodeForPairingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.ChainOidAndBoutiqueOid.fromBuffer(value),
        ($10.DevicePairingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.PendingDeviceRequest, $1.StatusResponse>(
        'addPendingDevice',
        addPendingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.PendingDeviceRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.ApproveDeviceRequest, $1.StatusResponse>(
        'approveDevice',
        approveDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.ApproveDeviceRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.DeviceLoginRequest, $10.Tokens>(
        'authenticateWithDevice',
        authenticateWithDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.DeviceLoginRequest.fromBuffer(value),
        ($10.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.UpdateDevicePasswordRequest, $1.StatusResponse>(
        'updateDeviceDefaultPassword',
        updateDeviceDefaultPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.UpdateDevicePasswordRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.UserPrivate, $1.StatusResponse>(
        'createOne',
        createOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.UserPrivate.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $13.UserPermissions>(
        'readUserPermissionsByToken',
        readUserPermissionsByToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($13.UserPermissions value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.UserOid, $10.UserInfo>(
        'readOne',
        readOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.UserOid.fromBuffer(value),
        ($10.UserInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.UserInfo, $1.StatusResponse>(
        'updateOne',
        updateOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.UserInfo.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.UserOid, $1.StatusResponse>(
        'deleteOne',
        deleteOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.UserOid.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$10.Tokens> authenticateWithCredentials_Pre($grpc.ServiceCall call, $async.Future<$10.LoginRequest> request) async {
    return authenticateWithCredentials(call, await request);
  }

  $async.Future<$10.Tokens> authenticateWithRefreshToken_Pre($grpc.ServiceCall call, $async.Future<$10.RefreshToken> request) async {
    return authenticateWithRefreshToken(call, await request);
  }

  $async.Future<$10.DevicePairingResponse> generateCodeForPairingDevice_Pre($grpc.ServiceCall call, $async.Future<$11.ChainOidAndBoutiqueOid> request) async {
    return generateCodeForPairingDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> addPendingDevice_Pre($grpc.ServiceCall call, $async.Future<$10.PendingDeviceRequest> request) async {
    return addPendingDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> approveDevice_Pre($grpc.ServiceCall call, $async.Future<$10.ApproveDeviceRequest> request) async {
    return approveDevice(call, await request);
  }

  $async.Future<$10.Tokens> authenticateWithDevice_Pre($grpc.ServiceCall call, $async.Future<$10.DeviceLoginRequest> request) async {
    return authenticateWithDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> updateDeviceDefaultPassword_Pre($grpc.ServiceCall call, $async.Future<$10.UpdateDevicePasswordRequest> request) async {
    return updateDeviceDefaultPassword(call, await request);
  }

  $async.Future<$1.StatusResponse> createOne_Pre($grpc.ServiceCall call, $async.Future<$12.UserPrivate> request) async {
    return createOne(call, await request);
  }

  $async.Future<$13.UserPermissions> readUserPermissionsByToken_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readUserPermissionsByToken(call, await request);
  }

  $async.Future<$10.UserInfo> readOne_Pre($grpc.ServiceCall call, $async.Future<$10.UserOid> request) async {
    return readOne(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOne_Pre($grpc.ServiceCall call, $async.Future<$10.UserInfo> request) async {
    return updateOne(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOne_Pre($grpc.ServiceCall call, $async.Future<$10.UserOid> request) async {
    return deleteOne(call, await request);
  }

  $async.Future<$10.Tokens> authenticateWithCredentials($grpc.ServiceCall call, $10.LoginRequest request);
  $async.Future<$10.Tokens> authenticateWithRefreshToken($grpc.ServiceCall call, $10.RefreshToken request);
  $async.Future<$10.DevicePairingResponse> generateCodeForPairingDevice($grpc.ServiceCall call, $11.ChainOidAndBoutiqueOid request);
  $async.Future<$1.StatusResponse> addPendingDevice($grpc.ServiceCall call, $10.PendingDeviceRequest request);
  $async.Future<$1.StatusResponse> approveDevice($grpc.ServiceCall call, $10.ApproveDeviceRequest request);
  $async.Future<$10.Tokens> authenticateWithDevice($grpc.ServiceCall call, $10.DeviceLoginRequest request);
  $async.Future<$1.StatusResponse> updateDeviceDefaultPassword($grpc.ServiceCall call, $10.UpdateDevicePasswordRequest request);
  $async.Future<$1.StatusResponse> createOne($grpc.ServiceCall call, $12.UserPrivate request);
  $async.Future<$13.UserPermissions> readUserPermissionsByToken($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$10.UserInfo> readOne($grpc.ServiceCall call, $10.UserOid request);
  $async.Future<$1.StatusResponse> updateOne($grpc.ServiceCall call, $10.UserInfo request);
  $async.Future<$1.StatusResponse> deleteOne($grpc.ServiceCall call, $10.UserOid request);
}
