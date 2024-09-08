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
import 'common/chained_ids.pb.dart' as $12;
import 'common/empty.pb.dart' as $0;
import 'common/g_common.pb.dart' as $1;
import 'device.pb.dart' as $13;
import 'fence_service.pb.dart' as $7;
import 'firm.pb.dart' as $9;
import 'user.pb.dart' as $6;
import 'user_permissions.pb.dart' as $8;

export 'fence_service.pb.dart';

@$pb.GrpcServiceName('weebi.fence.service.FenceService')
class FenceServiceClient extends $grpc.Client {
  static final _$signUp = $grpc.ClientMethod<$6.SignUpRequest, $6.SignUpResponse>(
      '/weebi.fence.service.FenceService/signUp',
      ($6.SignUpRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.SignUpResponse.fromBuffer(value));
  static final _$authenticateWithCredentials = $grpc.ClientMethod<$7.Credentials, $7.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithCredentials',
      ($7.Credentials value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.Tokens.fromBuffer(value));
  static final _$authenticateWithRefreshToken = $grpc.ClientMethod<$7.RefreshToken, $7.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithRefreshToken',
      ($7.RefreshToken value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.Tokens.fromBuffer(value));
  static final _$readUserPermissionsByToken = $grpc.ClientMethod<$0.Empty, $8.UserPermissions>(
      '/weebi.fence.service.FenceService/readUserPermissionsByToken',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.UserPermissions.fromBuffer(value));
  static final _$createFirm = $grpc.ClientMethod<$9.CreateFirmRequest, $9.CreateFirmResponse>(
      '/weebi.fence.service.FenceService/createFirm',
      ($9.CreateFirmRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.CreateFirmResponse.fromBuffer(value));
  static final _$readOneFirm = $grpc.ClientMethod<$0.Empty, $9.Firm>(
      '/weebi.fence.service.FenceService/readOneFirm',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.Firm.fromBuffer(value));
  static final _$createPendingUser = $grpc.ClientMethod<$6.PendingUserRequest, $6.PendingUserResponse>(
      '/weebi.fence.service.FenceService/createPendingUser',
      ($6.PendingUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.PendingUserResponse.fromBuffer(value));
  static final _$readOneUser = $grpc.ClientMethod<$7.UserId, $6.UserPublic>(
      '/weebi.fence.service.FenceService/readOneUser',
      ($7.UserId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.UserPublic.fromBuffer(value));
  static final _$readAllUsers = $grpc.ClientMethod<$0.Empty, $7.UsersPublic>(
      '/weebi.fence.service.FenceService/readAllUsers',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.UsersPublic.fromBuffer(value));
  static final _$updateOneUser = $grpc.ClientMethod<$6.UserPublic, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneUser',
      ($6.UserPublic value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updateUserPassword = $grpc.ClientMethod<$7.PasswordUpdateRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateUserPassword',
      ($7.PasswordUpdateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneUser = $grpc.ClientMethod<$7.UserId, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneUser',
      ($7.UserId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOneChain = $grpc.ClientMethod<$10.Chain, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/createOneChain',
      ($10.Chain value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readAllChains = $grpc.ClientMethod<$0.Empty, $7.ReadAllChainsResponse>(
      '/weebi.fence.service.FenceService/readAllChains',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.ReadAllChainsResponse.fromBuffer(value));
  static final _$updateOneChain = $grpc.ClientMethod<$10.Chain, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneChain',
      ($10.Chain value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOneBoutique = $grpc.ClientMethod<$11.Boutique, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/createOneBoutique',
      ($11.Boutique value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updateOneBoutique = $grpc.ClientMethod<$11.Boutique, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneBoutique',
      ($11.Boutique value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$generateCodeForPairingDevice = $grpc.ClientMethod<$12.ChainIdAndboutiqueId, $7.CodeForPairingDevice>(
      '/weebi.fence.service.FenceService/generateCodeForPairingDevice',
      ($12.ChainIdAndboutiqueId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.CodeForPairingDevice.fromBuffer(value));
  static final _$createPendingDevice = $grpc.ClientMethod<$7.PendingDeviceRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/createPendingDevice',
      ($7.PendingDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readOnePendingDevice = $grpc.ClientMethod<$7.ReadDeviceBtqRequest, $13.Device>(
      '/weebi.fence.service.FenceService/readOnePendingDevice',
      ($7.ReadDeviceBtqRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $13.Device.fromBuffer(value));
  static final _$approveDevice = $grpc.ClientMethod<$7.ApproveDeviceRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/approveDevice',
      ($7.ApproveDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readDevices = $grpc.ClientMethod<$7.ReadDevicesRequest, $13.Devices>(
      '/weebi.fence.service.FenceService/readDevices',
      ($7.ReadDevicesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $13.Devices.fromBuffer(value));
  static final _$authenticateWithDevice = $grpc.ClientMethod<$7.DeviceCredentials, $7.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithDevice',
      ($7.DeviceCredentials value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.Tokens.fromBuffer(value));
  static final _$updateDevicePassword = $grpc.ClientMethod<$7.UpdateDevicePasswordRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateDevicePassword',
      ($7.UpdateDevicePasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneDevice = $grpc.ClientMethod<$7.DeleteDeviceRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneDevice',
      ($7.DeleteDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  FenceServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$6.SignUpResponse> signUp($6.SignUpRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$7.Tokens> authenticateWithCredentials($7.Credentials request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithCredentials, request, options: options);
  }

  $grpc.ResponseFuture<$7.Tokens> authenticateWithRefreshToken($7.RefreshToken request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithRefreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$8.UserPermissions> readUserPermissionsByToken($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readUserPermissionsByToken, request, options: options);
  }

  $grpc.ResponseFuture<$9.CreateFirmResponse> createFirm($9.CreateFirmRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createFirm, request, options: options);
  }

  $grpc.ResponseFuture<$9.Firm> readOneFirm($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneFirm, request, options: options);
  }

  $grpc.ResponseFuture<$6.PendingUserResponse> createPendingUser($6.PendingUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPendingUser, request, options: options);
  }

  $grpc.ResponseFuture<$6.UserPublic> readOneUser($7.UserId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$7.UsersPublic> readAllUsers($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllUsers, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneUser($6.UserPublic request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateUserPassword($7.PasswordUpdateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUserPassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneUser($7.UserId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneChain($10.Chain request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$7.ReadAllChainsResponse> readAllChains($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllChains, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneChain($10.Chain request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneBoutique($11.Boutique request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneBoutique, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneBoutique($11.Boutique request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneBoutique, request, options: options);
  }

  $grpc.ResponseFuture<$7.CodeForPairingDevice> generateCodeForPairingDevice($12.ChainIdAndboutiqueId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateCodeForPairingDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createPendingDevice($7.PendingDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPendingDevice, request, options: options);
  }

  $grpc.ResponseFuture<$13.Device> readOnePendingDevice($7.ReadDeviceBtqRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOnePendingDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> approveDevice($7.ApproveDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$approveDevice, request, options: options);
  }

  $grpc.ResponseFuture<$13.Devices> readDevices($7.ReadDevicesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readDevices, request, options: options);
  }

  $grpc.ResponseFuture<$7.Tokens> authenticateWithDevice($7.DeviceCredentials request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateDevicePassword($7.UpdateDevicePasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDevicePassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneDevice($7.DeleteDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneDevice, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.fence.service.FenceService')
abstract class FenceServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.fence.service.FenceService';

  FenceServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.SignUpRequest, $6.SignUpResponse>(
        'signUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.SignUpRequest.fromBuffer(value),
        ($6.SignUpResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.Credentials, $7.Tokens>(
        'authenticateWithCredentials',
        authenticateWithCredentials_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.Credentials.fromBuffer(value),
        ($7.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.RefreshToken, $7.Tokens>(
        'authenticateWithRefreshToken',
        authenticateWithRefreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.RefreshToken.fromBuffer(value),
        ($7.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $8.UserPermissions>(
        'readUserPermissionsByToken',
        readUserPermissionsByToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($8.UserPermissions value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.CreateFirmRequest, $9.CreateFirmResponse>(
        'createFirm',
        createFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.CreateFirmRequest.fromBuffer(value),
        ($9.CreateFirmResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $9.Firm>(
        'readOneFirm',
        readOneFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($9.Firm value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.PendingUserRequest, $6.PendingUserResponse>(
        'createPendingUser',
        createPendingUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.PendingUserRequest.fromBuffer(value),
        ($6.PendingUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.UserId, $6.UserPublic>(
        'readOneUser',
        readOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.UserId.fromBuffer(value),
        ($6.UserPublic value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $7.UsersPublic>(
        'readAllUsers',
        readAllUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($7.UsersPublic value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.UserPublic, $1.StatusResponse>(
        'updateOneUser',
        updateOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.UserPublic.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.PasswordUpdateRequest, $1.StatusResponse>(
        'updateUserPassword',
        updateUserPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.PasswordUpdateRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.UserId, $1.StatusResponse>(
        'deleteOneUser',
        deleteOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.UserId.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.Chain, $1.StatusResponse>(
        'createOneChain',
        createOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.Chain.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $7.ReadAllChainsResponse>(
        'readAllChains',
        readAllChains_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($7.ReadAllChainsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.Chain, $1.StatusResponse>(
        'updateOneChain',
        updateOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.Chain.fromBuffer(value),
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
    $addMethod($grpc.ServiceMethod<$12.ChainIdAndboutiqueId, $7.CodeForPairingDevice>(
        'generateCodeForPairingDevice',
        generateCodeForPairingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.ChainIdAndboutiqueId.fromBuffer(value),
        ($7.CodeForPairingDevice value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.PendingDeviceRequest, $1.StatusResponse>(
        'createPendingDevice',
        createPendingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.PendingDeviceRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.ReadDeviceBtqRequest, $13.Device>(
        'readOnePendingDevice',
        readOnePendingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.ReadDeviceBtqRequest.fromBuffer(value),
        ($13.Device value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.ApproveDeviceRequest, $1.StatusResponse>(
        'approveDevice',
        approveDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.ApproveDeviceRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.ReadDevicesRequest, $13.Devices>(
        'readDevices',
        readDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.ReadDevicesRequest.fromBuffer(value),
        ($13.Devices value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.DeviceCredentials, $7.Tokens>(
        'authenticateWithDevice',
        authenticateWithDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.DeviceCredentials.fromBuffer(value),
        ($7.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.UpdateDevicePasswordRequest, $1.StatusResponse>(
        'updateDevicePassword',
        updateDevicePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.UpdateDevicePasswordRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.DeleteDeviceRequest, $1.StatusResponse>(
        'deleteOneDevice',
        deleteOneDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.DeleteDeviceRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$6.SignUpResponse> signUp_Pre($grpc.ServiceCall call, $async.Future<$6.SignUpRequest> request) async {
    return signUp(call, await request);
  }

  $async.Future<$7.Tokens> authenticateWithCredentials_Pre($grpc.ServiceCall call, $async.Future<$7.Credentials> request) async {
    return authenticateWithCredentials(call, await request);
  }

  $async.Future<$7.Tokens> authenticateWithRefreshToken_Pre($grpc.ServiceCall call, $async.Future<$7.RefreshToken> request) async {
    return authenticateWithRefreshToken(call, await request);
  }

  $async.Future<$8.UserPermissions> readUserPermissionsByToken_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readUserPermissionsByToken(call, await request);
  }

  $async.Future<$9.CreateFirmResponse> createFirm_Pre($grpc.ServiceCall call, $async.Future<$9.CreateFirmRequest> request) async {
    return createFirm(call, await request);
  }

  $async.Future<$9.Firm> readOneFirm_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readOneFirm(call, await request);
  }

  $async.Future<$6.PendingUserResponse> createPendingUser_Pre($grpc.ServiceCall call, $async.Future<$6.PendingUserRequest> request) async {
    return createPendingUser(call, await request);
  }

  $async.Future<$6.UserPublic> readOneUser_Pre($grpc.ServiceCall call, $async.Future<$7.UserId> request) async {
    return readOneUser(call, await request);
  }

  $async.Future<$7.UsersPublic> readAllUsers_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readAllUsers(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneUser_Pre($grpc.ServiceCall call, $async.Future<$6.UserPublic> request) async {
    return updateOneUser(call, await request);
  }

  $async.Future<$1.StatusResponse> updateUserPassword_Pre($grpc.ServiceCall call, $async.Future<$7.PasswordUpdateRequest> request) async {
    return updateUserPassword(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOneUser_Pre($grpc.ServiceCall call, $async.Future<$7.UserId> request) async {
    return deleteOneUser(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneChain_Pre($grpc.ServiceCall call, $async.Future<$10.Chain> request) async {
    return createOneChain(call, await request);
  }

  $async.Future<$7.ReadAllChainsResponse> readAllChains_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readAllChains(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneChain_Pre($grpc.ServiceCall call, $async.Future<$10.Chain> request) async {
    return updateOneChain(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneBoutique_Pre($grpc.ServiceCall call, $async.Future<$11.Boutique> request) async {
    return createOneBoutique(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneBoutique_Pre($grpc.ServiceCall call, $async.Future<$11.Boutique> request) async {
    return updateOneBoutique(call, await request);
  }

  $async.Future<$7.CodeForPairingDevice> generateCodeForPairingDevice_Pre($grpc.ServiceCall call, $async.Future<$12.ChainIdAndboutiqueId> request) async {
    return generateCodeForPairingDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> createPendingDevice_Pre($grpc.ServiceCall call, $async.Future<$7.PendingDeviceRequest> request) async {
    return createPendingDevice(call, await request);
  }

  $async.Future<$13.Device> readOnePendingDevice_Pre($grpc.ServiceCall call, $async.Future<$7.ReadDeviceBtqRequest> request) async {
    return readOnePendingDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> approveDevice_Pre($grpc.ServiceCall call, $async.Future<$7.ApproveDeviceRequest> request) async {
    return approveDevice(call, await request);
  }

  $async.Future<$13.Devices> readDevices_Pre($grpc.ServiceCall call, $async.Future<$7.ReadDevicesRequest> request) async {
    return readDevices(call, await request);
  }

  $async.Future<$7.Tokens> authenticateWithDevice_Pre($grpc.ServiceCall call, $async.Future<$7.DeviceCredentials> request) async {
    return authenticateWithDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> updateDevicePassword_Pre($grpc.ServiceCall call, $async.Future<$7.UpdateDevicePasswordRequest> request) async {
    return updateDevicePassword(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOneDevice_Pre($grpc.ServiceCall call, $async.Future<$7.DeleteDeviceRequest> request) async {
    return deleteOneDevice(call, await request);
  }

  $async.Future<$6.SignUpResponse> signUp($grpc.ServiceCall call, $6.SignUpRequest request);
  $async.Future<$7.Tokens> authenticateWithCredentials($grpc.ServiceCall call, $7.Credentials request);
  $async.Future<$7.Tokens> authenticateWithRefreshToken($grpc.ServiceCall call, $7.RefreshToken request);
  $async.Future<$8.UserPermissions> readUserPermissionsByToken($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$9.CreateFirmResponse> createFirm($grpc.ServiceCall call, $9.CreateFirmRequest request);
  $async.Future<$9.Firm> readOneFirm($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$6.PendingUserResponse> createPendingUser($grpc.ServiceCall call, $6.PendingUserRequest request);
  $async.Future<$6.UserPublic> readOneUser($grpc.ServiceCall call, $7.UserId request);
  $async.Future<$7.UsersPublic> readAllUsers($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.StatusResponse> updateOneUser($grpc.ServiceCall call, $6.UserPublic request);
  $async.Future<$1.StatusResponse> updateUserPassword($grpc.ServiceCall call, $7.PasswordUpdateRequest request);
  $async.Future<$1.StatusResponse> deleteOneUser($grpc.ServiceCall call, $7.UserId request);
  $async.Future<$1.StatusResponse> createOneChain($grpc.ServiceCall call, $10.Chain request);
  $async.Future<$7.ReadAllChainsResponse> readAllChains($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.StatusResponse> updateOneChain($grpc.ServiceCall call, $10.Chain request);
  $async.Future<$1.StatusResponse> createOneBoutique($grpc.ServiceCall call, $11.Boutique request);
  $async.Future<$1.StatusResponse> updateOneBoutique($grpc.ServiceCall call, $11.Boutique request);
  $async.Future<$7.CodeForPairingDevice> generateCodeForPairingDevice($grpc.ServiceCall call, $12.ChainIdAndboutiqueId request);
  $async.Future<$1.StatusResponse> createPendingDevice($grpc.ServiceCall call, $7.PendingDeviceRequest request);
  $async.Future<$13.Device> readOnePendingDevice($grpc.ServiceCall call, $7.ReadDeviceBtqRequest request);
  $async.Future<$1.StatusResponse> approveDevice($grpc.ServiceCall call, $7.ApproveDeviceRequest request);
  $async.Future<$13.Devices> readDevices($grpc.ServiceCall call, $7.ReadDevicesRequest request);
  $async.Future<$7.Tokens> authenticateWithDevice($grpc.ServiceCall call, $7.DeviceCredentials request);
  $async.Future<$1.StatusResponse> updateDevicePassword($grpc.ServiceCall call, $7.UpdateDevicePasswordRequest request);
  $async.Future<$1.StatusResponse> deleteOneDevice($grpc.ServiceCall call, $7.DeleteDeviceRequest request);
}
