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

import 'boutique.pb.dart' as $12;
import 'btq_chain.pb.dart' as $11;
import 'common/chained_ids.pb.dart' as $14;
import 'common/empty.pb.dart' as $0;
import 'common/g_common.pb.dart' as $1;
import 'device.pb.dart' as $13;
import 'fence_service.pb.dart' as $8;
import 'firm.pb.dart' as $10;
import 'user.pb.dart' as $7;
import 'user_permissions.pb.dart' as $9;

export 'fence_service.pb.dart';

@$pb.GrpcServiceName('weebi.fence.service.FenceService')
class FenceServiceClient extends $grpc.Client {
  static final _$signUp = $grpc.ClientMethod<$7.SignUpRequest, $7.SignUpResponse>(
      '/weebi.fence.service.FenceService/signUp',
      ($7.SignUpRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.SignUpResponse.fromBuffer(value));
  static final _$authenticateWithCredentials = $grpc.ClientMethod<$8.Credentials, $8.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithCredentials',
      ($8.Credentials value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.Tokens.fromBuffer(value));
  static final _$authenticateWithRefreshToken = $grpc.ClientMethod<$8.RefreshToken, $8.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithRefreshToken',
      ($8.RefreshToken value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.Tokens.fromBuffer(value));
  static final _$readUserPermissionsByToken = $grpc.ClientMethod<$0.Empty, $9.UserPermissions>(
      '/weebi.fence.service.FenceService/readUserPermissionsByToken',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.UserPermissions.fromBuffer(value));
  static final _$createFirm = $grpc.ClientMethod<$10.CreateFirmRequest, $10.CreateFirmResponse>(
      '/weebi.fence.service.FenceService/createFirm',
      ($10.CreateFirmRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.CreateFirmResponse.fromBuffer(value));
  static final _$readOneFirm = $grpc.ClientMethod<$0.Empty, $10.Firm>(
      '/weebi.fence.service.FenceService/readOneFirm',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.Firm.fromBuffer(value));
  static final _$createPendingUser = $grpc.ClientMethod<$7.PendingUserRequest, $7.PendingUserResponse>(
      '/weebi.fence.service.FenceService/createPendingUser',
      ($7.PendingUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.PendingUserResponse.fromBuffer(value));
  static final _$readOneUser = $grpc.ClientMethod<$8.UserId, $8.ReadOneUserResponse>(
      '/weebi.fence.service.FenceService/readOneUser',
      ($8.UserId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.ReadOneUserResponse.fromBuffer(value));
  static final _$readAllUsers = $grpc.ClientMethod<$0.Empty, $8.UsersPublic>(
      '/weebi.fence.service.FenceService/readAllUsers',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.UsersPublic.fromBuffer(value));
  static final _$updateOneUser = $grpc.ClientMethod<$7.UserPublic, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneUser',
      ($7.UserPublic value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updateUserPassword = $grpc.ClientMethod<$8.PasswordUpdateRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateUserPassword',
      ($8.PasswordUpdateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneUser = $grpc.ClientMethod<$8.UserId, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneUser',
      ($8.UserId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOneChain = $grpc.ClientMethod<$11.Chain, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/createOneChain',
      ($11.Chain value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readAllChains = $grpc.ClientMethod<$0.Empty, $8.ReadAllChainsResponse>(
      '/weebi.fence.service.FenceService/readAllChains',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.ReadAllChainsResponse.fromBuffer(value));
  static final _$updateOneChain = $grpc.ClientMethod<$11.Chain, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneChain',
      ($11.Chain value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOneBoutique = $grpc.ClientMethod<$12.Boutique, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/createOneBoutique',
      ($12.Boutique value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updateOneBoutique = $grpc.ClientMethod<$12.Boutique, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneBoutique',
      ($12.Boutique value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readDevices = $grpc.ClientMethod<$8.ReadDevicesRequest, $13.Devices>(
      '/weebi.fence.service.FenceService/readDevices',
      ($8.ReadDevicesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $13.Devices.fromBuffer(value));
  static final _$generateCodeForPairingDevice = $grpc.ClientMethod<$14.ChainIdAndboutiqueId, $8.CodeForPairingDevice>(
      '/weebi.fence.service.FenceService/generateCodeForPairingDevice',
      ($14.ChainIdAndboutiqueId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.CodeForPairingDevice.fromBuffer(value));
  static final _$readOnePendingDevice = $grpc.ClientMethod<$8.ReadDeviceBtqRequest, $13.Device>(
      '/weebi.fence.service.FenceService/readOnePendingDevice',
      ($8.ReadDeviceBtqRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $13.Device.fromBuffer(value));
  static final _$createDevice = $grpc.ClientMethod<$8.PendingDeviceRequest, $8.CreatePendingDeviceResponse>(
      '/weebi.fence.service.FenceService/createDevice',
      ($8.PendingDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.CreatePendingDeviceResponse.fromBuffer(value));
  static final _$authenticateWithDevice = $grpc.ClientMethod<$8.DeviceCredentials, $8.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithDevice',
      ($8.DeviceCredentials value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.Tokens.fromBuffer(value));
  static final _$updateDevicePassword = $grpc.ClientMethod<$8.UpdateDevicePasswordRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateDevicePassword',
      ($8.UpdateDevicePasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneDevice = $grpc.ClientMethod<$8.DeleteDeviceRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneDevice',
      ($8.DeleteDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  FenceServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$7.SignUpResponse> signUp($7.SignUpRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$8.Tokens> authenticateWithCredentials($8.Credentials request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithCredentials, request, options: options);
  }

  $grpc.ResponseFuture<$8.Tokens> authenticateWithRefreshToken($8.RefreshToken request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithRefreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$9.UserPermissions> readUserPermissionsByToken($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readUserPermissionsByToken, request, options: options);
  }

  $grpc.ResponseFuture<$10.CreateFirmResponse> createFirm($10.CreateFirmRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createFirm, request, options: options);
  }

  $grpc.ResponseFuture<$10.Firm> readOneFirm($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneFirm, request, options: options);
  }

  $grpc.ResponseFuture<$7.PendingUserResponse> createPendingUser($7.PendingUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPendingUser, request, options: options);
  }

  $grpc.ResponseFuture<$8.ReadOneUserResponse> readOneUser($8.UserId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$8.UsersPublic> readAllUsers($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllUsers, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneUser($7.UserPublic request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateUserPassword($8.PasswordUpdateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUserPassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneUser($8.UserId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneChain($11.Chain request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$8.ReadAllChainsResponse> readAllChains($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllChains, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneChain($11.Chain request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneBoutique($12.Boutique request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneBoutique, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneBoutique($12.Boutique request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneBoutique, request, options: options);
  }

  $grpc.ResponseFuture<$13.Devices> readDevices($8.ReadDevicesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readDevices, request, options: options);
  }

  $grpc.ResponseFuture<$8.CodeForPairingDevice> generateCodeForPairingDevice($14.ChainIdAndboutiqueId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateCodeForPairingDevice, request, options: options);
  }

  $grpc.ResponseFuture<$13.Device> readOnePendingDevice($8.ReadDeviceBtqRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOnePendingDevice, request, options: options);
  }

  $grpc.ResponseFuture<$8.CreatePendingDeviceResponse> createDevice($8.PendingDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDevice, request, options: options);
  }

  $grpc.ResponseFuture<$8.Tokens> authenticateWithDevice($8.DeviceCredentials request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateDevicePassword($8.UpdateDevicePasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDevicePassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneDevice($8.DeleteDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneDevice, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.fence.service.FenceService')
abstract class FenceServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.fence.service.FenceService';

  FenceServiceBase() {
    $addMethod($grpc.ServiceMethod<$7.SignUpRequest, $7.SignUpResponse>(
        'signUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.SignUpRequest.fromBuffer(value),
        ($7.SignUpResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.Credentials, $8.Tokens>(
        'authenticateWithCredentials',
        authenticateWithCredentials_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.Credentials.fromBuffer(value),
        ($8.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.RefreshToken, $8.Tokens>(
        'authenticateWithRefreshToken',
        authenticateWithRefreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.RefreshToken.fromBuffer(value),
        ($8.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $9.UserPermissions>(
        'readUserPermissionsByToken',
        readUserPermissionsByToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($9.UserPermissions value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.CreateFirmRequest, $10.CreateFirmResponse>(
        'createFirm',
        createFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.CreateFirmRequest.fromBuffer(value),
        ($10.CreateFirmResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $10.Firm>(
        'readOneFirm',
        readOneFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($10.Firm value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.PendingUserRequest, $7.PendingUserResponse>(
        'createPendingUser',
        createPendingUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.PendingUserRequest.fromBuffer(value),
        ($7.PendingUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UserId, $8.ReadOneUserResponse>(
        'readOneUser',
        readOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.UserId.fromBuffer(value),
        ($8.ReadOneUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $8.UsersPublic>(
        'readAllUsers',
        readAllUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($8.UsersPublic value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.UserPublic, $1.StatusResponse>(
        'updateOneUser',
        updateOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.UserPublic.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.PasswordUpdateRequest, $1.StatusResponse>(
        'updateUserPassword',
        updateUserPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.PasswordUpdateRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UserId, $1.StatusResponse>(
        'deleteOneUser',
        deleteOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.UserId.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.Chain, $1.StatusResponse>(
        'createOneChain',
        createOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.Chain.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $8.ReadAllChainsResponse>(
        'readAllChains',
        readAllChains_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($8.ReadAllChainsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.Chain, $1.StatusResponse>(
        'updateOneChain',
        updateOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.Chain.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.Boutique, $1.StatusResponse>(
        'createOneBoutique',
        createOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.Boutique.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.Boutique, $1.StatusResponse>(
        'updateOneBoutique',
        updateOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.Boutique.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ReadDevicesRequest, $13.Devices>(
        'readDevices',
        readDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ReadDevicesRequest.fromBuffer(value),
        ($13.Devices value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.ChainIdAndboutiqueId, $8.CodeForPairingDevice>(
        'generateCodeForPairingDevice',
        generateCodeForPairingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.ChainIdAndboutiqueId.fromBuffer(value),
        ($8.CodeForPairingDevice value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ReadDeviceBtqRequest, $13.Device>(
        'readOnePendingDevice',
        readOnePendingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ReadDeviceBtqRequest.fromBuffer(value),
        ($13.Device value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.PendingDeviceRequest, $8.CreatePendingDeviceResponse>(
        'createDevice',
        createDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.PendingDeviceRequest.fromBuffer(value),
        ($8.CreatePendingDeviceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.DeviceCredentials, $8.Tokens>(
        'authenticateWithDevice',
        authenticateWithDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.DeviceCredentials.fromBuffer(value),
        ($8.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UpdateDevicePasswordRequest, $1.StatusResponse>(
        'updateDevicePassword',
        updateDevicePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.UpdateDevicePasswordRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.DeleteDeviceRequest, $1.StatusResponse>(
        'deleteOneDevice',
        deleteOneDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.DeleteDeviceRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$7.SignUpResponse> signUp_Pre($grpc.ServiceCall call, $async.Future<$7.SignUpRequest> request) async {
    return signUp(call, await request);
  }

  $async.Future<$8.Tokens> authenticateWithCredentials_Pre($grpc.ServiceCall call, $async.Future<$8.Credentials> request) async {
    return authenticateWithCredentials(call, await request);
  }

  $async.Future<$8.Tokens> authenticateWithRefreshToken_Pre($grpc.ServiceCall call, $async.Future<$8.RefreshToken> request) async {
    return authenticateWithRefreshToken(call, await request);
  }

  $async.Future<$9.UserPermissions> readUserPermissionsByToken_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readUserPermissionsByToken(call, await request);
  }

  $async.Future<$10.CreateFirmResponse> createFirm_Pre($grpc.ServiceCall call, $async.Future<$10.CreateFirmRequest> request) async {
    return createFirm(call, await request);
  }

  $async.Future<$10.Firm> readOneFirm_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readOneFirm(call, await request);
  }

  $async.Future<$7.PendingUserResponse> createPendingUser_Pre($grpc.ServiceCall call, $async.Future<$7.PendingUserRequest> request) async {
    return createPendingUser(call, await request);
  }

  $async.Future<$8.ReadOneUserResponse> readOneUser_Pre($grpc.ServiceCall call, $async.Future<$8.UserId> request) async {
    return readOneUser(call, await request);
  }

  $async.Future<$8.UsersPublic> readAllUsers_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readAllUsers(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneUser_Pre($grpc.ServiceCall call, $async.Future<$7.UserPublic> request) async {
    return updateOneUser(call, await request);
  }

  $async.Future<$1.StatusResponse> updateUserPassword_Pre($grpc.ServiceCall call, $async.Future<$8.PasswordUpdateRequest> request) async {
    return updateUserPassword(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOneUser_Pre($grpc.ServiceCall call, $async.Future<$8.UserId> request) async {
    return deleteOneUser(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneChain_Pre($grpc.ServiceCall call, $async.Future<$11.Chain> request) async {
    return createOneChain(call, await request);
  }

  $async.Future<$8.ReadAllChainsResponse> readAllChains_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readAllChains(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneChain_Pre($grpc.ServiceCall call, $async.Future<$11.Chain> request) async {
    return updateOneChain(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneBoutique_Pre($grpc.ServiceCall call, $async.Future<$12.Boutique> request) async {
    return createOneBoutique(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneBoutique_Pre($grpc.ServiceCall call, $async.Future<$12.Boutique> request) async {
    return updateOneBoutique(call, await request);
  }

  $async.Future<$13.Devices> readDevices_Pre($grpc.ServiceCall call, $async.Future<$8.ReadDevicesRequest> request) async {
    return readDevices(call, await request);
  }

  $async.Future<$8.CodeForPairingDevice> generateCodeForPairingDevice_Pre($grpc.ServiceCall call, $async.Future<$14.ChainIdAndboutiqueId> request) async {
    return generateCodeForPairingDevice(call, await request);
  }

  $async.Future<$13.Device> readOnePendingDevice_Pre($grpc.ServiceCall call, $async.Future<$8.ReadDeviceBtqRequest> request) async {
    return readOnePendingDevice(call, await request);
  }

  $async.Future<$8.CreatePendingDeviceResponse> createDevice_Pre($grpc.ServiceCall call, $async.Future<$8.PendingDeviceRequest> request) async {
    return createDevice(call, await request);
  }

  $async.Future<$8.Tokens> authenticateWithDevice_Pre($grpc.ServiceCall call, $async.Future<$8.DeviceCredentials> request) async {
    return authenticateWithDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> updateDevicePassword_Pre($grpc.ServiceCall call, $async.Future<$8.UpdateDevicePasswordRequest> request) async {
    return updateDevicePassword(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOneDevice_Pre($grpc.ServiceCall call, $async.Future<$8.DeleteDeviceRequest> request) async {
    return deleteOneDevice(call, await request);
  }

  $async.Future<$7.SignUpResponse> signUp($grpc.ServiceCall call, $7.SignUpRequest request);
  $async.Future<$8.Tokens> authenticateWithCredentials($grpc.ServiceCall call, $8.Credentials request);
  $async.Future<$8.Tokens> authenticateWithRefreshToken($grpc.ServiceCall call, $8.RefreshToken request);
  $async.Future<$9.UserPermissions> readUserPermissionsByToken($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$10.CreateFirmResponse> createFirm($grpc.ServiceCall call, $10.CreateFirmRequest request);
  $async.Future<$10.Firm> readOneFirm($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$7.PendingUserResponse> createPendingUser($grpc.ServiceCall call, $7.PendingUserRequest request);
  $async.Future<$8.ReadOneUserResponse> readOneUser($grpc.ServiceCall call, $8.UserId request);
  $async.Future<$8.UsersPublic> readAllUsers($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.StatusResponse> updateOneUser($grpc.ServiceCall call, $7.UserPublic request);
  $async.Future<$1.StatusResponse> updateUserPassword($grpc.ServiceCall call, $8.PasswordUpdateRequest request);
  $async.Future<$1.StatusResponse> deleteOneUser($grpc.ServiceCall call, $8.UserId request);
  $async.Future<$1.StatusResponse> createOneChain($grpc.ServiceCall call, $11.Chain request);
  $async.Future<$8.ReadAllChainsResponse> readAllChains($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.StatusResponse> updateOneChain($grpc.ServiceCall call, $11.Chain request);
  $async.Future<$1.StatusResponse> createOneBoutique($grpc.ServiceCall call, $12.Boutique request);
  $async.Future<$1.StatusResponse> updateOneBoutique($grpc.ServiceCall call, $12.Boutique request);
  $async.Future<$13.Devices> readDevices($grpc.ServiceCall call, $8.ReadDevicesRequest request);
  $async.Future<$8.CodeForPairingDevice> generateCodeForPairingDevice($grpc.ServiceCall call, $14.ChainIdAndboutiqueId request);
  $async.Future<$13.Device> readOnePendingDevice($grpc.ServiceCall call, $8.ReadDeviceBtqRequest request);
  $async.Future<$8.CreatePendingDeviceResponse> createDevice($grpc.ServiceCall call, $8.PendingDeviceRequest request);
  $async.Future<$8.Tokens> authenticateWithDevice($grpc.ServiceCall call, $8.DeviceCredentials request);
  $async.Future<$1.StatusResponse> updateDevicePassword($grpc.ServiceCall call, $8.UpdateDevicePasswordRequest request);
  $async.Future<$1.StatusResponse> deleteOneDevice($grpc.ServiceCall call, $8.DeleteDeviceRequest request);
}
