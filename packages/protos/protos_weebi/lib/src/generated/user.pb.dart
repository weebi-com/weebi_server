// This is a generated file - do not edit.
//
// Generated from user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/g_common.pb.dart' as $3;
import 'common/g_timestamp.pb.dart' as $1;
import 'common/phone.pb.dart' as $0;
import 'user_permissions.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class UserPublic extends $pb.GeneratedMessage {
  factory UserPublic({
    $core.String? userId,
    $core.String? mail,
    $core.String? firstname,
    $core.String? lastname,
    $0.Phone? phone,
    $1.Timestamp? lastSignIn,
    $2.UserPermissions? permissions,
    $core.bool? mustChangePassword,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        othersAttributes,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (mail != null) result.mail = mail;
    if (firstname != null) result.firstname = firstname;
    if (lastname != null) result.lastname = lastname;
    if (phone != null) result.phone = phone;
    if (lastSignIn != null) result.lastSignIn = lastSignIn;
    if (permissions != null) result.permissions = permissions;
    if (mustChangePassword != null)
      result.mustChangePassword = mustChangePassword;
    if (othersAttributes != null)
      result.othersAttributes.addEntries(othersAttributes);
    return result;
  }

  UserPublic._();

  factory UserPublic.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserPublic.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserPublic',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'mail')
    ..aOS(3, _omitFieldNames ? '' : 'firstname')
    ..aOS(4, _omitFieldNames ? '' : 'lastname')
    ..aOM<$0.Phone>(5, _omitFieldNames ? '' : 'phone',
        subBuilder: $0.Phone.create)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'lastSignIn',
        protoName: 'lastSignIn', subBuilder: $1.Timestamp.create)
    ..aOM<$2.UserPermissions>(7, _omitFieldNames ? '' : 'permissions',
        subBuilder: $2.UserPermissions.create)
    ..aOB(8, _omitFieldNames ? '' : 'mustChangePassword',
        protoName: 'mustChangePassword')
    ..m<$core.String, $core.String>(
        99, _omitFieldNames ? '' : 'othersAttributes',
        protoName: 'othersAttributes',
        entryClassName: 'UserPublic.OthersAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('weebi.user'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserPublic clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserPublic copyWith(void Function(UserPublic) updates) =>
      super.copyWith((message) => updates(message as UserPublic)) as UserPublic;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserPublic create() => UserPublic._();
  @$core.override
  UserPublic createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserPublic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserPublic>(create);
  static UserPublic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get mail => $_getSZ(1);
  @$pb.TagNumber(2)
  set mail($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMail() => $_has(1);
  @$pb.TagNumber(2)
  void clearMail() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get firstname => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFirstname() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstname() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastname => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastname($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLastname() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastname() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.Phone get phone => $_getN(4);
  @$pb.TagNumber(5)
  set phone($0.Phone value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhone() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Phone ensurePhone() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Timestamp get lastSignIn => $_getN(5);
  @$pb.TagNumber(6)
  set lastSignIn($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasLastSignIn() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastSignIn() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureLastSignIn() => $_ensure(5);

  @$pb.TagNumber(7)
  $2.UserPermissions get permissions => $_getN(6);
  @$pb.TagNumber(7)
  set permissions($2.UserPermissions value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasPermissions() => $_has(6);
  @$pb.TagNumber(7)
  void clearPermissions() => $_clearField(7);
  @$pb.TagNumber(7)
  $2.UserPermissions ensurePermissions() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.bool get mustChangePassword => $_getBF(7);
  @$pb.TagNumber(8)
  set mustChangePassword($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMustChangePassword() => $_has(7);
  @$pb.TagNumber(8)
  void clearMustChangePassword() => $_clearField(8);

  @$pb.TagNumber(99)
  $pb.PbMap<$core.String, $core.String> get othersAttributes => $_getMap(8);
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
    $0.Phone? phone,
    $core.String? passwordEncrypted,
    $core.String? firmId,
    $2.UserPermissions? permissions,
    $1.Timestamp? lastSignIn,
    $core.String? lastUpdatedByuserId,
    $1.Timestamp? lastUpdateTimestampUTC,
    $1.Timestamp? creationDateUTC,
    $core.bool? mustChangePassword,
    $core.bool? emailVerificationSent,
    $core.String? subscriberId,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        othersAttributes,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (mail != null) result.mail = mail;
    if (firstname != null) result.firstname = firstname;
    if (lastname != null) result.lastname = lastname;
    if (phone != null) result.phone = phone;
    if (passwordEncrypted != null) result.passwordEncrypted = passwordEncrypted;
    if (firmId != null) result.firmId = firmId;
    if (permissions != null) result.permissions = permissions;
    if (lastSignIn != null) result.lastSignIn = lastSignIn;
    if (lastUpdatedByuserId != null)
      result.lastUpdatedByuserId = lastUpdatedByuserId;
    if (lastUpdateTimestampUTC != null)
      result.lastUpdateTimestampUTC = lastUpdateTimestampUTC;
    if (creationDateUTC != null) result.creationDateUTC = creationDateUTC;
    if (mustChangePassword != null)
      result.mustChangePassword = mustChangePassword;
    if (emailVerificationSent != null)
      result.emailVerificationSent = emailVerificationSent;
    if (subscriberId != null) result.subscriberId = subscriberId;
    if (othersAttributes != null)
      result.othersAttributes.addEntries(othersAttributes);
    return result;
  }

  UserPrivate._();

  factory UserPrivate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserPrivate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserPrivate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'mail')
    ..aOS(3, _omitFieldNames ? '' : 'firstname')
    ..aOS(4, _omitFieldNames ? '' : 'lastname')
    ..aOM<$0.Phone>(5, _omitFieldNames ? '' : 'phone',
        subBuilder: $0.Phone.create)
    ..aOS(6, _omitFieldNames ? '' : 'password', protoName: 'passwordEncrypted')
    ..aOS(7, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOM<$2.UserPermissions>(8, _omitFieldNames ? '' : 'permissions',
        subBuilder: $2.UserPermissions.create)
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'lastSignIn',
        protoName: 'lastSignIn', subBuilder: $1.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'lastUpdatedByuserId',
        protoName: 'lastUpdatedByuserId')
    ..aOM<$1.Timestamp>(11, _omitFieldNames ? '' : 'lastUpdateTimestampUTC',
        protoName: 'lastUpdateTimestampUTC', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(12, _omitFieldNames ? '' : 'creationDateUTC',
        protoName: 'creationDateUTC', subBuilder: $1.Timestamp.create)
    ..aOB(13, _omitFieldNames ? '' : 'mustChangePassword',
        protoName: 'mustChangePassword')
    ..aOB(14, _omitFieldNames ? '' : 'emailVerificationSent',
        protoName: 'emailVerificationSent')
    ..aOS(15, _omitFieldNames ? '' : 'subscriberId', protoName: 'subscriberId')
    ..m<$core.String, $core.String>(
        99, _omitFieldNames ? '' : 'othersAttributes',
        protoName: 'othersAttributes',
        entryClassName: 'UserPrivate.OthersAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('weebi.user'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserPrivate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserPrivate copyWith(void Function(UserPrivate) updates) =>
      super.copyWith((message) => updates(message as UserPrivate))
          as UserPrivate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserPrivate create() => UserPrivate._();
  @$core.override
  UserPrivate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserPrivate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserPrivate>(create);
  static UserPrivate? _defaultInstance;

  /// string userId = 1 [json_name = 'userId'];
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get mail => $_getSZ(1);
  @$pb.TagNumber(2)
  set mail($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMail() => $_has(1);
  @$pb.TagNumber(2)
  void clearMail() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get firstname => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFirstname() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstname() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastname => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastname($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLastname() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastname() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.Phone get phone => $_getN(4);
  @$pb.TagNumber(5)
  set phone($0.Phone value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhone() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Phone ensurePhone() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get passwordEncrypted => $_getSZ(5);
  @$pb.TagNumber(6)
  set passwordEncrypted($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPasswordEncrypted() => $_has(5);
  @$pb.TagNumber(6)
  void clearPasswordEncrypted() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get firmId => $_getSZ(6);
  @$pb.TagNumber(7)
  set firmId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasFirmId() => $_has(6);
  @$pb.TagNumber(7)
  void clearFirmId() => $_clearField(7);

  @$pb.TagNumber(8)
  $2.UserPermissions get permissions => $_getN(7);
  @$pb.TagNumber(8)
  set permissions($2.UserPermissions value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasPermissions() => $_has(7);
  @$pb.TagNumber(8)
  void clearPermissions() => $_clearField(8);
  @$pb.TagNumber(8)
  $2.UserPermissions ensurePermissions() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.Timestamp get lastSignIn => $_getN(8);
  @$pb.TagNumber(9)
  set lastSignIn($1.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasLastSignIn() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastSignIn() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureLastSignIn() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get lastUpdatedByuserId => $_getSZ(9);
  @$pb.TagNumber(10)
  set lastUpdatedByuserId($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLastUpdatedByuserId() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastUpdatedByuserId() => $_clearField(10);

  @$pb.TagNumber(11)
  $1.Timestamp get lastUpdateTimestampUTC => $_getN(10);
  @$pb.TagNumber(11)
  set lastUpdateTimestampUTC($1.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasLastUpdateTimestampUTC() => $_has(10);
  @$pb.TagNumber(11)
  void clearLastUpdateTimestampUTC() => $_clearField(11);
  @$pb.TagNumber(11)
  $1.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(10);

  @$pb.TagNumber(12)
  $1.Timestamp get creationDateUTC => $_getN(11);
  @$pb.TagNumber(12)
  set creationDateUTC($1.Timestamp value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasCreationDateUTC() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreationDateUTC() => $_clearField(12);
  @$pb.TagNumber(12)
  $1.Timestamp ensureCreationDateUTC() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.bool get mustChangePassword => $_getBF(12);
  @$pb.TagNumber(13)
  set mustChangePassword($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(13)
  $core.bool hasMustChangePassword() => $_has(12);
  @$pb.TagNumber(13)
  void clearMustChangePassword() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.bool get emailVerificationSent => $_getBF(13);
  @$pb.TagNumber(14)
  set emailVerificationSent($core.bool value) => $_setBool(13, value);
  @$pb.TagNumber(14)
  $core.bool hasEmailVerificationSent() => $_has(13);
  @$pb.TagNumber(14)
  void clearEmailVerificationSent() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get subscriberId => $_getSZ(14);
  @$pb.TagNumber(15)
  set subscriberId($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasSubscriberId() => $_has(14);
  @$pb.TagNumber(15)
  void clearSubscriberId() => $_clearField(15);

  @$pb.TagNumber(99)
  $pb.PbMap<$core.String, $core.String> get othersAttributes => $_getMap(15);
}

class SignUpRequest extends $pb.GeneratedMessage {
  factory SignUpRequest({
    $core.String? mail,
    $core.String? firstname,
    $core.String? lastname,
    $core.String? password,
  }) {
    final result = create();
    if (mail != null) result.mail = mail;
    if (firstname != null) result.firstname = firstname;
    if (lastname != null) result.lastname = lastname;
    if (password != null) result.password = password;
    return result;
  }

  SignUpRequest._();

  factory SignUpRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignUpRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignUpRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..aOS(2, _omitFieldNames ? '' : 'firstname')
    ..aOS(3, _omitFieldNames ? '' : 'lastname')
    ..aOS(4, _omitFieldNames ? '' : 'pwd', protoName: 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignUpRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignUpRequest copyWith(void Function(SignUpRequest) updates) =>
      super.copyWith((message) => updates(message as SignUpRequest))
          as SignUpRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignUpRequest create() => SignUpRequest._();
  @$core.override
  SignUpRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignUpRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignUpRequest>(create);
  static SignUpRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mail => $_getSZ(0);
  @$pb.TagNumber(1)
  set mail($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMail() => $_has(0);
  @$pb.TagNumber(1)
  void clearMail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstname => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFirstname() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastname => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLastname() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastname() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get password => $_getSZ(3);
  @$pb.TagNumber(4)
  set password($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearPassword() => $_clearField(4);
}

class SignUpResponse extends $pb.GeneratedMessage {
  factory SignUpResponse({
    $3.StatusResponse? statusResponse,
    $core.String? userId,
  }) {
    final result = create();
    if (statusResponse != null) result.statusResponse = statusResponse;
    if (userId != null) result.userId = userId;
    return result;
  }

  SignUpResponse._();

  factory SignUpResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignUpResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignUpResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'),
      createEmptyInstance: create)
    ..aOM<$3.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse',
        protoName: 'statusResponse', subBuilder: $3.StatusResponse.create)
    ..aOS(2, _omitFieldNames ? '' : 'string', protoName: 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignUpResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignUpResponse copyWith(void Function(SignUpResponse) updates) =>
      super.copyWith((message) => updates(message as SignUpResponse))
          as SignUpResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignUpResponse create() => SignUpResponse._();
  @$core.override
  SignUpResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignUpResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignUpResponse>(create);
  static SignUpResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.StatusResponse get statusResponse => $_getN(0);
  @$pb.TagNumber(1)
  set statusResponse($3.StatusResponse value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);
}

/// / used by admins to create users
class PendingUserRequest extends $pb.GeneratedMessage {
  factory PendingUserRequest({
    $core.String? mail,
    $core.String? firstname,
    $core.String? lastname,
    $2.UserPermissions? permissions,
    $0.Phone? phone,
    $core.String? password,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        othersAttributes,
  }) {
    final result = create();
    if (mail != null) result.mail = mail;
    if (firstname != null) result.firstname = firstname;
    if (lastname != null) result.lastname = lastname;
    if (permissions != null) result.permissions = permissions;
    if (phone != null) result.phone = phone;
    if (password != null) result.password = password;
    if (othersAttributes != null)
      result.othersAttributes.addEntries(othersAttributes);
    return result;
  }

  PendingUserRequest._();

  factory PendingUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PendingUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PendingUserRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..aOS(2, _omitFieldNames ? '' : 'firstname')
    ..aOS(3, _omitFieldNames ? '' : 'lastname')
    ..aOM<$2.UserPermissions>(4, _omitFieldNames ? '' : 'permissions',
        subBuilder: $2.UserPermissions.create)
    ..aOM<$0.Phone>(5, _omitFieldNames ? '' : 'phone',
        subBuilder: $0.Phone.create)
    ..aOS(6, _omitFieldNames ? '' : 'password')
    ..m<$core.String, $core.String>(
        99, _omitFieldNames ? '' : 'othersAttributes',
        protoName: 'othersAttributes',
        entryClassName: 'PendingUserRequest.OthersAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('weebi.user'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PendingUserRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PendingUserRequest copyWith(void Function(PendingUserRequest) updates) =>
      super.copyWith((message) => updates(message as PendingUserRequest))
          as PendingUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PendingUserRequest create() => PendingUserRequest._();
  @$core.override
  PendingUserRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PendingUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PendingUserRequest>(create);
  static PendingUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mail => $_getSZ(0);
  @$pb.TagNumber(1)
  set mail($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMail() => $_has(0);
  @$pb.TagNumber(1)
  void clearMail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstname => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFirstname() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastname => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLastname() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastname() => $_clearField(3);

  @$pb.TagNumber(4)
  $2.UserPermissions get permissions => $_getN(3);
  @$pb.TagNumber(4)
  set permissions($2.UserPermissions value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPermissions() => $_has(3);
  @$pb.TagNumber(4)
  void clearPermissions() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.UserPermissions ensurePermissions() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.Phone get phone => $_getN(4);
  @$pb.TagNumber(5)
  set phone($0.Phone value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhone() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Phone ensurePhone() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get password => $_getSZ(5);
  @$pb.TagNumber(6)
  set password($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPassword() => $_has(5);
  @$pb.TagNumber(6)
  void clearPassword() => $_clearField(6);

  @$pb.TagNumber(99)
  $pb.PbMap<$core.String, $core.String> get othersAttributes => $_getMap(6);
}

class PendingUserResponse extends $pb.GeneratedMessage {
  factory PendingUserResponse({
    $3.StatusResponse? statusResponse,
    UserPublic? userPublic,
  }) {
    final result = create();
    if (statusResponse != null) result.statusResponse = statusResponse;
    if (userPublic != null) result.userPublic = userPublic;
    return result;
  }

  PendingUserResponse._();

  factory PendingUserResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PendingUserResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PendingUserResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'),
      createEmptyInstance: create)
    ..aOM<$3.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse',
        protoName: 'statusResponse', subBuilder: $3.StatusResponse.create)
    ..aOM<UserPublic>(2, _omitFieldNames ? '' : 'userPublic',
        protoName: 'userPublic', subBuilder: UserPublic.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PendingUserResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PendingUserResponse copyWith(void Function(PendingUserResponse) updates) =>
      super.copyWith((message) => updates(message as PendingUserResponse))
          as PendingUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PendingUserResponse create() => PendingUserResponse._();
  @$core.override
  PendingUserResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PendingUserResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PendingUserResponse>(create);
  static PendingUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.StatusResponse get statusResponse => $_getN(0);
  @$pb.TagNumber(1)
  set statusResponse($3.StatusResponse value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  UserPublic get userPublic => $_getN(1);
  @$pb.TagNumber(2)
  set userPublic(UserPublic value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUserPublic() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserPublic() => $_clearField(2);
  @$pb.TagNumber(2)
  UserPublic ensureUserPublic() => $_ensure(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
