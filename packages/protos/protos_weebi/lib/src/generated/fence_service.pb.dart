// This is a generated file - do not edit.
//
// Generated from fence_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'boutique.pb.dart' as $8;
import 'btq_chain.pb.dart' as $5;
import 'common/g_common.pb.dart' as $3;
import 'common/g_timestamp.pb.dart' as $10;
import 'device.pb.dart' as $6;
import 'user.pb.dart' as $2;
import 'user_permissions.pb.dart' as $9;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// /
class ChainRequest extends $pb.GeneratedMessage {
  factory ChainRequest({
    $core.String? chainId,
    $core.String? name,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (name != null) result.name = name;
    return result;
  }

  ChainRequest._();

  factory ChainRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChainRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChainRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChainRequest clone() => ChainRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChainRequest copyWith(void Function(ChainRequest) updates) =>
      super.copyWith((message) => updates(message as ChainRequest))
          as ChainRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainRequest create() => ChainRequest._();
  @$core.override
  ChainRequest createEmptyInstance() => create();
  static $pb.PbList<ChainRequest> createRepeated() =>
      $pb.PbList<ChainRequest>();
  @$core.pragma('dart2js:noInline')
  static ChainRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChainRequest>(create);
  static ChainRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
}

/// / one boutique creation the server will assign the boutiqueId
class BoutiqueRequest extends $pb.GeneratedMessage {
  factory BoutiqueRequest({
    $core.String? chainId,
    $8.BoutiquePb? boutique,
    $core.List<$core.int>? logo,
    $core.String? logoExtension,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (boutique != null) result.boutique = boutique;
    if (logo != null) result.logo = logo;
    if (logoExtension != null) result.logoExtension = logoExtension;
    return result;
  }

  BoutiqueRequest._();

  factory BoutiqueRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoutiqueRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoutiqueRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$8.BoutiquePb>(2, _omitFieldNames ? '' : 'boutique',
        subBuilder: $8.BoutiquePb.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'logo', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'logoExtension', protoName: 'logoExtension')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueRequest clone() => BoutiqueRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueRequest copyWith(void Function(BoutiqueRequest) updates) =>
      super.copyWith((message) => updates(message as BoutiqueRequest))
          as BoutiqueRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiqueRequest create() => BoutiqueRequest._();
  @$core.override
  BoutiqueRequest createEmptyInstance() => create();
  static $pb.PbList<BoutiqueRequest> createRepeated() =>
      $pb.PbList<BoutiqueRequest>();
  @$core.pragma('dart2js:noInline')
  static BoutiqueRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoutiqueRequest>(create);
  static BoutiqueRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $8.BoutiquePb get boutique => $_getN(1);
  @$pb.TagNumber(2)
  set boutique($8.BoutiquePb value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBoutique() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutique() => $_clearField(2);
  @$pb.TagNumber(2)
  $8.BoutiquePb ensureBoutique() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get logo => $_getN(2);
  @$pb.TagNumber(3)
  set logo($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLogo() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogo() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get logoExtension => $_getSZ(3);
  @$pb.TagNumber(4)
  set logoExtension($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLogoExtension() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogoExtension() => $_clearField(4);
}

/// / one boutique creation the server will assign the boutiqueId
class BoutiqueResponse extends $pb.GeneratedMessage {
  factory BoutiqueResponse({
    $8.BoutiquePb? boutique,
    $core.List<$core.int>? logo,
    $core.String? logoExtension,
  }) {
    final result = create();
    if (boutique != null) result.boutique = boutique;
    if (logo != null) result.logo = logo;
    if (logoExtension != null) result.logoExtension = logoExtension;
    return result;
  }

  BoutiqueResponse._();

  factory BoutiqueResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoutiqueResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoutiqueResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOM<$8.BoutiquePb>(1, _omitFieldNames ? '' : 'boutique',
        subBuilder: $8.BoutiquePb.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'logo', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'logoExtension', protoName: 'logoExtension')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueResponse clone() => BoutiqueResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueResponse copyWith(void Function(BoutiqueResponse) updates) =>
      super.copyWith((message) => updates(message as BoutiqueResponse))
          as BoutiqueResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiqueResponse create() => BoutiqueResponse._();
  @$core.override
  BoutiqueResponse createEmptyInstance() => create();
  static $pb.PbList<BoutiqueResponse> createRepeated() =>
      $pb.PbList<BoutiqueResponse>();
  @$core.pragma('dart2js:noInline')
  static BoutiqueResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoutiqueResponse>(create);
  static BoutiqueResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $8.BoutiquePb get boutique => $_getN(0);
  @$pb.TagNumber(1)
  set boutique($8.BoutiquePb value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBoutique() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoutique() => $_clearField(1);
  @$pb.TagNumber(1)
  $8.BoutiquePb ensureBoutique() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get logo => $_getN(1);
  @$pb.TagNumber(2)
  set logo($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLogo() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogo() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get logoExtension => $_getSZ(2);
  @$pb.TagNumber(3)
  set logoExtension($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLogoExtension() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogoExtension() => $_clearField(3);
}

/// / deviceId == userId, so front can reuse deviceId to try login in
/// / remove pending
class CreateDeviceResponse extends $pb.GeneratedMessage {
  factory CreateDeviceResponse({
    $3.StatusResponse? statusResponse,
    $core.String? firmId,
    $core.String? chainId,
    $core.String? boutiqueId,
    $core.String? deviceId,
  }) {
    final result = create();
    if (statusResponse != null) result.statusResponse = statusResponse;
    if (firmId != null) result.firmId = firmId;
    if (chainId != null) result.chainId = chainId;
    if (boutiqueId != null) result.boutiqueId = boutiqueId;
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  CreateDeviceResponse._();

  factory CreateDeviceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateDeviceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDeviceResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOM<$3.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse',
        protoName: 'statusResponse', subBuilder: $3.StatusResponse.create)
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(3, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(4, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(5, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDeviceResponse clone() =>
      CreateDeviceResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDeviceResponse copyWith(void Function(CreateDeviceResponse) updates) =>
      super.copyWith((message) => updates(message as CreateDeviceResponse))
          as CreateDeviceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateDeviceResponse create() => CreateDeviceResponse._();
  @$core.override
  CreateDeviceResponse createEmptyInstance() => create();
  static $pb.PbList<CreateDeviceResponse> createRepeated() =>
      $pb.PbList<CreateDeviceResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateDeviceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDeviceResponse>(create);
  static CreateDeviceResponse? _defaultInstance;

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
  $core.String get firmId => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFirmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get chainId => $_getSZ(2);
  @$pb.TagNumber(3)
  set chainId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChainId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get boutiqueId => $_getSZ(3);
  @$pb.TagNumber(4)
  set boutiqueId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBoutiqueId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoutiqueId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceId => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceId() => $_clearField(5);
}

class ReadOneUserResponse extends $pb.GeneratedMessage {
  factory ReadOneUserResponse({
    $3.StatusResponse? statusResponse,
    $2.UserPublic? user,
  }) {
    final result = create();
    if (statusResponse != null) result.statusResponse = statusResponse;
    if (user != null) result.user = user;
    return result;
  }

  ReadOneUserResponse._();

  factory ReadOneUserResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadOneUserResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadOneUserResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOM<$3.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse',
        protoName: 'statusResponse', subBuilder: $3.StatusResponse.create)
    ..aOM<$2.UserPublic>(2, _omitFieldNames ? '' : 'user',
        subBuilder: $2.UserPublic.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadOneUserResponse clone() => ReadOneUserResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadOneUserResponse copyWith(void Function(ReadOneUserResponse) updates) =>
      super.copyWith((message) => updates(message as ReadOneUserResponse))
          as ReadOneUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadOneUserResponse create() => ReadOneUserResponse._();
  @$core.override
  ReadOneUserResponse createEmptyInstance() => create();
  static $pb.PbList<ReadOneUserResponse> createRepeated() =>
      $pb.PbList<ReadOneUserResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadOneUserResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadOneUserResponse>(create);
  static ReadOneUserResponse? _defaultInstance;

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
  $2.UserPublic get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($2.UserPublic value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.UserPublic ensureUser() => $_ensure(1);
}

class UsersPublic extends $pb.GeneratedMessage {
  factory UsersPublic({
    $core.Iterable<$2.UserPublic>? users,
  }) {
    final result = create();
    if (users != null) result.users.addAll(users);
    return result;
  }

  UsersPublic._();

  factory UsersPublic.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UsersPublic.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UsersPublic',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..pc<$2.UserPublic>(1, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM,
        subBuilder: $2.UserPublic.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UsersPublic clone() => UsersPublic()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UsersPublic copyWith(void Function(UsersPublic) updates) =>
      super.copyWith((message) => updates(message as UsersPublic))
          as UsersPublic;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsersPublic create() => UsersPublic._();
  @$core.override
  UsersPublic createEmptyInstance() => create();
  static $pb.PbList<UsersPublic> createRepeated() => $pb.PbList<UsersPublic>();
  @$core.pragma('dart2js:noInline')
  static UsersPublic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UsersPublic>(create);
  static UsersPublic? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$2.UserPublic> get users => $_getList(0);
}

class ReadAllChainsResponse extends $pb.GeneratedMessage {
  factory ReadAllChainsResponse({
    $core.Iterable<$5.Chain>? chains,
  }) {
    final result = create();
    if (chains != null) result.chains.addAll(chains);
    return result;
  }

  ReadAllChainsResponse._();

  factory ReadAllChainsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadAllChainsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadAllChainsResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..pc<$5.Chain>(1, _omitFieldNames ? '' : 'chains', $pb.PbFieldType.PM,
        subBuilder: $5.Chain.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadAllChainsResponse clone() =>
      ReadAllChainsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadAllChainsResponse copyWith(
          void Function(ReadAllChainsResponse) updates) =>
      super.copyWith((message) => updates(message as ReadAllChainsResponse))
          as ReadAllChainsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadAllChainsResponse create() => ReadAllChainsResponse._();
  @$core.override
  ReadAllChainsResponse createEmptyInstance() => create();
  static $pb.PbList<ReadAllChainsResponse> createRepeated() =>
      $pb.PbList<ReadAllChainsResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadAllChainsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadAllChainsResponse>(create);
  static ReadAllChainsResponse? _defaultInstance;

  /// google.retail.common.StatusResponse ?
  /// Note: chains contain only active boutiques (deleted ones are filtered out)
  @$pb.TagNumber(1)
  $pb.PbList<$5.Chain> get chains => $_getList(0);
}

class ReadAllBoutiquesResponse extends $pb.GeneratedMessage {
  factory ReadAllBoutiquesResponse({
    $core.Iterable<$8.BoutiquePb>? boutiques,
  }) {
    final result = create();
    if (boutiques != null) result.boutiques.addAll(boutiques);
    return result;
  }

  ReadAllBoutiquesResponse._();

  factory ReadAllBoutiquesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadAllBoutiquesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadAllBoutiquesResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..pc<$8.BoutiquePb>(
        1, _omitFieldNames ? '' : 'boutiques', $pb.PbFieldType.PM,
        subBuilder: $8.BoutiquePb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadAllBoutiquesResponse clone() =>
      ReadAllBoutiquesResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadAllBoutiquesResponse copyWith(
          void Function(ReadAllBoutiquesResponse) updates) =>
      super.copyWith((message) => updates(message as ReadAllBoutiquesResponse))
          as ReadAllBoutiquesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadAllBoutiquesResponse create() => ReadAllBoutiquesResponse._();
  @$core.override
  ReadAllBoutiquesResponse createEmptyInstance() => create();
  static $pb.PbList<ReadAllBoutiquesResponse> createRepeated() =>
      $pb.PbList<ReadAllBoutiquesResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadAllBoutiquesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadAllBoutiquesResponse>(create);
  static ReadAllBoutiquesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$8.BoutiquePb> get boutiques => $_getList(0);
}

class ReadDevicesRequest extends $pb.GeneratedMessage {
  factory ReadDevicesRequest({
    $core.String? chainId,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    return result;
  }

  ReadDevicesRequest._();

  factory ReadDevicesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadDevicesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadDevicesRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadDevicesRequest clone() => ReadDevicesRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadDevicesRequest copyWith(void Function(ReadDevicesRequest) updates) =>
      super.copyWith((message) => updates(message as ReadDevicesRequest))
          as ReadDevicesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadDevicesRequest create() => ReadDevicesRequest._();
  @$core.override
  ReadDevicesRequest createEmptyInstance() => create();
  static $pb.PbList<ReadDevicesRequest> createRepeated() =>
      $pb.PbList<ReadDevicesRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadDevicesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadDevicesRequest>(create);
  static ReadDevicesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);
}

class IsADeviceInChainResponse extends $pb.GeneratedMessage {
  factory IsADeviceInChainResponse({
    $core.bool? isADevice,
  }) {
    final result = create();
    if (isADevice != null) result.isADevice = isADevice;
    return result;
  }

  IsADeviceInChainResponse._();

  factory IsADeviceInChainResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IsADeviceInChainResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IsADeviceInChainResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isADevice', protoName: 'isADevice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IsADeviceInChainResponse clone() =>
      IsADeviceInChainResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IsADeviceInChainResponse copyWith(
          void Function(IsADeviceInChainResponse) updates) =>
      super.copyWith((message) => updates(message as IsADeviceInChainResponse))
          as IsADeviceInChainResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IsADeviceInChainResponse create() => IsADeviceInChainResponse._();
  @$core.override
  IsADeviceInChainResponse createEmptyInstance() => create();
  static $pb.PbList<IsADeviceInChainResponse> createRepeated() =>
      $pb.PbList<IsADeviceInChainResponse>();
  @$core.pragma('dart2js:noInline')
  static IsADeviceInChainResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IsADeviceInChainResponse>(create);
  static IsADeviceInChainResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isADevice => $_getBF(0);
  @$pb.TagNumber(1)
  set isADevice($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsADevice() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsADevice() => $_clearField(1);
}

class ReadDeviceBtqRequest extends $pb.GeneratedMessage {
  factory ReadDeviceBtqRequest({
    $core.String? chainId,
    $core.String? boutiqueId,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (boutiqueId != null) result.boutiqueId = boutiqueId;
    return result;
  }

  ReadDeviceBtqRequest._();

  factory ReadDeviceBtqRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadDeviceBtqRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadDeviceBtqRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadDeviceBtqRequest clone() =>
      ReadDeviceBtqRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadDeviceBtqRequest copyWith(void Function(ReadDeviceBtqRequest) updates) =>
      super.copyWith((message) => updates(message as ReadDeviceBtqRequest))
          as ReadDeviceBtqRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadDeviceBtqRequest create() => ReadDeviceBtqRequest._();
  @$core.override
  ReadDeviceBtqRequest createEmptyInstance() => create();
  static $pb.PbList<ReadDeviceBtqRequest> createRepeated() =>
      $pb.PbList<ReadDeviceBtqRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadDeviceBtqRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadDeviceBtqRequest>(create);
  static ReadDeviceBtqRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get boutiqueId => $_getSZ(1);
  @$pb.TagNumber(2)
  set boutiqueId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBoutiqueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiqueId() => $_clearField(2);
}

class DeleteDeviceRequest extends $pb.GeneratedMessage {
  factory DeleteDeviceRequest({
    $core.String? chainId,
    $6.Device? device,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (device != null) result.device = device;
    return result;
  }

  DeleteDeviceRequest._();

  factory DeleteDeviceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteDeviceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteDeviceRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$6.Device>(2, _omitFieldNames ? '' : 'device',
        subBuilder: $6.Device.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDeviceRequest clone() => DeleteDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDeviceRequest copyWith(void Function(DeleteDeviceRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteDeviceRequest))
          as DeleteDeviceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteDeviceRequest create() => DeleteDeviceRequest._();
  @$core.override
  DeleteDeviceRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteDeviceRequest> createRepeated() =>
      $pb.PbList<DeleteDeviceRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteDeviceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteDeviceRequest>(create);
  static DeleteDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $6.Device get device => $_getN(1);
  @$pb.TagNumber(2)
  set device($6.Device value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDevice() => $_has(1);
  @$pb.TagNumber(2)
  void clearDevice() => $_clearField(2);
  @$pb.TagNumber(2)
  $6.Device ensureDevice() => $_ensure(1);
}

class MailAndEncyptedPassword extends $pb.GeneratedMessage {
  factory MailAndEncyptedPassword({
    $core.String? mail,
    $core.String? passwordEncrypted,
  }) {
    final result = create();
    if (mail != null) result.mail = mail;
    if (passwordEncrypted != null) result.passwordEncrypted = passwordEncrypted;
    return result;
  }

  MailAndEncyptedPassword._();

  factory MailAndEncyptedPassword.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MailAndEncyptedPassword.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MailAndEncyptedPassword',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..aOS(2, _omitFieldNames ? '' : 'passwordEncrypted',
        protoName: 'passwordEncrypted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MailAndEncyptedPassword clone() =>
      MailAndEncyptedPassword()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MailAndEncyptedPassword copyWith(
          void Function(MailAndEncyptedPassword) updates) =>
      super.copyWith((message) => updates(message as MailAndEncyptedPassword))
          as MailAndEncyptedPassword;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MailAndEncyptedPassword create() => MailAndEncyptedPassword._();
  @$core.override
  MailAndEncyptedPassword createEmptyInstance() => create();
  static $pb.PbList<MailAndEncyptedPassword> createRepeated() =>
      $pb.PbList<MailAndEncyptedPassword>();
  @$core.pragma('dart2js:noInline')
  static MailAndEncyptedPassword getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MailAndEncyptedPassword>(create);
  static MailAndEncyptedPassword? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mail => $_getSZ(0);
  @$pb.TagNumber(1)
  set mail($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMail() => $_has(0);
  @$pb.TagNumber(1)
  void clearMail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get passwordEncrypted => $_getSZ(1);
  @$pb.TagNumber(2)
  set passwordEncrypted($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPasswordEncrypted() => $_has(1);
  @$pb.TagNumber(2)
  void clearPasswordEncrypted() => $_clearField(2);
}

class UserId extends $pb.GeneratedMessage {
  factory UserId({
    $core.String? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  UserId._();

  factory UserId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserId clone() => UserId()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserId copyWith(void Function(UserId) updates) =>
      super.copyWith((message) => updates(message as UserId)) as UserId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserId create() => UserId._();
  @$core.override
  UserId createEmptyInstance() => create();
  static $pb.PbList<UserId> createRepeated() => $pb.PbList<UserId>();
  @$core.pragma('dart2js:noInline')
  static UserId getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserId>(create);
  static UserId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class Access extends $pb.GeneratedMessage {
  factory Access({
    $9.ChainIds? chainIds,
    $9.BoutiqueIds? boutiqueIds,
  }) {
    final result = create();
    if (chainIds != null) result.chainIds = chainIds;
    if (boutiqueIds != null) result.boutiqueIds = boutiqueIds;
    return result;
  }

  Access._();

  factory Access.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Access.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Access',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOM<$9.ChainIds>(1, _omitFieldNames ? '' : 'chainIds',
        protoName: 'chainIds', subBuilder: $9.ChainIds.create)
    ..aOM<$9.BoutiqueIds>(2, _omitFieldNames ? '' : 'boutiqueIds',
        protoName: 'boutiqueIds', subBuilder: $9.BoutiqueIds.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Access clone() => Access()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Access copyWith(void Function(Access) updates) =>
      super.copyWith((message) => updates(message as Access)) as Access;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Access create() => Access._();
  @$core.override
  Access createEmptyInstance() => create();
  static $pb.PbList<Access> createRepeated() => $pb.PbList<Access>();
  @$core.pragma('dart2js:noInline')
  static Access getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Access>(create);
  static Access? _defaultInstance;

  @$pb.TagNumber(1)
  $9.ChainIds get chainIds => $_getN(0);
  @$pb.TagNumber(1)
  set chainIds($9.ChainIds value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasChainIds() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainIds() => $_clearField(1);
  @$pb.TagNumber(1)
  $9.ChainIds ensureChainIds() => $_ensure(0);

  @$pb.TagNumber(2)
  $9.BoutiqueIds get boutiqueIds => $_getN(1);
  @$pb.TagNumber(2)
  set boutiqueIds($9.BoutiqueIds value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBoutiqueIds() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiqueIds() => $_clearField(2);
  @$pb.TagNumber(2)
  $9.BoutiqueIds ensureBoutiqueIds() => $_ensure(1);
}

class Credentials extends $pb.GeneratedMessage {
  factory Credentials({
    $core.String? mail,
    $core.String? password,
  }) {
    final result = create();
    if (mail != null) result.mail = mail;
    if (password != null) result.password = password;
    return result;
  }

  Credentials._();

  factory Credentials.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Credentials.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Credentials',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Credentials clone() => Credentials()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Credentials copyWith(void Function(Credentials) updates) =>
      super.copyWith((message) => updates(message as Credentials))
          as Credentials;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Credentials create() => Credentials._();
  @$core.override
  Credentials createEmptyInstance() => create();
  static $pb.PbList<Credentials> createRepeated() => $pb.PbList<Credentials>();
  @$core.pragma('dart2js:noInline')
  static Credentials getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Credentials>(create);
  static Credentials? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mail => $_getSZ(0);
  @$pb.TagNumber(1)
  set mail($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMail() => $_has(0);
  @$pb.TagNumber(1)
  void clearMail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);
}

class DeviceCredentials extends $pb.GeneratedMessage {
  factory DeviceCredentials({
    $core.String? firmId,
    $core.String? chainId,
    $core.String? boutiqueId,
    $core.String? deviceId,
    $core.String? password,
  }) {
    final result = create();
    if (firmId != null) result.firmId = firmId;
    if (chainId != null) result.chainId = chainId;
    if (boutiqueId != null) result.boutiqueId = boutiqueId;
    if (deviceId != null) result.deviceId = deviceId;
    if (password != null) result.password = password;
    return result;
  }

  DeviceCredentials._();

  factory DeviceCredentials.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceCredentials.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceCredentials',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(3, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(4, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(5, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceCredentials clone() => DeviceCredentials()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceCredentials copyWith(void Function(DeviceCredentials) updates) =>
      super.copyWith((message) => updates(message as DeviceCredentials))
          as DeviceCredentials;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceCredentials create() => DeviceCredentials._();
  @$core.override
  DeviceCredentials createEmptyInstance() => create();
  static $pb.PbList<DeviceCredentials> createRepeated() =>
      $pb.PbList<DeviceCredentials>();
  @$core.pragma('dart2js:noInline')
  static DeviceCredentials getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceCredentials>(create);
  static DeviceCredentials? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get boutiqueId => $_getSZ(2);
  @$pb.TagNumber(3)
  set boutiqueId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBoutiqueId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoutiqueId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDeviceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => $_clearField(5);
}

class RefreshToken extends $pb.GeneratedMessage {
  factory RefreshToken({
    $core.String? refreshToken,
  }) {
    final result = create();
    if (refreshToken != null) result.refreshToken = refreshToken;
    return result;
  }

  RefreshToken._();

  factory RefreshToken.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshToken.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshToken',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refreshToken', protoName: 'refreshToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshToken clone() => RefreshToken()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshToken copyWith(void Function(RefreshToken) updates) =>
      super.copyWith((message) => updates(message as RefreshToken))
          as RefreshToken;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshToken create() => RefreshToken._();
  @$core.override
  RefreshToken createEmptyInstance() => create();
  static $pb.PbList<RefreshToken> createRepeated() =>
      $pb.PbList<RefreshToken>();
  @$core.pragma('dart2js:noInline')
  static RefreshToken getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshToken>(create);
  static RefreshToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => $_clearField(1);
}

class Tokens extends $pb.GeneratedMessage {
  factory Tokens({
    $core.String? accessToken,
    $core.String? refreshToken,
    $core.bool? mustChangePassword,
  }) {
    final result = create();
    if (accessToken != null) result.accessToken = accessToken;
    if (refreshToken != null) result.refreshToken = refreshToken;
    if (mustChangePassword != null)
      result.mustChangePassword = mustChangePassword;
    return result;
  }

  Tokens._();

  factory Tokens.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Tokens.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Tokens',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken', protoName: 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken', protoName: 'refreshToken')
    ..aOB(3, _omitFieldNames ? '' : 'mustChangePassword',
        protoName: 'mustChangePassword')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Tokens clone() => Tokens()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Tokens copyWith(void Function(Tokens) updates) =>
      super.copyWith((message) => updates(message as Tokens)) as Tokens;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Tokens create() => Tokens._();
  @$core.override
  Tokens createEmptyInstance() => create();
  static $pb.PbList<Tokens> createRepeated() => $pb.PbList<Tokens>();
  @$core.pragma('dart2js:noInline')
  static Tokens getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tokens>(create);
  static Tokens? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get mustChangePassword => $_getBF(2);
  @$pb.TagNumber(3)
  set mustChangePassword($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMustChangePassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearMustChangePassword() => $_clearField(3);
}

class UpdateDevicePasswordRequest extends $pb.GeneratedMessage {
  factory UpdateDevicePasswordRequest({
    $core.String? chainId,
    $6.Device? device,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (device != null) result.device = device;
    return result;
  }

  UpdateDevicePasswordRequest._();

  factory UpdateDevicePasswordRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateDevicePasswordRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateDevicePasswordRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$6.Device>(2, _omitFieldNames ? '' : 'device',
        subBuilder: $6.Device.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateDevicePasswordRequest clone() =>
      UpdateDevicePasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateDevicePasswordRequest copyWith(
          void Function(UpdateDevicePasswordRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateDevicePasswordRequest))
          as UpdateDevicePasswordRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateDevicePasswordRequest create() =>
      UpdateDevicePasswordRequest._();
  @$core.override
  UpdateDevicePasswordRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateDevicePasswordRequest> createRepeated() =>
      $pb.PbList<UpdateDevicePasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateDevicePasswordRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateDevicePasswordRequest>(create);
  static UpdateDevicePasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $6.Device get device => $_getN(1);
  @$pb.TagNumber(2)
  set device($6.Device value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDevice() => $_has(1);
  @$pb.TagNumber(2)
  void clearDevice() => $_clearField(2);
  @$pb.TagNumber(2)
  $6.Device ensureDevice() => $_ensure(1);
}

class PasswordUpdateRequest extends $pb.GeneratedMessage {
  factory PasswordUpdateRequest({
    $core.String? userId,
    $core.String? firmId,
    $core.String? passwordCurrent,
    $core.String? passwordNew,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (firmId != null) result.firmId = firmId;
    if (passwordCurrent != null) result.passwordCurrent = passwordCurrent;
    if (passwordNew != null) result.passwordNew = passwordNew;
    return result;
  }

  PasswordUpdateRequest._();

  factory PasswordUpdateRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PasswordUpdateRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PasswordUpdateRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(3, _omitFieldNames ? '' : 'passwordCurrent',
        protoName: 'passwordCurrent')
    ..aOS(4, _omitFieldNames ? '' : 'passwordNew', protoName: 'passwordNew')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PasswordUpdateRequest clone() =>
      PasswordUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PasswordUpdateRequest copyWith(
          void Function(PasswordUpdateRequest) updates) =>
      super.copyWith((message) => updates(message as PasswordUpdateRequest))
          as PasswordUpdateRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PasswordUpdateRequest create() => PasswordUpdateRequest._();
  @$core.override
  PasswordUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<PasswordUpdateRequest> createRepeated() =>
      $pb.PbList<PasswordUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static PasswordUpdateRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PasswordUpdateRequest>(create);
  static PasswordUpdateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get firmId => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFirmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get passwordCurrent => $_getSZ(2);
  @$pb.TagNumber(3)
  set passwordCurrent($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPasswordCurrent() => $_has(2);
  @$pb.TagNumber(3)
  void clearPasswordCurrent() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get passwordNew => $_getSZ(3);
  @$pb.TagNumber(4)
  set passwordNew($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPasswordNew() => $_has(3);
  @$pb.TagNumber(4)
  void clearPasswordNew() => $_clearField(4);
}

class PendingDeviceRequest extends $pb.GeneratedMessage {
  factory PendingDeviceRequest({
    $6.HardwareInfo? hardwareInfo,
    $core.int? code,
  }) {
    final result = create();
    if (hardwareInfo != null) result.hardwareInfo = hardwareInfo;
    if (code != null) result.code = code;
    return result;
  }

  PendingDeviceRequest._();

  factory PendingDeviceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PendingDeviceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PendingDeviceRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOM<$6.HardwareInfo>(1, _omitFieldNames ? '' : 'hardwareInfo',
        protoName: 'hardwareInfo', subBuilder: $6.HardwareInfo.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PendingDeviceRequest clone() =>
      PendingDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PendingDeviceRequest copyWith(void Function(PendingDeviceRequest) updates) =>
      super.copyWith((message) => updates(message as PendingDeviceRequest))
          as PendingDeviceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PendingDeviceRequest create() => PendingDeviceRequest._();
  @$core.override
  PendingDeviceRequest createEmptyInstance() => create();
  static $pb.PbList<PendingDeviceRequest> createRepeated() =>
      $pb.PbList<PendingDeviceRequest>();
  @$core.pragma('dart2js:noInline')
  static PendingDeviceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PendingDeviceRequest>(create);
  static PendingDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $6.HardwareInfo get hardwareInfo => $_getN(0);
  @$pb.TagNumber(1)
  set hardwareInfo($6.HardwareInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasHardwareInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $6.HardwareInfo ensureHardwareInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get code => $_getIZ(1);
  @$pb.TagNumber(2)
  set code($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);
}

class CodeForPairingDevice extends $pb.GeneratedMessage {
  factory CodeForPairingDevice({
    $core.String? firmId,
    $core.String? chainId,
    $core.String? boutiqueId,
    $core.String? userId,
    $core.int? code,
    $10.Timestamp? timestampUTC,
  }) {
    final result = create();
    if (firmId != null) result.firmId = firmId;
    if (chainId != null) result.chainId = chainId;
    if (boutiqueId != null) result.boutiqueId = boutiqueId;
    if (userId != null) result.userId = userId;
    if (code != null) result.code = code;
    if (timestampUTC != null) result.timestampUTC = timestampUTC;
    return result;
  }

  CodeForPairingDevice._();

  factory CodeForPairingDevice.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CodeForPairingDevice.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CodeForPairingDevice',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(3, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(4, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..aOM<$10.Timestamp>(6, _omitFieldNames ? '' : 'timestampUTC',
        protoName: 'timestampUTC', subBuilder: $10.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CodeForPairingDevice clone() =>
      CodeForPairingDevice()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CodeForPairingDevice copyWith(void Function(CodeForPairingDevice) updates) =>
      super.copyWith((message) => updates(message as CodeForPairingDevice))
          as CodeForPairingDevice;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CodeForPairingDevice create() => CodeForPairingDevice._();
  @$core.override
  CodeForPairingDevice createEmptyInstance() => create();
  static $pb.PbList<CodeForPairingDevice> createRepeated() =>
      $pb.PbList<CodeForPairingDevice>();
  @$core.pragma('dart2js:noInline')
  static CodeForPairingDevice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CodeForPairingDevice>(create);
  static CodeForPairingDevice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get boutiqueId => $_getSZ(2);
  @$pb.TagNumber(3)
  set boutiqueId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBoutiqueId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoutiqueId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get userId => $_getSZ(3);
  @$pb.TagNumber(4)
  set userId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get code => $_getIZ(4);
  @$pb.TagNumber(5)
  set code($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearCode() => $_clearField(5);

  @$pb.TagNumber(6)
  $10.Timestamp get timestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set timestampUTC($10.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimestampUTC() => $_clearField(6);
  @$pb.TagNumber(6)
  $10.Timestamp ensureTimestampUTC() => $_ensure(5);
}

class ApproveDeviceRequest extends $pb.GeneratedMessage {
  factory ApproveDeviceRequest({
    $6.Device? device,
  }) {
    final result = create();
    if (device != null) result.device = device;
    return result;
  }

  ApproveDeviceRequest._();

  factory ApproveDeviceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApproveDeviceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApproveDeviceRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOM<$6.Device>(1, _omitFieldNames ? '' : 'device',
        subBuilder: $6.Device.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApproveDeviceRequest clone() =>
      ApproveDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApproveDeviceRequest copyWith(void Function(ApproveDeviceRequest) updates) =>
      super.copyWith((message) => updates(message as ApproveDeviceRequest))
          as ApproveDeviceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApproveDeviceRequest create() => ApproveDeviceRequest._();
  @$core.override
  ApproveDeviceRequest createEmptyInstance() => create();
  static $pb.PbList<ApproveDeviceRequest> createRepeated() =>
      $pb.PbList<ApproveDeviceRequest>();
  @$core.pragma('dart2js:noInline')
  static ApproveDeviceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApproveDeviceRequest>(create);
  static ApproveDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $6.Device get device => $_getN(0);
  @$pb.TagNumber(1)
  set device($6.Device value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDevice() => $_has(0);
  @$pb.TagNumber(1)
  void clearDevice() => $_clearField(1);
  @$pb.TagNumber(1)
  $6.Device ensureDevice() => $_ensure(0);
}

class PasswordResetRequest extends $pb.GeneratedMessage {
  factory PasswordResetRequest({
    $core.String? mail,
  }) {
    final result = create();
    if (mail != null) result.mail = mail;
    return result;
  }

  PasswordResetRequest._();

  factory PasswordResetRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PasswordResetRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PasswordResetRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PasswordResetRequest clone() =>
      PasswordResetRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PasswordResetRequest copyWith(void Function(PasswordResetRequest) updates) =>
      super.copyWith((message) => updates(message as PasswordResetRequest))
          as PasswordResetRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PasswordResetRequest create() => PasswordResetRequest._();
  @$core.override
  PasswordResetRequest createEmptyInstance() => create();
  static $pb.PbList<PasswordResetRequest> createRepeated() =>
      $pb.PbList<PasswordResetRequest>();
  @$core.pragma('dart2js:noInline')
  static PasswordResetRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PasswordResetRequest>(create);
  static PasswordResetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mail => $_getSZ(0);
  @$pb.TagNumber(1)
  set mail($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMail() => $_has(0);
  @$pb.TagNumber(1)
  void clearMail() => $_clearField(1);
}

class PasswordResetConfirmRequest extends $pb.GeneratedMessage {
  factory PasswordResetConfirmRequest({
    $core.String? mail,
    $core.String? resetToken,
    $core.String? newPassword,
  }) {
    final result = create();
    if (mail != null) result.mail = mail;
    if (resetToken != null) result.resetToken = resetToken;
    if (newPassword != null) result.newPassword = newPassword;
    return result;
  }

  PasswordResetConfirmRequest._();

  factory PasswordResetConfirmRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PasswordResetConfirmRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PasswordResetConfirmRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..aOS(2, _omitFieldNames ? '' : 'resetToken', protoName: 'resetToken')
    ..aOS(3, _omitFieldNames ? '' : 'newPassword', protoName: 'newPassword')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PasswordResetConfirmRequest clone() =>
      PasswordResetConfirmRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PasswordResetConfirmRequest copyWith(
          void Function(PasswordResetConfirmRequest) updates) =>
      super.copyWith(
              (message) => updates(message as PasswordResetConfirmRequest))
          as PasswordResetConfirmRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PasswordResetConfirmRequest create() =>
      PasswordResetConfirmRequest._();
  @$core.override
  PasswordResetConfirmRequest createEmptyInstance() => create();
  static $pb.PbList<PasswordResetConfirmRequest> createRepeated() =>
      $pb.PbList<PasswordResetConfirmRequest>();
  @$core.pragma('dart2js:noInline')
  static PasswordResetConfirmRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PasswordResetConfirmRequest>(create);
  static PasswordResetConfirmRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mail => $_getSZ(0);
  @$pb.TagNumber(1)
  set mail($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMail() => $_has(0);
  @$pb.TagNumber(1)
  void clearMail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get resetToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set resetToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasResetToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearResetToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get newPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set newPassword($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNewPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewPassword() => $_clearField(3);
}

class MarkEmailVerifiedRequest extends $pb.GeneratedMessage {
  factory MarkEmailVerifiedRequest({
    $core.String? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  MarkEmailVerifiedRequest._();

  factory MarkEmailVerifiedRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarkEmailVerifiedRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarkEmailVerifiedRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkEmailVerifiedRequest clone() =>
      MarkEmailVerifiedRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkEmailVerifiedRequest copyWith(
          void Function(MarkEmailVerifiedRequest) updates) =>
      super.copyWith((message) => updates(message as MarkEmailVerifiedRequest))
          as MarkEmailVerifiedRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkEmailVerifiedRequest create() => MarkEmailVerifiedRequest._();
  @$core.override
  MarkEmailVerifiedRequest createEmptyInstance() => create();
  static $pb.PbList<MarkEmailVerifiedRequest> createRepeated() =>
      $pb.PbList<MarkEmailVerifiedRequest>();
  @$core.pragma('dart2js:noInline')
  static MarkEmailVerifiedRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarkEmailVerifiedRequest>(create);
  static MarkEmailVerifiedRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

/// / Health check response with service versions
class HealthCheckWeebiResponse extends $pb.GeneratedMessage {
  factory HealthCheckWeebiResponse({
    $core.String? status,
    $core.String? timestamp,
    ServiceVersions? versions,
    $core.bool? databaseHealthy,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (timestamp != null) result.timestamp = timestamp;
    if (versions != null) result.versions = versions;
    if (databaseHealthy != null) result.databaseHealthy = databaseHealthy;
    return result;
  }

  HealthCheckWeebiResponse._();

  factory HealthCheckWeebiResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HealthCheckWeebiResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HealthCheckWeebiResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'timestamp')
    ..aOM<ServiceVersions>(3, _omitFieldNames ? '' : 'versions',
        subBuilder: ServiceVersions.create)
    ..aOB(4, _omitFieldNames ? '' : 'databaseHealthy',
        protoName: 'databaseHealthy')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HealthCheckWeebiResponse clone() =>
      HealthCheckWeebiResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HealthCheckWeebiResponse copyWith(
          void Function(HealthCheckWeebiResponse) updates) =>
      super.copyWith((message) => updates(message as HealthCheckWeebiResponse))
          as HealthCheckWeebiResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HealthCheckWeebiResponse create() => HealthCheckWeebiResponse._();
  @$core.override
  HealthCheckWeebiResponse createEmptyInstance() => create();
  static $pb.PbList<HealthCheckWeebiResponse> createRepeated() =>
      $pb.PbList<HealthCheckWeebiResponse>();
  @$core.pragma('dart2js:noInline')
  static HealthCheckWeebiResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HealthCheckWeebiResponse>(create);
  static HealthCheckWeebiResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get timestamp => $_getSZ(1);
  @$pb.TagNumber(2)
  set timestamp($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => $_clearField(2);

  @$pb.TagNumber(3)
  ServiceVersions get versions => $_getN(2);
  @$pb.TagNumber(3)
  set versions(ServiceVersions value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasVersions() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersions() => $_clearField(3);
  @$pb.TagNumber(3)
  ServiceVersions ensureVersions() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get databaseHealthy => $_getBF(3);
  @$pb.TagNumber(4)
  set databaseHealthy($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDatabaseHealthy() => $_has(3);
  @$pb.TagNumber(4)
  void clearDatabaseHealthy() => $_clearField(4);
}

class ServiceVersions extends $pb.GeneratedMessage {
  factory ServiceVersions({
    $core.String? server,
    $core.String? protosWeebi,
    $core.String? fenceService,
    $core.String? modelsWeebi,
  }) {
    final result = create();
    if (server != null) result.server = server;
    if (protosWeebi != null) result.protosWeebi = protosWeebi;
    if (fenceService != null) result.fenceService = fenceService;
    if (modelsWeebi != null) result.modelsWeebi = modelsWeebi;
    return result;
  }

  ServiceVersions._();

  factory ServiceVersions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ServiceVersions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ServiceVersions',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'server')
    ..aOS(2, _omitFieldNames ? '' : 'protos_weebi')
    ..aOS(3, _omitFieldNames ? '' : 'fence_service')
    ..aOS(4, _omitFieldNames ? '' : 'models_weebi')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ServiceVersions clone() => ServiceVersions()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ServiceVersions copyWith(void Function(ServiceVersions) updates) =>
      super.copyWith((message) => updates(message as ServiceVersions))
          as ServiceVersions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServiceVersions create() => ServiceVersions._();
  @$core.override
  ServiceVersions createEmptyInstance() => create();
  static $pb.PbList<ServiceVersions> createRepeated() =>
      $pb.PbList<ServiceVersions>();
  @$core.pragma('dart2js:noInline')
  static ServiceVersions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ServiceVersions>(create);
  static ServiceVersions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get server => $_getSZ(0);
  @$pb.TagNumber(1)
  set server($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServer() => $_has(0);
  @$pb.TagNumber(1)
  void clearServer() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get protosWeebi => $_getSZ(1);
  @$pb.TagNumber(2)
  set protosWeebi($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProtosWeebi() => $_has(1);
  @$pb.TagNumber(2)
  void clearProtosWeebi() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fenceService => $_getSZ(2);
  @$pb.TagNumber(3)
  set fenceService($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFenceService() => $_has(2);
  @$pb.TagNumber(3)
  void clearFenceService() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get modelsWeebi => $_getSZ(3);
  @$pb.TagNumber(4)
  set modelsWeebi($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasModelsWeebi() => $_has(3);
  @$pb.TagNumber(4)
  void clearModelsWeebi() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
