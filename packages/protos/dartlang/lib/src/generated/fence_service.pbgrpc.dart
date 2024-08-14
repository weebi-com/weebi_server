//
//  Generated code. Do not modify.
//  source: fence_service.proto
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

import 'boutique.pb.dart' as $11;
import 'btq_chain.pb.dart' as $10;
import 'btq_firm.pb.dart' as $9;
import 'common/empty.pb.dart' as $0;
import 'common/g_common.pb.dart' as $1;
import 'common/mongo.pb.dart' as $7;
import 'fence_service.pb.dart' as $6;
import 'user.pb.dart' as $8;

export 'fence_service.pb.dart';

@$pb.GrpcServiceName('weebi.fence.service.FenceService')
class FenceServiceClient extends $grpc.Client {
  static final _$authenticateWithCredentials = $grpc.ClientMethod<$6.LoginRequest, $6.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithCredentials',
      ($6.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.Tokens.fromBuffer(value));
  static final _$authenticateWithRefreshToken = $grpc.ClientMethod<$6.RefreshToken, $6.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithRefreshToken',
      ($6.RefreshToken value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.Tokens.fromBuffer(value));
  static final _$generateCodeForPairingDevice = $grpc.ClientMethod<$7.chainIdAndboutiqueId, $6.DevicePairingResponse>(
      '/weebi.fence.service.FenceService/generateCodeForPairingDevice',
      ($7.chainIdAndboutiqueId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.DevicePairingResponse.fromBuffer(value));
  static final _$addPendingDevice = $grpc.ClientMethod<$6.PendingDeviceRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/addPendingDevice',
      ($6.PendingDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$approveDevice = $grpc.ClientMethod<$6.ApproveDeviceRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/approveDevice',
      ($6.ApproveDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$authenticateWithDevice = $grpc.ClientMethod<$6.DeviceLoginRequest, $6.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithDevice',
      ($6.DeviceLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.Tokens.fromBuffer(value));
  static final _$updateDeviceDefaultPassword = $grpc.ClientMethod<$6.UpdateDevicePasswordRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateDeviceDefaultPassword',
      ($6.UpdateDevicePasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOneUser = $grpc.ClientMethod<$6.CreateOneUserRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/createOneUser',
      ($6.CreateOneUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readUserPermissionsByToken = $grpc.ClientMethod<$0.Empty, $8.UserPermissions>(
      '/weebi.fence.service.FenceService/readUserPermissionsByToken',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.UserPermissions.fromBuffer(value));
  static final _$readOneUser = $grpc.ClientMethod<$6.UserId, $8.UserInfo>(
      '/weebi.fence.service.FenceService/readOneUser',
      ($6.UserId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.UserInfo.fromBuffer(value));
  static final _$updateOneUser = $grpc.ClientMethod<$8.UserInfo, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneUser',
      ($8.UserInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneUser = $grpc.ClientMethod<$6.UserId, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneUser',
      ($6.UserId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOneFirm = $grpc.ClientMethod<$9.Firm, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/createOneFirm',
      ($9.Firm value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readOneFirm = $grpc.ClientMethod<$0.Empty, $9.Firm>(
      '/weebi.fence.service.FenceService/readOneFirm',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.Firm.fromBuffer(value));
  static final _$createOneChain = $grpc.ClientMethod<$10.Chain, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/createOneChain',
      ($10.Chain value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updateOneChain = $grpc.ClientMethod<$10.Chain, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneChain',
      ($10.Chain value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readDevices = $grpc.ClientMethod<$6.ReadDeviceRequest, $10.Devices>(
      '/weebi.fence.service.FenceService/readDevices',
      ($6.ReadDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.Devices.fromBuffer(value));
  static final _$deleteOneDevice = $grpc.ClientMethod<$6.DeleteDeviceRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneDevice',
      ($6.DeleteDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOneBoutique = $grpc.ClientMethod<$11.Boutique, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/createOneBoutique',
      ($11.Boutique value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updateOneBoutique = $grpc.ClientMethod<$11.Boutique, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneBoutique',
      ($11.Boutique value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  FenceServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$6.Tokens> authenticateWithCredentials($6.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithCredentials, request, options: options);
  }

  $grpc.ResponseFuture<$6.Tokens> authenticateWithRefreshToken($6.RefreshToken request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithRefreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$6.DevicePairingResponse> generateCodeForPairingDevice($7.chainIdAndboutiqueId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateCodeForPairingDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> addPendingDevice($6.PendingDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addPendingDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> approveDevice($6.ApproveDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$approveDevice, request, options: options);
  }

  $grpc.ResponseFuture<$6.Tokens> authenticateWithDevice($6.DeviceLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateDeviceDefaultPassword($6.UpdateDevicePasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDeviceDefaultPassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneUser($6.CreateOneUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$8.UserPermissions> readUserPermissionsByToken($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readUserPermissionsByToken, request, options: options);
  }

  $grpc.ResponseFuture<$8.UserInfo> readOneUser($6.UserId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneUser($8.UserInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneUser($6.UserId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneFirm($9.Firm request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneFirm, request, options: options);
  }

  $grpc.ResponseFuture<$9.Firm> readOneFirm($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneFirm, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneChain($10.Chain request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneChain($10.Chain request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$10.Devices> readDevices($6.ReadDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readDevices, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneDevice($6.DeleteDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneBoutique($11.Boutique request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneBoutique, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneBoutique($11.Boutique request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneBoutique, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.fence.service.FenceService')
abstract class FenceServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.fence.service.FenceService';

  FenceServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.LoginRequest, $6.Tokens>(
        'authenticateWithCredentials',
        authenticateWithCredentials_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.LoginRequest.fromBuffer(value),
        ($6.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.RefreshToken, $6.Tokens>(
        'authenticateWithRefreshToken',
        authenticateWithRefreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.RefreshToken.fromBuffer(value),
        ($6.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.chainIdAndboutiqueId, $6.DevicePairingResponse>(
        'generateCodeForPairingDevice',
        generateCodeForPairingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.chainIdAndboutiqueId.fromBuffer(value),
        ($6.DevicePairingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.PendingDeviceRequest, $1.StatusResponse>(
        'addPendingDevice',
        addPendingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.PendingDeviceRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.ApproveDeviceRequest, $1.StatusResponse>(
        'approveDevice',
        approveDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.ApproveDeviceRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.DeviceLoginRequest, $6.Tokens>(
        'authenticateWithDevice',
        authenticateWithDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.DeviceLoginRequest.fromBuffer(value),
        ($6.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.UpdateDevicePasswordRequest, $1.StatusResponse>(
        'updateDeviceDefaultPassword',
        updateDeviceDefaultPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.UpdateDevicePasswordRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.CreateOneUserRequest, $1.StatusResponse>(
        'createOneUser',
        createOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.CreateOneUserRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $8.UserPermissions>(
        'readUserPermissionsByToken',
        readUserPermissionsByToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($8.UserPermissions value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.UserId, $8.UserInfo>(
        'readOneUser',
        readOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.UserId.fromBuffer(value),
        ($8.UserInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UserInfo, $1.StatusResponse>(
        'updateOneUser',
        updateOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.UserInfo.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.UserId, $1.StatusResponse>(
        'deleteOneUser',
        deleteOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.UserId.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.Firm, $1.StatusResponse>(
        'createOneFirm',
        createOneFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.Firm.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $9.Firm>(
        'readOneFirm',
        readOneFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($9.Firm value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.Chain, $1.StatusResponse>(
        'createOneChain',
        createOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.Chain.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.Chain, $1.StatusResponse>(
        'updateOneChain',
        updateOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.Chain.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.ReadDeviceRequest, $10.Devices>(
        'readDevices',
        readDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.ReadDeviceRequest.fromBuffer(value),
        ($10.Devices value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.DeleteDeviceRequest, $1.StatusResponse>(
        'deleteOneDevice',
        deleteOneDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.DeleteDeviceRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.Boutique, $1.StatusResponse>(
        'createOneBoutique',
        createOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.Boutique.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.Boutique, $1.StatusResponse>(
        'updateOneBoutique',
        updateOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.Boutique.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$6.Tokens> authenticateWithCredentials_Pre($grpc.ServiceCall call, $async.Future<$6.LoginRequest> request) async {
    return authenticateWithCredentials(call, await request);
  }

  $async.Future<$6.Tokens> authenticateWithRefreshToken_Pre($grpc.ServiceCall call, $async.Future<$6.RefreshToken> request) async {
    return authenticateWithRefreshToken(call, await request);
  }

  $async.Future<$6.DevicePairingResponse> generateCodeForPairingDevice_Pre($grpc.ServiceCall call, $async.Future<$7.chainIdAndboutiqueId> request) async {
    return generateCodeForPairingDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> addPendingDevice_Pre($grpc.ServiceCall call, $async.Future<$6.PendingDeviceRequest> request) async {
    return addPendingDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> approveDevice_Pre($grpc.ServiceCall call, $async.Future<$6.ApproveDeviceRequest> request) async {
    return approveDevice(call, await request);
  }

  $async.Future<$6.Tokens> authenticateWithDevice_Pre($grpc.ServiceCall call, $async.Future<$6.DeviceLoginRequest> request) async {
    return authenticateWithDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> updateDeviceDefaultPassword_Pre($grpc.ServiceCall call, $async.Future<$6.UpdateDevicePasswordRequest> request) async {
    return updateDeviceDefaultPassword(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneUser_Pre($grpc.ServiceCall call, $async.Future<$6.CreateOneUserRequest> request) async {
    return createOneUser(call, await request);
  }

  $async.Future<$8.UserPermissions> readUserPermissionsByToken_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readUserPermissionsByToken(call, await request);
  }

  $async.Future<$8.UserInfo> readOneUser_Pre($grpc.ServiceCall call, $async.Future<$6.UserId> request) async {
    return readOneUser(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneUser_Pre($grpc.ServiceCall call, $async.Future<$8.UserInfo> request) async {
    return updateOneUser(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOneUser_Pre($grpc.ServiceCall call, $async.Future<$6.UserId> request) async {
    return deleteOneUser(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneFirm_Pre($grpc.ServiceCall call, $async.Future<$9.Firm> request) async {
    return createOneFirm(call, await request);
  }

  $async.Future<$9.Firm> readOneFirm_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readOneFirm(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneChain_Pre($grpc.ServiceCall call, $async.Future<$10.Chain> request) async {
    return createOneChain(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneChain_Pre($grpc.ServiceCall call, $async.Future<$10.Chain> request) async {
    return updateOneChain(call, await request);
  }

  $async.Future<$10.Devices> readDevices_Pre($grpc.ServiceCall call, $async.Future<$6.ReadDeviceRequest> request) async {
    return readDevices(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOneDevice_Pre($grpc.ServiceCall call, $async.Future<$6.DeleteDeviceRequest> request) async {
    return deleteOneDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneBoutique_Pre($grpc.ServiceCall call, $async.Future<$11.Boutique> request) async {
    return createOneBoutique(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneBoutique_Pre($grpc.ServiceCall call, $async.Future<$11.Boutique> request) async {
    return updateOneBoutique(call, await request);
  }

  $async.Future<$6.Tokens> authenticateWithCredentials($grpc.ServiceCall call, $6.LoginRequest request);
  $async.Future<$6.Tokens> authenticateWithRefreshToken($grpc.ServiceCall call, $6.RefreshToken request);
  $async.Future<$6.DevicePairingResponse> generateCodeForPairingDevice($grpc.ServiceCall call, $7.chainIdAndboutiqueId request);
  $async.Future<$1.StatusResponse> addPendingDevice($grpc.ServiceCall call, $6.PendingDeviceRequest request);
  $async.Future<$1.StatusResponse> approveDevice($grpc.ServiceCall call, $6.ApproveDeviceRequest request);
  $async.Future<$6.Tokens> authenticateWithDevice($grpc.ServiceCall call, $6.DeviceLoginRequest request);
  $async.Future<$1.StatusResponse> updateDeviceDefaultPassword($grpc.ServiceCall call, $6.UpdateDevicePasswordRequest request);
  $async.Future<$1.StatusResponse> createOneUser($grpc.ServiceCall call, $6.CreateOneUserRequest request);
  $async.Future<$8.UserPermissions> readUserPermissionsByToken($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$8.UserInfo> readOneUser($grpc.ServiceCall call, $6.UserId request);
  $async.Future<$1.StatusResponse> updateOneUser($grpc.ServiceCall call, $8.UserInfo request);
  $async.Future<$1.StatusResponse> deleteOneUser($grpc.ServiceCall call, $6.UserId request);
  $async.Future<$1.StatusResponse> createOneFirm($grpc.ServiceCall call, $9.Firm request);
  $async.Future<$9.Firm> readOneFirm($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.StatusResponse> createOneChain($grpc.ServiceCall call, $10.Chain request);
  $async.Future<$1.StatusResponse> updateOneChain($grpc.ServiceCall call, $10.Chain request);
  $async.Future<$10.Devices> readDevices($grpc.ServiceCall call, $6.ReadDeviceRequest request);
  $async.Future<$1.StatusResponse> deleteOneDevice($grpc.ServiceCall call, $6.DeleteDeviceRequest request);
  $async.Future<$1.StatusResponse> createOneBoutique($grpc.ServiceCall call, $11.Boutique request);
  $async.Future<$1.StatusResponse> updateOneBoutique($grpc.ServiceCall call, $11.Boutique request);
}
