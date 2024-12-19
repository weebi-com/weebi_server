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

import 'boutique.pb.dart' as $13;
import 'btq_chain.pb.dart' as $12;
import 'common/chained_ids.pb.dart' as $15;
import 'common/empty.pb.dart' as $0;
import 'common/g_common.pb.dart' as $1;
import 'device.pb.dart' as $14;
import 'fence_service.pb.dart' as $9;
import 'firm.pb.dart' as $11;
import 'user.pb.dart' as $8;
import 'user_permissions.pb.dart' as $10;

export 'fence_service.pb.dart';

@$pb.GrpcServiceName('weebi.fence.service.FenceService')
class FenceServiceClient extends $grpc.Client {
  static final _$signUp = $grpc.ClientMethod<$8.SignUpRequest, $8.SignUpResponse>(
      '/weebi.fence.service.FenceService/signUp',
      ($8.SignUpRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.SignUpResponse.fromBuffer(value));
  static final _$authenticateWithCredentials = $grpc.ClientMethod<$9.Credentials, $9.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithCredentials',
      ($9.Credentials value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.Tokens.fromBuffer(value));
  static final _$authenticateWithRefreshToken = $grpc.ClientMethod<$9.RefreshToken, $9.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithRefreshToken',
      ($9.RefreshToken value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.Tokens.fromBuffer(value));
  static final _$readUserPermissionsByToken = $grpc.ClientMethod<$0.Empty, $10.UserPermissions>(
      '/weebi.fence.service.FenceService/readUserPermissionsByToken',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.UserPermissions.fromBuffer(value));
  static final _$createFirm = $grpc.ClientMethod<$11.CreateFirmRequest, $11.CreateFirmResponse>(
      '/weebi.fence.service.FenceService/createFirm',
      ($11.CreateFirmRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $11.CreateFirmResponse.fromBuffer(value));
  static final _$readOneFirm = $grpc.ClientMethod<$0.Empty, $11.Firm>(
      '/weebi.fence.service.FenceService/readOneFirm',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $11.Firm.fromBuffer(value));
  static final _$createPendingUser = $grpc.ClientMethod<$8.PendingUserRequest, $8.PendingUserResponse>(
      '/weebi.fence.service.FenceService/createPendingUser',
      ($8.PendingUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.PendingUserResponse.fromBuffer(value));
  static final _$readOneUser = $grpc.ClientMethod<$9.UserId, $9.ReadOneUserResponse>(
      '/weebi.fence.service.FenceService/readOneUser',
      ($9.UserId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.ReadOneUserResponse.fromBuffer(value));
  static final _$readAllUsers = $grpc.ClientMethod<$0.Empty, $9.UsersPublic>(
      '/weebi.fence.service.FenceService/readAllUsers',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.UsersPublic.fromBuffer(value));
  static final _$updateOneUser = $grpc.ClientMethod<$8.UserPublic, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneUser',
      ($8.UserPublic value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updateUserPassword = $grpc.ClientMethod<$9.PasswordUpdateRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateUserPassword',
      ($9.PasswordUpdateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneUser = $grpc.ClientMethod<$9.UserId, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneUser',
      ($9.UserId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOneChain = $grpc.ClientMethod<$12.Chain, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/createOneChain',
      ($12.Chain value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readAllChains = $grpc.ClientMethod<$0.Empty, $9.ReadAllChainsResponse>(
      '/weebi.fence.service.FenceService/readAllChains',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.ReadAllChainsResponse.fromBuffer(value));
  static final _$updateOneChain = $grpc.ClientMethod<$12.Chain, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneChain',
      ($12.Chain value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneChain = $grpc.ClientMethod<$12.Chain, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneChain',
      ($12.Chain value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOneBoutique = $grpc.ClientMethod<$9.BoutiqueRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/createOneBoutique',
      ($9.BoutiqueRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readOneBoutique = $grpc.ClientMethod<$9.BoutiqueRequest, $13.BoutiquePb>(
      '/weebi.fence.service.FenceService/readOneBoutique',
      ($9.BoutiqueRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $13.BoutiquePb.fromBuffer(value));
  static final _$updateOneBoutique = $grpc.ClientMethod<$9.BoutiqueRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneBoutique',
      ($9.BoutiqueRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneBoutique = $grpc.ClientMethod<$9.BoutiqueRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneBoutique',
      ($9.BoutiqueRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readDevices = $grpc.ClientMethod<$9.ReadDevicesRequest, $14.Devices>(
      '/weebi.fence.service.FenceService/readDevices',
      ($9.ReadDevicesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.Devices.fromBuffer(value));
  static final _$generateCodeForPairingDevice = $grpc.ClientMethod<$15.ChainIdAndboutiqueId, $9.CodeForPairingDevice>(
      '/weebi.fence.service.FenceService/generateCodeForPairingDevice',
      ($15.ChainIdAndboutiqueId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.CodeForPairingDevice.fromBuffer(value));
  static final _$readOnePendingDevice = $grpc.ClientMethod<$9.ReadDeviceBtqRequest, $14.Device>(
      '/weebi.fence.service.FenceService/readOnePendingDevice',
      ($9.ReadDeviceBtqRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.Device.fromBuffer(value));
  static final _$createDevice = $grpc.ClientMethod<$9.PendingDeviceRequest, $9.CreateDeviceResponse>(
      '/weebi.fence.service.FenceService/createDevice',
      ($9.PendingDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.CreateDeviceResponse.fromBuffer(value));
  static final _$authenticateWithDevice = $grpc.ClientMethod<$9.DeviceCredentials, $9.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithDevice',
      ($9.DeviceCredentials value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.Tokens.fromBuffer(value));
  static final _$updateDevicePassword = $grpc.ClientMethod<$9.UpdateDevicePasswordRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateDevicePassword',
      ($9.UpdateDevicePasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneDevice = $grpc.ClientMethod<$9.DeleteDeviceRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneDevice',
      ($9.DeleteDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  FenceServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$8.SignUpResponse> signUp($8.SignUpRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$9.Tokens> authenticateWithCredentials($9.Credentials request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithCredentials, request, options: options);
  }

  $grpc.ResponseFuture<$9.Tokens> authenticateWithRefreshToken($9.RefreshToken request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithRefreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$10.UserPermissions> readUserPermissionsByToken($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readUserPermissionsByToken, request, options: options);
  }

  $grpc.ResponseFuture<$11.CreateFirmResponse> createFirm($11.CreateFirmRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createFirm, request, options: options);
  }

  $grpc.ResponseFuture<$11.Firm> readOneFirm($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneFirm, request, options: options);
  }

  $grpc.ResponseFuture<$8.PendingUserResponse> createPendingUser($8.PendingUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPendingUser, request, options: options);
  }

  $grpc.ResponseFuture<$9.ReadOneUserResponse> readOneUser($9.UserId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$9.UsersPublic> readAllUsers($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllUsers, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneUser($8.UserPublic request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateUserPassword($9.PasswordUpdateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUserPassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneUser($9.UserId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneChain($12.Chain request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$9.ReadAllChainsResponse> readAllChains($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllChains, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneChain($12.Chain request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneChain($12.Chain request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneBoutique($9.BoutiqueRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneBoutique, request, options: options);
  }

  $grpc.ResponseFuture<$13.BoutiquePb> readOneBoutique($9.BoutiqueRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneBoutique, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneBoutique($9.BoutiqueRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneBoutique, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneBoutique($9.BoutiqueRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneBoutique, request, options: options);
  }

  $grpc.ResponseFuture<$14.Devices> readDevices($9.ReadDevicesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readDevices, request, options: options);
  }

  $grpc.ResponseFuture<$9.CodeForPairingDevice> generateCodeForPairingDevice($15.ChainIdAndboutiqueId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateCodeForPairingDevice, request, options: options);
  }

  $grpc.ResponseFuture<$14.Device> readOnePendingDevice($9.ReadDeviceBtqRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOnePendingDevice, request, options: options);
  }

  $grpc.ResponseFuture<$9.CreateDeviceResponse> createDevice($9.PendingDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDevice, request, options: options);
  }

  $grpc.ResponseFuture<$9.Tokens> authenticateWithDevice($9.DeviceCredentials request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateDevicePassword($9.UpdateDevicePasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDevicePassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneDevice($9.DeleteDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneDevice, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.fence.service.FenceService')
abstract class FenceServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.fence.service.FenceService';

  FenceServiceBase() {
    $addMethod($grpc.ServiceMethod<$8.SignUpRequest, $8.SignUpResponse>(
        'signUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.SignUpRequest.fromBuffer(value),
        ($8.SignUpResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.Credentials, $9.Tokens>(
        'authenticateWithCredentials',
        authenticateWithCredentials_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.Credentials.fromBuffer(value),
        ($9.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.RefreshToken, $9.Tokens>(
        'authenticateWithRefreshToken',
        authenticateWithRefreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.RefreshToken.fromBuffer(value),
        ($9.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $10.UserPermissions>(
        'readUserPermissionsByToken',
        readUserPermissionsByToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($10.UserPermissions value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.CreateFirmRequest, $11.CreateFirmResponse>(
        'createFirm',
        createFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.CreateFirmRequest.fromBuffer(value),
        ($11.CreateFirmResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $11.Firm>(
        'readOneFirm',
        readOneFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($11.Firm value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.PendingUserRequest, $8.PendingUserResponse>(
        'createPendingUser',
        createPendingUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.PendingUserRequest.fromBuffer(value),
        ($8.PendingUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.UserId, $9.ReadOneUserResponse>(
        'readOneUser',
        readOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.UserId.fromBuffer(value),
        ($9.ReadOneUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $9.UsersPublic>(
        'readAllUsers',
        readAllUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($9.UsersPublic value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UserPublic, $1.StatusResponse>(
        'updateOneUser',
        updateOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.UserPublic.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.PasswordUpdateRequest, $1.StatusResponse>(
        'updateUserPassword',
        updateUserPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.PasswordUpdateRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.UserId, $1.StatusResponse>(
        'deleteOneUser',
        deleteOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.UserId.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.Chain, $1.StatusResponse>(
        'createOneChain',
        createOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.Chain.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $9.ReadAllChainsResponse>(
        'readAllChains',
        readAllChains_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($9.ReadAllChainsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.Chain, $1.StatusResponse>(
        'updateOneChain',
        updateOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.Chain.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.Chain, $1.StatusResponse>(
        'deleteOneChain',
        deleteOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.Chain.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.BoutiqueRequest, $1.StatusResponse>(
        'createOneBoutique',
        createOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.BoutiqueRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.BoutiqueRequest, $13.BoutiquePb>(
        'readOneBoutique',
        readOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.BoutiqueRequest.fromBuffer(value),
        ($13.BoutiquePb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.BoutiqueRequest, $1.StatusResponse>(
        'updateOneBoutique',
        updateOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.BoutiqueRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.BoutiqueRequest, $1.StatusResponse>(
        'deleteOneBoutique',
        deleteOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.BoutiqueRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.ReadDevicesRequest, $14.Devices>(
        'readDevices',
        readDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.ReadDevicesRequest.fromBuffer(value),
        ($14.Devices value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.ChainIdAndboutiqueId, $9.CodeForPairingDevice>(
        'generateCodeForPairingDevice',
        generateCodeForPairingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.ChainIdAndboutiqueId.fromBuffer(value),
        ($9.CodeForPairingDevice value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.ReadDeviceBtqRequest, $14.Device>(
        'readOnePendingDevice',
        readOnePendingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.ReadDeviceBtqRequest.fromBuffer(value),
        ($14.Device value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.PendingDeviceRequest, $9.CreateDeviceResponse>(
        'createDevice',
        createDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.PendingDeviceRequest.fromBuffer(value),
        ($9.CreateDeviceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.DeviceCredentials, $9.Tokens>(
        'authenticateWithDevice',
        authenticateWithDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.DeviceCredentials.fromBuffer(value),
        ($9.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.UpdateDevicePasswordRequest, $1.StatusResponse>(
        'updateDevicePassword',
        updateDevicePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.UpdateDevicePasswordRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.DeleteDeviceRequest, $1.StatusResponse>(
        'deleteOneDevice',
        deleteOneDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.DeleteDeviceRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$8.SignUpResponse> signUp_Pre($grpc.ServiceCall call, $async.Future<$8.SignUpRequest> request) async {
    return signUp(call, await request);
  }

  $async.Future<$9.Tokens> authenticateWithCredentials_Pre($grpc.ServiceCall call, $async.Future<$9.Credentials> request) async {
    return authenticateWithCredentials(call, await request);
  }

  $async.Future<$9.Tokens> authenticateWithRefreshToken_Pre($grpc.ServiceCall call, $async.Future<$9.RefreshToken> request) async {
    return authenticateWithRefreshToken(call, await request);
  }

  $async.Future<$10.UserPermissions> readUserPermissionsByToken_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readUserPermissionsByToken(call, await request);
  }

  $async.Future<$11.CreateFirmResponse> createFirm_Pre($grpc.ServiceCall call, $async.Future<$11.CreateFirmRequest> request) async {
    return createFirm(call, await request);
  }

  $async.Future<$11.Firm> readOneFirm_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readOneFirm(call, await request);
  }

  $async.Future<$8.PendingUserResponse> createPendingUser_Pre($grpc.ServiceCall call, $async.Future<$8.PendingUserRequest> request) async {
    return createPendingUser(call, await request);
  }

  $async.Future<$9.ReadOneUserResponse> readOneUser_Pre($grpc.ServiceCall call, $async.Future<$9.UserId> request) async {
    return readOneUser(call, await request);
  }

  $async.Future<$9.UsersPublic> readAllUsers_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readAllUsers(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneUser_Pre($grpc.ServiceCall call, $async.Future<$8.UserPublic> request) async {
    return updateOneUser(call, await request);
  }

  $async.Future<$1.StatusResponse> updateUserPassword_Pre($grpc.ServiceCall call, $async.Future<$9.PasswordUpdateRequest> request) async {
    return updateUserPassword(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOneUser_Pre($grpc.ServiceCall call, $async.Future<$9.UserId> request) async {
    return deleteOneUser(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneChain_Pre($grpc.ServiceCall call, $async.Future<$12.Chain> request) async {
    return createOneChain(call, await request);
  }

  $async.Future<$9.ReadAllChainsResponse> readAllChains_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readAllChains(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneChain_Pre($grpc.ServiceCall call, $async.Future<$12.Chain> request) async {
    return updateOneChain(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOneChain_Pre($grpc.ServiceCall call, $async.Future<$12.Chain> request) async {
    return deleteOneChain(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneBoutique_Pre($grpc.ServiceCall call, $async.Future<$9.BoutiqueRequest> request) async {
    return createOneBoutique(call, await request);
  }

  $async.Future<$13.BoutiquePb> readOneBoutique_Pre($grpc.ServiceCall call, $async.Future<$9.BoutiqueRequest> request) async {
    return readOneBoutique(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneBoutique_Pre($grpc.ServiceCall call, $async.Future<$9.BoutiqueRequest> request) async {
    return updateOneBoutique(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOneBoutique_Pre($grpc.ServiceCall call, $async.Future<$9.BoutiqueRequest> request) async {
    return deleteOneBoutique(call, await request);
  }

  $async.Future<$14.Devices> readDevices_Pre($grpc.ServiceCall call, $async.Future<$9.ReadDevicesRequest> request) async {
    return readDevices(call, await request);
  }

  $async.Future<$9.CodeForPairingDevice> generateCodeForPairingDevice_Pre($grpc.ServiceCall call, $async.Future<$15.ChainIdAndboutiqueId> request) async {
    return generateCodeForPairingDevice(call, await request);
  }

  $async.Future<$14.Device> readOnePendingDevice_Pre($grpc.ServiceCall call, $async.Future<$9.ReadDeviceBtqRequest> request) async {
    return readOnePendingDevice(call, await request);
  }

  $async.Future<$9.CreateDeviceResponse> createDevice_Pre($grpc.ServiceCall call, $async.Future<$9.PendingDeviceRequest> request) async {
    return createDevice(call, await request);
  }

  $async.Future<$9.Tokens> authenticateWithDevice_Pre($grpc.ServiceCall call, $async.Future<$9.DeviceCredentials> request) async {
    return authenticateWithDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> updateDevicePassword_Pre($grpc.ServiceCall call, $async.Future<$9.UpdateDevicePasswordRequest> request) async {
    return updateDevicePassword(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOneDevice_Pre($grpc.ServiceCall call, $async.Future<$9.DeleteDeviceRequest> request) async {
    return deleteOneDevice(call, await request);
  }

  $async.Future<$8.SignUpResponse> signUp($grpc.ServiceCall call, $8.SignUpRequest request);
  $async.Future<$9.Tokens> authenticateWithCredentials($grpc.ServiceCall call, $9.Credentials request);
  $async.Future<$9.Tokens> authenticateWithRefreshToken($grpc.ServiceCall call, $9.RefreshToken request);
  $async.Future<$10.UserPermissions> readUserPermissionsByToken($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$11.CreateFirmResponse> createFirm($grpc.ServiceCall call, $11.CreateFirmRequest request);
  $async.Future<$11.Firm> readOneFirm($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$8.PendingUserResponse> createPendingUser($grpc.ServiceCall call, $8.PendingUserRequest request);
  $async.Future<$9.ReadOneUserResponse> readOneUser($grpc.ServiceCall call, $9.UserId request);
  $async.Future<$9.UsersPublic> readAllUsers($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.StatusResponse> updateOneUser($grpc.ServiceCall call, $8.UserPublic request);
  $async.Future<$1.StatusResponse> updateUserPassword($grpc.ServiceCall call, $9.PasswordUpdateRequest request);
  $async.Future<$1.StatusResponse> deleteOneUser($grpc.ServiceCall call, $9.UserId request);
  $async.Future<$1.StatusResponse> createOneChain($grpc.ServiceCall call, $12.Chain request);
  $async.Future<$9.ReadAllChainsResponse> readAllChains($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.StatusResponse> updateOneChain($grpc.ServiceCall call, $12.Chain request);
  $async.Future<$1.StatusResponse> deleteOneChain($grpc.ServiceCall call, $12.Chain request);
  $async.Future<$1.StatusResponse> createOneBoutique($grpc.ServiceCall call, $9.BoutiqueRequest request);
  $async.Future<$13.BoutiquePb> readOneBoutique($grpc.ServiceCall call, $9.BoutiqueRequest request);
  $async.Future<$1.StatusResponse> updateOneBoutique($grpc.ServiceCall call, $9.BoutiqueRequest request);
  $async.Future<$1.StatusResponse> deleteOneBoutique($grpc.ServiceCall call, $9.BoutiqueRequest request);
  $async.Future<$14.Devices> readDevices($grpc.ServiceCall call, $9.ReadDevicesRequest request);
  $async.Future<$9.CodeForPairingDevice> generateCodeForPairingDevice($grpc.ServiceCall call, $15.ChainIdAndboutiqueId request);
  $async.Future<$14.Device> readOnePendingDevice($grpc.ServiceCall call, $9.ReadDeviceBtqRequest request);
  $async.Future<$9.CreateDeviceResponse> createDevice($grpc.ServiceCall call, $9.PendingDeviceRequest request);
  $async.Future<$9.Tokens> authenticateWithDevice($grpc.ServiceCall call, $9.DeviceCredentials request);
  $async.Future<$1.StatusResponse> updateDevicePassword($grpc.ServiceCall call, $9.UpdateDevicePasswordRequest request);
  $async.Future<$1.StatusResponse> deleteOneDevice($grpc.ServiceCall call, $9.DeleteDeviceRequest request);
}
