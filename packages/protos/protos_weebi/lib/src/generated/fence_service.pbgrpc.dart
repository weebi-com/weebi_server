//
//  Generated code. Do not modify.
//  source: fence_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'btq_chain.pb.dart' as $11;
import 'common/chained_ids.pb.dart' as $13;
import 'common/empty.pb.dart' as $5;
import 'common/g_common.pb.dart' as $1;
import 'device.pb.dart' as $12;
import 'fence_service.pb.dart' as $8;
import 'firm.pb.dart' as $10;
import 'user.pb.dart' as $9;

export 'fence_service.pb.dart';

/// / boutiques & users
@$pb.GrpcServiceName('weebi.fence.service.FenceService')
class FenceServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  static final _$healthCheck = $grpc.ClientMethod<$5.Empty, $8.HealthCheckWeebiResponse>(
      '/weebi.fence.service.FenceService/healthCheck',
      ($5.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.HealthCheckWeebiResponse.fromBuffer(value));
  static final _$signUp = $grpc.ClientMethod<$9.SignUpRequest, $9.SignUpResponse>(
      '/weebi.fence.service.FenceService/signUp',
      ($9.SignUpRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.SignUpResponse.fromBuffer(value));
  static final _$authenticateWithCredentials = $grpc.ClientMethod<$8.Credentials, $8.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithCredentials',
      ($8.Credentials value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.Tokens.fromBuffer(value));
  static final _$authenticateWithRefreshToken = $grpc.ClientMethod<$8.RefreshToken, $8.Tokens>(
      '/weebi.fence.service.FenceService/authenticateWithRefreshToken',
      ($8.RefreshToken value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.Tokens.fromBuffer(value));
  static final _$requestPasswordReset = $grpc.ClientMethod<$8.PasswordResetRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/requestPasswordReset',
      ($8.PasswordResetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$confirmPasswordReset = $grpc.ClientMethod<$8.PasswordResetConfirmRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/confirmPasswordReset',
      ($8.PasswordResetConfirmRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createFirm = $grpc.ClientMethod<$10.CreateFirmRequest, $10.CreateFirmResponse>(
      '/weebi.fence.service.FenceService/createFirm',
      ($10.CreateFirmRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.CreateFirmResponse.fromBuffer(value));
  static final _$readOneFirm = $grpc.ClientMethod<$5.Empty, $10.Firm>(
      '/weebi.fence.service.FenceService/readOneFirm',
      ($5.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.Firm.fromBuffer(value));
  static final _$createPendingUser = $grpc.ClientMethod<$9.PendingUserRequest, $9.PendingUserResponse>(
      '/weebi.fence.service.FenceService/createPendingUser',
      ($9.PendingUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.PendingUserResponse.fromBuffer(value));
  static final _$readOneUser = $grpc.ClientMethod<$8.UserId, $8.ReadOneUserResponse>(
      '/weebi.fence.service.FenceService/readOneUser',
      ($8.UserId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.ReadOneUserResponse.fromBuffer(value));
  static final _$readAllUsers = $grpc.ClientMethod<$5.Empty, $8.UsersPublic>(
      '/weebi.fence.service.FenceService/readAllUsers',
      ($5.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.UsersPublic.fromBuffer(value));
  static final _$updateOneUser = $grpc.ClientMethod<$9.UserPublic, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneUser',
      ($9.UserPublic value) => value.writeToBuffer(),
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
  static final _$readAllChains = $grpc.ClientMethod<$5.Empty, $8.ReadAllChainsResponse>(
      '/weebi.fence.service.FenceService/readAllChains',
      ($5.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.ReadAllChainsResponse.fromBuffer(value));
  static final _$updateOneChain = $grpc.ClientMethod<$8.ChainRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneChain',
      ($8.ChainRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneChain = $grpc.ClientMethod<$8.ChainRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneChain',
      ($8.ChainRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOneBoutique = $grpc.ClientMethod<$8.BoutiqueRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/createOneBoutique',
      ($8.BoutiqueRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readOneBoutique = $grpc.ClientMethod<$8.BoutiqueRequest, $8.BoutiqueResponse>(
      '/weebi.fence.service.FenceService/readOneBoutique',
      ($8.BoutiqueRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.BoutiqueResponse.fromBuffer(value));
  static final _$updateOneBoutique = $grpc.ClientMethod<$8.BoutiqueRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateOneBoutique',
      ($8.BoutiqueRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneBoutique = $grpc.ClientMethod<$8.BoutiqueRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneBoutique',
      ($8.BoutiqueRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$restoreOneBoutique = $grpc.ClientMethod<$8.BoutiqueRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/restoreOneBoutique',
      ($8.BoutiqueRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readAllBoutiques = $grpc.ClientMethod<$5.Empty, $8.ReadAllBoutiquesResponse>(
      '/weebi.fence.service.FenceService/readAllBoutiques',
      ($5.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.ReadAllBoutiquesResponse.fromBuffer(value));
  static final _$isADeviceInChain = $grpc.ClientMethod<$8.ReadDevicesRequest, $8.IsADeviceInChainResponse>(
      '/weebi.fence.service.FenceService/isADeviceInChain',
      ($8.ReadDevicesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.IsADeviceInChainResponse.fromBuffer(value));
  static final _$readDevices = $grpc.ClientMethod<$8.ReadDevicesRequest, $12.Devices>(
      '/weebi.fence.service.FenceService/readDevices',
      ($8.ReadDevicesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $12.Devices.fromBuffer(value));
  static final _$generateCodeForPairingDevice = $grpc.ClientMethod<$13.ChainIdAndboutiqueId, $8.CodeForPairingDevice>(
      '/weebi.fence.service.FenceService/generateCodeForPairingDevice',
      ($13.ChainIdAndboutiqueId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.CodeForPairingDevice.fromBuffer(value));
  static final _$readOnePendingDevice = $grpc.ClientMethod<$8.ReadDeviceBtqRequest, $12.Device>(
      '/weebi.fence.service.FenceService/readOnePendingDevice',
      ($8.ReadDeviceBtqRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $12.Device.fromBuffer(value));
  static final _$createDevice = $grpc.ClientMethod<$8.PendingDeviceRequest, $8.CreateDeviceResponse>(
      '/weebi.fence.service.FenceService/createDevice',
      ($8.PendingDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.CreateDeviceResponse.fromBuffer(value));
  static final _$updateDevicePassword = $grpc.ClientMethod<$8.UpdateDevicePasswordRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/updateDevicePassword',
      ($8.UpdateDevicePasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneDevice = $grpc.ClientMethod<$8.DeleteDeviceRequest, $1.StatusResponse>(
      '/weebi.fence.service.FenceService/deleteOneDevice',
      ($8.DeleteDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  FenceServiceClient(super.channel, {super.options, super.interceptors});

  /// / Health check with version information
  $grpc.ResponseFuture<$8.HealthCheckWeebiResponse> healthCheck($5.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$healthCheck, request, options: options);
  }

  $grpc.ResponseFuture<$9.SignUpResponse> signUp($9.SignUpRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$8.Tokens> authenticateWithCredentials($8.Credentials request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithCredentials, request, options: options);
  }

  $grpc.ResponseFuture<$8.Tokens> authenticateWithRefreshToken($8.RefreshToken request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticateWithRefreshToken, request, options: options);
  }

  /// Password reset functionality
  $grpc.ResponseFuture<$1.StatusResponse> requestPasswordReset($8.PasswordResetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$requestPasswordReset, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> confirmPasswordReset($8.PasswordResetConfirmRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$confirmPasswordReset, request, options: options);
  }

  /// / only one firm per 'company'
  /// / 1. user signup and get a userId & create firm permission
  /// / 2. A. user create a firm
  /// / Chain and Boutique will be created by default and will use the same firmId
  /// / Since createFirm also updates user permission, clientApp needs to reauthent using refresh right after
  /// / 2. B. user joins a firm is a different use case detailed in createPendingUser rpc
  $grpc.ResponseFuture<$10.CreateFirmResponse> createFirm($10.CreateFirmRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createFirm, request, options: options);
  }

  $grpc.ResponseFuture<$10.Firm> readOneFirm($5.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneFirm, request, options: options);
  }

  $grpc.ResponseFuture<$9.PendingUserResponse> createPendingUser($9.PendingUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPendingUser, request, options: options);
  }

  $grpc.ResponseFuture<$8.ReadOneUserResponse> readOneUser($8.UserId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneUser, request, options: options);
  }

  /// / Presumably, until 2030 firms will have max 9 users, why bother filter ?
  $grpc.ResponseFuture<$8.UsersPublic> readAllUsers($5.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllUsers, request, options: options);
  }

  /// real update, not an upsert, does nothing if user not found
  $grpc.ResponseFuture<$1.StatusResponse> updateOneUser($9.UserPublic request, {$grpc.CallOptions? options}) {
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

  $grpc.ResponseFuture<$8.ReadAllChainsResponse> readAllChains($5.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllChains, request, options: options);
  }

  /// only update fiels not boutiques, not upsert, do nothing if unfound
  $grpc.ResponseFuture<$1.StatusResponse> updateOneChain($8.ChainRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneChain, request, options: options);
  }

  /// / hard/complete delete
  $grpc.ResponseFuture<$1.StatusResponse> deleteOneChain($8.ChainRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneBoutique($8.BoutiqueRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneBoutique, request, options: options);
  }

  $grpc.ResponseFuture<$8.BoutiqueResponse> readOneBoutique($8.BoutiqueRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneBoutique, request, options: options);
  }

  /// / real update, not upsert, do nothing if unfound
  $grpc.ResponseFuture<$1.StatusResponse> updateOneBoutique($8.BoutiqueRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneBoutique, request, options: options);
  }

  /// / soft delete - marks boutique as deleted
  $grpc.ResponseFuture<$1.StatusResponse> deleteOneBoutique($8.BoutiqueRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneBoutique, request, options: options);
  }

  /// / restore a soft-deleted boutique
  $grpc.ResponseFuture<$1.StatusResponse> restoreOneBoutique($8.BoutiqueRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$restoreOneBoutique, request, options: options);
  }

  /// / returns all active boutiques across all chains (filters out deleted ones)
  $grpc.ResponseFuture<$8.ReadAllBoutiquesResponse> readAllBoutiques($5.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllBoutiques, request, options: options);
  }

  /// / scans all firm's devices, disregarding user rights
  /// / used both in :
  /// / weebi_app signups to REQUIRE that user pushes device data
  /// / weebi_app device linking to PREVENT user from pushing data, pulling only
  ///  will be false by default, which is safer since it avoids corrupting data when linking new device that potentially weebi_app with different data
  ///  == isOneDevice at least
  $grpc.ResponseFuture<$8.IsADeviceInChainResponse> isADeviceInChain($8.ReadDevicesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isADeviceInChain, request, options: options);
  }

  /// / return only device visible according to user rights
  $grpc.ResponseFuture<$12.Devices> readDevices($8.ReadDevicesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readDevices, request, options: options);
  }

  /// / device enrolment follows a different process than user enrolment
  /// / generateCodeForPairingDevice is called by web app, it includes chainId and boutiqueId
  /// / A device belongs to a boutique
  ///  TODO rename this create
  $grpc.ResponseFuture<$8.CodeForPairingDevice> generateCodeForPairingDevice($13.ChainIdAndboutiqueId request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateCodeForPairingDevice, request, options: options);
  }

  /// / webapp listens to deviceStream awaiting PoS app to createDevice by typing the code
  $grpc.ResponseFuture<$12.Device> readOnePendingDevice($8.ReadDeviceBtqRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOnePendingDevice, request, options: options);
  }

  /// / createDevice is called by mobile/desktop app
  /// / await lasts for 2 minutes (to be tested)
  /// / remove pending
  $grpc.ResponseFuture<$8.CreateDeviceResponse> createDevice($8.PendingDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDevice, request, options: options);
  }

  /// / removed as it brings a security risk
  /// / rpc authenticateWithDevice (DeviceCredentials) returns (Tokens);
  $grpc.ResponseFuture<$1.StatusResponse> updateDevicePassword($8.UpdateDevicePasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDevicePassword, request, options: options);
  }

  /// / hard/forever delete
  $grpc.ResponseFuture<$1.StatusResponse> deleteOneDevice($8.DeleteDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneDevice, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.fence.service.FenceService')
abstract class FenceServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.fence.service.FenceService';

  FenceServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.Empty, $8.HealthCheckWeebiResponse>(
        'healthCheck',
        healthCheck_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.Empty.fromBuffer(value),
        ($8.HealthCheckWeebiResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.SignUpRequest, $9.SignUpResponse>(
        'signUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.SignUpRequest.fromBuffer(value),
        ($9.SignUpResponse value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$8.PasswordResetRequest, $1.StatusResponse>(
        'requestPasswordReset',
        requestPasswordReset_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.PasswordResetRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.PasswordResetConfirmRequest, $1.StatusResponse>(
        'confirmPasswordReset',
        confirmPasswordReset_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.PasswordResetConfirmRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.CreateFirmRequest, $10.CreateFirmResponse>(
        'createFirm',
        createFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.CreateFirmRequest.fromBuffer(value),
        ($10.CreateFirmResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.Empty, $10.Firm>(
        'readOneFirm',
        readOneFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.Empty.fromBuffer(value),
        ($10.Firm value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.PendingUserRequest, $9.PendingUserResponse>(
        'createPendingUser',
        createPendingUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.PendingUserRequest.fromBuffer(value),
        ($9.PendingUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UserId, $8.ReadOneUserResponse>(
        'readOneUser',
        readOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.UserId.fromBuffer(value),
        ($8.ReadOneUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.Empty, $8.UsersPublic>(
        'readAllUsers',
        readAllUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.Empty.fromBuffer(value),
        ($8.UsersPublic value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.UserPublic, $1.StatusResponse>(
        'updateOneUser',
        updateOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.UserPublic.fromBuffer(value),
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
    $addMethod($grpc.ServiceMethod<$5.Empty, $8.ReadAllChainsResponse>(
        'readAllChains',
        readAllChains_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.Empty.fromBuffer(value),
        ($8.ReadAllChainsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChainRequest, $1.StatusResponse>(
        'updateOneChain',
        updateOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChainRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChainRequest, $1.StatusResponse>(
        'deleteOneChain',
        deleteOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChainRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.BoutiqueRequest, $1.StatusResponse>(
        'createOneBoutique',
        createOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.BoutiqueRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.BoutiqueRequest, $8.BoutiqueResponse>(
        'readOneBoutique',
        readOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.BoutiqueRequest.fromBuffer(value),
        ($8.BoutiqueResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.BoutiqueRequest, $1.StatusResponse>(
        'updateOneBoutique',
        updateOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.BoutiqueRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.BoutiqueRequest, $1.StatusResponse>(
        'deleteOneBoutique',
        deleteOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.BoutiqueRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.BoutiqueRequest, $1.StatusResponse>(
        'restoreOneBoutique',
        restoreOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.BoutiqueRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.Empty, $8.ReadAllBoutiquesResponse>(
        'readAllBoutiques',
        readAllBoutiques_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.Empty.fromBuffer(value),
        ($8.ReadAllBoutiquesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ReadDevicesRequest, $8.IsADeviceInChainResponse>(
        'isADeviceInChain',
        isADeviceInChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ReadDevicesRequest.fromBuffer(value),
        ($8.IsADeviceInChainResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ReadDevicesRequest, $12.Devices>(
        'readDevices',
        readDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ReadDevicesRequest.fromBuffer(value),
        ($12.Devices value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$13.ChainIdAndboutiqueId, $8.CodeForPairingDevice>(
        'generateCodeForPairingDevice',
        generateCodeForPairingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $13.ChainIdAndboutiqueId.fromBuffer(value),
        ($8.CodeForPairingDevice value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ReadDeviceBtqRequest, $12.Device>(
        'readOnePendingDevice',
        readOnePendingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ReadDeviceBtqRequest.fromBuffer(value),
        ($12.Device value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.PendingDeviceRequest, $8.CreateDeviceResponse>(
        'createDevice',
        createDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.PendingDeviceRequest.fromBuffer(value),
        ($8.CreateDeviceResponse value) => value.writeToBuffer()));
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

  $async.Future<$8.HealthCheckWeebiResponse> healthCheck_Pre($grpc.ServiceCall $call, $async.Future<$5.Empty> $request) async {
    return healthCheck($call, await $request);
  }

  $async.Future<$9.SignUpResponse> signUp_Pre($grpc.ServiceCall $call, $async.Future<$9.SignUpRequest> $request) async {
    return signUp($call, await $request);
  }

  $async.Future<$8.Tokens> authenticateWithCredentials_Pre($grpc.ServiceCall $call, $async.Future<$8.Credentials> $request) async {
    return authenticateWithCredentials($call, await $request);
  }

  $async.Future<$8.Tokens> authenticateWithRefreshToken_Pre($grpc.ServiceCall $call, $async.Future<$8.RefreshToken> $request) async {
    return authenticateWithRefreshToken($call, await $request);
  }

  $async.Future<$1.StatusResponse> requestPasswordReset_Pre($grpc.ServiceCall $call, $async.Future<$8.PasswordResetRequest> $request) async {
    return requestPasswordReset($call, await $request);
  }

  $async.Future<$1.StatusResponse> confirmPasswordReset_Pre($grpc.ServiceCall $call, $async.Future<$8.PasswordResetConfirmRequest> $request) async {
    return confirmPasswordReset($call, await $request);
  }

  $async.Future<$10.CreateFirmResponse> createFirm_Pre($grpc.ServiceCall $call, $async.Future<$10.CreateFirmRequest> $request) async {
    return createFirm($call, await $request);
  }

  $async.Future<$10.Firm> readOneFirm_Pre($grpc.ServiceCall $call, $async.Future<$5.Empty> $request) async {
    return readOneFirm($call, await $request);
  }

  $async.Future<$9.PendingUserResponse> createPendingUser_Pre($grpc.ServiceCall $call, $async.Future<$9.PendingUserRequest> $request) async {
    return createPendingUser($call, await $request);
  }

  $async.Future<$8.ReadOneUserResponse> readOneUser_Pre($grpc.ServiceCall $call, $async.Future<$8.UserId> $request) async {
    return readOneUser($call, await $request);
  }

  $async.Future<$8.UsersPublic> readAllUsers_Pre($grpc.ServiceCall $call, $async.Future<$5.Empty> $request) async {
    return readAllUsers($call, await $request);
  }

  $async.Future<$1.StatusResponse> updateOneUser_Pre($grpc.ServiceCall $call, $async.Future<$9.UserPublic> $request) async {
    return updateOneUser($call, await $request);
  }

  $async.Future<$1.StatusResponse> updateUserPassword_Pre($grpc.ServiceCall $call, $async.Future<$8.PasswordUpdateRequest> $request) async {
    return updateUserPassword($call, await $request);
  }

  $async.Future<$1.StatusResponse> deleteOneUser_Pre($grpc.ServiceCall $call, $async.Future<$8.UserId> $request) async {
    return deleteOneUser($call, await $request);
  }

  $async.Future<$1.StatusResponse> createOneChain_Pre($grpc.ServiceCall $call, $async.Future<$11.Chain> $request) async {
    return createOneChain($call, await $request);
  }

  $async.Future<$8.ReadAllChainsResponse> readAllChains_Pre($grpc.ServiceCall $call, $async.Future<$5.Empty> $request) async {
    return readAllChains($call, await $request);
  }

  $async.Future<$1.StatusResponse> updateOneChain_Pre($grpc.ServiceCall $call, $async.Future<$8.ChainRequest> $request) async {
    return updateOneChain($call, await $request);
  }

  $async.Future<$1.StatusResponse> deleteOneChain_Pre($grpc.ServiceCall $call, $async.Future<$8.ChainRequest> $request) async {
    return deleteOneChain($call, await $request);
  }

  $async.Future<$1.StatusResponse> createOneBoutique_Pre($grpc.ServiceCall $call, $async.Future<$8.BoutiqueRequest> $request) async {
    return createOneBoutique($call, await $request);
  }

  $async.Future<$8.BoutiqueResponse> readOneBoutique_Pre($grpc.ServiceCall $call, $async.Future<$8.BoutiqueRequest> $request) async {
    return readOneBoutique($call, await $request);
  }

  $async.Future<$1.StatusResponse> updateOneBoutique_Pre($grpc.ServiceCall $call, $async.Future<$8.BoutiqueRequest> $request) async {
    return updateOneBoutique($call, await $request);
  }

  $async.Future<$1.StatusResponse> deleteOneBoutique_Pre($grpc.ServiceCall $call, $async.Future<$8.BoutiqueRequest> $request) async {
    return deleteOneBoutique($call, await $request);
  }

  $async.Future<$1.StatusResponse> restoreOneBoutique_Pre($grpc.ServiceCall $call, $async.Future<$8.BoutiqueRequest> $request) async {
    return restoreOneBoutique($call, await $request);
  }

  $async.Future<$8.ReadAllBoutiquesResponse> readAllBoutiques_Pre($grpc.ServiceCall $call, $async.Future<$5.Empty> $request) async {
    return readAllBoutiques($call, await $request);
  }

  $async.Future<$8.IsADeviceInChainResponse> isADeviceInChain_Pre($grpc.ServiceCall $call, $async.Future<$8.ReadDevicesRequest> $request) async {
    return isADeviceInChain($call, await $request);
  }

  $async.Future<$12.Devices> readDevices_Pre($grpc.ServiceCall $call, $async.Future<$8.ReadDevicesRequest> $request) async {
    return readDevices($call, await $request);
  }

  $async.Future<$8.CodeForPairingDevice> generateCodeForPairingDevice_Pre($grpc.ServiceCall $call, $async.Future<$13.ChainIdAndboutiqueId> $request) async {
    return generateCodeForPairingDevice($call, await $request);
  }

  $async.Future<$12.Device> readOnePendingDevice_Pre($grpc.ServiceCall $call, $async.Future<$8.ReadDeviceBtqRequest> $request) async {
    return readOnePendingDevice($call, await $request);
  }

  $async.Future<$8.CreateDeviceResponse> createDevice_Pre($grpc.ServiceCall $call, $async.Future<$8.PendingDeviceRequest> $request) async {
    return createDevice($call, await $request);
  }

  $async.Future<$1.StatusResponse> updateDevicePassword_Pre($grpc.ServiceCall $call, $async.Future<$8.UpdateDevicePasswordRequest> $request) async {
    return updateDevicePassword($call, await $request);
  }

  $async.Future<$1.StatusResponse> deleteOneDevice_Pre($grpc.ServiceCall $call, $async.Future<$8.DeleteDeviceRequest> $request) async {
    return deleteOneDevice($call, await $request);
  }

  $async.Future<$8.HealthCheckWeebiResponse> healthCheck($grpc.ServiceCall call, $5.Empty request);
  $async.Future<$9.SignUpResponse> signUp($grpc.ServiceCall call, $9.SignUpRequest request);
  $async.Future<$8.Tokens> authenticateWithCredentials($grpc.ServiceCall call, $8.Credentials request);
  $async.Future<$8.Tokens> authenticateWithRefreshToken($grpc.ServiceCall call, $8.RefreshToken request);
  $async.Future<$1.StatusResponse> requestPasswordReset($grpc.ServiceCall call, $8.PasswordResetRequest request);
  $async.Future<$1.StatusResponse> confirmPasswordReset($grpc.ServiceCall call, $8.PasswordResetConfirmRequest request);
  $async.Future<$10.CreateFirmResponse> createFirm($grpc.ServiceCall call, $10.CreateFirmRequest request);
  $async.Future<$10.Firm> readOneFirm($grpc.ServiceCall call, $5.Empty request);
  $async.Future<$9.PendingUserResponse> createPendingUser($grpc.ServiceCall call, $9.PendingUserRequest request);
  $async.Future<$8.ReadOneUserResponse> readOneUser($grpc.ServiceCall call, $8.UserId request);
  $async.Future<$8.UsersPublic> readAllUsers($grpc.ServiceCall call, $5.Empty request);
  $async.Future<$1.StatusResponse> updateOneUser($grpc.ServiceCall call, $9.UserPublic request);
  $async.Future<$1.StatusResponse> updateUserPassword($grpc.ServiceCall call, $8.PasswordUpdateRequest request);
  $async.Future<$1.StatusResponse> deleteOneUser($grpc.ServiceCall call, $8.UserId request);
  $async.Future<$1.StatusResponse> createOneChain($grpc.ServiceCall call, $11.Chain request);
  $async.Future<$8.ReadAllChainsResponse> readAllChains($grpc.ServiceCall call, $5.Empty request);
  $async.Future<$1.StatusResponse> updateOneChain($grpc.ServiceCall call, $8.ChainRequest request);
  $async.Future<$1.StatusResponse> deleteOneChain($grpc.ServiceCall call, $8.ChainRequest request);
  $async.Future<$1.StatusResponse> createOneBoutique($grpc.ServiceCall call, $8.BoutiqueRequest request);
  $async.Future<$8.BoutiqueResponse> readOneBoutique($grpc.ServiceCall call, $8.BoutiqueRequest request);
  $async.Future<$1.StatusResponse> updateOneBoutique($grpc.ServiceCall call, $8.BoutiqueRequest request);
  $async.Future<$1.StatusResponse> deleteOneBoutique($grpc.ServiceCall call, $8.BoutiqueRequest request);
  $async.Future<$1.StatusResponse> restoreOneBoutique($grpc.ServiceCall call, $8.BoutiqueRequest request);
  $async.Future<$8.ReadAllBoutiquesResponse> readAllBoutiques($grpc.ServiceCall call, $5.Empty request);
  $async.Future<$8.IsADeviceInChainResponse> isADeviceInChain($grpc.ServiceCall call, $8.ReadDevicesRequest request);
  $async.Future<$12.Devices> readDevices($grpc.ServiceCall call, $8.ReadDevicesRequest request);
  $async.Future<$8.CodeForPairingDevice> generateCodeForPairingDevice($grpc.ServiceCall call, $13.ChainIdAndboutiqueId request);
  $async.Future<$12.Device> readOnePendingDevice($grpc.ServiceCall call, $8.ReadDeviceBtqRequest request);
  $async.Future<$8.CreateDeviceResponse> createDevice($grpc.ServiceCall call, $8.PendingDeviceRequest request);
  $async.Future<$1.StatusResponse> updateDevicePassword($grpc.ServiceCall call, $8.UpdateDevicePasswordRequest request);
  $async.Future<$1.StatusResponse> deleteOneDevice($grpc.ServiceCall call, $8.DeleteDeviceRequest request);
}
