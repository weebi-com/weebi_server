// This is a generated file - do not edit.
//
// Generated from user_permissions.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'user_permissions.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'user_permissions.pbenum.dart';

class ChainIds extends $pb.GeneratedMessage {
  factory ChainIds({
    $core.Iterable<$core.String>? ids,
  }) {
    final result = create();
    if (ids != null) result.ids.addAll(ids);
    return result;
  }

  ChainIds._();

  factory ChainIds.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChainIds.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChainIds',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChainIds clone() => ChainIds()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChainIds copyWith(void Function(ChainIds) updates) =>
      super.copyWith((message) => updates(message as ChainIds)) as ChainIds;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainIds create() => ChainIds._();
  @$core.override
  ChainIds createEmptyInstance() => create();
  static $pb.PbList<ChainIds> createRepeated() => $pb.PbList<ChainIds>();
  @$core.pragma('dart2js:noInline')
  static ChainIds getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainIds>(create);
  static ChainIds? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get ids => $_getList(0);
}

class BoutiqueIds extends $pb.GeneratedMessage {
  factory BoutiqueIds({
    $core.Iterable<$core.String>? ids,
  }) {
    final result = create();
    if (ids != null) result.ids.addAll(ids);
    return result;
  }

  BoutiqueIds._();

  factory BoutiqueIds.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoutiqueIds.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoutiqueIds',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueIds clone() => BoutiqueIds()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueIds copyWith(void Function(BoutiqueIds) updates) =>
      super.copyWith((message) => updates(message as BoutiqueIds))
          as BoutiqueIds;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiqueIds create() => BoutiqueIds._();
  @$core.override
  BoutiqueIds createEmptyInstance() => create();
  static $pb.PbList<BoutiqueIds> createRepeated() => $pb.PbList<BoutiqueIds>();
  @$core.pragma('dart2js:noInline')
  static BoutiqueIds getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoutiqueIds>(create);
  static BoutiqueIds? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get ids => $_getList(0);
}

class AccessLimited extends $pb.GeneratedMessage {
  factory AccessLimited({
    ChainIds? chainIds,
    BoutiqueIds? boutiqueIds,
  }) {
    final result = create();
    if (chainIds != null) result.chainIds = chainIds;
    if (boutiqueIds != null) result.boutiqueIds = boutiqueIds;
    return result;
  }

  AccessLimited._();

