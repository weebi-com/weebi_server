// This is a generated file - do not edit.
//
// Generated from article/photo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../common/g_timestamp.pb.dart' as $0;
import 'photo.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'photo.pbenum.dart';

class ArticlePhotoMongo extends $pb.GeneratedMessage {
  factory ArticlePhotoMongo({
    $core.String? firmId,
    $core.String? chainId,
    $core.String? userId,
    $core.int? calibreId,
    ArticlePhotoPb? photo,
    $0.Timestamp? lastTouchTimestampUTC,
  }) {
    final result = create();
    if (firmId != null) result.firmId = firmId;
    if (chainId != null) result.chainId = chainId;
    if (userId != null) result.userId = userId;
    if (calibreId != null) result.calibreId = calibreId;
    if (photo != null) result.photo = photo;
    if (lastTouchTimestampUTC != null)
      result.lastTouchTimestampUTC = lastTouchTimestampUTC;
    return result;
  }

  ArticlePhotoMongo._();

  factory ArticlePhotoMongo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArticlePhotoMongo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArticlePhotoMongo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.photo'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(3, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aI(4, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aOM<ArticlePhotoPb>(5, _omitFieldNames ? '' : 'photo',
        subBuilder: ArticlePhotoPb.create)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'lastTouchTimestampUTC',
        protoName: 'lastTouchTimestampUTC', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticlePhotoMongo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticlePhotoMongo copyWith(void Function(ArticlePhotoMongo) updates) =>
      super.copyWith((message) => updates(message as ArticlePhotoMongo))
          as ArticlePhotoMongo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticlePhotoMongo create() => ArticlePhotoMongo._();
  @$core.override
  ArticlePhotoMongo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArticlePhotoMongo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArticlePhotoMongo>(create);
  static ArticlePhotoMongo? _defaultInstance;

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
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get calibreId => $_getIZ(3);
  @$pb.TagNumber(4)
  set calibreId($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCalibreId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCalibreId() => $_clearField(4);

  @$pb.TagNumber(5)
  ArticlePhotoPb get photo => $_getN(4);
  @$pb.TagNumber(5)
  set photo(ArticlePhotoPb value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPhoto() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoto() => $_clearField(5);
  @$pb.TagNumber(5)
  ArticlePhotoPb ensurePhoto() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.Timestamp get lastTouchTimestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set lastTouchTimestampUTC($0.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasLastTouchTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastTouchTimestampUTC() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureLastTouchTimestampUTC() => $_ensure(5);
}

class ArticlePhotoPb extends $pb.GeneratedMessage {
  factory ArticlePhotoPb({
    $core.int? calibreId,
    $core.int? id,
    $core.List<$core.int>? data,
    ArticlePhotoPb_ExtensionPb? extension_4,
  }) {
    final result = create();
    if (calibreId != null) result.calibreId = calibreId;
    if (id != null) result.id = id;
    if (data != null) result.data = data;
    if (extension_4 != null) result.extension_4 = extension_4;
    return result;
  }

  ArticlePhotoPb._();

  factory ArticlePhotoPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArticlePhotoPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArticlePhotoPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.photo'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aI(2, _omitFieldNames ? '' : 'id')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..aE<ArticlePhotoPb_ExtensionPb>(4, _omitFieldNames ? '' : 'extension',
        enumValues: ArticlePhotoPb_ExtensionPb.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticlePhotoPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticlePhotoPb copyWith(void Function(ArticlePhotoPb) updates) =>
      super.copyWith((message) => updates(message as ArticlePhotoPb))
          as ArticlePhotoPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticlePhotoPb create() => ArticlePhotoPb._();
  @$core.override
  ArticlePhotoPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArticlePhotoPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArticlePhotoPb>(create);
  static ArticlePhotoPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get calibreId => $_getIZ(0);
  @$pb.TagNumber(1)
  set calibreId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCalibreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalibreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);

  @$pb.TagNumber(4)
  ArticlePhotoPb_ExtensionPb get extension_4 => $_getN(3);
  @$pb.TagNumber(4)
  set extension_4(ArticlePhotoPb_ExtensionPb value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasExtension_4() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtension_4() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
