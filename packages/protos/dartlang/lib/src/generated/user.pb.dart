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

import 'common/g_timestamp.pb.dart' as $17;
import 'user.pbenum.dart';

export 'user.pbenum.dart';

/// / if user is simple seller / cashier
/// / user.chainIds = ['mall1']
/// / user.boutiquesOids = ['boutique1A']
/// /   =>
/// /   userPermission.chainsAccessible = ['mall1'] chainId where the boutique belongs
/// /   userPermission.boutiquesAccessible = ['boutique1A']
/// / if user is admin
/// / user.chainIds = ['mall1', 'mall2']
/// / user.boutiquesOids = []
/// / =>
/// /   userPermission.chainsAccessible = ['mall1', 'mall2']
/// /   userPermission.boutiquesAccessible = ['boutique1A', 'boutique1B', 'boutique2A']
class UserPermissions extends $pb.GeneratedMessage {
  factory UserPermissions({
    $core.String? userId,
    $core.String? firmId,
    Ids? chainsAccessible,
    Ids? boutiquesAccessible,
    TicketRights? ticketRights,
    ContactRights? contactRights,
    ArticleRights? articleRights,
    BoutiqueRights? boutiqueRights,
    MallRights? chainRights,
    FirmRights? firmRights,
    UserManagementRights? userManagementRights,
    BoolRights? boolRights,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (chainsAccessible != null) {
      $result.chainsAccessible = chainsAccessible;
    }
    if (boutiquesAccessible != null) {
      $result.boutiquesAccessible = boutiquesAccessible;
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
    if (boolRights != null) {
      $result.boolRights = boolRights;
    }
    return $result;
  }
  UserPermissions._() : super();
  factory UserPermissions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserPermissions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserPermissions', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOM<Ids>(3, _omitFieldNames ? '' : 'chainsAccessible', protoName: 'chainsAccessible', subBuilder: Ids.create)
    ..aOM<Ids>(4, _omitFieldNames ? '' : 'boutiquesAccessible', protoName: 'boutiquesAccessible', subBuilder: Ids.create)
    ..aOM<TicketRights>(5, _omitFieldNames ? '' : 'ticketRights', protoName: 'ticketRights', subBuilder: TicketRights.create)
    ..aOM<ContactRights>(6, _omitFieldNames ? '' : 'contactRights', protoName: 'contactRights', subBuilder: ContactRights.create)
    ..aOM<ArticleRights>(7, _omitFieldNames ? '' : 'articleRights', protoName: 'articleRights', subBuilder: ArticleRights.create)
    ..aOM<BoutiqueRights>(8, _omitFieldNames ? '' : 'boutiqueRights', protoName: 'boutiqueRights', subBuilder: BoutiqueRights.create)
    ..aOM<MallRights>(9, _omitFieldNames ? '' : 'mallRights', protoName: 'chainRights', subBuilder: MallRights.create)
    ..aOM<FirmRights>(10, _omitFieldNames ? '' : 'firmRights', protoName: 'firmRights', subBuilder: FirmRights.create)
    ..aOM<UserManagementRights>(11, _omitFieldNames ? '' : 'userManagementRights', protoName: 'userManagementRights', subBuilder: UserManagementRights.create)
    ..aOM<BoolRights>(12, _omitFieldNames ? '' : 'boolRights', protoName: 'boolRights', subBuilder: BoolRights.create)
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
  Ids get chainsAccessible => $_getN(2);
  @$pb.TagNumber(3)
  set chainsAccessible(Ids v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChainsAccessible() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainsAccessible() => clearField(3);
  @$pb.TagNumber(3)
  Ids ensureChainsAccessible() => $_ensure(2);

  @$pb.TagNumber(4)
  Ids get boutiquesAccessible => $_getN(3);
  @$pb.TagNumber(4)
  set boutiquesAccessible(Ids v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoutiquesAccessible() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoutiquesAccessible() => clearField(4);
  @$pb.TagNumber(4)
  Ids ensureBoutiquesAccessible() => $_ensure(3);

  @$pb.TagNumber(5)
  TicketRights get ticketRights => $_getN(4);
  @$pb.TagNumber(5)
  set ticketRights(TicketRights v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTicketRights() => $_has(4);
  @$pb.TagNumber(5)
  void clearTicketRights() => clearField(5);
  @$pb.TagNumber(5)
  TicketRights ensureTicketRights() => $_ensure(4);

  @$pb.TagNumber(6)
  ContactRights get contactRights => $_getN(5);
  @$pb.TagNumber(6)
  set contactRights(ContactRights v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasContactRights() => $_has(5);
  @$pb.TagNumber(6)
  void clearContactRights() => clearField(6);
  @$pb.TagNumber(6)
  ContactRights ensureContactRights() => $_ensure(5);

  @$pb.TagNumber(7)
  ArticleRights get articleRights => $_getN(6);
  @$pb.TagNumber(7)
  set articleRights(ArticleRights v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasArticleRights() => $_has(6);
  @$pb.TagNumber(7)
  void clearArticleRights() => clearField(7);
  @$pb.TagNumber(7)
  ArticleRights ensureArticleRights() => $_ensure(6);

  @$pb.TagNumber(8)
  BoutiqueRights get boutiqueRights => $_getN(7);
  @$pb.TagNumber(8)
  set boutiqueRights(BoutiqueRights v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasBoutiqueRights() => $_has(7);
  @$pb.TagNumber(8)
  void clearBoutiqueRights() => clearField(8);
  @$pb.TagNumber(8)
  BoutiqueRights ensureBoutiqueRights() => $_ensure(7);

  @$pb.TagNumber(9)
  MallRights get chainRights => $_getN(8);
  @$pb.TagNumber(9)
  set chainRights(MallRights v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasChainRights() => $_has(8);
  @$pb.TagNumber(9)
  void clearChainRights() => clearField(9);
  @$pb.TagNumber(9)
  MallRights ensureChainRights() => $_ensure(8);

  @$pb.TagNumber(10)
  FirmRights get firmRights => $_getN(9);
  @$pb.TagNumber(10)
  set firmRights(FirmRights v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasFirmRights() => $_has(9);
  @$pb.TagNumber(10)
  void clearFirmRights() => clearField(10);
  @$pb.TagNumber(10)
  FirmRights ensureFirmRights() => $_ensure(9);

  @$pb.TagNumber(11)
  UserManagementRights get userManagementRights => $_getN(10);
  @$pb.TagNumber(11)
  set userManagementRights(UserManagementRights v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasUserManagementRights() => $_has(10);
  @$pb.TagNumber(11)
  void clearUserManagementRights() => clearField(11);
  @$pb.TagNumber(11)
  UserManagementRights ensureUserManagementRights() => $_ensure(10);

  @$pb.TagNumber(12)
  BoolRights get boolRights => $_getN(11);
  @$pb.TagNumber(12)
  set boolRights(BoolRights v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasBoolRights() => $_has(11);
  @$pb.TagNumber(12)
  void clearBoolRights() => clearField(12);
  @$pb.TagNumber(12)
  BoolRights ensureBoolRights() => $_ensure(11);
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ArticleRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoutiqueRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
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

class MallRights extends $pb.GeneratedMessage {
  factory MallRights({
    $core.Iterable<Right>? rights,
  }) {
    final $result = create();
    if (rights != null) {
      $result.rights.addAll(rights);
    }
    return $result;
  }
  MallRights._() : super();
  factory MallRights.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MallRights.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MallRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
    ..pc<Right>(1, _omitFieldNames ? '' : 'mallRights', $pb.PbFieldType.KE, protoName: 'rights', valueOf: Right.valueOf, enumValues: Right.values, defaultEnumValue: Right.unknown)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MallRights clone() => MallRights()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MallRights copyWith(void Function(MallRights) updates) => super.copyWith((message) => updates(message as MallRights)) as MallRights;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MallRights create() => MallRights._();
  MallRights createEmptyInstance() => create();
  static $pb.PbList<MallRights> createRepeated() => $pb.PbList<MallRights>();
  @$core.pragma('dart2js:noInline')
  static MallRights getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MallRights>(create);
  static MallRights? _defaultInstance;

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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FirmRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TicketRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserManagementRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
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

class BoolRights extends $pb.GeneratedMessage {
  factory BoolRights({
    $core.bool? canSeeStats,
    $core.bool? canExportData,
    $core.bool? canGiveDiscount,
    $core.bool? canSetPromo,
    $core.bool? canStockMovement,
    $core.bool? canStockInventory,
    $core.bool? canQuickSpend,
    $core.bool? canPurchase,
    $core.bool? canImportTickets,
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
    if (canQuickSpend != null) {
      $result.canQuickSpend = canQuickSpend;
    }
    if (canPurchase != null) {
      $result.canPurchase = canPurchase;
    }
    if (canImportTickets != null) {
      $result.canImportTickets = canImportTickets;
    }
    return $result;
  }
  BoolRights._() : super();
  factory BoolRights.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoolRights.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoolRights', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'canSeeStats', protoName: 'canSeeStats')
    ..aOB(2, _omitFieldNames ? '' : 'canExportData', protoName: 'canExportData')
    ..aOB(3, _omitFieldNames ? '' : 'canGiveDiscount', protoName: 'canGiveDiscount')
    ..aOB(4, _omitFieldNames ? '' : 'canSetPromo', protoName: 'canSetPromo')
    ..aOB(5, _omitFieldNames ? '' : 'canStockMovement', protoName: 'canStockMovement')
    ..aOB(6, _omitFieldNames ? '' : 'canStockInventory', protoName: 'canStockInventory')
    ..aOB(7, _omitFieldNames ? '' : 'canQuickSpend', protoName: 'canQuickSpend')
    ..aOB(8, _omitFieldNames ? '' : 'canPurchase', protoName: 'canPurchase')
    ..aOB(9, _omitFieldNames ? '' : 'canImportTickets', protoName: 'canImportTickets')
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
  $core.bool get canQuickSpend => $_getBF(6);
  @$pb.TagNumber(7)
  set canQuickSpend($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCanQuickSpend() => $_has(6);
  @$pb.TagNumber(7)
  void clearCanQuickSpend() => clearField(7);

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
}

class Ids extends $pb.GeneratedMessage {
  factory Ids({
    $core.Iterable<$core.String>? ids,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  Ids._() : super();
  factory Ids.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ids.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Ids', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ids clone() => Ids()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ids copyWith(void Function(Ids) updates) => super.copyWith((message) => updates(message as Ids)) as Ids;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Ids create() => Ids._();
  Ids createEmptyInstance() => create();
  static $pb.PbList<Ids> createRepeated() => $pb.PbList<Ids>();
  @$core.pragma('dart2js:noInline')
  static Ids getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ids>(create);
  static Ids? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);
}

/// / ! any addition to this model must be replicated in the user_service_base.dart updateOne()
class UserInfo extends $pb.GeneratedMessage {
  factory UserInfo({
    $core.String? userId,
    $core.String? mail,
    $core.String? firstname,
    $core.String? lastname,
    UserPermissions? permissions,
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
    if (permissions != null) {
      $result.permissions = permissions;
    }
    return $result;
  }
  UserInfo._() : super();
  factory UserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'mail')
    ..aOS(3, _omitFieldNames ? '' : 'firstname')
    ..aOS(4, _omitFieldNames ? '' : 'lastname')
    ..aOM<UserPermissions>(5, _omitFieldNames ? '' : 'permissions', subBuilder: UserPermissions.create)
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
  UserPermissions get permissions => $_getN(4);
  @$pb.TagNumber(5)
  set permissions(UserPermissions v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPermissions() => $_has(4);
  @$pb.TagNumber(5)
  void clearPermissions() => clearField(5);
  @$pb.TagNumber(5)
  UserPermissions ensurePermissions() => $_ensure(4);
}

/// / this is how users are stored in db
/// / this model should not be exposed / used by clients
class UserPrivate extends $pb.GeneratedMessage {
  factory UserPrivate({
    $core.String? userId,
    $core.String? mail,
    $core.String? passwordEncrypted,
    $core.String? firmId,
    Ids? chainIds,
    Ids? boutiqueIds,
    ArticleRights? articleRights,
    BoutiqueRights? boutiqueRights,
    FirmRights? firmRights,
    MallRights? chainRights,
    ContactRights? contactRights,
    TicketRights? ticketRights,
    UserManagementRights? userManagementRights,
    BoolRights? boolRights,
    $core.String? lastUpdatedByuserId,
    $17.Timestamp? lastUpdateTimestampUTC,
    $core.String? firstname,
    $core.String? lastname,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (mail != null) {
      $result.mail = mail;
    }
    if (passwordEncrypted != null) {
      $result.passwordEncrypted = passwordEncrypted;
    }
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (chainIds != null) {
      $result.chainIds = chainIds;
    }
    if (boutiqueIds != null) {
      $result.boutiqueIds = boutiqueIds;
    }
    if (articleRights != null) {
      $result.articleRights = articleRights;
    }
    if (boutiqueRights != null) {
      $result.boutiqueRights = boutiqueRights;
    }
    if (firmRights != null) {
      $result.firmRights = firmRights;
    }
    if (chainRights != null) {
      $result.chainRights = chainRights;
    }
    if (contactRights != null) {
      $result.contactRights = contactRights;
    }
    if (ticketRights != null) {
      $result.ticketRights = ticketRights;
    }
    if (userManagementRights != null) {
      $result.userManagementRights = userManagementRights;
    }
    if (boolRights != null) {
      $result.boolRights = boolRights;
    }
    if (lastUpdatedByuserId != null) {
      $result.lastUpdatedByuserId = lastUpdatedByuserId;
    }
    if (lastUpdateTimestampUTC != null) {
      $result.lastUpdateTimestampUTC = lastUpdateTimestampUTC;
    }
    if (firstname != null) {
      $result.firstname = firstname;
    }
    if (lastname != null) {
      $result.lastname = lastname;
    }
    return $result;
  }
  UserPrivate._() : super();
  factory UserPrivate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserPrivate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserPrivate', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'mail')
    ..aOS(3, _omitFieldNames ? '' : 'password', protoName: 'passwordEncrypted')
    ..aOS(4, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOM<Ids>(5, _omitFieldNames ? '' : 'chainIds', protoName: 'chainIds', subBuilder: Ids.create)
    ..aOM<Ids>(6, _omitFieldNames ? '' : 'boutiqueIds', protoName: 'boutiqueIds', subBuilder: Ids.create)
    ..aOM<ArticleRights>(7, _omitFieldNames ? '' : 'articleRights', protoName: 'articleRights', subBuilder: ArticleRights.create)
    ..aOM<BoutiqueRights>(8, _omitFieldNames ? '' : 'boutiqueRights', protoName: 'boutiqueRights', subBuilder: BoutiqueRights.create)
    ..aOM<FirmRights>(9, _omitFieldNames ? '' : 'firmRights', protoName: 'firmRights', subBuilder: FirmRights.create)
    ..aOM<MallRights>(10, _omitFieldNames ? '' : 'mallRights', protoName: 'chainRights', subBuilder: MallRights.create)
    ..aOM<ContactRights>(11, _omitFieldNames ? '' : 'contactRights', protoName: 'contactRights', subBuilder: ContactRights.create)
    ..aOM<TicketRights>(12, _omitFieldNames ? '' : 'ticketRights', protoName: 'ticketRights', subBuilder: TicketRights.create)
    ..aOM<UserManagementRights>(13, _omitFieldNames ? '' : 'userManagementRights', protoName: 'userManagementRights', subBuilder: UserManagementRights.create)
    ..aOM<BoolRights>(14, _omitFieldNames ? '' : 'boolRights', protoName: 'boolRights', subBuilder: BoolRights.create)
    ..aOS(15, _omitFieldNames ? '' : 'lastUpdatedByuserId', protoName: 'lastUpdatedByuserId')
    ..aOM<$17.Timestamp>(16, _omitFieldNames ? '' : 'lastUpdateTimestampUTC', protoName: 'lastUpdateTimestampUTC', subBuilder: $17.Timestamp.create)
    ..aOS(17, _omitFieldNames ? '' : 'firstname')
    ..aOS(18, _omitFieldNames ? '' : 'lastname')
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
  $core.String get passwordEncrypted => $_getSZ(2);
  @$pb.TagNumber(3)
  set passwordEncrypted($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPasswordEncrypted() => $_has(2);
  @$pb.TagNumber(3)
  void clearPasswordEncrypted() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get firmId => $_getSZ(3);
  @$pb.TagNumber(4)
  set firmId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirmId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirmId() => clearField(4);

  @$pb.TagNumber(5)
  Ids get chainIds => $_getN(4);
  @$pb.TagNumber(5)
  set chainIds(Ids v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasChainIds() => $_has(4);
  @$pb.TagNumber(5)
  void clearChainIds() => clearField(5);
  @$pb.TagNumber(5)
  Ids ensureChainIds() => $_ensure(4);

  @$pb.TagNumber(6)
  Ids get boutiqueIds => $_getN(5);
  @$pb.TagNumber(6)
  set boutiqueIds(Ids v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasBoutiqueIds() => $_has(5);
  @$pb.TagNumber(6)
  void clearBoutiqueIds() => clearField(6);
  @$pb.TagNumber(6)
  Ids ensureBoutiqueIds() => $_ensure(5);

  @$pb.TagNumber(7)
  ArticleRights get articleRights => $_getN(6);
  @$pb.TagNumber(7)
  set articleRights(ArticleRights v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasArticleRights() => $_has(6);
  @$pb.TagNumber(7)
  void clearArticleRights() => clearField(7);
  @$pb.TagNumber(7)
  ArticleRights ensureArticleRights() => $_ensure(6);

  @$pb.TagNumber(8)
  BoutiqueRights get boutiqueRights => $_getN(7);
  @$pb.TagNumber(8)
  set boutiqueRights(BoutiqueRights v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasBoutiqueRights() => $_has(7);
  @$pb.TagNumber(8)
  void clearBoutiqueRights() => clearField(8);
  @$pb.TagNumber(8)
  BoutiqueRights ensureBoutiqueRights() => $_ensure(7);

  @$pb.TagNumber(9)
  FirmRights get firmRights => $_getN(8);
  @$pb.TagNumber(9)
  set firmRights(FirmRights v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasFirmRights() => $_has(8);
  @$pb.TagNumber(9)
  void clearFirmRights() => clearField(9);
  @$pb.TagNumber(9)
  FirmRights ensureFirmRights() => $_ensure(8);

  @$pb.TagNumber(10)
  MallRights get chainRights => $_getN(9);
  @$pb.TagNumber(10)
  set chainRights(MallRights v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasChainRights() => $_has(9);
  @$pb.TagNumber(10)
  void clearChainRights() => clearField(10);
  @$pb.TagNumber(10)
  MallRights ensureChainRights() => $_ensure(9);

  @$pb.TagNumber(11)
  ContactRights get contactRights => $_getN(10);
  @$pb.TagNumber(11)
  set contactRights(ContactRights v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasContactRights() => $_has(10);
  @$pb.TagNumber(11)
  void clearContactRights() => clearField(11);
  @$pb.TagNumber(11)
  ContactRights ensureContactRights() => $_ensure(10);

  @$pb.TagNumber(12)
  TicketRights get ticketRights => $_getN(11);
  @$pb.TagNumber(12)
  set ticketRights(TicketRights v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasTicketRights() => $_has(11);
  @$pb.TagNumber(12)
  void clearTicketRights() => clearField(12);
  @$pb.TagNumber(12)
  TicketRights ensureTicketRights() => $_ensure(11);

  @$pb.TagNumber(13)
  UserManagementRights get userManagementRights => $_getN(12);
  @$pb.TagNumber(13)
  set userManagementRights(UserManagementRights v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasUserManagementRights() => $_has(12);
  @$pb.TagNumber(13)
  void clearUserManagementRights() => clearField(13);
  @$pb.TagNumber(13)
  UserManagementRights ensureUserManagementRights() => $_ensure(12);

  @$pb.TagNumber(14)
  BoolRights get boolRights => $_getN(13);
  @$pb.TagNumber(14)
  set boolRights(BoolRights v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasBoolRights() => $_has(13);
  @$pb.TagNumber(14)
  void clearBoolRights() => clearField(14);
  @$pb.TagNumber(14)
  BoolRights ensureBoolRights() => $_ensure(13);

  @$pb.TagNumber(15)
  $core.String get lastUpdatedByuserId => $_getSZ(14);
  @$pb.TagNumber(15)
  set lastUpdatedByuserId($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasLastUpdatedByuserId() => $_has(14);
  @$pb.TagNumber(15)
  void clearLastUpdatedByuserId() => clearField(15);

  @$pb.TagNumber(16)
  $17.Timestamp get lastUpdateTimestampUTC => $_getN(15);
  @$pb.TagNumber(16)
  set lastUpdateTimestampUTC($17.Timestamp v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasLastUpdateTimestampUTC() => $_has(15);
  @$pb.TagNumber(16)
  void clearLastUpdateTimestampUTC() => clearField(16);
  @$pb.TagNumber(16)
  $17.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(15);

  @$pb.TagNumber(17)
  $core.String get firstname => $_getSZ(16);
  @$pb.TagNumber(17)
  set firstname($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasFirstname() => $_has(16);
  @$pb.TagNumber(17)
  void clearFirstname() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get lastname => $_getSZ(17);
  @$pb.TagNumber(18)
  set lastname($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasLastname() => $_has(17);
  @$pb.TagNumber(18)
  void clearLastname() => clearField(18);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