  factory AccessLimited.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AccessLimited.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccessLimited',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..aOM<ChainIds>(1, _omitFieldNames ? '' : 'chainIds',
        protoName: 'chainIds', subBuilder: ChainIds.create)
    ..aOM<BoutiqueIds>(2, _omitFieldNames ? '' : 'boutiqueIds',
        protoName: 'boutiqueIds', subBuilder: BoutiqueIds.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccessLimited clone() => AccessLimited()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccessLimited copyWith(void Function(AccessLimited) updates) =>
      super.copyWith((message) => updates(message as AccessLimited))
          as AccessLimited;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccessLimited create() => AccessLimited._();
  @$core.override
  AccessLimited createEmptyInstance() => create();
  static $pb.PbList<AccessLimited> createRepeated() =>
      $pb.PbList<AccessLimited>();
  @$core.pragma('dart2js:noInline')
  static AccessLimited getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccessLimited>(create);
  static AccessLimited? _defaultInstance;

  @$pb.TagNumber(1)
  ChainIds get chainIds => $_getN(0);
  @$pb.TagNumber(1)
  set chainIds(ChainIds value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasChainIds() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainIds() => $_clearField(1);
  @$pb.TagNumber(1)
  ChainIds ensureChainIds() => $_ensure(0);

  @$pb.TagNumber(2)
  BoutiqueIds get boutiqueIds => $_getN(1);
  @$pb.TagNumber(2)
  set boutiqueIds(BoutiqueIds value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBoutiqueIds() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiqueIds() => $_clearField(2);
  @$pb.TagNumber(2)
  BoutiqueIds ensureBoutiqueIds() => $_ensure(1);
}

class AccessFull extends $pb.GeneratedMessage {
  factory AccessFull({
    $core.bool? hasFullAccess,
  }) {
    final result = create();
    if (hasFullAccess != null) result.hasFullAccess = hasFullAccess;
    return result;
  }

  AccessFull._();

  factory AccessFull.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AccessFull.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccessFull',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasFullAccess', protoName: 'hasFullAccess')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccessFull clone() => AccessFull()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccessFull copyWith(void Function(AccessFull) updates) =>
      super.copyWith((message) => updates(message as AccessFull)) as AccessFull;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccessFull create() => AccessFull._();
  @$core.override
  AccessFull createEmptyInstance() => create();
  static $pb.PbList<AccessFull> createRepeated() => $pb.PbList<AccessFull>();
  @$core.pragma('dart2js:noInline')
  static AccessFull getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccessFull>(create);
  static AccessFull? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasFullAccess => $_getBF(0);
  @$pb.TagNumber(1)
  set hasFullAccess($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHasFullAccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasFullAccess() => $_clearField(1);
}

enum UserPermissions_Access { limitedAccess, fullAccess, notSet }

class UserPermissions extends $pb.GeneratedMessage {
  factory UserPermissions({
    $core.String? userId,
    $core.String? firmId,
    AccessLimited? limitedAccess,
    AccessFull? fullAccess,
    TicketRights? ticketRights,
    ContactRights? contactRights,
    ArticleRights? articleRights,
    BoutiqueRights? boutiqueRights,
    ChainRights? chainRights,
    FirmRights? firmRights,
    UserManagementRights? userManagementRights,
    BillingRights? billingRights,
    BoolRights? boolRights,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (firmId != null) result.firmId = firmId;
    if (limitedAccess != null) result.limitedAccess = limitedAccess;
    if (fullAccess != null) result.fullAccess = fullAccess;
    if (ticketRights != null) result.ticketRights = ticketRights;
    if (contactRights != null) result.contactRights = contactRights;
    if (articleRights != null) result.articleRights = articleRights;
    if (boutiqueRights != null) result.boutiqueRights = boutiqueRights;
    if (chainRights != null) result.chainRights = chainRights;
    if (firmRights != null) result.firmRights = firmRights;
    if (userManagementRights != null)
      result.userManagementRights = userManagementRights;
    if (billingRights != null) result.billingRights = billingRights;
    if (boolRights != null) result.boolRights = boolRights;
    return result;
  }

  UserPermissions._();

  factory UserPermissions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserPermissions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, UserPermissions_Access>
      _UserPermissions_AccessByTag = {
    3: UserPermissions_Access.limitedAccess,
    4: UserPermissions_Access.fullAccess,
    0: UserPermissions_Access.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserPermissions',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOM<AccessLimited>(3, _omitFieldNames ? '' : 'limitedAccess',
        protoName: 'limitedAccess', subBuilder: AccessLimited.create)
    ..aOM<AccessFull>(4, _omitFieldNames ? '' : 'fullAccess',
        protoName: 'fullAccess', subBuilder: AccessFull.create)
    ..aOM<TicketRights>(6, _omitFieldNames ? '' : 'ticketRights',
        protoName: 'ticketRights', subBuilder: TicketRights.create)
    ..aOM<ContactRights>(7, _omitFieldNames ? '' : 'contactRights',
        protoName: 'contactRights', subBuilder: ContactRights.create)
    ..aOM<ArticleRights>(8, _omitFieldNames ? '' : 'articleRights',
        protoName: 'articleRights', subBuilder: ArticleRights.create)
    ..aOM<BoutiqueRights>(9, _omitFieldNames ? '' : 'boutiqueRights',
        protoName: 'boutiqueRights', subBuilder: BoutiqueRights.create)
    ..aOM<ChainRights>(10, _omitFieldNames ? '' : 'chainRights',
        protoName: 'chainRights', subBuilder: ChainRights.create)
    ..aOM<FirmRights>(11, _omitFieldNames ? '' : 'firmRights',
        protoName: 'firmRights', subBuilder: FirmRights.create)
    ..aOM<UserManagementRights>(
        12, _omitFieldNames ? '' : 'userManagementRights',
        protoName: 'userManagementRights',
        subBuilder: UserManagementRights.create)
    ..aOM<BillingRights>(13, _omitFieldNames ? '' : 'billingRights',
        protoName: 'billingRights', subBuilder: BillingRights.create)
    ..aOM<BoolRights>(14, _omitFieldNames ? '' : 'boolRights',
        protoName: 'boolRights', subBuilder: BoolRights.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserPermissions clone() => UserPermissions()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserPermissions copyWith(void Function(UserPermissions) updates) =>
      super.copyWith((message) => updates(message as UserPermissions))
          as UserPermissions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserPermissions create() => UserPermissions._();
  @$core.override
  UserPermissions createEmptyInstance() => create();
  static $pb.PbList<UserPermissions> createRepeated() =>
      $pb.PbList<UserPermissions>();
  @$core.pragma('dart2js:noInline')
  static UserPermissions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserPermissions>(create);
  static UserPermissions? _defaultInstance;

  UserPermissions_Access whichAccess() =>
      _UserPermissions_AccessByTag[$_whichOneof(0)]!;
  void clearAccess() => $_clearField($_whichOneof(0));

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
  AccessLimited get limitedAccess => $_getN(2);
  @$pb.TagNumber(3)
  set limitedAccess(AccessLimited value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasLimitedAccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimitedAccess() => $_clearField(3);
  @$pb.TagNumber(3)
  AccessLimited ensureLimitedAccess() => $_ensure(2);

  @$pb.TagNumber(4)
  AccessFull get fullAccess => $_getN(3);
  @$pb.TagNumber(4)
  set fullAccess(AccessFull value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasFullAccess() => $_has(3);
  @$pb.TagNumber(4)
  void clearFullAccess() => $_clearField(4);
  @$pb.TagNumber(4)
  AccessFull ensureFullAccess() => $_ensure(3);

  @$pb.TagNumber(6)
  TicketRights get ticketRights => $_getN(4);
  @$pb.TagNumber(6)
  set ticketRights(TicketRights value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasTicketRights() => $_has(4);
  @$pb.TagNumber(6)
  void clearTicketRights() => $_clearField(6);
  @$pb.TagNumber(6)
  TicketRights ensureTicketRights() => $_ensure(4);

  @$pb.TagNumber(7)
  ContactRights get contactRights => $_getN(5);
  @$pb.TagNumber(7)
  set contactRights(ContactRights value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasContactRights() => $_has(5);
  @$pb.TagNumber(7)
  void clearContactRights() => $_clearField(7);
  @$pb.TagNumber(7)
  ContactRights ensureContactRights() => $_ensure(5);

  @$pb.TagNumber(8)
  ArticleRights get articleRights => $_getN(6);
  @$pb.TagNumber(8)
  set articleRights(ArticleRights value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasArticleRights() => $_has(6);
  @$pb.TagNumber(8)
  void clearArticleRights() => $_clearField(8);
  @$pb.TagNumber(8)
  ArticleRights ensureArticleRights() => $_ensure(6);

  @$pb.TagNumber(9)
  BoutiqueRights get boutiqueRights => $_getN(7);
  @$pb.TagNumber(9)
  set boutiqueRights(BoutiqueRights value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasBoutiqueRights() => $_has(7);
  @$pb.TagNumber(9)
  void clearBoutiqueRights() => $_clearField(9);
  @$pb.TagNumber(9)
  BoutiqueRights ensureBoutiqueRights() => $_ensure(7);

  @$pb.TagNumber(10)
  ChainRights get chainRights => $_getN(8);
  @$pb.TagNumber(10)
  set chainRights(ChainRights value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasChainRights() => $_has(8);
  @$pb.TagNumber(10)
  void clearChainRights() => $_clearField(10);
  @$pb.TagNumber(10)
  ChainRights ensureChainRights() => $_ensure(8);

  @$pb.TagNumber(11)
  FirmRights get firmRights => $_getN(9);
  @$pb.TagNumber(11)
  set firmRights(FirmRights value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasFirmRights() => $_has(9);
  @$pb.TagNumber(11)
  void clearFirmRights() => $_clearField(11);
  @$pb.TagNumber(11)
  FirmRights ensureFirmRights() => $_ensure(9);

  @$pb.TagNumber(12)
  UserManagementRights get userManagementRights => $_getN(10);
  @$pb.TagNumber(12)
  set userManagementRights(UserManagementRights value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasUserManagementRights() => $_has(10);
  @$pb.TagNumber(12)
  void clearUserManagementRights() => $_clearField(12);
  @$pb.TagNumber(12)
  UserManagementRights ensureUserManagementRights() => $_ensure(10);

  @$pb.TagNumber(13)
  BillingRights get billingRights => $_getN(11);
  @$pb.TagNumber(13)
  set billingRights(BillingRights value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasBillingRights() => $_has(11);
  @$pb.TagNumber(13)
  void clearBillingRights() => $_clearField(13);
  @$pb.TagNumber(13)
  BillingRights ensureBillingRights() => $_ensure(11);

  @$pb.TagNumber(14)
  BoolRights get boolRights => $_getN(12);
  @$pb.TagNumber(14)
  set boolRights(BoolRights value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasBoolRights() => $_has(12);
  @$pb.TagNumber(14)
  void clearBoolRights() => $_clearField(14);
  @$pb.TagNumber(14)
  BoolRights ensureBoolRights() => $_ensure(12);
}

class ArticleRights extends $pb.GeneratedMessage {
  factory ArticleRights({
    $core.Iterable<Right>? rights,
  }) {
    final result = create();
    if (rights != null) result.rights.addAll(rights);
    return result;
  }

  ArticleRights._();

  factory ArticleRights.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArticleRights.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArticleRights',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'articleRights', $pb.PbFieldType.KE,
        protoName: 'rights',
        valueOf: Right.valueOf,
        enumValues: Right.values,
        defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleRights clone() => ArticleRights()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleRights copyWith(void Function(ArticleRights) updates) =>
      super.copyWith((message) => updates(message as ArticleRights))
          as ArticleRights;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticleRights create() => ArticleRights._();
  @$core.override
  ArticleRights createEmptyInstance() => create();
  static $pb.PbList<ArticleRights> createRepeated() =>
      $pb.PbList<ArticleRights>();
  @$core.pragma('dart2js:noInline')
  static ArticleRights getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArticleRights>(create);
  static ArticleRights? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Right> get rights => $_getList(0);
}

class BoutiqueRights extends $pb.GeneratedMessage {
  factory BoutiqueRights({
    $core.Iterable<Right>? rights,
  }) {
    final result = create();
    if (rights != null) result.rights.addAll(rights);
    return result;
  }

  BoutiqueRights._();

  factory BoutiqueRights.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoutiqueRights.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoutiqueRights',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'boutiqueRights', $pb.PbFieldType.KE,
        protoName: 'rights',
        valueOf: Right.valueOf,
        enumValues: Right.values,
        defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueRights clone() => BoutiqueRights()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueRights copyWith(void Function(BoutiqueRights) updates) =>
      super.copyWith((message) => updates(message as BoutiqueRights))
          as BoutiqueRights;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiqueRights create() => BoutiqueRights._();
  @$core.override
  BoutiqueRights createEmptyInstance() => create();
  static $pb.PbList<BoutiqueRights> createRepeated() =>
      $pb.PbList<BoutiqueRights>();
  @$core.pragma('dart2js:noInline')
  static BoutiqueRights getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoutiqueRights>(create);
  static BoutiqueRights? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Right> get rights => $_getList(0);
}

class ChainRights extends $pb.GeneratedMessage {
  factory ChainRights({
    $core.Iterable<Right>? rights,
  }) {
    final result = create();
    if (rights != null) result.rights.addAll(rights);
    return result;
  }

  ChainRights._();

  factory ChainRights.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChainRights.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChainRights',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'chainRights', $pb.PbFieldType.KE,
        protoName: 'rights',
        valueOf: Right.valueOf,
        enumValues: Right.values,
        defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChainRights clone() => ChainRights()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChainRights copyWith(void Function(ChainRights) updates) =>
      super.copyWith((message) => updates(message as ChainRights))
          as ChainRights;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainRights create() => ChainRights._();
  @$core.override
  ChainRights createEmptyInstance() => create();
  static $pb.PbList<ChainRights> createRepeated() => $pb.PbList<ChainRights>();
  @$core.pragma('dart2js:noInline')
  static ChainRights getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChainRights>(create);
  static ChainRights? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Right> get rights => $_getList(0);
}

class FirmRights extends $pb.GeneratedMessage {
  factory FirmRights({
    $core.Iterable<Right>? rights,
  }) {
    final result = create();
    if (rights != null) result.rights.addAll(rights);
    return result;
  }

  FirmRights._();

  factory FirmRights.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FirmRights.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FirmRights',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'firmRights', $pb.PbFieldType.KE,
        protoName: 'rights',
        valueOf: Right.valueOf,
        enumValues: Right.values,
        defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FirmRights clone() => FirmRights()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FirmRights copyWith(void Function(FirmRights) updates) =>
      super.copyWith((message) => updates(message as FirmRights)) as FirmRights;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FirmRights create() => FirmRights._();
  @$core.override
  FirmRights createEmptyInstance() => create();
  static $pb.PbList<FirmRights> createRepeated() => $pb.PbList<FirmRights>();
  @$core.pragma('dart2js:noInline')
  static FirmRights getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FirmRights>(create);
  static FirmRights? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Right> get rights => $_getList(0);
}

class ContactRights extends $pb.GeneratedMessage {
  factory ContactRights({
    $core.Iterable<Right>? rights,
  }) {
    final result = create();
    if (rights != null) result.rights.addAll(rights);
    return result;
  }

  ContactRights._();

  factory ContactRights.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ContactRights.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ContactRights',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'contactRights', $pb.PbFieldType.KE,
        protoName: 'rights',
        valueOf: Right.valueOf,
        enumValues: Right.values,
        defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ContactRights clone() => ContactRights()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ContactRights copyWith(void Function(ContactRights) updates) =>
      super.copyWith((message) => updates(message as ContactRights))
          as ContactRights;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContactRights create() => ContactRights._();
  @$core.override
  ContactRights createEmptyInstance() => create();
  static $pb.PbList<ContactRights> createRepeated() =>
      $pb.PbList<ContactRights>();
  @$core.pragma('dart2js:noInline')
  static ContactRights getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ContactRights>(create);
  static ContactRights? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Right> get rights => $_getList(0);
}

/// / there is no such a thing as updating a ticket, one can simply disable or restore it
/// / but for simplicity we will use the same enum Right here, including update
class TicketRights extends $pb.GeneratedMessage {
  factory TicketRights({
    $core.Iterable<Right>? rights,
  }) {
    final result = create();
    if (rights != null) result.rights.addAll(rights);
    return result;
  }

  TicketRights._();

  factory TicketRights.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TicketRights.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TicketRights',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'ticketRights', $pb.PbFieldType.KE,
        protoName: 'rights',
        valueOf: Right.valueOf,
        enumValues: Right.values,
        defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketRights clone() => TicketRights()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketRights copyWith(void Function(TicketRights) updates) =>
      super.copyWith((message) => updates(message as TicketRights))
          as TicketRights;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketRights create() => TicketRights._();
  @$core.override
  TicketRights createEmptyInstance() => create();
  static $pb.PbList<TicketRights> createRepeated() =>
      $pb.PbList<TicketRights>();
  @$core.pragma('dart2js:noInline')
  static TicketRights getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TicketRights>(create);
  static TicketRights? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Right> get rights => $_getList(0);
}

class UserManagementRights extends $pb.GeneratedMessage {
  factory UserManagementRights({
    $core.Iterable<Right>? rights,
    $core.bool? canUpdateUserPassword,
  }) {
    final result = create();
    if (rights != null) result.rights.addAll(rights);
    if (canUpdateUserPassword != null)
      result.canUpdateUserPassword = canUpdateUserPassword;
    return result;
  }

  UserManagementRights._();

  factory UserManagementRights.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserManagementRights.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserManagementRights',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..pc<Right>(
        1, _omitFieldNames ? '' : 'userManagementRights', $pb.PbFieldType.KE,
        protoName: 'rights',
        valueOf: Right.valueOf,
        enumValues: Right.values,
        defaultEnumValue: Right.unknown)
    ..aOB(2, _omitFieldNames ? '' : 'canUpdateUserPassword',
        protoName: 'canUpdateUserPassword')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserManagementRights clone() =>
      UserManagementRights()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserManagementRights copyWith(void Function(UserManagementRights) updates) =>
      super.copyWith((message) => updates(message as UserManagementRights))
          as UserManagementRights;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserManagementRights create() => UserManagementRights._();
  @$core.override
  UserManagementRights createEmptyInstance() => create();
  static $pb.PbList<UserManagementRights> createRepeated() =>
      $pb.PbList<UserManagementRights>();
  @$core.pragma('dart2js:noInline')
  static UserManagementRights getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserManagementRights>(create);
  static UserManagementRights? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Right> get rights => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get canUpdateUserPassword => $_getBF(1);
  @$pb.TagNumber(2)
  set canUpdateUserPassword($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCanUpdateUserPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearCanUpdateUserPassword() => $_clearField(2);
}

class BillingRights extends $pb.GeneratedMessage {
  factory BillingRights({
    $core.Iterable<Right>? rights,
  }) {
    final result = create();
    if (rights != null) result.rights.addAll(rights);
    return result;
  }

  BillingRights._();

  factory BillingRights.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BillingRights.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BillingRights',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'billingRights', $pb.PbFieldType.KE,
        protoName: 'rights',
        valueOf: Right.valueOf,
        enumValues: Right.values,
        defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BillingRights clone() => BillingRights()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BillingRights copyWith(void Function(BillingRights) updates) =>
      super.copyWith((message) => updates(message as BillingRights))
          as BillingRights;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BillingRights create() => BillingRights._();
  @$core.override
  BillingRights createEmptyInstance() => create();
  static $pb.PbList<BillingRights> createRepeated() =>
      $pb.PbList<BillingRights>();
  @$core.pragma('dart2js:noInline')
  static BillingRights getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BillingRights>(create);
  static BillingRights? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Right> get rights => $_getList(0);
}

class BoolRights extends $pb.GeneratedMessage {
  factory BoolRights({
    $core.bool? canSeeStats,
    $core.bool? canExportData,
    $core.bool? canGiveDiscount,
    $core.bool? canSetPromo,
    $core.bool? canStockMovement,
    $core.bool? canStockInventory,
    $core.bool? canSpendOutOfCatalog,
    $core.bool? canPurchase,
    $core.bool? canImportTickets,
    $core.bool? canSellOutOfCatalog,
    $core.bool? canUpdateContactBalanceOffline,
  }) {
    final result = create();
    if (canSeeStats != null) result.canSeeStats = canSeeStats;
    if (canExportData != null) result.canExportData = canExportData;
    if (canGiveDiscount != null) result.canGiveDiscount = canGiveDiscount;
    if (canSetPromo != null) result.canSetPromo = canSetPromo;
    if (canStockMovement != null) result.canStockMovement = canStockMovement;
    if (canStockInventory != null) result.canStockInventory = canStockInventory;
    if (canSpendOutOfCatalog != null)
      result.canSpendOutOfCatalog = canSpendOutOfCatalog;
    if (canPurchase != null) result.canPurchase = canPurchase;
    if (canImportTickets != null) result.canImportTickets = canImportTickets;
    if (canSellOutOfCatalog != null)
      result.canSellOutOfCatalog = canSellOutOfCatalog;
    if (canUpdateContactBalanceOffline != null)
      result.canUpdateContactBalanceOffline = canUpdateContactBalanceOffline;
    return result;
  }

  BoolRights._();

  factory BoolRights.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoolRights.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoolRights',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.user.permissions'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'canSeeStats', protoName: 'canSeeStats')
    ..aOB(2, _omitFieldNames ? '' : 'canExportData', protoName: 'canExportData')
    ..aOB(3, _omitFieldNames ? '' : 'canGiveDiscount',
        protoName: 'canGiveDiscount')
    ..aOB(4, _omitFieldNames ? '' : 'canSetPromo', protoName: 'canSetPromo')
    ..aOB(5, _omitFieldNames ? '' : 'canStockMovement',
        protoName: 'canStockMovement')
    ..aOB(6, _omitFieldNames ? '' : 'canStockInventory',
        protoName: 'canStockInventory')
    ..aOB(7, _omitFieldNames ? '' : 'canSpendOutOfCatalog',
        protoName: 'canSpendOutOfCatalog')
    ..aOB(8, _omitFieldNames ? '' : 'canPurchase', protoName: 'canPurchase')
    ..aOB(9, _omitFieldNames ? '' : 'canImportTickets',
        protoName: 'canImportTickets')
    ..aOB(10, _omitFieldNames ? '' : 'canSellOutOfCatalog',
        protoName: 'canSellOutOfCatalog')
    ..aOB(11, _omitFieldNames ? '' : 'canUpdateContactBalanceOffline',
        protoName: 'canUpdateContactBalanceOffline')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoolRights clone() => BoolRights()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoolRights copyWith(void Function(BoolRights) updates) =>
      super.copyWith((message) => updates(message as BoolRights)) as BoolRights;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoolRights create() => BoolRights._();
  @$core.override
  BoolRights createEmptyInstance() => create();
  static $pb.PbList<BoolRights> createRepeated() => $pb.PbList<BoolRights>();
  @$core.pragma('dart2js:noInline')
  static BoolRights getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoolRights>(create);
  static BoolRights? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get canSeeStats => $_getBF(0);
  @$pb.TagNumber(1)
  set canSeeStats($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCanSeeStats() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanSeeStats() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get canExportData => $_getBF(1);
  @$pb.TagNumber(2)
  set canExportData($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCanExportData() => $_has(1);
  @$pb.TagNumber(2)
  void clearCanExportData() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get canGiveDiscount => $_getBF(2);
  @$pb.TagNumber(3)
  set canGiveDiscount($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCanGiveDiscount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCanGiveDiscount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get canSetPromo => $_getBF(3);
  @$pb.TagNumber(4)
  set canSetPromo($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCanSetPromo() => $_has(3);
  @$pb.TagNumber(4)
  void clearCanSetPromo() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get canStockMovement => $_getBF(4);
  @$pb.TagNumber(5)
  set canStockMovement($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCanStockMovement() => $_has(4);
  @$pb.TagNumber(5)
  void clearCanStockMovement() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get canStockInventory => $_getBF(5);
  @$pb.TagNumber(6)
  set canStockInventory($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCanStockInventory() => $_has(5);
  @$pb.TagNumber(6)
  void clearCanStockInventory() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get canSpendOutOfCatalog => $_getBF(6);
  @$pb.TagNumber(7)
  set canSpendOutOfCatalog($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCanSpendOutOfCatalog() => $_has(6);
  @$pb.TagNumber(7)
  void clearCanSpendOutOfCatalog() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get canPurchase => $_getBF(7);
  @$pb.TagNumber(8)
  set canPurchase($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCanPurchase() => $_has(7);
  @$pb.TagNumber(8)
  void clearCanPurchase() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get canImportTickets => $_getBF(8);
  @$pb.TagNumber(9)
  set canImportTickets($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCanImportTickets() => $_has(8);
  @$pb.TagNumber(9)
  void clearCanImportTickets() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get canSellOutOfCatalog => $_getBF(9);
  @$pb.TagNumber(10)
  set canSellOutOfCatalog($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCanSellOutOfCatalog() => $_has(9);
  @$pb.TagNumber(10)
  void clearCanSellOutOfCatalog() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get canUpdateContactBalanceOffline => $_getBF(10);
  @$pb.TagNumber(11)
  set canUpdateContactBalanceOffline($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCanUpdateContactBalanceOffline() => $_has(10);
  @$pb.TagNumber(11)
  void clearCanUpdateContactBalanceOffline() => $_clearField(11);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
