//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/g_common.pb.dart' as $1;
import 'common/g_timestamp.pb.dart' as $17;
import 'common/phone.pb.dart' as $18;
import 'user_permissions.pb.dart' as $8;

class UserPublic extends $pb.GeneratedMessage {
  factory UserPublic({
    $core.String? userId,
    $core.String? mail,
    $core.String? firstname,
    $core.String? lastname,
    $18.Phone? phone,
    $17.Timestamp? lastSignIn,
    $8.UserPermissions? permissions,
    $core.Map<$core.String, $core.String>? othersAttributes,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
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
    if (phone != null) {
      $result.phone = phone;
    }
    if (lastSignIn != null) {
      $result.lastSignIn = lastSignIn;
    }
    if (permissions != null) {
      $result.permissions = permissions;
    }
    if (othersAttributes != null) {
      $result.othersAttributes.addAll(othersAttributes);
    }
    return $result;
  }
  UserPublic._() : super();
  factory UserPublic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserPublic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserPublic', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'mail')
    ..aOS(3, _omitFieldNames ? '' : 'firstname')
    ..aOS(4, _omitFieldNames ? '' : 'lastname')
    ..aOM<$18.Phone>(5, _omitFieldNames ? '' : 'phone', subBuilder: $18.Phone.create)
    ..aOM<$17.Timestamp>(6, _omitFieldNames ? '' : 'lastSignIn', protoName: 'lastSignIn', subBuilder: $17.Timestamp.create)
    ..aOM<$8.UserPermissions>(7, _omitFieldNames ? '' : 'permissions', subBuilder: $8.UserPermissions.create)
    ..m<$core.String, $core.String>(99, _omitFieldNames ? '' : 'othersAttributes', protoName: 'othersAttributes', entryClassName: 'UserPublic.OthersAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('weebi.user'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserPublic clone() => UserPublic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserPublic copyWith(void Function(UserPublic) updates) => super.copyWith((message) => updates(message as UserPublic)) as UserPublic;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserPublic create() => UserPublic._();
  UserPublic createEmptyInstance() => create();
  static $pb.PbList<UserPublic> createRepeated() => $pb.PbList<UserPublic>();
  @$core.pragma('dart2js:noInline')
  static UserPublic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserPublic>(create);
  static UserPublic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

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
  $18.Phone get phone => $_getN(4);
  @$pb.TagNumber(5)
  set phone($18.Phone v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhone() => clearField(5);
  @$pb.TagNumber(5)
  $18.Phone ensurePhone() => $_ensure(4);

  @$pb.TagNumber(6)
  $17.Timestamp get lastSignIn => $_getN(5);
  @$pb.TagNumber(6)
  set lastSignIn($17.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastSignIn() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastSignIn() => clearField(6);
  @$pb.TagNumber(6)
  $17.Timestamp ensureLastSignIn() => $_ensure(5);

  @$pb.TagNumber(7)
  $8.UserPermissions get permissions => $_getN(6);
  @$pb.TagNumber(7)
  set permissions($8.UserPermissions v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasPermissions() => $_has(6);
  @$pb.TagNumber(7)
  void clearPermissions() => clearField(7);
  @$pb.TagNumber(7)
  $8.UserPermissions ensurePermissions() => $_ensure(6);

  @$pb.TagNumber(99)
  $core.Map<$core.String, $core.String> get othersAttributes => $_getMap(7);
}

/// / this is how users are stored in db
/// / this model should not be exposed / used by clients
/// / because it includes password
class UserPrivate extends $pb.GeneratedMessage {
  factory UserPrivate({
    $core.String? userId,
    $core.String? mail,
    $core.String? firstname,
    $core.String? lastname,
    $18.Phone? phone,
    $core.String? passwordEncrypted,
    $core.String? firmId,
    $8.UserPermissions? permissions,
    $17.Timestamp? lastSignIn,
    $core.String? lastUpdatedByuserId,
    $17.Timestamp? lastUpdateTimestampUTC,
    $core.Map<$core.String, $core.String>? othersAttributes,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
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
    if (phone != null) {
      $result.phone = phone;
    }
    if (passwordEncrypted != null) {
      $result.passwordEncrypted = passwordEncrypted;
    }
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (permissions != null) {
      $result.permissions = permissions;
    }
    if (lastSignIn != null) {
      $result.lastSignIn = lastSignIn;
    }
    if (lastUpdatedByuserId != null) {
      $result.lastUpdatedByuserId = lastUpdatedByuserId;
    }
    if (lastUpdateTimestampUTC != null) {
      $result.lastUpdateTimestampUTC = lastUpdateTimestampUTC;
    }
    if (othersAttributes != null) {
      $result.othersAttributes.addAll(othersAttributes);
    }
    return $result;
  }
  UserPrivate._() : super();
  factory UserPrivate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserPrivate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserPrivate', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'mail')
    ..aOS(3, _omitFieldNames ? '' : 'firstname')
    ..aOS(4, _omitFieldNames ? '' : 'lastname')
    ..aOM<$18.Phone>(5, _omitFieldNames ? '' : 'phone', subBuilder: $18.Phone.create)
    ..aOS(6, _omitFieldNames ? '' : 'password', protoName: 'passwordEncrypted')
    ..aOS(7, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOM<$8.UserPermissions>(8, _omitFieldNames ? '' : 'permissions', subBuilder: $8.UserPermissions.create)
    ..aOM<$17.Timestamp>(9, _omitFieldNames ? '' : 'lastSignIn', protoName: 'lastSignIn', subBuilder: $17.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'lastUpdatedByuserId', protoName: 'lastUpdatedByuserId')
    ..aOM<$17.Timestamp>(11, _omitFieldNames ? '' : 'lastUpdateTimestampUTC', protoName: 'lastUpdateTimestampUTC', subBuilder: $17.Timestamp.create)
    ..m<$core.String, $core.String>(99, _omitFieldNames ? '' : 'othersAttributes', protoName: 'othersAttributes', entryClassName: 'UserPrivate.OthersAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('weebi.user'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserPrivate clone() => UserPrivate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserPrivate copyWith(void Function(UserPrivate) updates) => super.copyWith((message) => updates(message as UserPrivate)) as UserPrivate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserPrivate create() => UserPrivate._();
  UserPrivate createEmptyInstance() => create();
  static $pb.PbList<UserPrivate> createRepeated() => $pb.PbList<UserPrivate>();
  @$core.pragma('dart2js:noInline')
  static UserPrivate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserPrivate>(create);
  static UserPrivate? _defaultInstance;

  /// string userId = 1 [json_name = 'userId'];
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

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
  $18.Phone get phone => $_getN(4);
  @$pb.TagNumber(5)
  set phone($18.Phone v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhone() => clearField(5);
  @$pb.TagNumber(5)
  $18.Phone ensurePhone() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get passwordEncrypted => $_getSZ(5);
  @$pb.TagNumber(6)
  set passwordEncrypted($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPasswordEncrypted() => $_has(5);
  @$pb.TagNumber(6)
  void clearPasswordEncrypted() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get firmId => $_getSZ(6);
  @$pb.TagNumber(7)
  set firmId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFirmId() => $_has(6);
  @$pb.TagNumber(7)
  void clearFirmId() => clearField(7);

  @$pb.TagNumber(8)
  $8.UserPermissions get permissions => $_getN(7);
  @$pb.TagNumber(8)
  set permissions($8.UserPermissions v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPermissions() => $_has(7);
  @$pb.TagNumber(8)
  void clearPermissions() => clearField(8);
  @$pb.TagNumber(8)
  $8.UserPermissions ensurePermissions() => $_ensure(7);

  @$pb.TagNumber(9)
  $17.Timestamp get lastSignIn => $_getN(8);
  @$pb.TagNumber(9)
  set lastSignIn($17.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasLastSignIn() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastSignIn() => clearField(9);
  @$pb.TagNumber(9)
  $17.Timestamp ensureLastSignIn() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get lastUpdatedByuserId => $_getSZ(9);
  @$pb.TagNumber(10)
  set lastUpdatedByuserId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLastUpdatedByuserId() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastUpdatedByuserId() => clearField(10);

  @$pb.TagNumber(11)
  $17.Timestamp get lastUpdateTimestampUTC => $_getN(10);
  @$pb.TagNumber(11)
  set lastUpdateTimestampUTC($17.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasLastUpdateTimestampUTC() => $_has(10);
  @$pb.TagNumber(11)
  void clearLastUpdateTimestampUTC() => clearField(11);
  @$pb.TagNumber(11)
  $17.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(10);

  @$pb.TagNumber(99)
  $core.Map<$core.String, $core.String> get othersAttributes => $_getMap(11);
}

class SignUpRequest extends $pb.GeneratedMessage {
  factory SignUpRequest({
    $1.StatusResponse? statusResponse,
    $core.String? mail,
    $core.String? firstname,
    $core.String? lastname,
    $core.String? password,
  }) {
    final $result = create();
    if (statusResponse != null) {
      $result.statusResponse = statusResponse;
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
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  SignUpRequest._() : super();
  factory SignUpRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignUpRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignUpRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
    ..aOM<$1.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse', protoName: 'statusResponse', subBuilder: $1.StatusResponse.create)
    ..aOS(2, _omitFieldNames ? '' : 'mail')
    ..aOS(3, _omitFieldNames ? '' : 'firstname')
    ..aOS(4, _omitFieldNames ? '' : 'lastname')
    ..aOS(5, _omitFieldNames ? '' : 'pwd', protoName: 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignUpRequest clone() => SignUpRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignUpRequest copyWith(void Function(SignUpRequest) updates) => super.copyWith((message) => updates(message as SignUpRequest)) as SignUpRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignUpRequest create() => SignUpRequest._();
  SignUpRequest createEmptyInstance() => create();
  static $pb.PbList<SignUpRequest> createRepeated() => $pb.PbList<SignUpRequest>();
  @$core.pragma('dart2js:noInline')
  static SignUpRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignUpRequest>(create);
  static SignUpRequest? _defaultInstance;

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
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => clearField(5);
}

class SignUpResponse extends $pb.GeneratedMessage {
  factory SignUpResponse({
    $1.StatusResponse? statusResponse,
    $core.String? userId,
  }) {
    final $result = create();
    if (statusResponse != null) {
      $result.statusResponse = statusResponse;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  SignUpResponse._() : super();
  factory SignUpResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignUpResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignUpResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
    ..aOM<$1.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse', protoName: 'statusResponse', subBuilder: $1.StatusResponse.create)
    ..aOS(2, _omitFieldNames ? '' : 'string', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignUpResponse clone() => SignUpResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignUpResponse copyWith(void Function(SignUpResponse) updates) => super.copyWith((message) => updates(message as SignUpResponse)) as SignUpResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignUpResponse create() => SignUpResponse._();
  SignUpResponse createEmptyInstance() => create();
  static $pb.PbList<SignUpResponse> createRepeated() => $pb.PbList<SignUpResponse>();
  @$core.pragma('dart2js:noInline')
  static SignUpResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignUpResponse>(create);
  static SignUpResponse? _defaultInstance;

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
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

/// / used by admins to create users
class AddPendingUserRequest extends $pb.GeneratedMessage {
  factory AddPendingUserRequest({
    $core.String? mail,
    $core.String? firstname,
    $core.String? lastname,
    $8.UserPermissions? permissions,
    $18.Phone? phone,
    $core.Map<$core.String, $core.String>? othersAttributes,
  }) {
    final $result = create();
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
    if (phone != null) {
      $result.phone = phone;
    }
    if (othersAttributes != null) {
      $result.othersAttributes.addAll(othersAttributes);
    }
    return $result;
  }
  AddPendingUserRequest._() : super();
  factory AddPendingUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPendingUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddPendingUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..aOS(2, _omitFieldNames ? '' : 'firstname')
    ..aOS(3, _omitFieldNames ? '' : 'lastname')
    ..aOM<$8.UserPermissions>(4, _omitFieldNames ? '' : 'permissions', subBuilder: $8.UserPermissions.create)
    ..aOM<$18.Phone>(5, _omitFieldNames ? '' : 'phone', subBuilder: $18.Phone.create)
    ..m<$core.String, $core.String>(99, _omitFieldNames ? '' : 'othersAttributes', protoName: 'othersAttributes', entryClassName: 'AddPendingUserRequest.OthersAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('weebi.user'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPendingUserRequest clone() => AddPendingUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPendingUserRequest copyWith(void Function(AddPendingUserRequest) updates) => super.copyWith((message) => updates(message as AddPendingUserRequest)) as AddPendingUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPendingUserRequest create() => AddPendingUserRequest._();
  AddPendingUserRequest createEmptyInstance() => create();
  static $pb.PbList<AddPendingUserRequest> createRepeated() => $pb.PbList<AddPendingUserRequest>();
  @$core.pragma('dart2js:noInline')
  static AddPendingUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPendingUserRequest>(create);
  static AddPendingUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mail => $_getSZ(0);
  @$pb.TagNumber(1)
  set mail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMail() => $_has(0);
  @$pb.TagNumber(1)
  void clearMail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstname => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstname() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastname => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastname() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastname() => clearField(3);

  @$pb.TagNumber(4)
  $8.UserPermissions get permissions => $_getN(3);
  @$pb.TagNumber(4)
  set permissions($8.UserPermissions v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPermissions() => $_has(3);
  @$pb.TagNumber(4)
  void clearPermissions() => clearField(4);
  @$pb.TagNumber(4)
  $8.UserPermissions ensurePermissions() => $_ensure(3);

  @$pb.TagNumber(5)
  $18.Phone get phone => $_getN(4);
  @$pb.TagNumber(5)
  set phone($18.Phone v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhone() => clearField(5);
  @$pb.TagNumber(5)
  $18.Phone ensurePhone() => $_ensure(4);

  @$pb.TagNumber(99)
  $core.Map<$core.String, $core.String> get othersAttributes => $_getMap(5);
}

class AddPendingUserResponse extends $pb.GeneratedMessage {
  factory AddPendingUserResponse({
    $1.StatusResponse? statusResponse,
    UserPublic? userPublic,
  }) {
    final $result = create();
    if (statusResponse != null) {
      $result.statusResponse = statusResponse;
    }
    if (userPublic != null) {
      $result.userPublic = userPublic;
    }
    return $result;
  }
  AddPendingUserResponse._() : super();
  factory AddPendingUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPendingUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddPendingUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
    ..aOM<$1.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse', protoName: 'statusResponse', subBuilder: $1.StatusResponse.create)
    ..aOM<UserPublic>(2, _omitFieldNames ? '' : 'userPublic', protoName: 'userPublic', subBuilder: UserPublic.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPendingUserResponse clone() => AddPendingUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPendingUserResponse copyWith(void Function(AddPendingUserResponse) updates) => super.copyWith((message) => updates(message as AddPendingUserResponse)) as AddPendingUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPendingUserResponse create() => AddPendingUserResponse._();
  AddPendingUserResponse createEmptyInstance() => create();
  static $pb.PbList<AddPendingUserResponse> createRepeated() => $pb.PbList<AddPendingUserResponse>();
  @$core.pragma('dart2js:noInline')
  static AddPendingUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPendingUserResponse>(create);
  static AddPendingUserResponse? _defaultInstance;

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
  UserPublic get userPublic => $_getN(1);
  @$pb.TagNumber(2)
  set userPublic(UserPublic v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserPublic() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserPublic() => clearField(2);
  @$pb.TagNumber(2)
  UserPublic ensureUserPublic() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
