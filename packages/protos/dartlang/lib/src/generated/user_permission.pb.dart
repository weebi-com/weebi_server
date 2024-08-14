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

import 'user.pb.dart' as $20;

class UserPermissions extends $pb.GeneratedMessage {
  factory UserPermissions({
    $core.String? userOid,
    $core.String? firmOid,
    $20.Oids? chainsAccessible,
    $20.Oids? boutiquesAccessible,
    $20.TicketRights? ticketRights,
    $20.ContactRights? contactRights,
    $20.ArticleRights? articleRights,
    $20.BoutiqueRights? boutiqueRights,
    $20.MallRights? chainRights,
    $20.FirmRights? firmRights,
    $20.UserManagementRights? userManagementRights,
    $20.BoolRights? boolRights,
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
    ..aOM<$20.Oids>(3, _omitFieldNames ? '' : 'chainsAccessible', protoName: 'chainsAccessible', subBuilder: $20.Oids.create)
    ..aOM<$20.Oids>(4, _omitFieldNames ? '' : 'boutiquesAccessible', protoName: 'boutiquesAccessible', subBuilder: $20.Oids.create)
    ..aOM<$20.TicketRights>(5, _omitFieldNames ? '' : 'ticketRights', protoName: 'ticketRights', subBuilder: $20.TicketRights.create)
    ..aOM<$20.ContactRights>(6, _omitFieldNames ? '' : 'contactRights', protoName: 'contactRights', subBuilder: $20.ContactRights.create)
    ..aOM<$20.ArticleRights>(7, _omitFieldNames ? '' : 'articleRights', protoName: 'articleRights', subBuilder: $20.ArticleRights.create)
    ..aOM<$20.BoutiqueRights>(8, _omitFieldNames ? '' : 'boutiqueRights', protoName: 'boutiqueRights', subBuilder: $20.BoutiqueRights.create)
    ..aOM<$20.MallRights>(9, _omitFieldNames ? '' : 'mallRights', protoName: 'chainRights', subBuilder: $20.MallRights.create)
    ..aOM<$20.FirmRights>(10, _omitFieldNames ? '' : 'firmRights', protoName: 'firmRights', subBuilder: $20.FirmRights.create)
    ..aOM<$20.UserManagementRights>(11, _omitFieldNames ? '' : 'userManagementRights', protoName: 'userManagementRights', subBuilder: $20.UserManagementRights.create)
    ..aOM<$20.BoolRights>(12, _omitFieldNames ? '' : 'boolRights', protoName: 'boolRights', subBuilder: $20.BoolRights.create)
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
  $20.Oids get chainsAccessible => $_getN(2);
  @$pb.TagNumber(3)
  set chainsAccessible($20.Oids v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChainsAccessible() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainsAccessible() => clearField(3);
  @$pb.TagNumber(3)
  $20.Oids ensureChainsAccessible() => $_ensure(2);

  @$pb.TagNumber(4)
  $20.Oids get boutiquesAccessible => $_getN(3);
  @$pb.TagNumber(4)
  set boutiquesAccessible($20.Oids v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoutiquesAccessible() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoutiquesAccessible() => clearField(4);
  @$pb.TagNumber(4)
  $20.Oids ensureBoutiquesAccessible() => $_ensure(3);

  @$pb.TagNumber(5)
  $20.TicketRights get ticketRights => $_getN(4);
  @$pb.TagNumber(5)
  set ticketRights($20.TicketRights v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTicketRights() => $_has(4);
  @$pb.TagNumber(5)
  void clearTicketRights() => clearField(5);
  @$pb.TagNumber(5)
  $20.TicketRights ensureTicketRights() => $_ensure(4);

  @$pb.TagNumber(6)
  $20.ContactRights get contactRights => $_getN(5);
  @$pb.TagNumber(6)
  set contactRights($20.ContactRights v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasContactRights() => $_has(5);
  @$pb.TagNumber(6)
  void clearContactRights() => clearField(6);
  @$pb.TagNumber(6)
  $20.ContactRights ensureContactRights() => $_ensure(5);

  @$pb.TagNumber(7)
  $20.ArticleRights get articleRights => $_getN(6);
  @$pb.TagNumber(7)
  set articleRights($20.ArticleRights v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasArticleRights() => $_has(6);
  @$pb.TagNumber(7)
  void clearArticleRights() => clearField(7);
  @$pb.TagNumber(7)
  $20.ArticleRights ensureArticleRights() => $_ensure(6);

  @$pb.TagNumber(8)
  $20.BoutiqueRights get boutiqueRights => $_getN(7);
  @$pb.TagNumber(8)
  set boutiqueRights($20.BoutiqueRights v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasBoutiqueRights() => $_has(7);
  @$pb.TagNumber(8)
  void clearBoutiqueRights() => clearField(8);
  @$pb.TagNumber(8)
  $20.BoutiqueRights ensureBoutiqueRights() => $_ensure(7);

  @$pb.TagNumber(9)
  $20.MallRights get chainRights => $_getN(8);
  @$pb.TagNumber(9)
  set chainRights($20.MallRights v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasChainRights() => $_has(8);
  @$pb.TagNumber(9)
  void clearChainRights() => clearField(9);
  @$pb.TagNumber(9)
  $20.MallRights ensureChainRights() => $_ensure(8);

  @$pb.TagNumber(10)
  $20.FirmRights get firmRights => $_getN(9);
  @$pb.TagNumber(10)
  set firmRights($20.FirmRights v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasFirmRights() => $_has(9);
  @$pb.TagNumber(10)
  void clearFirmRights() => clearField(10);
  @$pb.TagNumber(10)
  $20.FirmRights ensureFirmRights() => $_ensure(9);

  @$pb.TagNumber(11)
  $20.UserManagementRights get userManagementRights => $_getN(10);
  @$pb.TagNumber(11)
  set userManagementRights($20.UserManagementRights v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasUserManagementRights() => $_has(10);
  @$pb.TagNumber(11)
  void clearUserManagementRights() => clearField(11);
  @$pb.TagNumber(11)
  $20.UserManagementRights ensureUserManagementRights() => $_ensure(10);

  @$pb.TagNumber(12)
  $20.BoolRights get boolRights => $_getN(11);
  @$pb.TagNumber(12)
  set boolRights($20.BoolRights v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasBoolRights() => $_has(11);
  @$pb.TagNumber(12)
  void clearBoolRights() => clearField(12);
  @$pb.TagNumber(12)
  $20.BoolRights ensureBoolRights() => $_ensure(11);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
