//
//  Generated code. Do not modify.
//  source: article/category.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../common/g_timestamp.pb.dart' as $18;

class CategoryMongo extends $pb.GeneratedMessage {
  factory CategoryMongo({
    $core.String? firmId,
    $core.String? chainId,
    $core.String? userId,
    $core.String? title,
    CategoryPb? category,
    $18.Timestamp? lastTouchTimestampUTC,
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
    if (title != null) {
      $result.title = title;
    }
    if (category != null) {
      $result.category = category;
    }
    if (lastTouchTimestampUTC != null) {
      $result.lastTouchTimestampUTC = lastTouchTimestampUTC;
    }
    return $result;
  }
  CategoryMongo._() : super();
  factory CategoryMongo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CategoryMongo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CategoryMongo', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.category'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(3, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..aOM<CategoryPb>(5, _omitFieldNames ? '' : 'category', subBuilder: CategoryPb.create)
    ..aOM<$18.Timestamp>(6, _omitFieldNames ? '' : 'lastTouchTimestampUTC', protoName: 'lastTouchTimestampUTC', subBuilder: $18.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CategoryMongo clone() => CategoryMongo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CategoryMongo copyWith(void Function(CategoryMongo) updates) => super.copyWith((message) => updates(message as CategoryMongo)) as CategoryMongo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CategoryMongo create() => CategoryMongo._();
  CategoryMongo createEmptyInstance() => create();
  static $pb.PbList<CategoryMongo> createRepeated() => $pb.PbList<CategoryMongo>();
  @$core.pragma('dart2js:noInline')
  static CategoryMongo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CategoryMongo>(create);
  static CategoryMongo? _defaultInstance;

  /// faster object read
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
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  CategoryPb get category => $_getN(4);
  @$pb.TagNumber(5)
  set category(CategoryPb v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategory() => clearField(5);
  @$pb.TagNumber(5)
  CategoryPb ensureCategory() => $_ensure(4);

  @$pb.TagNumber(6)
  $18.Timestamp get lastTouchTimestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set lastTouchTimestampUTC($18.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastTouchTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastTouchTimestampUTC() => clearField(6);
  @$pb.TagNumber(6)
  $18.Timestamp ensureLastTouchTimestampUTC() => $_ensure(5);
}

class CategoryPb extends $pb.GeneratedMessage {
  factory CategoryPb({
    $core.Iterable<$core.int>? calibresIds,
    $core.String? title,
    $fixnum.Int64? color,
    $core.String? creationDate,
    $core.String? updateDate,
  }) {
    final $result = create();
    if (calibresIds != null) {
      $result.calibresIds.addAll(calibresIds);
    }
    if (title != null) {
      $result.title = title;
    }
    if (color != null) {
      $result.color = color;
    }
    if (creationDate != null) {
      $result.creationDate = creationDate;
    }
    if (updateDate != null) {
      $result.updateDate = updateDate;
    }
    return $result;
  }
  CategoryPb._() : super();
  factory CategoryPb.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CategoryPb.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CategoryPb', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.category'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'calibresIds', $pb.PbFieldType.KU3, protoName: 'calibresIds')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'color', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(5, _omitFieldNames ? '' : 'updateDate', protoName: 'updateDate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CategoryPb clone() => CategoryPb()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CategoryPb copyWith(void Function(CategoryPb) updates) => super.copyWith((message) => updates(message as CategoryPb)) as CategoryPb;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CategoryPb create() => CategoryPb._();
  CategoryPb createEmptyInstance() => create();
  static $pb.PbList<CategoryPb> createRepeated() => $pb.PbList<CategoryPb>();
  @$core.pragma('dart2js:noInline')
  static CategoryPb getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CategoryPb>(create);
  static CategoryPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get calibresIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get color => $_getI64(2);
  @$pb.TagNumber(3)
  set color($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearColor() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get creationDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set creationDate($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreationDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreationDate() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get updateDate => $_getSZ(4);
  @$pb.TagNumber(5)
  set updateDate($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdateDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdateDate() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
