//
//  Generated code. Do not modify.
//  source: user_permissions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'user_permissions.pbenum.dart';

export 'user_permissions.pbenum.dart';

///   message AccessChainsAndBoutiques {
/// message AccessLimited {
/// ChainIds chainIds = 1 [json_name = 'boutiqueIds'];
/// BoutiqueIds boutiqueIds = 2 [json_name = 'boutiqueIds'];
/// }
/// message AccessFull {
/// bool hasFullAccess = 1 [json_name = 'hasFullAccess'];
/// }
/// oneof access {
/// AccessLimited limitedAccess = 1 [json_name = 'limitedAccess'];
/// AccessFull fullAccess = 2 [json_name = 'fullAccess'];
/// }
/// }
class ChainIds extends $pb.GeneratedMessage {
  factory ChainIds({
    $core.Iterable<$core.String>? ids,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  ChainIds._() : super();
  factory ChainIds.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainIds.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChainIds', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChainIds clone() => ChainIds()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChainIds copyWith(void Function(ChainIds) updates) => super.copyWith((message) => updates(message as ChainIds)) as ChainIds;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainIds create() => ChainIds._();
  ChainIds createEmptyInstance() => create();
  static $pb.PbList<ChainIds> createRepeated() => $pb.PbList<ChainIds>();
  @$core.pragma('dart2js:noInline')
  static ChainIds getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainIds>(create);
  static ChainIds? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);
}

class BoutiqueIds extends $pb.GeneratedMessage {
  factory BoutiqueIds({
    $core.Iterable<$core.String>? ids,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  BoutiqueIds._() : super();
  factory BoutiqueIds.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoutiqueIds.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoutiqueIds', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoutiqueIds clone() => BoutiqueIds()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoutiqueIds copyWith(void Function(BoutiqueIds) updates) => super.copyWith((message) => updates(message as BoutiqueIds)) as BoutiqueIds;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiqueIds create() => BoutiqueIds._();
  BoutiqueIds createEmptyInstance() => create();
  static $pb.PbList<BoutiqueIds> createRepeated() => $pb.PbList<BoutiqueIds>();
  @$core.pragma('dart2js:noInline')
  static BoutiqueIds getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoutiqueIds>(create);
  static BoutiqueIds? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);
}

class AccessLimited extends $pb.GeneratedMessage {
  factory AccessLimited({
    ChainIds? chainIds,
    BoutiqueIds? boutiqueIds,
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
  AccessLimited._() : super();
  factory AccessLimited.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccessLimited.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccessLimited', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..aOM<ChainIds>(1, _omitFieldNames ? '' : 'chainIds', protoName: 'chainIds', subBuilder: ChainIds.create)
    ..aOM<BoutiqueIds>(2, _omitFieldNames ? '' : 'boutiqueIds', protoName: 'boutiqueIds', subBuilder: BoutiqueIds.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccessLimited clone() => AccessLimited()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccessLimited copyWith(void Function(AccessLimited) updates) => super.copyWith((message) => updates(message as AccessLimited)) as AccessLimited;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccessLimited create() => AccessLimited._();
  AccessLimited createEmptyInstance() => create();
  static $pb.PbList<AccessLimited> createRepeated() => $pb.PbList<AccessLimited>();
  @$core.pragma('dart2js:noInline')
  static AccessLimited getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccessLimited>(create);
  static AccessLimited? _defaultInstance;

  @$pb.TagNumber(1)
  ChainIds get chainIds => $_getN(0);
  @$pb.TagNumber(1)
  set chainIds(ChainIds v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainIds() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainIds() => clearField(1);
  @$pb.TagNumber(1)
  ChainIds ensureChainIds() => $_ensure(0);

  @$pb.TagNumber(2)
  BoutiqueIds get boutiqueIds => $_getN(1);
  @$pb.TagNumber(2)
  set boutiqueIds(BoutiqueIds v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoutiqueIds() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiqueIds() => clearField(2);
  @$pb.TagNumber(2)
  BoutiqueIds ensureBoutiqueIds() => $_ensure(1);
}

class AccessFull extends $pb.GeneratedMessage {
  factory AccessFull({
    $core.bool? hasFullAccess,
  }) {
    final $result = create();
    if (hasFullAccess != null) {
      $result.hasFullAccess = hasFullAccess;
    }
    return $result;
  }
  AccessFull._() : super();
  factory AccessFull.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccessFull.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccessFull', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasFullAccess', protoName: 'hasFullAccess')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccessFull clone() => AccessFull()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccessFull copyWith(void Function(AccessFull) updates) => super.copyWith((message) => updates(message as AccessFull)) as AccessFull;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccessFull create() => AccessFull._();
  AccessFull createEmptyInstance() => create();
  static $pb.PbList<AccessFull> createRepeated() => $pb.PbList<AccessFull>();
  @$core.pragma('dart2js:noInline')
  static AccessFull getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccessFull>(create);
  static AccessFull? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasFullAccess => $_getBF(0);
  @$pb.TagNumber(1)
  set hasFullAccess($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHasFullAccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasFullAccess() => clearField(1);
}

enum UserPermissions_Access {
  limitedAccess, 
  fullAccess, 
  notSet
}

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
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (limitedAccess != null) {
      $result.limitedAccess = limitedAccess;
    }
    if (fullAccess != null) {
      $result.fullAccess = fullAccess;
    }
    if (ticketRights != null) {
      $result.ticketRights = ticketRights;
    }
    if (contactRights != null) {
      $result.contactRights = contactRights;
    }
    if (articleRights != null) {
      $result.articleRights = articleRights;
    }
    if (boutiqueRights != null) {
      $result.boutiqueRights = boutiqueRights;
    }
    if (chainRights != null) {
      $result.chainRights = chainRights;
    }
    if (firmRights != null) {
      $result.firmRights = firmRights;
    }
    if (userManagementRights != null) {
      $result.userManagementRights = userManagementRights;
    }
    if (billingRights != null) {
      $result.billingRights = billingRights;
    }
    if (boolRights != null) {
      $result.boolRights = boolRights;
    }
    return $result;
  }
  UserPermissions._() : super();
  factory UserPermissions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserPermissions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UserPermissions_Access> _UserPermissions_AccessByTag = {
    3 : UserPermissions_Access.limitedAccess,
    4 : UserPermissions_Access.fullAccess,
    0 : UserPermissions_Access.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserPermissions', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOM<AccessLimited>(3, _omitFieldNames ? '' : 'limitedAccess', protoName: 'limitedAccess', subBuilder: AccessLimited.create)
    ..aOM<AccessFull>(4, _omitFieldNames ? '' : 'fullAccess', protoName: 'fullAccess', subBuilder: AccessFull.create)
    ..aOM<TicketRights>(6, _omitFieldNames ? '' : 'ticketRights', protoName: 'ticketRights', subBuilder: TicketRights.create)
    ..aOM<ContactRights>(7, _omitFieldNames ? '' : 'contactRights', protoName: 'contactRights', subBuilder: ContactRights.create)
    ..aOM<ArticleRights>(8, _omitFieldNames ? '' : 'articleRights', protoName: 'articleRights', subBuilder: ArticleRights.create)
    ..aOM<BoutiqueRights>(9, _omitFieldNames ? '' : 'boutiqueRights', protoName: 'boutiqueRights', subBuilder: BoutiqueRights.create)
    ..aOM<ChainRights>(10, _omitFieldNames ? '' : 'chainRights', protoName: 'chainRights', subBuilder: ChainRights.create)
    ..aOM<FirmRights>(11, _omitFieldNames ? '' : 'firmRights', protoName: 'firmRights', subBuilder: FirmRights.create)
    ..aOM<UserManagementRights>(12, _omitFieldNames ? '' : 'userManagementRights', protoName: 'userManagementRights', subBuilder: UserManagementRights.create)
    ..aOM<BillingRights>(13, _omitFieldNames ? '' : 'billingRights', protoName: 'billingRights', subBuilder: BillingRights.create)
    ..aOM<BoolRights>(14, _omitFieldNames ? '' : 'boolRights', protoName: 'boolRights', subBuilder: BoolRights.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserPermissions clone() => UserPermissions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserPermissions copyWith(void Function(UserPermissions) updates) => super.copyWith((message) => updates(message as UserPermissions)) as UserPermissions;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserPermissions create() => UserPermissions._();
  UserPermissions createEmptyInstance() => create();
  static $pb.PbList<UserPermissions> createRepeated() => $pb.PbList<UserPermissions>();
  @$core.pragma('dart2js:noInline')
  static UserPermissions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserPermissions>(create);
  static UserPermissions? _defaultInstance;

  UserPermissions_Access whichAccess() => _UserPermissions_AccessByTag[$_whichOneof(0)]!;
  void clearAccess() => clearField($_whichOneof(0));

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
  AccessLimited get limitedAccess => $_getN(2);
  @$pb.TagNumber(3)
  set limitedAccess(AccessLimited v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLimitedAccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimitedAccess() => clearField(3);
  @$pb.TagNumber(3)
  AccessLimited ensureLimitedAccess() => $_ensure(2);

  @$pb.TagNumber(4)
  AccessFull get fullAccess => $_getN(3);
  @$pb.TagNumber(4)
  set fullAccess(AccessFull v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFullAccess() => $_has(3);
  @$pb.TagNumber(4)
  void clearFullAccess() => clearField(4);
  @$pb.TagNumber(4)
  AccessFull ensureFullAccess() => $_ensure(3);

  @$pb.TagNumber(6)
  TicketRights get ticketRights => $_getN(4);
  @$pb.TagNumber(6)
  set ticketRights(TicketRights v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTicketRights() => $_has(4);
  @$pb.TagNumber(6)
  void clearTicketRights() => clearField(6);
  @$pb.TagNumber(6)
  TicketRights ensureTicketRights() => $_ensure(4);

  @$pb.TagNumber(7)
  ContactRights get contactRights => $_getN(5);
  @$pb.TagNumber(7)
  set contactRights(ContactRights v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasContactRights() => $_has(5);
  @$pb.TagNumber(7)
  void clearContactRights() => clearField(7);
  @$pb.TagNumber(7)
  ContactRights ensureContactRights() => $_ensure(5);

  @$pb.TagNumber(8)
  ArticleRights get articleRights => $_getN(6);
  @$pb.TagNumber(8)
  set articleRights(ArticleRights v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasArticleRights() => $_has(6);
  @$pb.TagNumber(8)
  void clearArticleRights() => clearField(8);
  @$pb.TagNumber(8)
  ArticleRights ensureArticleRights() => $_ensure(6);

  @$pb.TagNumber(9)
  BoutiqueRights get boutiqueRights => $_getN(7);
  @$pb.TagNumber(9)
  set boutiqueRights(BoutiqueRights v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasBoutiqueRights() => $_has(7);
  @$pb.TagNumber(9)
  void clearBoutiqueRights() => clearField(9);
  @$pb.TagNumber(9)
  BoutiqueRights ensureBoutiqueRights() => $_ensure(7);

  /// TODO: think about a deviceRights or at least something about device boolRights
  /// TODO reanme below
  @$pb.TagNumber(10)
  ChainRights get chainRights => $_getN(8);
  @$pb.TagNumber(10)
  set chainRights(ChainRights v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasChainRights() => $_has(8);
  @$pb.TagNumber(10)
  void clearChainRights() => clearField(10);
  @$pb.TagNumber(10)
  ChainRights ensureChainRights() => $_ensure(8);

  @$pb.TagNumber(11)
  FirmRights get firmRights => $_getN(9);
  @$pb.TagNumber(11)
  set firmRights(FirmRights v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasFirmRights() => $_has(9);
  @$pb.TagNumber(11)
  void clearFirmRights() => clearField(11);
  @$pb.TagNumber(11)
  FirmRights ensureFirmRights() => $_ensure(9);

  @$pb.TagNumber(12)
  UserManagementRights get userManagementRights => $_getN(10);
  @$pb.TagNumber(12)
  set userManagementRights(UserManagementRights v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasUserManagementRights() => $_has(10);
  @$pb.TagNumber(12)
  void clearUserManagementRights() => clearField(12);
  @$pb.TagNumber(12)
  UserManagementRights ensureUserManagementRights() => $_ensure(10);

  @$pb.TagNumber(13)
  BillingRights get billingRights => $_getN(11);
  @$pb.TagNumber(13)
  set billingRights(BillingRights v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasBillingRights() => $_has(11);
  @$pb.TagNumber(13)
  void clearBillingRights() => clearField(13);
  @$pb.TagNumber(13)
  BillingRights ensureBillingRights() => $_ensure(11);

  @$pb.TagNumber(14)
  BoolRights get boolRights => $_getN(12);
  @$pb.TagNumber(14)
  set boolRights(BoolRights v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasBoolRights() => $_has(12);
  @$pb.TagNumber(14)
  void clearBoolRights() => clearField(14);
  @$pb.TagNumber(14)
  BoolRights ensureBoolRights() => $_ensure(12);
}

class ArticleRights extends $pb.GeneratedMessage {
  factory ArticleRights({
    $core.Iterable<Right>? rights,
  }) {
    final $result = create();
    if (rights != null) {
      $result.rights.addAll(rights);
    }
    return $result;
  }
  ArticleRights._() : super();
  factory ArticleRights.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticleRights.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ArticleRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'articleRights', $pb.PbFieldType.KE, protoName: 'rights', valueOf: Right.valueOf, enumValues: Right.values, defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArticleRights clone() => ArticleRights()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArticleRights copyWith(void Function(ArticleRights) updates) => super.copyWith((message) => updates(message as ArticleRights)) as ArticleRights;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticleRights create() => ArticleRights._();
  ArticleRights createEmptyInstance() => create();
  static $pb.PbList<ArticleRights> createRepeated() => $pb.PbList<ArticleRights>();
  @$core.pragma('dart2js:noInline')
  static ArticleRights getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticleRights>(create);
  static ArticleRights? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Right> get rights => $_getList(0);
}

class BoutiqueRights extends $pb.GeneratedMessage {
  factory BoutiqueRights({
    $core.Iterable<Right>? rights,
  }) {
    final $result = create();
    if (rights != null) {
      $result.rights.addAll(rights);
    }
    return $result;
  }
  BoutiqueRights._() : super();
  factory BoutiqueRights.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoutiqueRights.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoutiqueRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'boutiqueRights', $pb.PbFieldType.KE, protoName: 'rights', valueOf: Right.valueOf, enumValues: Right.values, defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoutiqueRights clone() => BoutiqueRights()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoutiqueRights copyWith(void Function(BoutiqueRights) updates) => super.copyWith((message) => updates(message as BoutiqueRights)) as BoutiqueRights;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiqueRights create() => BoutiqueRights._();
  BoutiqueRights createEmptyInstance() => create();
  static $pb.PbList<BoutiqueRights> createRepeated() => $pb.PbList<BoutiqueRights>();
  @$core.pragma('dart2js:noInline')
  static BoutiqueRights getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoutiqueRights>(create);
  static BoutiqueRights? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Right> get rights => $_getList(0);
}

class ChainRights extends $pb.GeneratedMessage {
  factory ChainRights({
    $core.Iterable<Right>? rights,
  }) {
    final $result = create();
    if (rights != null) {
      $result.rights.addAll(rights);
    }
    return $result;
  }
  ChainRights._() : super();
  factory ChainRights.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainRights.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChainRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'chainRights', $pb.PbFieldType.KE, protoName: 'rights', valueOf: Right.valueOf, enumValues: Right.values, defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChainRights clone() => ChainRights()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChainRights copyWith(void Function(ChainRights) updates) => super.copyWith((message) => updates(message as ChainRights)) as ChainRights;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainRights create() => ChainRights._();
  ChainRights createEmptyInstance() => create();
  static $pb.PbList<ChainRights> createRepeated() => $pb.PbList<ChainRights>();
  @$core.pragma('dart2js:noInline')
  static ChainRights getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainRights>(create);
  static ChainRights? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Right> get rights => $_getList(0);
}

class FirmRights extends $pb.GeneratedMessage {
  factory FirmRights({
    $core.Iterable<Right>? rights,
  }) {
    final $result = create();
    if (rights != null) {
      $result.rights.addAll(rights);
    }
    return $result;
  }
  FirmRights._() : super();
  factory FirmRights.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FirmRights.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FirmRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'firmRights', $pb.PbFieldType.KE, protoName: 'rights', valueOf: Right.valueOf, enumValues: Right.values, defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FirmRights clone() => FirmRights()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FirmRights copyWith(void Function(FirmRights) updates) => super.copyWith((message) => updates(message as FirmRights)) as FirmRights;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FirmRights create() => FirmRights._();
  FirmRights createEmptyInstance() => create();
  static $pb.PbList<FirmRights> createRepeated() => $pb.PbList<FirmRights>();
  @$core.pragma('dart2js:noInline')
  static FirmRights getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FirmRights>(create);
  static FirmRights? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Right> get rights => $_getList(0);
}

class ContactRights extends $pb.GeneratedMessage {
  factory ContactRights({
    $core.Iterable<Right>? rights,
  }) {
    final $result = create();
    if (rights != null) {
      $result.rights.addAll(rights);
    }
    return $result;
  }
  ContactRights._() : super();
  factory ContactRights.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactRights.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'contactRights', $pb.PbFieldType.KE, protoName: 'rights', valueOf: Right.valueOf, enumValues: Right.values, defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactRights clone() => ContactRights()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactRights copyWith(void Function(ContactRights) updates) => super.copyWith((message) => updates(message as ContactRights)) as ContactRights;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContactRights create() => ContactRights._();
  ContactRights createEmptyInstance() => create();
  static $pb.PbList<ContactRights> createRepeated() => $pb.PbList<ContactRights>();
  @$core.pragma('dart2js:noInline')
  static ContactRights getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactRights>(create);
  static ContactRights? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Right> get rights => $_getList(0);
}

/// / there is no such a thing as updating a ticket, one can simply disable or restore it
/// / but for simplicity we will use the same enum Right here, including update
class TicketRights extends $pb.GeneratedMessage {
  factory TicketRights({
    $core.Iterable<Right>? rights,
  }) {
    final $result = create();
    if (rights != null) {
      $result.rights.addAll(rights);
    }
    return $result;
  }
  TicketRights._() : super();
  factory TicketRights.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TicketRights.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TicketRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'ticketRights', $pb.PbFieldType.KE, protoName: 'rights', valueOf: Right.valueOf, enumValues: Right.values, defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TicketRights clone() => TicketRights()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TicketRights copyWith(void Function(TicketRights) updates) => super.copyWith((message) => updates(message as TicketRights)) as TicketRights;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketRights create() => TicketRights._();
  TicketRights createEmptyInstance() => create();
  static $pb.PbList<TicketRights> createRepeated() => $pb.PbList<TicketRights>();
  @$core.pragma('dart2js:noInline')
  static TicketRights getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TicketRights>(create);
  static TicketRights? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Right> get rights => $_getList(0);
}

class UserManagementRights extends $pb.GeneratedMessage {
  factory UserManagementRights({
    $core.Iterable<Right>? rights,
  }) {
    final $result = create();
    if (rights != null) {
      $result.rights.addAll(rights);
    }
    return $result;
  }
  UserManagementRights._() : super();
  factory UserManagementRights.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserManagementRights.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserManagementRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'userManagementRights', $pb.PbFieldType.KE, protoName: 'rights', valueOf: Right.valueOf, enumValues: Right.values, defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserManagementRights clone() => UserManagementRights()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserManagementRights copyWith(void Function(UserManagementRights) updates) => super.copyWith((message) => updates(message as UserManagementRights)) as UserManagementRights;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserManagementRights create() => UserManagementRights._();
  UserManagementRights createEmptyInstance() => create();
  static $pb.PbList<UserManagementRights> createRepeated() => $pb.PbList<UserManagementRights>();
  @$core.pragma('dart2js:noInline')
  static UserManagementRights getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserManagementRights>(create);
  static UserManagementRights? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Right> get rights => $_getList(0);
}

class BillingRights extends $pb.GeneratedMessage {
  factory BillingRights({
    $core.Iterable<Right>? rights,
  }) {
    final $result = create();
    if (rights != null) {
      $result.rights.addAll(rights);
    }
    return $result;
  }
  BillingRights._() : super();
  factory BillingRights.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BillingRights.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BillingRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'billingRights', $pb.PbFieldType.KE, protoName: 'rights', valueOf: Right.valueOf, enumValues: Right.values, defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BillingRights clone() => BillingRights()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BillingRights copyWith(void Function(BillingRights) updates) => super.copyWith((message) => updates(message as BillingRights)) as BillingRights;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BillingRights create() => BillingRights._();
  BillingRights createEmptyInstance() => create();
  static $pb.PbList<BillingRights> createRepeated() => $pb.PbList<BillingRights>();
  @$core.pragma('dart2js:noInline')
  static BillingRights getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BillingRights>(create);
  static BillingRights? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Right> get rights => $_getList(0);
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
    final $result = create();
    if (canSeeStats != null) {
      $result.canSeeStats = canSeeStats;
    }
    if (canExportData != null) {
      $result.canExportData = canExportData;
    }
    if (canGiveDiscount != null) {
      $result.canGiveDiscount = canGiveDiscount;
    }
    if (canSetPromo != null) {
      $result.canSetPromo = canSetPromo;
    }
    if (canStockMovement != null) {
      $result.canStockMovement = canStockMovement;
    }
    if (canStockInventory != null) {
      $result.canStockInventory = canStockInventory;
    }
    if (canSpendOutOfCatalog != null) {
      $result.canSpendOutOfCatalog = canSpendOutOfCatalog;
    }
    if (canPurchase != null) {
      $result.canPurchase = canPurchase;
    }
    if (canImportTickets != null) {
      $result.canImportTickets = canImportTickets;
    }
    if (canSellOutOfCatalog != null) {
      $result.canSellOutOfCatalog = canSellOutOfCatalog;
    }
    if (canUpdateContactBalanceOffline != null) {
      $result.canUpdateContactBalanceOffline = canUpdateContactBalanceOffline;
    }
    return $result;
  }
  BoolRights._() : super();
  factory BoolRights.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoolRights.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoolRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user.permissions'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'canSeeStats', protoName: 'canSeeStats')
    ..aOB(2, _omitFieldNames ? '' : 'canExportData', protoName: 'canExportData')
    ..aOB(3, _omitFieldNames ? '' : 'canGiveDiscount', protoName: 'canGiveDiscount')
    ..aOB(4, _omitFieldNames ? '' : 'canSetPromo', protoName: 'canSetPromo')
    ..aOB(5, _omitFieldNames ? '' : 'canStockMovement', protoName: 'canStockMovement')
    ..aOB(6, _omitFieldNames ? '' : 'canStockInventory', protoName: 'canStockInventory')
    ..aOB(7, _omitFieldNames ? '' : 'canSpendOutOfCatalog', protoName: 'canSpendOutOfCatalog')
    ..aOB(8, _omitFieldNames ? '' : 'canPurchase', protoName: 'canPurchase')
    ..aOB(9, _omitFieldNames ? '' : 'canImportTickets', protoName: 'canImportTickets')
    ..aOB(10, _omitFieldNames ? '' : 'canSellOutOfCatalog', protoName: 'canSellOutOfCatalog')
    ..aOB(11, _omitFieldNames ? '' : 'canUpdateContactBalanceOffline', protoName: 'canUpdateContactBalanceOffline')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoolRights clone() => BoolRights()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoolRights copyWith(void Function(BoolRights) updates) => super.copyWith((message) => updates(message as BoolRights)) as BoolRights;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoolRights create() => BoolRights._();
  BoolRights createEmptyInstance() => create();
  static $pb.PbList<BoolRights> createRepeated() => $pb.PbList<BoolRights>();
  @$core.pragma('dart2js:noInline')
  static BoolRights getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoolRights>(create);
  static BoolRights? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get canSeeStats => $_getBF(0);
  @$pb.TagNumber(1)
  set canSeeStats($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanSeeStats() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanSeeStats() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get canExportData => $_getBF(1);
  @$pb.TagNumber(2)
  set canExportData($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCanExportData() => $_has(1);
  @$pb.TagNumber(2)
  void clearCanExportData() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get canGiveDiscount => $_getBF(2);
  @$pb.TagNumber(3)
  set canGiveDiscount($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCanGiveDiscount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCanGiveDiscount() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get canSetPromo => $_getBF(3);
  @$pb.TagNumber(4)
  set canSetPromo($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCanSetPromo() => $_has(3);
  @$pb.TagNumber(4)
  void clearCanSetPromo() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get canStockMovement => $_getBF(4);
  @$pb.TagNumber(5)
  set canStockMovement($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCanStockMovement() => $_has(4);
  @$pb.TagNumber(5)
  void clearCanStockMovement() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get canStockInventory => $_getBF(5);
  @$pb.TagNumber(6)
  set canStockInventory($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCanStockInventory() => $_has(5);
  @$pb.TagNumber(6)
  void clearCanStockInventory() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get canSpendOutOfCatalog => $_getBF(6);
  @$pb.TagNumber(7)
  set canSpendOutOfCatalog($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCanSpendOutOfCatalog() => $_has(6);
  @$pb.TagNumber(7)
  void clearCanSpendOutOfCatalog() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get canPurchase => $_getBF(7);
  @$pb.TagNumber(8)
  set canPurchase($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCanPurchase() => $_has(7);
  @$pb.TagNumber(8)
  void clearCanPurchase() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get canImportTickets => $_getBF(8);
  @$pb.TagNumber(9)
  set canImportTickets($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCanImportTickets() => $_has(8);
  @$pb.TagNumber(9)
  void clearCanImportTickets() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get canSellOutOfCatalog => $_getBF(9);
  @$pb.TagNumber(10)
  set canSellOutOfCatalog($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCanSellOutOfCatalog() => $_has(9);
  @$pb.TagNumber(10)
  void clearCanSellOutOfCatalog() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get canUpdateContactBalanceOffline => $_getBF(10);
  @$pb.TagNumber(11)
  set canUpdateContactBalanceOffline($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCanUpdateContactBalanceOffline() => $_has(10);
  @$pb.TagNumber(11)
  void clearCanUpdateContactBalanceOffline() => clearField(11);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
