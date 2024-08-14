//
//  Generated code. Do not modify.
//  source: user_permission.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $12;

class UserPermissions extends $pb.GeneratedMessage {
  factory UserPermissions({
    $core.String? userOid,
    $core.String? firmOid,
    $12.Oids? chainsAccessible,
    $12.Oids? boutiquesAccessible,
    $12.TicketRights? ticketRights,
    $12.ContactRights? contactRights,
    $12.ArticleRights? articleRights,
    $12.BoutiqueRights? boutiqueRights,
    $12.MallRights? chainRights,
    $12.FirmRights? firmRights,
    $12.UserManagementRights? userManagementRights,
    $12.BoolRights? boolRights,
  }) {
    final $result = create();
    if (userOid != null) {
      $result.userOid = userOid;
    }
    if (firmOid != null) {
      $result.firmOid = firmOid;
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserPermissions', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.user_permissions'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userOid', protoName: 'userOid')
    ..aOS(2, _omitFieldNames ? '' : 'firmOid', protoName: 'firmOid')
    ..aOM<$12.Oids>(3, _omitFieldNames ? '' : 'chainsAccessible', protoName: 'chainsAccessible', subBuilder: $12.Oids.create)
    ..aOM<$12.Oids>(4, _omitFieldNames ? '' : 'boutiquesAccessible', protoName: 'boutiquesAccessible', subBuilder: $12.Oids.create)
    ..aOM<$12.TicketRights>(5, _omitFieldNames ? '' : 'ticketRights', protoName: 'ticketRights', subBuilder: $12.TicketRights.create)
    ..aOM<$12.ContactRights>(6, _omitFieldNames ? '' : 'contactRights', protoName: 'contactRights', subBuilder: $12.ContactRights.create)
    ..aOM<$12.ArticleRights>(7, _omitFieldNames ? '' : 'articleRights', protoName: 'articleRights', subBuilder: $12.ArticleRights.create)
    ..aOM<$12.BoutiqueRights>(8, _omitFieldNames ? '' : 'boutiqueRights', protoName: 'boutiqueRights', subBuilder: $12.BoutiqueRights.create)
    ..aOM<$12.MallRights>(9, _omitFieldNames ? '' : 'mallRights', protoName: 'chainRights', subBuilder: $12.MallRights.create)
    ..aOM<$12.FirmRights>(10, _omitFieldNames ? '' : 'firmRights', protoName: 'firmRights', subBuilder: $12.FirmRights.create)
    ..aOM<$12.UserManagementRights>(11, _omitFieldNames ? '' : 'userManagementRights', protoName: 'userManagementRights', subBuilder: $12.UserManagementRights.create)
    ..aOM<$12.BoolRights>(12, _omitFieldNames ? '' : 'boolRights', protoName: 'boolRights', subBuilder: $12.BoolRights.create)
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

  @$pb.TagNumber(3)
  $12.Oids get chainsAccessible => $_getN(2);
  @$pb.TagNumber(3)
  set chainsAccessible($12.Oids v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChainsAccessible() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainsAccessible() => clearField(3);
  @$pb.TagNumber(3)
  $12.Oids ensureChainsAccessible() => $_ensure(2);

  @$pb.TagNumber(4)
  $12.Oids get boutiquesAccessible => $_getN(3);
  @$pb.TagNumber(4)
  set boutiquesAccessible($12.Oids v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoutiquesAccessible() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoutiquesAccessible() => clearField(4);
  @$pb.TagNumber(4)
  $12.Oids ensureBoutiquesAccessible() => $_ensure(3);

  @$pb.TagNumber(5)
  $12.TicketRights get ticketRights => $_getN(4);
  @$pb.TagNumber(5)
  set ticketRights($12.TicketRights v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTicketRights() => $_has(4);
  @$pb.TagNumber(5)
  void clearTicketRights() => clearField(5);
  @$pb.TagNumber(5)
  $12.TicketRights ensureTicketRights() => $_ensure(4);

  @$pb.TagNumber(6)
  $12.ContactRights get contactRights => $_getN(5);
  @$pb.TagNumber(6)
  set contactRights($12.ContactRights v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasContactRights() => $_has(5);
  @$pb.TagNumber(6)
  void clearContactRights() => clearField(6);
  @$pb.TagNumber(6)
  $12.ContactRights ensureContactRights() => $_ensure(5);

  @$pb.TagNumber(7)
  $12.ArticleRights get articleRights => $_getN(6);
  @$pb.TagNumber(7)
  set articleRights($12.ArticleRights v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasArticleRights() => $_has(6);
  @$pb.TagNumber(7)
  void clearArticleRights() => clearField(7);
  @$pb.TagNumber(7)
  $12.ArticleRights ensureArticleRights() => $_ensure(6);

  @$pb.TagNumber(8)
  $12.BoutiqueRights get boutiqueRights => $_getN(7);
  @$pb.TagNumber(8)
  set boutiqueRights($12.BoutiqueRights v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasBoutiqueRights() => $_has(7);
  @$pb.TagNumber(8)
  void clearBoutiqueRights() => clearField(8);
  @$pb.TagNumber(8)
  $12.BoutiqueRights ensureBoutiqueRights() => $_ensure(7);

  @$pb.TagNumber(9)
  $12.MallRights get chainRights => $_getN(8);
  @$pb.TagNumber(9)
  set chainRights($12.MallRights v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasChainRights() => $_has(8);
  @$pb.TagNumber(9)
  void clearChainRights() => clearField(9);
  @$pb.TagNumber(9)
  $12.MallRights ensureChainRights() => $_ensure(8);

  @$pb.TagNumber(10)
  $12.FirmRights get firmRights => $_getN(9);
  @$pb.TagNumber(10)
  set firmRights($12.FirmRights v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasFirmRights() => $_has(9);
  @$pb.TagNumber(10)
  void clearFirmRights() => clearField(10);
  @$pb.TagNumber(10)
  $12.FirmRights ensureFirmRights() => $_ensure(9);

  @$pb.TagNumber(11)
  $12.UserManagementRights get userManagementRights => $_getN(10);
  @$pb.TagNumber(11)
  set userManagementRights($12.UserManagementRights v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasUserManagementRights() => $_has(10);
  @$pb.TagNumber(11)
  void clearUserManagementRights() => clearField(11);
  @$pb.TagNumber(11)
  $12.UserManagementRights ensureUserManagementRights() => $_ensure(10);

  @$pb.TagNumber(12)
  $12.BoolRights get boolRights => $_getN(11);
  @$pb.TagNumber(12)
  set boolRights($12.BoolRights v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasBoolRights() => $_has(11);
  @$pb.TagNumber(12)
  void clearBoolRights() => clearField(12);
  @$pb.TagNumber(12)
  $12.BoolRights ensureBoolRights() => $_ensure(11);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
