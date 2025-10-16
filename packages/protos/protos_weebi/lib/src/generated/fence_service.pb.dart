//
//  Generated code. Do not modify.
//  source: fence_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'boutique.pb.dart' as $20;
import 'btq_chain.pb.dart' as $11;
import 'common/g_common.pb.dart' as $1;
import 'common/g_timestamp.pb.dart' as $17;
import 'device.pb.dart' as $12;
import 'user.pb.dart' as $8;
import 'user_permissions.pb.dart' as $22;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// /
class ChainRequest extends $pb.GeneratedMessage {
  factory ChainRequest({
    $core.String? chainId,
    $core.String? name,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  ChainRequest._() : super();
  factory ChainRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChainRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChainRequest clone() => ChainRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChainRequest copyWith(void Function(ChainRequest) updates) => super.copyWith((message) => updates(message as ChainRequest)) as ChainRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainRequest create() => ChainRequest._();
  ChainRequest createEmptyInstance() => create();
  static $pb.PbList<ChainRequest> createRepeated() => $pb.PbList<ChainRequest>();
  @$core.pragma('dart2js:noInline')
  static ChainRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainRequest>(create);
  static ChainRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
}

/// / one boutique creation the server will assign the boutiqueId
class BoutiqueRequest extends $pb.GeneratedMessage {
  factory BoutiqueRequest({
    $core.String? chainId,
    $20.BoutiquePb? boutique,
    $core.List<$core.int>? logo,
    $core.String? logoExtension,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (boutique != null) {
      $result.boutique = boutique;
    }
    if (logo != null) {
      $result.logo = logo;
    }
    if (logoExtension != null) {
      $result.logoExtension = logoExtension;
    }
    return $result;
  }
  BoutiqueRequest._() : super();
  factory BoutiqueRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoutiqueRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoutiqueRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$20.BoutiquePb>(2, _omitFieldNames ? '' : 'boutique', subBuilder: $20.BoutiquePb.create)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'logo', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'logoExtension', protoName: 'logoExtension')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueRequest clone() => BoutiqueRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueRequest copyWith(void Function(BoutiqueRequest) updates) => super.copyWith((message) => updates(message as BoutiqueRequest)) as BoutiqueRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiqueRequest create() => BoutiqueRequest._();
  BoutiqueRequest createEmptyInstance() => create();
  static $pb.PbList<BoutiqueRequest> createRepeated() => $pb.PbList<BoutiqueRequest>();
  @$core.pragma('dart2js:noInline')
  static BoutiqueRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoutiqueRequest>(create);
  static BoutiqueRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $20.BoutiquePb get boutique => $_getN(1);
  @$pb.TagNumber(2)
  set boutique($20.BoutiquePb v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoutique() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutique() => $_clearField(2);
  @$pb.TagNumber(2)
  $20.BoutiquePb ensureBoutique() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get logo => $_getN(2);
  @$pb.TagNumber(3)
  set logo($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLogo() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogo() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get logoExtension => $_getSZ(3);
  @$pb.TagNumber(4)
  set logoExtension($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLogoExtension() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogoExtension() => $_clearField(4);
}

/// / one boutique creation the server will assign the boutiqueId
class BoutiqueResponse extends $pb.GeneratedMessage {
  factory BoutiqueResponse({
    $20.BoutiquePb? boutique,
    $core.List<$core.int>? logo,
    $core.String? logoExtension,
  }) {
    final $result = create();
    if (boutique != null) {
      $result.boutique = boutique;
    }
    if (logo != null) {
      $result.logo = logo;
    }
    if (logoExtension != null) {
      $result.logoExtension = logoExtension;
    }
    return $result;
  }
  BoutiqueResponse._() : super();
  factory BoutiqueResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoutiqueResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoutiqueResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOM<$20.BoutiquePb>(1, _omitFieldNames ? '' : 'boutique', subBuilder: $20.BoutiquePb.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'logo', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'logoExtension', protoName: 'logoExtension')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueResponse clone() => BoutiqueResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueResponse copyWith(void Function(BoutiqueResponse) updates) => super.copyWith((message) => updates(message as BoutiqueResponse)) as BoutiqueResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiqueResponse create() => BoutiqueResponse._();
  BoutiqueResponse createEmptyInstance() => create();
  static $pb.PbList<BoutiqueResponse> createRepeated() => $pb.PbList<BoutiqueResponse>();
  @$core.pragma('dart2js:noInline')
  static BoutiqueResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoutiqueResponse>(create);
  static BoutiqueResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $20.BoutiquePb get boutique => $_getN(0);
  @$pb.TagNumber(1)
  set boutique($20.BoutiquePb v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoutique() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoutique() => $_clearField(1);
  @$pb.TagNumber(1)
  $20.BoutiquePb ensureBoutique() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get logo => $_getN(1);
  @$pb.TagNumber(2)
  set logo($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogo() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogo() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get logoExtension => $_getSZ(2);
  @$pb.TagNumber(3)
  set logoExtension($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLogoExtension() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogoExtension() => $_clearField(3);
}

/// / deviceId == userId, so front can reuse deviceId to try login in
/// / remove pending
class CreateDeviceResponse extends $pb.GeneratedMessage {
  factory CreateDeviceResponse({
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
  CreateDeviceResponse._() : super();
  factory CreateDeviceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDeviceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateDeviceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOM<$1.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse', protoName: 'statusResponse', subBuilder: $1.StatusResponse.create)
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(3, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(4, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(5, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDeviceResponse clone() => CreateDeviceResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDeviceResponse copyWith(void Function(CreateDeviceResponse) updates) => super.copyWith((message) => updates(message as CreateDeviceResponse)) as CreateDeviceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateDeviceResponse create() => CreateDeviceResponse._();
  CreateDeviceResponse createEmptyInstance() => create();
  static $pb.PbList<CreateDeviceResponse> createRepeated() => $pb.PbList<CreateDeviceResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateDeviceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDeviceResponse>(create);
  static CreateDeviceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StatusResponse get statusResponse => $_getN(0);
  @$pb.TagNumber(1)
  set statusResponse($1.StatusResponse v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get firmId => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get chainId => $_getSZ(2);
  @$pb.TagNumber(3)
  set chainId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChainId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get boutiqueId => $_getSZ(3);
  @$pb.TagNumber(4)
  set boutiqueId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoutiqueId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoutiqueId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceId => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceId() => $_clearField(5);
}

class ReadOneUserResponse extends $pb.GeneratedMessage {
  factory ReadOneUserResponse({
    $1.StatusResponse? statusResponse,
    $8.UserPublic? user,
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
    ..aOM<$8.UserPublic>(2, _omitFieldNames ? '' : 'user', subBuilder: $8.UserPublic.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadOneUserResponse clone() => ReadOneUserResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  set statusResponse($1.StatusResponse v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  $8.UserPublic get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($8.UserPublic v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => $_clearField(2);
  @$pb.TagNumber(2)
  $8.UserPublic ensureUser() => $_ensure(1);
}

class UsersPublic extends $pb.GeneratedMessage {
  factory UsersPublic({
    $core.Iterable<$8.UserPublic>? users,
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
    ..pc<$8.UserPublic>(1, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM, subBuilder: $8.UserPublic.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UsersPublic clone() => UsersPublic()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  $pb.PbList<$8.UserPublic> get users => $_getList(0);
}

class ReadAllChainsResponse extends $pb.GeneratedMessage {
  factory ReadAllChainsResponse({
    $core.Iterable<$11.Chain>? chains,
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
    ..pc<$11.Chain>(1, _omitFieldNames ? '' : 'chains', $pb.PbFieldType.PM, subBuilder: $11.Chain.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadAllChainsResponse clone() => ReadAllChainsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  $pb.PbList<$11.Chain> get chains => $_getList(0);
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

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadDevicesRequest clone() => ReadDevicesRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearChainId() => $_clearField(1);
}

class IsADeviceInChainResponse extends $pb.GeneratedMessage {
  factory IsADeviceInChainResponse({
    $core.bool? isADevice,
  }) {
    final $result = create();
    if (isADevice != null) {
      $result.isADevice = isADevice;
    }
    return $result;
  }
  IsADeviceInChainResponse._() : super();
  factory IsADeviceInChainResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsADeviceInChainResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IsADeviceInChainResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isADevice', protoName: 'isADevice')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IsADeviceInChainResponse clone() => IsADeviceInChainResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IsADeviceInChainResponse copyWith(void Function(IsADeviceInChainResponse) updates) => super.copyWith((message) => updates(message as IsADeviceInChainResponse)) as IsADeviceInChainResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IsADeviceInChainResponse create() => IsADeviceInChainResponse._();
  IsADeviceInChainResponse createEmptyInstance() => create();
  static $pb.PbList<IsADeviceInChainResponse> createRepeated() => $pb.PbList<IsADeviceInChainResponse>();
  @$core.pragma('dart2js:noInline')
  static IsADeviceInChainResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsADeviceInChainResponse>(create);
  static IsADeviceInChainResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isADevice => $_getBF(0);
  @$pb.TagNumber(1)
  set isADevice($core.bool v) { $_setBool(0, v); }
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

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadDeviceBtqRequest clone() => ReadDeviceBtqRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get boutiqueId => $_getSZ(1);
  @$pb.TagNumber(2)
  set boutiqueId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoutiqueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiqueId() => $_clearField(2);
}

class DeleteDeviceRequest extends $pb.GeneratedMessage {
  factory DeleteDeviceRequest({
    $core.String? chainId,
    $12.Device? device,
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
    ..aOM<$12.Device>(2, _omitFieldNames ? '' : 'device', subBuilder: $12.Device.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDeviceRequest clone() => DeleteDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $12.Device get device => $_getN(1);
  @$pb.TagNumber(2)
  set device($12.Device v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDevice() => $_has(1);
  @$pb.TagNumber(2)
  void clearDevice() => $_clearField(2);
  @$pb.TagNumber(2)
  $12.Device ensureDevice() => $_ensure(1);
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

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MailAndEncyptedPassword clone() => MailAndEncyptedPassword()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearMail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get passwordEncrypted => $_getSZ(1);
  @$pb.TagNumber(2)
  set passwordEncrypted($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPasswordEncrypted() => $_has(1);
  @$pb.TagNumber(2)
  void clearPasswordEncrypted() => $_clearField(2);
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

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserId clone() => UserId()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearUserId() => $_clearField(1);
}

class Access extends $pb.GeneratedMessage {
  factory Access({
    $22.ChainIds? chainIds,
    $22.BoutiqueIds? boutiqueIds,
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
    ..aOM<$22.ChainIds>(1, _omitFieldNames ? '' : 'chainIds', protoName: 'chainIds', subBuilder: $22.ChainIds.create)
    ..aOM<$22.BoutiqueIds>(2, _omitFieldNames ? '' : 'boutiqueIds', protoName: 'boutiqueIds', subBuilder: $22.BoutiqueIds.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Access clone() => Access()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  $22.ChainIds get chainIds => $_getN(0);
  @$pb.TagNumber(1)
  set chainIds($22.ChainIds v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainIds() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainIds() => $_clearField(1);
  @$pb.TagNumber(1)
  $22.ChainIds ensureChainIds() => $_ensure(0);

  @$pb.TagNumber(2)
  $22.BoutiqueIds get boutiqueIds => $_getN(1);
  @$pb.TagNumber(2)
  set boutiqueIds($22.BoutiqueIds v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoutiqueIds() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiqueIds() => $_clearField(2);
  @$pb.TagNumber(2)
  $22.BoutiqueIds ensureBoutiqueIds() => $_ensure(1);
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

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Credentials clone() => Credentials()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearMail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
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

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceCredentials clone() => DeviceCredentials()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearFirmId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get boutiqueId => $_getSZ(2);
  @$pb.TagNumber(3)
  set boutiqueId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoutiqueId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoutiqueId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => $_clearField(5);
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

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshToken clone() => RefreshToken()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearRefreshToken() => $_clearField(1);
}

class Tokens extends $pb.GeneratedMessage {
  factory Tokens({
    $core.String? accessToken,
    $core.String? refreshToken,
    $core.bool? mustChangePassword,
  }) {
    final $result = create();
    if (accessToken != null) {
      $result.accessToken = accessToken;
    }
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    if (mustChangePassword != null) {
      $result.mustChangePassword = mustChangePassword;
    }
    return $result;
  }
  Tokens._() : super();
  factory Tokens.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tokens.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Tokens', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken', protoName: 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken', protoName: 'refreshToken')
    ..aOB(3, _omitFieldNames ? '' : 'mustChangePassword', protoName: 'mustChangePassword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Tokens clone() => Tokens()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearAccessToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get mustChangePassword => $_getBF(2);
  @$pb.TagNumber(3)
  set mustChangePassword($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMustChangePassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearMustChangePassword() => $_clearField(3);
}

class UpdateDevicePasswordRequest extends $pb.GeneratedMessage {
  factory UpdateDevicePasswordRequest({
    $core.String? chainId,
    $12.Device? device,
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
    ..aOM<$12.Device>(2, _omitFieldNames ? '' : 'device', subBuilder: $12.Device.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateDevicePasswordRequest clone() => UpdateDevicePasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $12.Device get device => $_getN(1);
  @$pb.TagNumber(2)
  set device($12.Device v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDevice() => $_has(1);
  @$pb.TagNumber(2)
  void clearDevice() => $_clearField(2);
  @$pb.TagNumber(2)
  $12.Device ensureDevice() => $_ensure(1);
}

class PasswordUpdateRequest extends $pb.GeneratedMessage {
  factory PasswordUpdateRequest({
    $core.String? userId,
    $core.String? firmId,
    $core.String? passwordCurrent,
    $core.String? passwordNew,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (passwordCurrent != null) {
      $result.passwordCurrent = passwordCurrent;
    }
    if (passwordNew != null) {
      $result.passwordNew = passwordNew;
    }
    return $result;
  }
  PasswordUpdateRequest._() : super();
  factory PasswordUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PasswordUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PasswordUpdateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(3, _omitFieldNames ? '' : 'passwordCurrent', protoName: 'passwordCurrent')
    ..aOS(4, _omitFieldNames ? '' : 'passwordNew', protoName: 'passwordNew')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PasswordUpdateRequest clone() => PasswordUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get firmId => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get passwordCurrent => $_getSZ(2);
  @$pb.TagNumber(3)
  set passwordCurrent($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPasswordCurrent() => $_has(2);
  @$pb.TagNumber(3)
  void clearPasswordCurrent() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get passwordNew => $_getSZ(3);
  @$pb.TagNumber(4)
  set passwordNew($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPasswordNew() => $_has(3);
  @$pb.TagNumber(4)
  void clearPasswordNew() => $_clearField(4);
}

class PendingDeviceRequest extends $pb.GeneratedMessage {
  factory PendingDeviceRequest({
    $12.HardwareInfo? hardwareInfo,
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
    ..aOM<$12.HardwareInfo>(1, _omitFieldNames ? '' : 'hardwareInfo', protoName: 'hardwareInfo', subBuilder: $12.HardwareInfo.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PendingDeviceRequest clone() => PendingDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  $12.HardwareInfo get hardwareInfo => $_getN(0);
  @$pb.TagNumber(1)
  set hardwareInfo($12.HardwareInfo v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $12.HardwareInfo ensureHardwareInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get code => $_getIZ(1);
  @$pb.TagNumber(2)
  set code($core.int v) { $_setSignedInt32(1, v); }
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
    $17.Timestamp? timestampUTC,
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
    ..aOM<$17.Timestamp>(6, _omitFieldNames ? '' : 'timestampUTC', protoName: 'timestampUTC', subBuilder: $17.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CodeForPairingDevice clone() => CodeForPairingDevice()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  void clearFirmId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get boutiqueId => $_getSZ(2);
  @$pb.TagNumber(3)
  set boutiqueId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoutiqueId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoutiqueId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get userId => $_getSZ(3);
  @$pb.TagNumber(4)
  set userId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get code => $_getIZ(4);
  @$pb.TagNumber(5)
  set code($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearCode() => $_clearField(5);

  @$pb.TagNumber(6)
  $17.Timestamp get timestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set timestampUTC($17.Timestamp v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimestampUTC() => $_clearField(6);
  @$pb.TagNumber(6)
  $17.Timestamp ensureTimestampUTC() => $_ensure(5);
}

class ApproveDeviceRequest extends $pb.GeneratedMessage {
  factory ApproveDeviceRequest({
    $12.Device? device,
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
    ..aOM<$12.Device>(1, _omitFieldNames ? '' : 'device', subBuilder: $12.Device.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApproveDeviceRequest clone() => ApproveDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
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
  $12.Device get device => $_getN(0);
  @$pb.TagNumber(1)
  set device($12.Device v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDevice() => $_has(0);
  @$pb.TagNumber(1)
  void clearDevice() => $_clearField(1);
  @$pb.TagNumber(1)
  $12.Device ensureDevice() => $_ensure(0);
}

class PasswordResetRequest extends $pb.GeneratedMessage {
  factory PasswordResetRequest({
    $core.String? mail,
  }) {
    final $result = create();
    if (mail != null) {
      $result.mail = mail;
    }
    return $result;
  }
  PasswordResetRequest._() : super();
  factory PasswordResetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PasswordResetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PasswordResetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PasswordResetRequest clone() => PasswordResetRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PasswordResetRequest copyWith(void Function(PasswordResetRequest) updates) => super.copyWith((message) => updates(message as PasswordResetRequest)) as PasswordResetRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PasswordResetRequest create() => PasswordResetRequest._();
  PasswordResetRequest createEmptyInstance() => create();
  static $pb.PbList<PasswordResetRequest> createRepeated() => $pb.PbList<PasswordResetRequest>();
  @$core.pragma('dart2js:noInline')
  static PasswordResetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PasswordResetRequest>(create);
  static PasswordResetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mail => $_getSZ(0);
  @$pb.TagNumber(1)
  set mail($core.String v) { $_setString(0, v); }
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
    final $result = create();
    if (mail != null) {
      $result.mail = mail;
    }
    if (resetToken != null) {
      $result.resetToken = resetToken;
    }
    if (newPassword != null) {
      $result.newPassword = newPassword;
    }
    return $result;
  }
  PasswordResetConfirmRequest._() : super();
  factory PasswordResetConfirmRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PasswordResetConfirmRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PasswordResetConfirmRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.fence.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mail')
    ..aOS(2, _omitFieldNames ? '' : 'resetToken', protoName: 'resetToken')
    ..aOS(3, _omitFieldNames ? '' : 'newPassword', protoName: 'newPassword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PasswordResetConfirmRequest clone() => PasswordResetConfirmRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PasswordResetConfirmRequest copyWith(void Function(PasswordResetConfirmRequest) updates) => super.copyWith((message) => updates(message as PasswordResetConfirmRequest)) as PasswordResetConfirmRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PasswordResetConfirmRequest create() => PasswordResetConfirmRequest._();
  PasswordResetConfirmRequest createEmptyInstance() => create();
  static $pb.PbList<PasswordResetConfirmRequest> createRepeated() => $pb.PbList<PasswordResetConfirmRequest>();
  @$core.pragma('dart2js:noInline')
  static PasswordResetConfirmRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PasswordResetConfirmRequest>(create);
  static PasswordResetConfirmRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mail => $_getSZ(0);
  @$pb.TagNumber(1)
  set mail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMail() => $_has(0);
  @$pb.TagNumber(1)
  void clearMail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get resetToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set resetToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResetToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearResetToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get newPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set newPassword($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNewPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewPassword() => $_clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
