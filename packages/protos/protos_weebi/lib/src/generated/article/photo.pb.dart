//
//  Generated code. Do not modify.
//  source: article/photo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../common/g_timestamp.pb.dart' as $19;

class ArticlePhotoMongo extends $pb.GeneratedMessage {
  factory ArticlePhotoMongo({
    $core.String? firmId,
    $core.String? chainId,
    $core.String? userId,
    $core.int? calibreId,
    ArticlePhotoPb? photo,
    $19.Timestamp? lastTouchTimestampUTC,
  }) {
    final $result = create();
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (calibreId != null) {
      $result.calibreId = calibreId;
    }
    if (photo != null) {
      $result.photo = photo;
    }
    if (lastTouchTimestampUTC != null) {
      $result.lastTouchTimestampUTC = lastTouchTimestampUTC;
    }
    return $result;
  }
  ArticlePhotoMongo._() : super();
  factory ArticlePhotoMongo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticlePhotoMongo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ArticlePhotoMongo', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.photo'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(3, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'calibreId', $pb.PbFieldType.O3, protoName: 'calibreId')
    ..aOM<ArticlePhotoPb>(5, _omitFieldNames ? '' : 'photo', subBuilder: ArticlePhotoPb.create)
    ..aOM<$19.Timestamp>(6, _omitFieldNames ? '' : 'lastTouchTimestampUTC', protoName: 'lastTouchTimestampUTC', subBuilder: $19.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArticlePhotoMongo clone() => ArticlePhotoMongo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArticlePhotoMongo copyWith(void Function(ArticlePhotoMongo) updates) => super.copyWith((message) => updates(message as ArticlePhotoMongo)) as ArticlePhotoMongo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticlePhotoMongo create() => ArticlePhotoMongo._();
  ArticlePhotoMongo createEmptyInstance() => create();
  static $pb.PbList<ArticlePhotoMongo> createRepeated() => $pb.PbList<ArticlePhotoMongo>();
  @$core.pragma('dart2js:noInline')
  static ArticlePhotoMongo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticlePhotoMongo>(create);
  static ArticlePhotoMongo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get calibreId => $_getIZ(3);
  @$pb.TagNumber(4)
  set calibreId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCalibreId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCalibreId() => clearField(4);

  @$pb.TagNumber(5)
  ArticlePhotoPb get photo => $_getN(4);
  @$pb.TagNumber(5)
  set photo(ArticlePhotoPb v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhoto() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoto() => clearField(5);
  @$pb.TagNumber(5)
  ArticlePhotoPb ensurePhoto() => $_ensure(4);

  @$pb.TagNumber(6)
  $19.Timestamp get lastTouchTimestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set lastTouchTimestampUTC($19.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastTouchTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastTouchTimestampUTC() => clearField(6);
  @$pb.TagNumber(6)
  $19.Timestamp ensureLastTouchTimestampUTC() => $_ensure(5);
}

class ArticlePhotoPb extends $pb.GeneratedMessage {
  factory ArticlePhotoPb({
    $core.int? calibreId,
    $core.int? id,
    $core.List<$core.int>? data,
  }) {
    final $result = create();
    if (calibreId != null) {
      $result.calibreId = calibreId;
    }
    if (id != null) {
      $result.id = id;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  ArticlePhotoPb._() : super();
  factory ArticlePhotoPb.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticlePhotoPb.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ArticlePhotoPb', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.photo'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'calibreId', $pb.PbFieldType.O3, protoName: 'calibreId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArticlePhotoPb clone() => ArticlePhotoPb()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArticlePhotoPb copyWith(void Function(ArticlePhotoPb) updates) => super.copyWith((message) => updates(message as ArticlePhotoPb)) as ArticlePhotoPb;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticlePhotoPb create() => ArticlePhotoPb._();
  ArticlePhotoPb createEmptyInstance() => create();
  static $pb.PbList<ArticlePhotoPb> createRepeated() => $pb.PbList<ArticlePhotoPb>();
  @$core.pragma('dart2js:noInline')
  static ArticlePhotoPb getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticlePhotoPb>(create);
  static ArticlePhotoPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get calibreId => $_getIZ(0);
  @$pb.TagNumber(1)
  set calibreId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCalibreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalibreId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
