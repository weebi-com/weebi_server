// This is a generated file - do not edit.
//
// Generated from fence_service.proto.

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

import 'btq_chain.pb.dart' as $5;
import 'common/chained_ids.pb.dart' as $7;
import 'common/empty.pb.dart' as $0;
import 'common/g_common.pb.dart' as $3;
import 'device.pb.dart' as $6;
import 'fence_service.pb.dart' as $1;
import 'firm.pb.dart' as $4;
import 'user.pb.dart' as $2;

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

  FenceServiceClient(super.channel, {super.options, super.interceptors});

  /// / Health check with version information
  $grpc.ResponseFuture<$1.HealthCheckWeebiResponse> healthCheck(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$healthCheck, request, options: options);
  }

  $grpc.ResponseFuture<$2.SignUpResponse> signUp(
    $2.SignUpRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$1.Tokens> authenticateWithCredentials(
    $1.Credentials request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$authenticateWithCredentials, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Tokens> authenticateWithRefreshToken(
    $1.RefreshToken request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$authenticateWithRefreshToken, request,
        options: options);
  }

  /// Password reset functionality
  $grpc.ResponseFuture<$3.StatusResponse> requestPasswordReset(
    $1.PasswordResetRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$requestPasswordReset, request, options: options);
  }

  $grpc.ResponseFuture<$3.StatusResponse> confirmPasswordReset(
    $1.PasswordResetConfirmRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$confirmPasswordReset, request, options: options);
  }

  /// / only one firm per 'company'
  /// / 1. user signup and get a userId & create firm permission
  /// / 2. A. user create a firm
  /// / Chain and Boutique will be created by default and will use the same firmId
  /// / Since createFirm also updates user permission, clientApp needs to reauthent using refresh right after
  /// / 2. B. user joins a firm is a different use case detailed in createPendingUser rpc
  $grpc.ResponseFuture<$4.CreateFirmResponse> createFirm(
    $4.CreateFirmRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createFirm, request, options: options);
  }

  $grpc.ResponseFuture<$4.Firm> readOneFirm(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readOneFirm, request, options: options);
  }

  $grpc.ResponseFuture<$2.PendingUserResponse> createPendingUser(
    $2.PendingUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createPendingUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.ReadOneUserResponse> readOneUser(
    $1.UserId request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readOneUser, request, options: options);
  }

  /// / Presumably, until 2030 firms will have max 9 users, why bother filter ?
  $grpc.ResponseFuture<$1.UsersPublic> readAllUsers(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readAllUsers, request, options: options);
  }

  /// real update, not an upsert, does nothing if user not found
  $grpc.ResponseFuture<$3.StatusResponse> updateOneUser(
    $2.UserPublic request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.StatusResponse> updateUserPassword(
    $1.PasswordUpdateRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateUserPassword, request, options: options);
  }

  $grpc.ResponseFuture<$3.StatusResponse> deleteOneUser(
    $1.UserId request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteOneUser, request, options: options);
  }

  /// Email verification - marks a user's email as verified
  $grpc.ResponseFuture<$3.StatusResponse> markEmailVerified(
    $1.MarkEmailVerifiedRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$markEmailVerified, request, options: options);
  }

  $grpc.ResponseFuture<$3.StatusResponse> createOneChain(
    $5.Chain request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$1.ReadAllChainsResponse> readAllChains(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readAllChains, request, options: options);
  }

  /// only update fiels not boutiques, not upsert, do nothing if unfound
  $grpc.ResponseFuture<$3.StatusResponse> updateOneChain(
    $1.ChainRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateOneChain, request, options: options);
  }

  /// / hard/complete delete
  $grpc.ResponseFuture<$3.StatusResponse> deleteOneChain(
    $1.ChainRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$3.StatusResponse> createOneBoutique(
    $1.BoutiqueRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createOneBoutique, request, options: options);
  }

  $grpc.ResponseFuture<$1.BoutiqueResponse> readOneBoutique(
    $1.BoutiqueRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readOneBoutique, request, options: options);
  }

  /// / real update, not upsert, do nothing if unfound
  $grpc.ResponseFuture<$3.StatusResponse> updateOneBoutique(
    $1.BoutiqueRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateOneBoutique, request, options: options);
  }

  /// / soft delete - marks boutique as deleted
  $grpc.ResponseFuture<$3.StatusResponse> deleteOneBoutique(
    $1.BoutiqueRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteOneBoutique, request, options: options);
  }

  /// / restore a soft-deleted boutique
  $grpc.ResponseFuture<$3.StatusResponse> restoreOneBoutique(
    $1.BoutiqueRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$restoreOneBoutique, request, options: options);
  }

  /// / returns all active boutiques across all chains (filters out deleted ones)
  $grpc.ResponseFuture<$1.ReadAllBoutiquesResponse> readAllBoutiques(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readAllBoutiques, request, options: options);
  }

  /// / scans all firm's devices, disregarding user rights
  /// / used both in :
  /// / weebi_app signups to REQUIRE that user pushes device data
  /// / weebi_app device linking to PREVENT user from pushing data, pulling only
  ///  will be false by default, which is safer since it avoids corrupting data when linking new device that potentially weebi_app with different data
  ///  == isOneDevice at least
  $grpc.ResponseFuture<$1.IsADeviceInChainResponse> isADeviceInChain(
    $1.ReadDevicesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$isADeviceInChain, request, options: options);
  }

  /// / return only device visible according to user rights
  $grpc.ResponseFuture<$6.Devices> readDevices(
    $1.ReadDevicesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readDevices, request, options: options);
  }

  /// / device enrolment follows a different process than user enrolment
  /// / generateCodeForPairingDevice is called by web app, it includes chainId and boutiqueId
  /// / A device belongs to a boutique
  ///  TODO rename this create
  $grpc.ResponseFuture<$1.CodeForPairingDevice> generateCodeForPairingDevice(
    $7.ChainIdAndboutiqueId request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateCodeForPairingDevice, request,
        options: options);
  }

  /// / webapp listens to deviceStream awaiting PoS app to createDevice by typing the code
  $grpc.ResponseFuture<$6.Device> readOnePendingDevice(
    $1.ReadDeviceBtqRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readOnePendingDevice, request, options: options);
  }

  /// / createDevice is called by mobile/desktop app
  /// / await lasts for 2 minutes (to be tested)
  /// / remove pending
  $grpc.ResponseFuture<$1.CreateDeviceResponse> createDevice(
    $1.PendingDeviceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createDevice, request, options: options);
  }

  /// / removed as it brings a security risk
  /// / rpc authenticateWithDevice (DeviceCredentials) returns (Tokens);
  $grpc.ResponseFuture<$3.StatusResponse> updateDevicePassword(
    $1.UpdateDevicePasswordRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateDevicePassword, request, options: options);
  }

  /// / hard/forever delete
  $grpc.ResponseFuture<$3.StatusResponse> deleteOneDevice(
    $1.DeleteDeviceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteOneDevice, request, options: options);
  }

  // method descriptors

  static final _$healthCheck =
      $grpc.ClientMethod<$0.Empty, $1.HealthCheckWeebiResponse>(
          '/weebi.fence.service.FenceService/healthCheck',
          ($0.Empty value) => value.writeToBuffer(),
          $1.HealthCheckWeebiResponse.fromBuffer);
  static final _$signUp =
      $grpc.ClientMethod<$2.SignUpRequest, $2.SignUpResponse>(
          '/weebi.fence.service.FenceService/signUp',
          ($2.SignUpRequest value) => value.writeToBuffer(),
          $2.SignUpResponse.fromBuffer);
  static final _$authenticateWithCredentials =
      $grpc.ClientMethod<$1.Credentials, $1.Tokens>(
          '/weebi.fence.service.FenceService/authenticateWithCredentials',
          ($1.Credentials value) => value.writeToBuffer(),
          $1.Tokens.fromBuffer);
  static final _$authenticateWithRefreshToken =
      $grpc.ClientMethod<$1.RefreshToken, $1.Tokens>(
          '/weebi.fence.service.FenceService/authenticateWithRefreshToken',
          ($1.RefreshToken value) => value.writeToBuffer(),
          $1.Tokens.fromBuffer);
  static final _$requestPasswordReset =
      $grpc.ClientMethod<$1.PasswordResetRequest, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/requestPasswordReset',
          ($1.PasswordResetRequest value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$confirmPasswordReset =
      $grpc.ClientMethod<$1.PasswordResetConfirmRequest, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/confirmPasswordReset',
          ($1.PasswordResetConfirmRequest value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$createFirm =
      $grpc.ClientMethod<$4.CreateFirmRequest, $4.CreateFirmResponse>(
          '/weebi.fence.service.FenceService/createFirm',
          ($4.CreateFirmRequest value) => value.writeToBuffer(),
          $4.CreateFirmResponse.fromBuffer);
  static final _$readOneFirm = $grpc.ClientMethod<$0.Empty, $4.Firm>(
      '/weebi.fence.service.FenceService/readOneFirm',
      ($0.Empty value) => value.writeToBuffer(),
      $4.Firm.fromBuffer);
  static final _$createPendingUser =
      $grpc.ClientMethod<$2.PendingUserRequest, $2.PendingUserResponse>(
          '/weebi.fence.service.FenceService/createPendingUser',
          ($2.PendingUserRequest value) => value.writeToBuffer(),
          $2.PendingUserResponse.fromBuffer);
  static final _$readOneUser =
      $grpc.ClientMethod<$1.UserId, $1.ReadOneUserResponse>(
          '/weebi.fence.service.FenceService/readOneUser',
          ($1.UserId value) => value.writeToBuffer(),
          $1.ReadOneUserResponse.fromBuffer);
  static final _$readAllUsers = $grpc.ClientMethod<$0.Empty, $1.UsersPublic>(
      '/weebi.fence.service.FenceService/readAllUsers',
      ($0.Empty value) => value.writeToBuffer(),
      $1.UsersPublic.fromBuffer);
  static final _$updateOneUser =
      $grpc.ClientMethod<$2.UserPublic, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/updateOneUser',
          ($2.UserPublic value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$updateUserPassword =
      $grpc.ClientMethod<$1.PasswordUpdateRequest, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/updateUserPassword',
          ($1.PasswordUpdateRequest value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$deleteOneUser =
      $grpc.ClientMethod<$1.UserId, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/deleteOneUser',
          ($1.UserId value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$markEmailVerified =
      $grpc.ClientMethod<$1.MarkEmailVerifiedRequest, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/markEmailVerified',
          ($1.MarkEmailVerifiedRequest value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$createOneChain =
      $grpc.ClientMethod<$5.Chain, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/createOneChain',
          ($5.Chain value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$readAllChains =
      $grpc.ClientMethod<$0.Empty, $1.ReadAllChainsResponse>(
          '/weebi.fence.service.FenceService/readAllChains',
          ($0.Empty value) => value.writeToBuffer(),
          $1.ReadAllChainsResponse.fromBuffer);
  static final _$updateOneChain =
      $grpc.ClientMethod<$1.ChainRequest, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/updateOneChain',
          ($1.ChainRequest value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$deleteOneChain =
      $grpc.ClientMethod<$1.ChainRequest, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/deleteOneChain',
          ($1.ChainRequest value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$createOneBoutique =
      $grpc.ClientMethod<$1.BoutiqueRequest, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/createOneBoutique',
          ($1.BoutiqueRequest value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$readOneBoutique =
      $grpc.ClientMethod<$1.BoutiqueRequest, $1.BoutiqueResponse>(
          '/weebi.fence.service.FenceService/readOneBoutique',
          ($1.BoutiqueRequest value) => value.writeToBuffer(),
          $1.BoutiqueResponse.fromBuffer);
  static final _$updateOneBoutique =
      $grpc.ClientMethod<$1.BoutiqueRequest, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/updateOneBoutique',
          ($1.BoutiqueRequest value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$deleteOneBoutique =
      $grpc.ClientMethod<$1.BoutiqueRequest, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/deleteOneBoutique',
          ($1.BoutiqueRequest value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$restoreOneBoutique =
      $grpc.ClientMethod<$1.BoutiqueRequest, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/restoreOneBoutique',
          ($1.BoutiqueRequest value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$readAllBoutiques =
      $grpc.ClientMethod<$0.Empty, $1.ReadAllBoutiquesResponse>(
          '/weebi.fence.service.FenceService/readAllBoutiques',
          ($0.Empty value) => value.writeToBuffer(),
          $1.ReadAllBoutiquesResponse.fromBuffer);
  static final _$isADeviceInChain =
      $grpc.ClientMethod<$1.ReadDevicesRequest, $1.IsADeviceInChainResponse>(
          '/weebi.fence.service.FenceService/isADeviceInChain',
          ($1.ReadDevicesRequest value) => value.writeToBuffer(),
          $1.IsADeviceInChainResponse.fromBuffer);
  static final _$readDevices =
      $grpc.ClientMethod<$1.ReadDevicesRequest, $6.Devices>(
          '/weebi.fence.service.FenceService/readDevices',
          ($1.ReadDevicesRequest value) => value.writeToBuffer(),
          $6.Devices.fromBuffer);
  static final _$generateCodeForPairingDevice =
      $grpc.ClientMethod<$7.ChainIdAndboutiqueId, $1.CodeForPairingDevice>(
          '/weebi.fence.service.FenceService/generateCodeForPairingDevice',
          ($7.ChainIdAndboutiqueId value) => value.writeToBuffer(),
          $1.CodeForPairingDevice.fromBuffer);
  static final _$readOnePendingDevice =
      $grpc.ClientMethod<$1.ReadDeviceBtqRequest, $6.Device>(
          '/weebi.fence.service.FenceService/readOnePendingDevice',
          ($1.ReadDeviceBtqRequest value) => value.writeToBuffer(),
          $6.Device.fromBuffer);
  static final _$createDevice =
      $grpc.ClientMethod<$1.PendingDeviceRequest, $1.CreateDeviceResponse>(
          '/weebi.fence.service.FenceService/createDevice',
          ($1.PendingDeviceRequest value) => value.writeToBuffer(),
          $1.CreateDeviceResponse.fromBuffer);
  static final _$updateDevicePassword =
      $grpc.ClientMethod<$1.UpdateDevicePasswordRequest, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/updateDevicePassword',
          ($1.UpdateDevicePasswordRequest value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
  static final _$deleteOneDevice =
      $grpc.ClientMethod<$1.DeleteDeviceRequest, $3.StatusResponse>(
          '/weebi.fence.service.FenceService/deleteOneDevice',
          ($1.DeleteDeviceRequest value) => value.writeToBuffer(),
          $3.StatusResponse.fromBuffer);
}

@$pb.GrpcServiceName('weebi.fence.service.FenceService')
abstract class FenceServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.fence.service.FenceService';

  FenceServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.HealthCheckWeebiResponse>(
        'healthCheck',
        healthCheck_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.HealthCheckWeebiResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.SignUpRequest, $2.SignUpResponse>(
        'signUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SignUpRequest.fromBuffer(value),
        ($2.SignUpResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Credentials, $1.Tokens>(
        'authenticateWithCredentials',
        authenticateWithCredentials_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Credentials.fromBuffer(value),
        ($1.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RefreshToken, $1.Tokens>(
        'authenticateWithRefreshToken',
        authenticateWithRefreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RefreshToken.fromBuffer(value),
        ($1.Tokens value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.PasswordResetRequest, $3.StatusResponse>(
        'requestPasswordReset',
        requestPasswordReset_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.PasswordResetRequest.fromBuffer(value),
        ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.PasswordResetConfirmRequest, $3.StatusResponse>(
            'confirmPasswordReset',
            confirmPasswordReset_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.PasswordResetConfirmRequest.fromBuffer(value),
            ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.CreateFirmRequest, $4.CreateFirmResponse>(
        'createFirm',
        createFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.CreateFirmRequest.fromBuffer(value),
        ($4.CreateFirmResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $4.Firm>(
        'readOneFirm',
        readOneFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($4.Firm value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.PendingUserRequest, $2.PendingUserResponse>(
            'createPendingUser',
            createPendingUser_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $2.PendingUserRequest.fromBuffer(value),
            ($2.PendingUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UserId, $1.ReadOneUserResponse>(
        'readOneUser',
        readOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UserId.fromBuffer(value),
        ($1.ReadOneUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.UsersPublic>(
        'readAllUsers',
        readAllUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.UsersPublic value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UserPublic, $3.StatusResponse>(
        'updateOneUser',
        updateOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UserPublic.fromBuffer(value),
        ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.PasswordUpdateRequest, $3.StatusResponse>(
        'updateUserPassword',
        updateUserPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.PasswordUpdateRequest.fromBuffer(value),
        ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UserId, $3.StatusResponse>(
        'deleteOneUser',
        deleteOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UserId.fromBuffer(value),
        ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.MarkEmailVerifiedRequest, $3.StatusResponse>(
            'markEmailVerified',
            markEmailVerified_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.MarkEmailVerifiedRequest.fromBuffer(value),
            ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.Chain, $3.StatusResponse>(
        'createOneChain',
        createOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.Chain.fromBuffer(value),
        ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ReadAllChainsResponse>(
        'readAllChains',
        readAllChains_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ReadAllChainsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ChainRequest, $3.StatusResponse>(
        'updateOneChain',
        updateOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ChainRequest.fromBuffer(value),
        ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ChainRequest, $3.StatusResponse>(
        'deleteOneChain',
        deleteOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ChainRequest.fromBuffer(value),
        ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.BoutiqueRequest, $3.StatusResponse>(
        'createOneBoutique',
        createOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.BoutiqueRequest.fromBuffer(value),
        ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.BoutiqueRequest, $1.BoutiqueResponse>(
        'readOneBoutique',
        readOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.BoutiqueRequest.fromBuffer(value),
        ($1.BoutiqueResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.BoutiqueRequest, $3.StatusResponse>(
        'updateOneBoutique',
        updateOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.BoutiqueRequest.fromBuffer(value),
        ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.BoutiqueRequest, $3.StatusResponse>(
        'deleteOneBoutique',
        deleteOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.BoutiqueRequest.fromBuffer(value),
        ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.BoutiqueRequest, $3.StatusResponse>(
        'restoreOneBoutique',
        restoreOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.BoutiqueRequest.fromBuffer(value),
        ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ReadAllBoutiquesResponse>(
        'readAllBoutiques',
        readAllBoutiques_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ReadAllBoutiquesResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.ReadDevicesRequest, $1.IsADeviceInChainResponse>(
            'isADeviceInChain',
            isADeviceInChain_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.ReadDevicesRequest.fromBuffer(value),
            ($1.IsADeviceInChainResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ReadDevicesRequest, $6.Devices>(
        'readDevices',
        readDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ReadDevicesRequest.fromBuffer(value),
        ($6.Devices value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$7.ChainIdAndboutiqueId, $1.CodeForPairingDevice>(
            'generateCodeForPairingDevice',
            generateCodeForPairingDevice_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $7.ChainIdAndboutiqueId.fromBuffer(value),
            ($1.CodeForPairingDevice value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ReadDeviceBtqRequest, $6.Device>(
        'readOnePendingDevice',
        readOnePendingDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ReadDeviceBtqRequest.fromBuffer(value),
        ($6.Device value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.PendingDeviceRequest, $1.CreateDeviceResponse>(
            'createDevice',
            createDevice_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.PendingDeviceRequest.fromBuffer(value),
            ($1.CreateDeviceResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.UpdateDevicePasswordRequest, $3.StatusResponse>(
            'updateDevicePassword',
            updateDevicePassword_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.UpdateDevicePasswordRequest.fromBuffer(value),
            ($3.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteDeviceRequest, $3.StatusResponse>(
        'deleteOneDevice',
        deleteOneDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.DeleteDeviceRequest.fromBuffer(value),
        ($3.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.HealthCheckWeebiResponse> healthCheck_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return healthCheck($call, await $request);
  }

  $async.Future<$1.HealthCheckWeebiResponse> healthCheck(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$2.SignUpResponse> signUp_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.SignUpRequest> $request) async {
    return signUp($call, await $request);
  }

  $async.Future<$2.SignUpResponse> signUp(
      $grpc.ServiceCall call, $2.SignUpRequest request);

  $async.Future<$1.Tokens> authenticateWithCredentials_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Credentials> $request) async {
    return authenticateWithCredentials($call, await $request);
  }

  $async.Future<$1.Tokens> authenticateWithCredentials(
      $grpc.ServiceCall call, $1.Credentials request);

  $async.Future<$1.Tokens> authenticateWithRefreshToken_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.RefreshToken> $request) async {
    return authenticateWithRefreshToken($call, await $request);
  }

  $async.Future<$1.Tokens> authenticateWithRefreshToken(
      $grpc.ServiceCall call, $1.RefreshToken request);

  $async.Future<$3.StatusResponse> requestPasswordReset_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.PasswordResetRequest> $request) async {
    return requestPasswordReset($call, await $request);
  }

  $async.Future<$3.StatusResponse> requestPasswordReset(
      $grpc.ServiceCall call, $1.PasswordResetRequest request);

  $async.Future<$3.StatusResponse> confirmPasswordReset_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.PasswordResetConfirmRequest> $request) async {
    return confirmPasswordReset($call, await $request);
  }

  $async.Future<$3.StatusResponse> confirmPasswordReset(
      $grpc.ServiceCall call, $1.PasswordResetConfirmRequest request);

  $async.Future<$4.CreateFirmResponse> createFirm_Pre($grpc.ServiceCall $call,
      $async.Future<$4.CreateFirmRequest> $request) async {
    return createFirm($call, await $request);
  }

  $async.Future<$4.CreateFirmResponse> createFirm(
      $grpc.ServiceCall call, $4.CreateFirmRequest request);

  $async.Future<$4.Firm> readOneFirm_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return readOneFirm($call, await $request);
  }

  $async.Future<$4.Firm> readOneFirm($grpc.ServiceCall call, $0.Empty request);

  $async.Future<$2.PendingUserResponse> createPendingUser_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$2.PendingUserRequest> $request) async {
    return createPendingUser($call, await $request);
  }

  $async.Future<$2.PendingUserResponse> createPendingUser(
      $grpc.ServiceCall call, $2.PendingUserRequest request);

  $async.Future<$1.ReadOneUserResponse> readOneUser_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.UserId> $request) async {
    return readOneUser($call, await $request);
  }

  $async.Future<$1.ReadOneUserResponse> readOneUser(
      $grpc.ServiceCall call, $1.UserId request);

  $async.Future<$1.UsersPublic> readAllUsers_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return readAllUsers($call, await $request);
  }

  $async.Future<$1.UsersPublic> readAllUsers(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$3.StatusResponse> updateOneUser_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.UserPublic> $request) async {
    return updateOneUser($call, await $request);
  }

  $async.Future<$3.StatusResponse> updateOneUser(
      $grpc.ServiceCall call, $2.UserPublic request);

  $async.Future<$3.StatusResponse> updateUserPassword_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.PasswordUpdateRequest> $request) async {
    return updateUserPassword($call, await $request);
  }

  $async.Future<$3.StatusResponse> updateUserPassword(
      $grpc.ServiceCall call, $1.PasswordUpdateRequest request);

  $async.Future<$3.StatusResponse> deleteOneUser_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.UserId> $request) async {
    return deleteOneUser($call, await $request);
  }

  $async.Future<$3.StatusResponse> deleteOneUser(
      $grpc.ServiceCall call, $1.UserId request);

  $async.Future<$3.StatusResponse> markEmailVerified_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.MarkEmailVerifiedRequest> $request) async {
    return markEmailVerified($call, await $request);
  }

  $async.Future<$3.StatusResponse> markEmailVerified(
      $grpc.ServiceCall call, $1.MarkEmailVerifiedRequest request);

  $async.Future<$3.StatusResponse> createOneChain_Pre(
      $grpc.ServiceCall $call, $async.Future<$5.Chain> $request) async {
    return createOneChain($call, await $request);
  }

  $async.Future<$3.StatusResponse> createOneChain(
      $grpc.ServiceCall call, $5.Chain request);

  $async.Future<$1.ReadAllChainsResponse> readAllChains_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return readAllChains($call, await $request);
  }

  $async.Future<$1.ReadAllChainsResponse> readAllChains(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$3.StatusResponse> updateOneChain_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.ChainRequest> $request) async {
    return updateOneChain($call, await $request);
  }

  $async.Future<$3.StatusResponse> updateOneChain(
      $grpc.ServiceCall call, $1.ChainRequest request);

  $async.Future<$3.StatusResponse> deleteOneChain_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.ChainRequest> $request) async {
    return deleteOneChain($call, await $request);
  }

  $async.Future<$3.StatusResponse> deleteOneChain(
      $grpc.ServiceCall call, $1.ChainRequest request);

  $async.Future<$3.StatusResponse> createOneBoutique_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.BoutiqueRequest> $request) async {
    return createOneBoutique($call, await $request);
  }

  $async.Future<$3.StatusResponse> createOneBoutique(
      $grpc.ServiceCall call, $1.BoutiqueRequest request);

  $async.Future<$1.BoutiqueResponse> readOneBoutique_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.BoutiqueRequest> $request) async {
    return readOneBoutique($call, await $request);
  }

  $async.Future<$1.BoutiqueResponse> readOneBoutique(
      $grpc.ServiceCall call, $1.BoutiqueRequest request);

  $async.Future<$3.StatusResponse> updateOneBoutique_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.BoutiqueRequest> $request) async {
    return updateOneBoutique($call, await $request);
  }

  $async.Future<$3.StatusResponse> updateOneBoutique(
      $grpc.ServiceCall call, $1.BoutiqueRequest request);

  $async.Future<$3.StatusResponse> deleteOneBoutique_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.BoutiqueRequest> $request) async {
    return deleteOneBoutique($call, await $request);
  }

  $async.Future<$3.StatusResponse> deleteOneBoutique(
      $grpc.ServiceCall call, $1.BoutiqueRequest request);

  $async.Future<$3.StatusResponse> restoreOneBoutique_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.BoutiqueRequest> $request) async {
    return restoreOneBoutique($call, await $request);
  }

  $async.Future<$3.StatusResponse> restoreOneBoutique(
      $grpc.ServiceCall call, $1.BoutiqueRequest request);

  $async.Future<$1.ReadAllBoutiquesResponse> readAllBoutiques_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return readAllBoutiques($call, await $request);
  }

  $async.Future<$1.ReadAllBoutiquesResponse> readAllBoutiques(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.IsADeviceInChainResponse> isADeviceInChain_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.ReadDevicesRequest> $request) async {
    return isADeviceInChain($call, await $request);
  }

  $async.Future<$1.IsADeviceInChainResponse> isADeviceInChain(
      $grpc.ServiceCall call, $1.ReadDevicesRequest request);

  $async.Future<$6.Devices> readDevices_Pre($grpc.ServiceCall $call,
      $async.Future<$1.ReadDevicesRequest> $request) async {
    return readDevices($call, await $request);
  }

  $async.Future<$6.Devices> readDevices(
      $grpc.ServiceCall call, $1.ReadDevicesRequest request);

  $async.Future<$1.CodeForPairingDevice> generateCodeForPairingDevice_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$7.ChainIdAndboutiqueId> $request) async {
    return generateCodeForPairingDevice($call, await $request);
  }

  $async.Future<$1.CodeForPairingDevice> generateCodeForPairingDevice(
      $grpc.ServiceCall call, $7.ChainIdAndboutiqueId request);

  $async.Future<$6.Device> readOnePendingDevice_Pre($grpc.ServiceCall $call,
      $async.Future<$1.ReadDeviceBtqRequest> $request) async {
    return readOnePendingDevice($call, await $request);
  }

  $async.Future<$6.Device> readOnePendingDevice(
      $grpc.ServiceCall call, $1.ReadDeviceBtqRequest request);

  $async.Future<$1.CreateDeviceResponse> createDevice_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.PendingDeviceRequest> $request) async {
    return createDevice($call, await $request);
  }

  $async.Future<$1.CreateDeviceResponse> createDevice(
      $grpc.ServiceCall call, $1.PendingDeviceRequest request);

  $async.Future<$3.StatusResponse> updateDevicePassword_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.UpdateDevicePasswordRequest> $request) async {
    return updateDevicePassword($call, await $request);
  }

  $async.Future<$3.StatusResponse> updateDevicePassword(
      $grpc.ServiceCall call, $1.UpdateDevicePasswordRequest request);

  $async.Future<$3.StatusResponse> deleteOneDevice_Pre($grpc.ServiceCall $call,
      $async.Future<$1.DeleteDeviceRequest> $request) async {
    return deleteOneDevice($call, await $request);
  }

  $async.Future<$3.StatusResponse> deleteOneDevice(
      $grpc.ServiceCall call, $1.DeleteDeviceRequest request);
}
