//
//  Generated code. Do not modify.
//  source: user_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'boutique_chain.pb.dart' as $7;
import 'common/g_timestamp.pb.dart' as $17;
import 'common/mongo.pb.dart' as $11;
import 'user.pb.dart' as $20;
import 'user_permission.pb.dart' as $12;

class MailAndEncyptedPasswordRequest extends $pb.GeneratedMessage {
  factory MailAndEncyptedPasswordRequest({
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
  MailAndEncyptedPasswordRequest._() : super();
  factory MailAndEncyptedPasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MailAndEncyptedPasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MailAndEncyptedPasswordRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..aOS(2, _omitFieldNames ? '' : 'passwordEncrypted', protoName: 'passwordEncrypted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MailAndEncyptedPasswordRequest clone() => MailAndEncyptedPasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MailAndEncyptedPasswordRequest copyWith(void Function(MailAndEncyptedPasswordRequest) updates) => super.copyWith((message) => updates(message as MailAndEncyptedPasswordRequest)) as MailAndEncyptedPasswordRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MailAndEncyptedPasswordRequest create() => MailAndEncyptedPasswordRequest._();
  MailAndEncyptedPasswordRequest createEmptyInstance() => create();
  static $pb.PbList<MailAndEncyptedPasswordRequest> createRepeated() => $pb.PbList<MailAndEncyptedPasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static MailAndEncyptedPasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MailAndEncyptedPasswordRequest>(create);
  static MailAndEncyptedPasswordRequest? _defaultInstance;

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

class UserOid extends $pb.GeneratedMessage {
  factory UserOid({
    $core.String? oid,
  }) {
    final $result = create();
    if (oid != null) {
      $result.oid = oid;
    }
    return $result;
  }
  UserOid._() : super();
  factory UserOid.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserOid.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserOid', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'oid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserOid clone() => UserOid()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserOid copyWith(void Function(UserOid) updates) => super.copyWith((message) => updates(message as UserOid)) as UserOid;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserOid create() => UserOid._();
  UserOid createEmptyInstance() => create();
  static $pb.PbList<UserOid> createRepeated() => $pb.PbList<UserOid>();
  @$core.pragma('dart2js:noInline')
  static UserOid getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserOid>(create);
  static UserOid? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get oid => $_getSZ(0);
  @$pb.TagNumber(1)
  set oid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOid() => $_has(0);
  @$pb.TagNumber(1)
  void clearOid() => clearField(1);
}

class Access extends $pb.GeneratedMessage {
  factory Access({
    $20.Oids? chainsAccessible,
    $20.Oids? boutiquesAccessible,
  }) {
    final $result = create();
    if (chainsAccessible != null) {
      $result.chainsAccessible = chainsAccessible;
    }
    if (boutiquesAccessible != null) {
      $result.boutiquesAccessible = boutiquesAccessible;
    }
    return $result;
  }
  Access._() : super();
  factory Access.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Access.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Access', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
    ..aOM<$20.Oids>(1, _omitFieldNames ? '' : 'chainsAccessible', protoName: 'chainsAccessible', subBuilder: $20.Oids.create)
    ..aOM<$20.Oids>(2, _omitFieldNames ? '' : 'boutiquesAccessible', protoName: 'boutiquesAccessible', subBuilder: $20.Oids.create)
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
  $20.Oids get chainsAccessible => $_getN(0);
  @$pb.TagNumber(1)
  set chainsAccessible($20.Oids v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainsAccessible() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainsAccessible() => clearField(1);
  @$pb.TagNumber(1)
  $20.Oids ensureChainsAccessible() => $_ensure(0);

  @$pb.TagNumber(2)
  $20.Oids get boutiquesAccessible => $_getN(1);
  @$pb.TagNumber(2)
  set boutiquesAccessible($20.Oids v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoutiquesAccessible() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiquesAccessible() => clearField(2);
  @$pb.TagNumber(2)
  $20.Oids ensureBoutiquesAccessible() => $_ensure(1);
}

class LoginRequest extends $pb.GeneratedMessage {
  factory LoginRequest({
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
  LoginRequest._() : super();
  factory LoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRequest copyWith(void Function(LoginRequest) updates) => super.copyWith((message) => updates(message as LoginRequest)) as LoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() => $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

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

class DeviceLoginRequest extends $pb.GeneratedMessage {
  factory DeviceLoginRequest({
    $core.String? firmOid,
    $core.String? chainOid,
    $core.String? boutiqueOid,
    $core.String? deviceOid,
    $core.String? password,
  }) {
    final $result = create();
    if (firmOid != null) {
      $result.firmOid = firmOid;
    }
    if (chainOid != null) {
      $result.chainOid = chainOid;
    }
    if (boutiqueOid != null) {
      $result.boutiqueOid = boutiqueOid;
    }
    if (deviceOid != null) {
      $result.deviceOid = deviceOid;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  DeviceLoginRequest._() : super();
  factory DeviceLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeviceLoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmOid', protoName: 'firmOid')
    ..aOS(2, _omitFieldNames ? '' : 'chainOid', protoName: 'chainOid')
    ..aOS(3, _omitFieldNames ? '' : 'boutiqueOid', protoName: 'boutiqueOid')
    ..aOS(4, _omitFieldNames ? '' : 'deviceOid', protoName: 'deviceOid')
    ..aOS(5, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceLoginRequest clone() => DeviceLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceLoginRequest copyWith(void Function(DeviceLoginRequest) updates) => super.copyWith((message) => updates(message as DeviceLoginRequest)) as DeviceLoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceLoginRequest create() => DeviceLoginRequest._();
  DeviceLoginRequest createEmptyInstance() => create();
  static $pb.PbList<DeviceLoginRequest> createRepeated() => $pb.PbList<DeviceLoginRequest>();
  @$core.pragma('dart2js:noInline')
  static DeviceLoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceLoginRequest>(create);
  static DeviceLoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmOid => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmOid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmOid() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmOid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainOid => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainOid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChainOid() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainOid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get boutiqueOid => $_getSZ(2);
  @$pb.TagNumber(3)
  set boutiqueOid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoutiqueOid() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoutiqueOid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceOid => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceOid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceOid() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceOid() => clearField(4);

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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshToken', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Tokens', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
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
    $core.String? chainOid,
    $7.Device? device,
  }) {
    final $result = create();
    if (chainOid != null) {
      $result.chainOid = chainOid;
    }
    if (device != null) {
      $result.device = device;
    }
    return $result;
  }
  UpdateDevicePasswordRequest._() : super();
  factory UpdateDevicePasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDevicePasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateDevicePasswordRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainOid', protoName: 'chainOid')
    ..aOM<$7.Device>(2, _omitFieldNames ? '' : 'device', subBuilder: $7.Device.create)
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
  $core.String get chainOid => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainOid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainOid() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainOid() => clearField(1);

  @$pb.TagNumber(2)
  $7.Device get device => $_getN(1);
  @$pb.TagNumber(2)
  set device($7.Device v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDevice() => $_has(1);
  @$pb.TagNumber(2)
  void clearDevice() => clearField(2);
  @$pb.TagNumber(2)
  $7.Device ensureDevice() => $_ensure(1);
}

/// / ! any addition to this model must be replicated in the user_service_base.dart updateOne()
class UserInfo extends $pb.GeneratedMessage {
  factory UserInfo({
    $core.String? userOid,
    $core.String? mail,
    $core.String? firstname,
    $core.String? lastname,
    $12.UserPermissions? permissions,
  }) {
    final $result = create();
    if (userOid != null) {
      $result.userOid = userOid;
    }
    if (mail != null) {
      $result.mail = mail;
    }
    if (firstname != null) {
      $result.firstname = firstname;
    }
    if (lastname != null) {
      $result.lastname = lastname;
    }
    if (permissions != null) {
      $result.permissions = permissions;
    }
    return $result;
  }
  UserInfo._() : super();
  factory UserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userOid', protoName: 'userOid')
    ..aOS(2, _omitFieldNames ? '' : 'mail')
    ..aOS(3, _omitFieldNames ? '' : 'firstname')
    ..aOS(4, _omitFieldNames ? '' : 'lastname')
    ..aOM<$12.UserPermissions>(5, _omitFieldNames ? '' : 'permissions', subBuilder: $12.UserPermissions.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfo clone() => UserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfo copyWith(void Function(UserInfo) updates) => super.copyWith((message) => updates(message as UserInfo)) as UserInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfo create() => UserInfo._();
  UserInfo createEmptyInstance() => create();
  static $pb.PbList<UserInfo> createRepeated() => $pb.PbList<UserInfo>();
  @$core.pragma('dart2js:noInline')
  static UserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfo>(create);
  static UserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userOid => $_getSZ(0);
  @$pb.TagNumber(1)
  set userOid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserOid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserOid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mail => $_getSZ(1);
  @$pb.TagNumber(2)
  set mail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMail() => $_has(1);
  @$pb.TagNumber(2)
  void clearMail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get firstname => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirstname() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstname() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastname => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastname($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastname() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastname() => clearField(4);

  @$pb.TagNumber(5)
  $12.UserPermissions get permissions => $_getN(4);
  @$pb.TagNumber(5)
  set permissions($12.UserPermissions v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPermissions() => $_has(4);
  @$pb.TagNumber(5)
  void clearPermissions() => clearField(5);
  @$pb.TagNumber(5)
  $12.UserPermissions ensurePermissions() => $_ensure(4);
}

class CreateOneRequest extends $pb.GeneratedMessage {
  factory CreateOneRequest({
    UserInfo? userInfo,
    $core.String? password,
    $core.bool? isFirstUser,
  }) {
    final $result = create();
    if (userInfo != null) {
      $result.userInfo = userInfo;
    }
    if (password != null) {
      $result.password = password;
    }
    if (isFirstUser != null) {
      $result.isFirstUser = isFirstUser;
    }
    return $result;
  }
  CreateOneRequest._() : super();
  factory CreateOneRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateOneRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateOneRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
    ..aOM<UserInfo>(1, _omitFieldNames ? '' : 'userInfo', protoName: 'userInfo', subBuilder: UserInfo.create)
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOB(3, _omitFieldNames ? '' : 'isFirstUser', protoName: 'isFirstUser')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateOneRequest clone() => CreateOneRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateOneRequest copyWith(void Function(CreateOneRequest) updates) => super.copyWith((message) => updates(message as CreateOneRequest)) as CreateOneRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateOneRequest create() => CreateOneRequest._();
  CreateOneRequest createEmptyInstance() => create();
  static $pb.PbList<CreateOneRequest> createRepeated() => $pb.PbList<CreateOneRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateOneRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateOneRequest>(create);
  static CreateOneRequest? _defaultInstance;

  @$pb.TagNumber(1)
  UserInfo get userInfo => $_getN(0);
  @$pb.TagNumber(1)
  set userInfo(UserInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInfo() => clearField(1);
  @$pb.TagNumber(1)
  UserInfo ensureUserInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isFirstUser => $_getBF(2);
  @$pb.TagNumber(3)
  set isFirstUser($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsFirstUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsFirstUser() => clearField(3);
}

class PasswordUpdateRequest extends $pb.GeneratedMessage {
  factory PasswordUpdateRequest({
    $core.String? userOid,
    $core.String? firmOid,
  }) {
    final $result = create();
    if (userOid != null) {
      $result.userOid = userOid;
    }
    if (firmOid != null) {
      $result.firmOid = firmOid;
    }
    return $result;
  }
  PasswordUpdateRequest._() : super();
  factory PasswordUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PasswordUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PasswordUpdateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userOid', protoName: 'userOid')
    ..aOS(2, _omitFieldNames ? '' : 'firmOid', protoName: 'firmOid')
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
  $core.String get userOid => $_getSZ(0);
  @$pb.TagNumber(1)
  set userOid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserOid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserOid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firmOid => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmOid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirmOid() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmOid() => clearField(2);
}

class PendingDeviceRequest extends $pb.GeneratedMessage {
  factory PendingDeviceRequest({
    $7.Device? device,
    $core.int? code,
  }) {
    final $result = create();
    if (device != null) {
      $result.device = device;
    }
    if (code != null) {
      $result.code = code;
    }
    return $result;
  }
  PendingDeviceRequest._() : super();
  factory PendingDeviceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PendingDeviceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PendingDeviceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
    ..aOM<$7.Device>(1, _omitFieldNames ? '' : 'device', subBuilder: $7.Device.create)
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
  $7.Device get device => $_getN(0);
  @$pb.TagNumber(1)
  set device($7.Device v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDevice() => $_has(0);
  @$pb.TagNumber(1)
  void clearDevice() => clearField(1);
  @$pb.TagNumber(1)
  $7.Device ensureDevice() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get code => $_getIZ(1);
  @$pb.TagNumber(2)
  set code($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class DevicePairingResponse extends $pb.GeneratedMessage {
  factory DevicePairingResponse({
    $core.String? firmOid,
    $core.String? chainOid,
    $core.String? boutiqueOid,
    $core.String? userOid,
    $core.int? code,
    $17.Timestamp? timestampUTC,
  }) {
    final $result = create();
    if (firmOid != null) {
      $result.firmOid = firmOid;
    }
    if (chainOid != null) {
      $result.chainOid = chainOid;
    }
    if (boutiqueOid != null) {
      $result.boutiqueOid = boutiqueOid;
    }
    if (userOid != null) {
      $result.userOid = userOid;
    }
    if (code != null) {
      $result.code = code;
    }
    if (timestampUTC != null) {
      $result.timestampUTC = timestampUTC;
    }
    return $result;
  }
  DevicePairingResponse._() : super();
  factory DevicePairingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DevicePairingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DevicePairingResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmOid', protoName: 'firmOid')
    ..aOS(2, _omitFieldNames ? '' : 'chainOid', protoName: 'chainOid')
    ..aOS(3, _omitFieldNames ? '' : 'boutiqueOid', protoName: 'boutiqueOid')
    ..aOS(4, _omitFieldNames ? '' : 'userOid', protoName: 'userOid')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..aOM<$17.Timestamp>(6, _omitFieldNames ? '' : 'timestampUTC', protoName: 'timestampUTC', subBuilder: $17.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DevicePairingResponse clone() => DevicePairingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DevicePairingResponse copyWith(void Function(DevicePairingResponse) updates) => super.copyWith((message) => updates(message as DevicePairingResponse)) as DevicePairingResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DevicePairingResponse create() => DevicePairingResponse._();
  DevicePairingResponse createEmptyInstance() => create();
  static $pb.PbList<DevicePairingResponse> createRepeated() => $pb.PbList<DevicePairingResponse>();
  @$core.pragma('dart2js:noInline')
  static DevicePairingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DevicePairingResponse>(create);
  static DevicePairingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmOid => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmOid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmOid() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmOid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainOid => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainOid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChainOid() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainOid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get boutiqueOid => $_getSZ(2);
  @$pb.TagNumber(3)
  set boutiqueOid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoutiqueOid() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoutiqueOid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userOid => $_getSZ(3);
  @$pb.TagNumber(4)
  set userOid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserOid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserOid() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get code => $_getIZ(4);
  @$pb.TagNumber(5)
  set code($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearCode() => clearField(5);

  @$pb.TagNumber(6)
  $17.Timestamp get timestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set timestampUTC($17.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimestampUTC() => clearField(6);
  @$pb.TagNumber(6)
  $17.Timestamp ensureTimestampUTC() => $_ensure(5);
}

class ApproveDeviceRequest extends $pb.GeneratedMessage {
  factory ApproveDeviceRequest({
    $11.ChainOidAndBoutiqueOid? chainOidAndBoutiqueOid,
    $7.Device? device,
  }) {
    final $result = create();
    if (chainOidAndBoutiqueOid != null) {
      $result.chainOidAndBoutiqueOid = chainOidAndBoutiqueOid;
    }
    if (device != null) {
      $result.device = device;
    }
    return $result;
  }
  ApproveDeviceRequest._() : super();
  factory ApproveDeviceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproveDeviceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ApproveDeviceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.service'), createEmptyInstance: create)
    ..aOM<$11.ChainOidAndBoutiqueOid>(1, _omitFieldNames ? '' : 'chainOidAndBoutiqueOid', protoName: 'chainOidAndBoutiqueOid', subBuilder: $11.ChainOidAndBoutiqueOid.create)
    ..aOM<$7.Device>(2, _omitFieldNames ? '' : 'device', subBuilder: $7.Device.create)
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
  $11.ChainOidAndBoutiqueOid get chainOidAndBoutiqueOid => $_getN(0);
  @$pb.TagNumber(1)
  set chainOidAndBoutiqueOid($11.ChainOidAndBoutiqueOid v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainOidAndBoutiqueOid() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainOidAndBoutiqueOid() => clearField(1);
  @$pb.TagNumber(1)
  $11.ChainOidAndBoutiqueOid ensureChainOidAndBoutiqueOid() => $_ensure(0);

  @$pb.TagNumber(2)
  $7.Device get device => $_getN(1);
  @$pb.TagNumber(2)
  set device($7.Device v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDevice() => $_has(1);
  @$pb.TagNumber(2)
  void clearDevice() => clearField(2);
  @$pb.TagNumber(2)
  $7.Device ensureDevice() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
