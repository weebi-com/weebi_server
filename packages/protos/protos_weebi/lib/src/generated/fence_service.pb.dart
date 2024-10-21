//
//  Generated code. Do not modify.
//  source: fence_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'btq_chain.pb.dart' as $10;
import 'common/g_common.pb.dart' as $1;
import 'common/g_timestamp.pb.dart' as $18;
import 'device.pb.dart' as $13;
import 'user.pb.dart' as $6;
import 'user_permissions.pb.dart' as $8;

/// / deviceId == userId, so front can reuse deviceId to try login in
class CreatePendingDeviceResponse extends $pb.GeneratedMessage {
  factory CreatePendingDeviceResponse({
    $1.StatusResponse? statusResponse,
    $core.String? firmId,
    $core.String? chainId,
    $core.String? boutiqueId,
    $core.String? deviceId,
  }) {
    final $result = create();
    if (statusResponse != null) {
      $result.statusResponse = statusResponse;
    }
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (boutiqueId != null) {
      $result.boutiqueId = boutiqueId;
    }
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    return $result;
  }
  CreatePendingDeviceResponse._() : super();
  factory CreatePendingDeviceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePendingDeviceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePendingDeviceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOM<$1.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse', protoName: 'statusResponse', subBuilder: $1.StatusResponse.create)
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(3, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(4, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(5, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePendingDeviceResponse clone() => CreatePendingDeviceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePendingDeviceResponse copyWith(void Function(CreatePendingDeviceResponse) updates) => super.copyWith((message) => updates(message as CreatePendingDeviceResponse)) as CreatePendingDeviceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePendingDeviceResponse create() => CreatePendingDeviceResponse._();
  CreatePendingDeviceResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePendingDeviceResponse> createRepeated() => $pb.PbList<CreatePendingDeviceResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePendingDeviceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePendingDeviceResponse>(create);
  static CreatePendingDeviceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StatusResponse get statusResponse => $_getN(0);
  @$pb.TagNumber(1)
  set statusResponse($1.StatusResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => clearField(1);
  @$pb.TagNumber(1)
  $1.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get firmId => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get chainId => $_getSZ(2);
  @$pb.TagNumber(3)
  set chainId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChainId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get boutiqueId => $_getSZ(3);
  @$pb.TagNumber(4)
  set boutiqueId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoutiqueId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoutiqueId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceId => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceId() => clearField(5);
}

class ReadOneUserResponse extends $pb.GeneratedMessage {
  factory ReadOneUserResponse({
    $1.StatusResponse? statusResponse,
    $6.UserPublic? user,
  }) {
    final $result = create();
    if (statusResponse != null) {
      $result.statusResponse = statusResponse;
    }
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  ReadOneUserResponse._() : super();
  factory ReadOneUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadOneUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadOneUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOM<$1.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse', protoName: 'statusResponse', subBuilder: $1.StatusResponse.create)
    ..aOM<$6.UserPublic>(2, _omitFieldNames ? '' : 'user', subBuilder: $6.UserPublic.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadOneUserResponse clone() => ReadOneUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadOneUserResponse copyWith(void Function(ReadOneUserResponse) updates) => super.copyWith((message) => updates(message as ReadOneUserResponse)) as ReadOneUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadOneUserResponse create() => ReadOneUserResponse._();
  ReadOneUserResponse createEmptyInstance() => create();
  static $pb.PbList<ReadOneUserResponse> createRepeated() => $pb.PbList<ReadOneUserResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadOneUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadOneUserResponse>(create);
  static ReadOneUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StatusResponse get statusResponse => $_getN(0);
  @$pb.TagNumber(1)
  set statusResponse($1.StatusResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => clearField(1);
  @$pb.TagNumber(1)
  $1.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  $6.UserPublic get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($6.UserPublic v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  $6.UserPublic ensureUser() => $_ensure(1);
}

class UsersPublic extends $pb.GeneratedMessage {
  factory UsersPublic({
    $core.Iterable<$6.UserPublic>? users,
  }) {
    final $result = create();
    if (users != null) {
      $result.users.addAll(users);
    }
    return $result;
  }
  UsersPublic._() : super();
  factory UsersPublic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsersPublic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsersPublic', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..pc<$6.UserPublic>(1, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM, subBuilder: $6.UserPublic.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsersPublic clone() => UsersPublic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsersPublic copyWith(void Function(UsersPublic) updates) => super.copyWith((message) => updates(message as UsersPublic)) as UsersPublic;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsersPublic create() => UsersPublic._();
  UsersPublic createEmptyInstance() => create();
  static $pb.PbList<UsersPublic> createRepeated() => $pb.PbList<UsersPublic>();
  @$core.pragma('dart2js:noInline')
  static UsersPublic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsersPublic>(create);
  static UsersPublic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$6.UserPublic> get users => $_getList(0);
}

class ReadAllChainsResponse extends $pb.GeneratedMessage {
  factory ReadAllChainsResponse({
    $core.Iterable<$10.Chain>? chains,
  }) {
    final $result = create();
    if (chains != null) {
      $result.chains.addAll(chains);
    }
    return $result;
  }
  ReadAllChainsResponse._() : super();
  factory ReadAllChainsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadAllChainsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadAllChainsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..pc<$10.Chain>(1, _omitFieldNames ? '' : 'chains', $pb.PbFieldType.PM, subBuilder: $10.Chain.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadAllChainsResponse clone() => ReadAllChainsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadAllChainsResponse copyWith(void Function(ReadAllChainsResponse) updates) => super.copyWith((message) => updates(message as ReadAllChainsResponse)) as ReadAllChainsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadAllChainsResponse create() => ReadAllChainsResponse._();
  ReadAllChainsResponse createEmptyInstance() => create();
  static $pb.PbList<ReadAllChainsResponse> createRepeated() => $pb.PbList<ReadAllChainsResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadAllChainsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadAllChainsResponse>(create);
  static ReadAllChainsResponse? _defaultInstance;

  /// google.retail.common.StatusResponse ?
  @$pb.TagNumber(1)
  $core.List<$10.Chain> get chains => $_getList(0);
}

class ReadDevicesRequest extends $pb.GeneratedMessage {
  factory ReadDevicesRequest({
    $core.String? chainId,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    return $result;
  }
  ReadDevicesRequest._() : super();
  factory ReadDevicesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadDevicesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadDevicesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadDevicesRequest clone() => ReadDevicesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadDevicesRequest copyWith(void Function(ReadDevicesRequest) updates) => super.copyWith((message) => updates(message as ReadDevicesRequest)) as ReadDevicesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadDevicesRequest create() => ReadDevicesRequest._();
  ReadDevicesRequest createEmptyInstance() => create();
  static $pb.PbList<ReadDevicesRequest> createRepeated() => $pb.PbList<ReadDevicesRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadDevicesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadDevicesRequest>(create);
  static ReadDevicesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);
}

class ReadDeviceBtqRequest extends $pb.GeneratedMessage {
  factory ReadDeviceBtqRequest({
    $core.String? chainId,
    $core.String? boutiqueId,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (boutiqueId != null) {
      $result.boutiqueId = boutiqueId;
    }
    return $result;
  }
  ReadDeviceBtqRequest._() : super();
  factory ReadDeviceBtqRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadDeviceBtqRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadDeviceBtqRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadDeviceBtqRequest clone() => ReadDeviceBtqRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadDeviceBtqRequest copyWith(void Function(ReadDeviceBtqRequest) updates) => super.copyWith((message) => updates(message as ReadDeviceBtqRequest)) as ReadDeviceBtqRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadDeviceBtqRequest create() => ReadDeviceBtqRequest._();
  ReadDeviceBtqRequest createEmptyInstance() => create();
  static $pb.PbList<ReadDeviceBtqRequest> createRepeated() => $pb.PbList<ReadDeviceBtqRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadDeviceBtqRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadDeviceBtqRequest>(create);
  static ReadDeviceBtqRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get boutiqueId => $_getSZ(1);
  @$pb.TagNumber(2)
  set boutiqueId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoutiqueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiqueId() => clearField(2);
}

class DeleteDeviceRequest extends $pb.GeneratedMessage {
  factory DeleteDeviceRequest({
    $core.String? chainId,
    $13.Device? device,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (device != null) {
      $result.device = device;
    }
    return $result;
  }
  DeleteDeviceRequest._() : super();
  factory DeleteDeviceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteDeviceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteDeviceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$13.Device>(2, _omitFieldNames ? '' : 'device', subBuilder: $13.Device.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteDeviceRequest clone() => DeleteDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteDeviceRequest copyWith(void Function(DeleteDeviceRequest) updates) => super.copyWith((message) => updates(message as DeleteDeviceRequest)) as DeleteDeviceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteDeviceRequest create() => DeleteDeviceRequest._();
  DeleteDeviceRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteDeviceRequest> createRepeated() => $pb.PbList<DeleteDeviceRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteDeviceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteDeviceRequest>(create);
  static DeleteDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $13.Device get device => $_getN(1);
  @$pb.TagNumber(2)
  set device($13.Device v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDevice() => $_has(1);
  @$pb.TagNumber(2)
  void clearDevice() => clearField(2);
  @$pb.TagNumber(2)
  $13.Device ensureDevice() => $_ensure(1);
}

class MailAndEncyptedPassword extends $pb.GeneratedMessage {
  factory MailAndEncyptedPassword({
    $core.String? mail,
    $core.String? passwordEncrypted,
  }) {
    final $result = create();
    if (mail != null) {
      $result.mail = mail;
    }
    if (passwordEncrypted != null) {
      $result.passwordEncrypted = passwordEncrypted;
    }
    return $result;
  }
  MailAndEncyptedPassword._() : super();
  factory MailAndEncyptedPassword.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MailAndEncyptedPassword.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MailAndEncyptedPassword', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..aOS(2, _omitFieldNames ? '' : 'passwordEncrypted', protoName: 'passwordEncrypted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MailAndEncyptedPassword clone() => MailAndEncyptedPassword()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MailAndEncyptedPassword copyWith(void Function(MailAndEncyptedPassword) updates) => super.copyWith((message) => updates(message as MailAndEncyptedPassword)) as MailAndEncyptedPassword;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MailAndEncyptedPassword create() => MailAndEncyptedPassword._();
  MailAndEncyptedPassword createEmptyInstance() => create();
  static $pb.PbList<MailAndEncyptedPassword> createRepeated() => $pb.PbList<MailAndEncyptedPassword>();
  @$core.pragma('dart2js:noInline')
  static MailAndEncyptedPassword getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MailAndEncyptedPassword>(create);
  static MailAndEncyptedPassword? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mail => $_getSZ(0);
  @$pb.TagNumber(1)
  set mail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMail() => $_has(0);
  @$pb.TagNumber(1)
  void clearMail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get passwordEncrypted => $_getSZ(1);
  @$pb.TagNumber(2)
  set passwordEncrypted($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPasswordEncrypted() => $_has(1);
  @$pb.TagNumber(2)
  void clearPasswordEncrypted() => clearField(2);
}

class UserId extends $pb.GeneratedMessage {
  factory UserId({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  UserId._() : super();
  factory UserId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserId', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserId clone() => UserId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserId copyWith(void Function(UserId) updates) => super.copyWith((message) => updates(message as UserId)) as UserId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserId create() => UserId._();
  UserId createEmptyInstance() => create();
  static $pb.PbList<UserId> createRepeated() => $pb.PbList<UserId>();
  @$core.pragma('dart2js:noInline')
  static UserId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserId>(create);
  static UserId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class Access extends $pb.GeneratedMessage {
  factory Access({
    $8.ChainIds? chainIds,
    $8.BoutiqueIds? boutiqueIds,
  }) {
    final $result = create();
    if (chainIds != null) {
      $result.chainIds = chainIds;
    }
    if (boutiqueIds != null) {
      $result.boutiqueIds = boutiqueIds;
    }
    return $result;
  }
  Access._() : super();
  factory Access.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Access.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Access', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOM<$8.ChainIds>(1, _omitFieldNames ? '' : 'chainIds', protoName: 'chainIds', subBuilder: $8.ChainIds.create)
    ..aOM<$8.BoutiqueIds>(2, _omitFieldNames ? '' : 'boutiqueIds', protoName: 'boutiqueIds', subBuilder: $8.BoutiqueIds.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Access clone() => Access()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Access copyWith(void Function(Access) updates) => super.copyWith((message) => updates(message as Access)) as Access;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Access create() => Access._();
  Access createEmptyInstance() => create();
  static $pb.PbList<Access> createRepeated() => $pb.PbList<Access>();
  @$core.pragma('dart2js:noInline')
  static Access getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Access>(create);
  static Access? _defaultInstance;

  @$pb.TagNumber(1)
  $8.ChainIds get chainIds => $_getN(0);
  @$pb.TagNumber(1)
  set chainIds($8.ChainIds v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainIds() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainIds() => clearField(1);
  @$pb.TagNumber(1)
  $8.ChainIds ensureChainIds() => $_ensure(0);

  @$pb.TagNumber(2)
  $8.BoutiqueIds get boutiqueIds => $_getN(1);
  @$pb.TagNumber(2)
  set boutiqueIds($8.BoutiqueIds v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoutiqueIds() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiqueIds() => clearField(2);
  @$pb.TagNumber(2)
  $8.BoutiqueIds ensureBoutiqueIds() => $_ensure(1);
}

class Credentials extends $pb.GeneratedMessage {
  factory Credentials({
    $core.String? mail,
    $core.String? password,
  }) {
    final $result = create();
    if (mail != null) {
      $result.mail = mail;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  Credentials._() : super();
  factory Credentials.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Credentials.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Credentials', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Credentials clone() => Credentials()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Credentials copyWith(void Function(Credentials) updates) => super.copyWith((message) => updates(message as Credentials)) as Credentials;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Credentials create() => Credentials._();
  Credentials createEmptyInstance() => create();
  static $pb.PbList<Credentials> createRepeated() => $pb.PbList<Credentials>();
  @$core.pragma('dart2js:noInline')
  static Credentials getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Credentials>(create);
  static Credentials? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mail => $_getSZ(0);
  @$pb.TagNumber(1)
  set mail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMail() => $_has(0);
  @$pb.TagNumber(1)
  void clearMail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class DeviceCredentials extends $pb.GeneratedMessage {
  factory DeviceCredentials({
    $core.String? firmId,
    $core.String? chainId,
    $core.String? boutiqueId,
    $core.String? deviceId,
    $core.String? password,
  }) {
    final $result = create();
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (boutiqueId != null) {
      $result.boutiqueId = boutiqueId;
    }
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  DeviceCredentials._() : super();
  factory DeviceCredentials.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceCredentials.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeviceCredentials', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(3, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(4, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(5, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceCredentials clone() => DeviceCredentials()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceCredentials copyWith(void Function(DeviceCredentials) updates) => super.copyWith((message) => updates(message as DeviceCredentials)) as DeviceCredentials;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceCredentials create() => DeviceCredentials._();
  DeviceCredentials createEmptyInstance() => create();
  static $pb.PbList<DeviceCredentials> createRepeated() => $pb.PbList<DeviceCredentials>();
  @$core.pragma('dart2js:noInline')
  static DeviceCredentials getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceCredentials>(create);
  static DeviceCredentials? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get boutiqueId => $_getSZ(2);
  @$pb.TagNumber(3)
  set boutiqueId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoutiqueId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoutiqueId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => clearField(5);
}

class RefreshToken extends $pb.GeneratedMessage {
  factory RefreshToken({
    $core.String? refreshToken,
  }) {
    final $result = create();
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    return $result;
  }
  RefreshToken._() : super();
  factory RefreshToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshToken', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refreshToken', protoName: 'refreshToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshToken clone() => RefreshToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshToken copyWith(void Function(RefreshToken) updates) => super.copyWith((message) => updates(message as RefreshToken)) as RefreshToken;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshToken create() => RefreshToken._();
  RefreshToken createEmptyInstance() => create();
  static $pb.PbList<RefreshToken> createRepeated() => $pb.PbList<RefreshToken>();
  @$core.pragma('dart2js:noInline')
  static RefreshToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshToken>(create);
  static RefreshToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => clearField(1);
}

class Tokens extends $pb.GeneratedMessage {
  factory Tokens({
    $core.String? accessToken,
    $core.String? refreshToken,
  }) {
    final $result = create();
    if (accessToken != null) {
      $result.accessToken = accessToken;
    }
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    return $result;
  }
  Tokens._() : super();
  factory Tokens.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tokens.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Tokens', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken', protoName: 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken', protoName: 'refreshToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Tokens clone() => Tokens()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Tokens copyWith(void Function(Tokens) updates) => super.copyWith((message) => updates(message as Tokens)) as Tokens;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Tokens create() => Tokens._();
  Tokens createEmptyInstance() => create();
  static $pb.PbList<Tokens> createRepeated() => $pb.PbList<Tokens>();
  @$core.pragma('dart2js:noInline')
  static Tokens getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tokens>(create);
  static Tokens? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => clearField(2);
}

class UpdateDevicePasswordRequest extends $pb.GeneratedMessage {
  factory UpdateDevicePasswordRequest({
    $core.String? chainId,
    $13.Device? device,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (device != null) {
      $result.device = device;
    }
    return $result;
  }
  UpdateDevicePasswordRequest._() : super();
  factory UpdateDevicePasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDevicePasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateDevicePasswordRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$13.Device>(2, _omitFieldNames ? '' : 'device', subBuilder: $13.Device.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDevicePasswordRequest clone() => UpdateDevicePasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDevicePasswordRequest copyWith(void Function(UpdateDevicePasswordRequest) updates) => super.copyWith((message) => updates(message as UpdateDevicePasswordRequest)) as UpdateDevicePasswordRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateDevicePasswordRequest create() => UpdateDevicePasswordRequest._();
  UpdateDevicePasswordRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateDevicePasswordRequest> createRepeated() => $pb.PbList<UpdateDevicePasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateDevicePasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDevicePasswordRequest>(create);
  static UpdateDevicePasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $13.Device get device => $_getN(1);
  @$pb.TagNumber(2)
  set device($13.Device v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDevice() => $_has(1);
  @$pb.TagNumber(2)
  void clearDevice() => clearField(2);
  @$pb.TagNumber(2)
  $13.Device ensureDevice() => $_ensure(1);
}

class PasswordUpdateRequest extends $pb.GeneratedMessage {
  factory PasswordUpdateRequest({
    $core.String? userId,
    $core.String? firmId,
    $core.String? password,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  PasswordUpdateRequest._() : super();
  factory PasswordUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PasswordUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PasswordUpdateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PasswordUpdateRequest clone() => PasswordUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PasswordUpdateRequest copyWith(void Function(PasswordUpdateRequest) updates) => super.copyWith((message) => updates(message as PasswordUpdateRequest)) as PasswordUpdateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PasswordUpdateRequest create() => PasswordUpdateRequest._();
  PasswordUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<PasswordUpdateRequest> createRepeated() => $pb.PbList<PasswordUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static PasswordUpdateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PasswordUpdateRequest>(create);
  static PasswordUpdateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firmId => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

/// / deviceId && status && password && dateCreation will be set by server, ignore them in front
class PendingDeviceRequest extends $pb.GeneratedMessage {
  factory PendingDeviceRequest({
    $13.HardwareInfo? hardwareInfo,
    $core.int? code,
  }) {
    final $result = create();
    if (hardwareInfo != null) {
      $result.hardwareInfo = hardwareInfo;
    }
    if (code != null) {
      $result.code = code;
    }
    return $result;
  }
  PendingDeviceRequest._() : super();
  factory PendingDeviceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PendingDeviceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PendingDeviceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOM<$13.HardwareInfo>(1, _omitFieldNames ? '' : 'hardwareInfo', protoName: 'hardwareInfo', subBuilder: $13.HardwareInfo.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PendingDeviceRequest clone() => PendingDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PendingDeviceRequest copyWith(void Function(PendingDeviceRequest) updates) => super.copyWith((message) => updates(message as PendingDeviceRequest)) as PendingDeviceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PendingDeviceRequest create() => PendingDeviceRequest._();
  PendingDeviceRequest createEmptyInstance() => create();
  static $pb.PbList<PendingDeviceRequest> createRepeated() => $pb.PbList<PendingDeviceRequest>();
  @$core.pragma('dart2js:noInline')
  static PendingDeviceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PendingDeviceRequest>(create);
  static PendingDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $13.HardwareInfo get hardwareInfo => $_getN(0);
  @$pb.TagNumber(1)
  set hardwareInfo($13.HardwareInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareInfo() => clearField(1);
  @$pb.TagNumber(1)
  $13.HardwareInfo ensureHardwareInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get code => $_getIZ(1);
  @$pb.TagNumber(2)
  set code($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class CodeForPairingDevice extends $pb.GeneratedMessage {
  factory CodeForPairingDevice({
    $core.String? firmId,
    $core.String? chainId,
    $core.String? boutiqueId,
    $core.String? userId,
    $core.int? code,
    $18.Timestamp? timestampUTC,
  }) {
    final $result = create();
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (boutiqueId != null) {
      $result.boutiqueId = boutiqueId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (code != null) {
      $result.code = code;
    }
    if (timestampUTC != null) {
      $result.timestampUTC = timestampUTC;
    }
    return $result;
  }
  CodeForPairingDevice._() : super();
  factory CodeForPairingDevice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CodeForPairingDevice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CodeForPairingDevice', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(3, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(4, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..aOM<$18.Timestamp>(6, _omitFieldNames ? '' : 'timestampUTC', protoName: 'timestampUTC', subBuilder: $18.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CodeForPairingDevice clone() => CodeForPairingDevice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CodeForPairingDevice copyWith(void Function(CodeForPairingDevice) updates) => super.copyWith((message) => updates(message as CodeForPairingDevice)) as CodeForPairingDevice;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CodeForPairingDevice create() => CodeForPairingDevice._();
  CodeForPairingDevice createEmptyInstance() => create();
  static $pb.PbList<CodeForPairingDevice> createRepeated() => $pb.PbList<CodeForPairingDevice>();
  @$core.pragma('dart2js:noInline')
  static CodeForPairingDevice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CodeForPairingDevice>(create);
  static CodeForPairingDevice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get boutiqueId => $_getSZ(2);
  @$pb.TagNumber(3)
  set boutiqueId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoutiqueId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoutiqueId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userId => $_getSZ(3);
  @$pb.TagNumber(4)
  set userId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get code => $_getIZ(4);
  @$pb.TagNumber(5)
  set code($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearCode() => clearField(5);

  @$pb.TagNumber(6)
  $18.Timestamp get timestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set timestampUTC($18.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimestampUTC() => clearField(6);
  @$pb.TagNumber(6)
  $18.Timestamp ensureTimestampUTC() => $_ensure(5);
}

class ApproveDeviceRequest extends $pb.GeneratedMessage {
  factory ApproveDeviceRequest({
    $13.Device? device,
  }) {
    final $result = create();
    if (device != null) {
      $result.device = device;
    }
    return $result;
  }
  ApproveDeviceRequest._() : super();
  factory ApproveDeviceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproveDeviceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ApproveDeviceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOM<$13.Device>(1, _omitFieldNames ? '' : 'device', subBuilder: $13.Device.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApproveDeviceRequest clone() => ApproveDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApproveDeviceRequest copyWith(void Function(ApproveDeviceRequest) updates) => super.copyWith((message) => updates(message as ApproveDeviceRequest)) as ApproveDeviceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApproveDeviceRequest create() => ApproveDeviceRequest._();
  ApproveDeviceRequest createEmptyInstance() => create();
  static $pb.PbList<ApproveDeviceRequest> createRepeated() => $pb.PbList<ApproveDeviceRequest>();
  @$core.pragma('dart2js:noInline')
  static ApproveDeviceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApproveDeviceRequest>(create);
  static ApproveDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $13.Device get device => $_getN(0);
  @$pb.TagNumber(1)
  set device($13.Device v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDevice() => $_has(0);
  @$pb.TagNumber(1)
  void clearDevice() => clearField(1);
  @$pb.TagNumber(1)
  $13.Device ensureDevice() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
