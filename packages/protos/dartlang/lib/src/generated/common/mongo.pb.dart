//
//  Generated code. Do not modify.
//  source: common/mongo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ChainOidAndBoutiqueOid extends $pb.GeneratedMessage {
  factory ChainOidAndBoutiqueOid({
    $core.String? chainOid,
    $core.String? boutiqueOid,
  }) {
    final $result = create();
    if (chainOid != null) {
      $result.chainOid = chainOid;
    }
    if (boutiqueOid != null) {
      $result.boutiqueOid = boutiqueOid;
    }
    return $result;
  }
  ChainOidAndBoutiqueOid._() : super();
  factory ChainOidAndBoutiqueOid.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainOidAndBoutiqueOid.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChainOidAndBoutiqueOid', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.common.mongo'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainOid', protoName: 'chainOid')
    ..aOS(2, _omitFieldNames ? '' : 'boutiqueOid', protoName: 'boutiqueOid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChainOidAndBoutiqueOid clone() => ChainOidAndBoutiqueOid()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChainOidAndBoutiqueOid copyWith(void Function(ChainOidAndBoutiqueOid) updates) => super.copyWith((message) => updates(message as ChainOidAndBoutiqueOid)) as ChainOidAndBoutiqueOid;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainOidAndBoutiqueOid create() => ChainOidAndBoutiqueOid._();
  ChainOidAndBoutiqueOid createEmptyInstance() => create();
  static $pb.PbList<ChainOidAndBoutiqueOid> createRepeated() => $pb.PbList<ChainOidAndBoutiqueOid>();
  @$core.pragma('dart2js:noInline')
  static ChainOidAndBoutiqueOid getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainOidAndBoutiqueOid>(create);
  static ChainOidAndBoutiqueOid? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainOid => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainOid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainOid() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainOid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get boutiqueOid => $_getSZ(1);
  @$pb.TagNumber(2)
  set boutiqueOid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoutiqueOid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiqueOid() => clearField(2);
}

class Testing extends $pb.GeneratedMessage {
  factory Testing({
    ObjectIdProto? id,
    $core.String? name,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  Testing._() : super();
  factory Testing.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Testing.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Testing', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.common.mongo'), createEmptyInstance: create)
    ..aOM<ObjectIdProto>(1, _omitFieldNames ? '' : 'Id', subBuilder: ObjectIdProto.create)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Testing clone() => Testing()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Testing copyWith(void Function(Testing) updates) => super.copyWith((message) => updates(message as Testing)) as Testing;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Testing create() => Testing._();
  Testing createEmptyInstance() => create();
  static $pb.PbList<Testing> createRepeated() => $pb.PbList<Testing>();
  @$core.pragma('dart2js:noInline')
  static Testing getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Testing>(create);
  static Testing? _defaultInstance;

  @$pb.TagNumber(1)
  ObjectIdProto get id => $_getN(0);
  @$pb.TagNumber(1)
  set id(ObjectIdProto v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
  @$pb.TagNumber(1)
  ObjectIdProto ensureId() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class ObjectIdProto extends $pb.GeneratedMessage {
  factory ObjectIdProto({
    $core.String? oid,
  }) {
    final $result = create();
    if (oid != null) {
      $result.oid = oid;
    }
    return $result;
  }
  ObjectIdProto._() : super();
  factory ObjectIdProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ObjectIdProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ObjectIdProto', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.common.mongo'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'oid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ObjectIdProto clone() => ObjectIdProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ObjectIdProto copyWith(void Function(ObjectIdProto) updates) => super.copyWith((message) => updates(message as ObjectIdProto)) as ObjectIdProto;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ObjectIdProto create() => ObjectIdProto._();
  ObjectIdProto createEmptyInstance() => create();
  static $pb.PbList<ObjectIdProto> createRepeated() => $pb.PbList<ObjectIdProto>();
  @$core.pragma('dart2js:noInline')
  static ObjectIdProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ObjectIdProto>(create);
  static ObjectIdProto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get oid => $_getSZ(0);
  @$pb.TagNumber(1)
  set oid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOid() => $_has(0);
  @$pb.TagNumber(1)
  void clearOid() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
