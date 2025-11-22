// This is a generated file - do not edit.
//
// Generated from article/category.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../common/g_timestamp.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CategoryMongo extends $pb.GeneratedMessage {
  factory CategoryMongo({
    $core.String? firmId,
    $core.String? chainId,
    $core.String? userId,
    $core.String? title,
    CategoryPb? category,
    $0.Timestamp? lastTouchTimestampUTC,
  }) {
    final result = create();
    if (firmId != null) result.firmId = firmId;
    if (chainId != null) result.chainId = chainId;
    if (userId != null) result.userId = userId;
    if (title != null) result.title = title;
    if (category != null) result.category = category;
    if (lastTouchTimestampUTC != null)
      result.lastTouchTimestampUTC = lastTouchTimestampUTC;
    return result;
  }

  CategoryMongo._();

  factory CategoryMongo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CategoryMongo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CategoryMongo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.category'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(3, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..aOM<CategoryPb>(5, _omitFieldNames ? '' : 'category',
        subBuilder: CategoryPb.create)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'lastTouchTimestampUTC',
        protoName: 'lastTouchTimestampUTC', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CategoryMongo clone() => CategoryMongo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CategoryMongo copyWith(void Function(CategoryMongo) updates) =>
      super.copyWith((message) => updates(message as CategoryMongo))
          as CategoryMongo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CategoryMongo create() => CategoryMongo._();
  @$core.override
  CategoryMongo createEmptyInstance() => create();
  static $pb.PbList<CategoryMongo> createRepeated() =>
      $pb.PbList<CategoryMongo>();
  @$core.pragma('dart2js:noInline')
  static CategoryMongo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryMongo>(create);
  static CategoryMongo? _defaultInstance;

  /// faster object read
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
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => $_clearField(4);

  @$pb.TagNumber(5)
  CategoryPb get category => $_getN(4);
  @$pb.TagNumber(5)
  set category(CategoryPb value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategory() => $_clearField(5);
  @$pb.TagNumber(5)
  CategoryPb ensureCategory() => $_ensure(4);

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

class CategoryPb extends $pb.GeneratedMessage {
  factory CategoryPb({
    $core.Iterable<$core.int>? calibresIds,
    $core.String? title,
    $fixnum.Int64? color,
    $core.String? creationDate,
    $core.String? updateDate,
  }) {
    final result = create();
    if (calibresIds != null) result.calibresIds.addAll(calibresIds);
    if (title != null) result.title = title;
    if (color != null) result.color = color;
    if (creationDate != null) result.creationDate = creationDate;
    if (updateDate != null) result.updateDate = updateDate;
    return result;
  }

  CategoryPb._();

  factory CategoryPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CategoryPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CategoryPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.category'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'calibresIds', $pb.PbFieldType.KU3,
        protoName: 'calibresIds')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'color', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(5, _omitFieldNames ? '' : 'updateDate', protoName: 'updateDate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CategoryPb clone() => CategoryPb()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CategoryPb copyWith(void Function(CategoryPb) updates) =>
      super.copyWith((message) => updates(message as CategoryPb)) as CategoryPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CategoryPb create() => CategoryPb._();
  @$core.override
  CategoryPb createEmptyInstance() => create();
  static $pb.PbList<CategoryPb> createRepeated() => $pb.PbList<CategoryPb>();
  @$core.pragma('dart2js:noInline')
  static CategoryPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryPb>(create);
  static CategoryPb? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get calibresIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get color => $_getI64(2);
  @$pb.TagNumber(3)
  set color($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearColor() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get creationDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set creationDate($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreationDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreationDate() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get updateDate => $_getSZ(4);
  @$pb.TagNumber(5)
  set updateDate($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUpdateDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdateDate() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
