// This is a generated file - do not edit.
//
// Generated from article/article_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../common/g_timestamp.pb.dart' as $5;
import 'article.pb.dart' as $2;
import 'category.pb.dart' as $3;
import 'photo.pb.dart' as $4;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// / A Calibre includes Articles
class ReadCalibreRequest extends $pb.GeneratedMessage {
  factory ReadCalibreRequest({
    $core.String? chainId,
    $core.String? title,
    $core.int? calibreId,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (title != null) result.title = title;
    if (calibreId != null) result.calibreId = calibreId;
    return result;
  }

  ReadCalibreRequest._();

  factory ReadCalibreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadCalibreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadCalibreRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'calibreId', $pb.PbFieldType.O3,
        protoName: 'calibreId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadCalibreRequest clone() => ReadCalibreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadCalibreRequest copyWith(void Function(ReadCalibreRequest) updates) =>
      super.copyWith((message) => updates(message as ReadCalibreRequest))
          as ReadCalibreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadCalibreRequest create() => ReadCalibreRequest._();
  @$core.override
  ReadCalibreRequest createEmptyInstance() => create();
  static $pb.PbList<ReadCalibreRequest> createRepeated() =>
      $pb.PbList<ReadCalibreRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadCalibreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadCalibreRequest>(create);
  static ReadCalibreRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get calibreId => $_getIZ(2);
  @$pb.TagNumber(3)
  set calibreId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCalibreId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCalibreId() => $_clearField(3);
}

class ReadAllRequest extends $pb.GeneratedMessage {
  factory ReadAllRequest({
    $core.String? chainId,
    $5.Timestamp? lastFetchTimestampUTC,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (lastFetchTimestampUTC != null)
      result.lastFetchTimestampUTC = lastFetchTimestampUTC;
    return result;
  }

  ReadAllRequest._();

  factory ReadAllRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadAllRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadAllRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$5.Timestamp>(2, _omitFieldNames ? '' : 'lastFetchTimestampUTC',
        protoName: 'lastFetchTimestampUTC', subBuilder: $5.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadAllRequest clone() => ReadAllRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadAllRequest copyWith(void Function(ReadAllRequest) updates) =>
      super.copyWith((message) => updates(message as ReadAllRequest))
          as ReadAllRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadAllRequest create() => ReadAllRequest._();
  @$core.override
  ReadAllRequest createEmptyInstance() => create();
  static $pb.PbList<ReadAllRequest> createRepeated() =>
      $pb.PbList<ReadAllRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadAllRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadAllRequest>(create);
  static ReadAllRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  /// optional used for weebi_app device back online
  @$pb.TagNumber(2)
  $5.Timestamp get lastFetchTimestampUTC => $_getN(1);
  @$pb.TagNumber(2)
  set lastFetchTimestampUTC($5.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLastFetchTimestampUTC() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastFetchTimestampUTC() => $_clearField(2);
  @$pb.TagNumber(2)
  $5.Timestamp ensureLastFetchTimestampUTC() => $_ensure(1);
}

class CalibreRequest extends $pb.GeneratedMessage {
  factory CalibreRequest({
    $core.String? chainId,
    $2.CalibrePb? calibre,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (calibre != null) result.calibre = calibre;
    return result;
  }

  CalibreRequest._();

  factory CalibreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CalibreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CalibreRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$2.CalibrePb>(2, _omitFieldNames ? '' : 'calibre',
        subBuilder: $2.CalibrePb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalibreRequest clone() => CalibreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalibreRequest copyWith(void Function(CalibreRequest) updates) =>
      super.copyWith((message) => updates(message as CalibreRequest))
          as CalibreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalibreRequest create() => CalibreRequest._();
  @$core.override
  CalibreRequest createEmptyInstance() => create();
  static $pb.PbList<CalibreRequest> createRepeated() =>
      $pb.PbList<CalibreRequest>();
  @$core.pragma('dart2js:noInline')
  static CalibreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CalibreRequest>(create);
  static CalibreRequest? _defaultInstance;

  /// below in case mutiple chains, permission check will still be applied to verify
  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.CalibrePb get calibre => $_getN(1);
  @$pb.TagNumber(2)
  set calibre($2.CalibrePb value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCalibre() => $_has(1);
  @$pb.TagNumber(2)
  void clearCalibre() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.CalibrePb ensureCalibre() => $_ensure(1);
}

class CalibresRequest extends $pb.GeneratedMessage {
  factory CalibresRequest({
    $core.String? chainId,
    $core.Iterable<$2.CalibrePb>? calibres,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (calibres != null) result.calibres.addAll(calibres);
    return result;
  }

  CalibresRequest._();

  factory CalibresRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CalibresRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CalibresRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..pc<$2.CalibrePb>(2, _omitFieldNames ? '' : 'calibres', $pb.PbFieldType.PM,
        subBuilder: $2.CalibrePb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalibresRequest clone() => CalibresRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalibresRequest copyWith(void Function(CalibresRequest) updates) =>
      super.copyWith((message) => updates(message as CalibresRequest))
          as CalibresRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalibresRequest create() => CalibresRequest._();
  @$core.override
  CalibresRequest createEmptyInstance() => create();
  static $pb.PbList<CalibresRequest> createRepeated() =>
      $pb.PbList<CalibresRequest>();
  @$core.pragma('dart2js:noInline')
  static CalibresRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CalibresRequest>(create);
  static CalibresRequest? _defaultInstance;

  /// below in case mutiple chains, permission check will still be applied to verify
  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$2.CalibrePb> get calibres => $_getList(1);
}

class CalibresResponse extends $pb.GeneratedMessage {
  factory CalibresResponse({
    $core.Iterable<$2.CalibrePb>? calibres,
  }) {
    final result = create();
    if (calibres != null) result.calibres.addAll(calibres);
    return result;
  }

  CalibresResponse._();

  factory CalibresResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CalibresResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CalibresResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..pc<$2.CalibrePb>(1, _omitFieldNames ? '' : 'calibres', $pb.PbFieldType.PM,
        subBuilder: $2.CalibrePb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalibresResponse clone() => CalibresResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalibresResponse copyWith(void Function(CalibresResponse) updates) =>
      super.copyWith((message) => updates(message as CalibresResponse))
          as CalibresResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalibresResponse create() => CalibresResponse._();
  @$core.override
  CalibresResponse createEmptyInstance() => create();
  static $pb.PbList<CalibresResponse> createRepeated() =>
      $pb.PbList<CalibresResponse>();
  @$core.pragma('dart2js:noInline')
  static CalibresResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CalibresResponse>(create);
  static CalibresResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$2.CalibrePb> get calibres => $_getList(0);
}

class ReadIdsRequest extends $pb.GeneratedMessage {
  factory ReadIdsRequest({
    $core.String? chainId,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    return result;
  }

  ReadIdsRequest._();

  factory ReadIdsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadIdsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadIdsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadIdsRequest clone() => ReadIdsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadIdsRequest copyWith(void Function(ReadIdsRequest) updates) =>
      super.copyWith((message) => updates(message as ReadIdsRequest))
          as ReadIdsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadIdsRequest create() => ReadIdsRequest._();
  @$core.override
  ReadIdsRequest createEmptyInstance() => create();
  static $pb.PbList<ReadIdsRequest> createRepeated() =>
      $pb.PbList<ReadIdsRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadIdsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadIdsRequest>(create);
  static ReadIdsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);
}

/// / include all ids so that offline device can delete objects removed by another user/device
class CalibresIdsResponse extends $pb.GeneratedMessage {
  factory CalibresIdsResponse({
    $core.Iterable<$core.int>? ids,
  }) {
    final result = create();
    if (ids != null) result.ids.addAll(ids);
    return result;
  }

  CalibresIdsResponse._();

  factory CalibresIdsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CalibresIdsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CalibresIdsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.K3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalibresIdsResponse clone() => CalibresIdsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalibresIdsResponse copyWith(void Function(CalibresIdsResponse) updates) =>
      super.copyWith((message) => updates(message as CalibresIdsResponse))
          as CalibresIdsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalibresIdsResponse create() => CalibresIdsResponse._();
  @$core.override
  CalibresIdsResponse createEmptyInstance() => create();
  static $pb.PbList<CalibresIdsResponse> createRepeated() =>
      $pb.PbList<CalibresIdsResponse>();
  @$core.pragma('dart2js:noInline')
  static CalibresIdsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CalibresIdsResponse>(create);
  static CalibresIdsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get ids => $_getList(0);
}

/// / categories
class FindCategoryRequest extends $pb.GeneratedMessage {
  factory FindCategoryRequest({
    $core.String? chainId,
    $core.String? title,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (title != null) result.title = title;
    return result;
  }

  FindCategoryRequest._();

  factory FindCategoryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindCategoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindCategoryRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindCategoryRequest clone() => FindCategoryRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindCategoryRequest copyWith(void Function(FindCategoryRequest) updates) =>
      super.copyWith((message) => updates(message as FindCategoryRequest))
          as FindCategoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindCategoryRequest create() => FindCategoryRequest._();
  @$core.override
  FindCategoryRequest createEmptyInstance() => create();
  static $pb.PbList<FindCategoryRequest> createRepeated() =>
      $pb.PbList<FindCategoryRequest>();
  @$core.pragma('dart2js:noInline')
  static FindCategoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindCategoryRequest>(create);
  static FindCategoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);
}

class ReadCategoriesRequest extends $pb.GeneratedMessage {
  factory ReadCategoriesRequest({
    $core.String? chainId,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    return result;
  }

  ReadCategoriesRequest._();

  factory ReadCategoriesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadCategoriesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadCategoriesRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadCategoriesRequest clone() =>
      ReadCategoriesRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadCategoriesRequest copyWith(
          void Function(ReadCategoriesRequest) updates) =>
      super.copyWith((message) => updates(message as ReadCategoriesRequest))
          as ReadCategoriesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadCategoriesRequest create() => ReadCategoriesRequest._();
  @$core.override
  ReadCategoriesRequest createEmptyInstance() => create();
  static $pb.PbList<ReadCategoriesRequest> createRepeated() =>
      $pb.PbList<ReadCategoriesRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadCategoriesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadCategoriesRequest>(create);
  static ReadCategoriesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);
}

class CategoryRequest extends $pb.GeneratedMessage {
  factory CategoryRequest({
    $core.String? chainId,
    $3.CategoryPb? category,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (category != null) result.category = category;
    return result;
  }

  CategoryRequest._();

  factory CategoryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CategoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CategoryRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$3.CategoryPb>(2, _omitFieldNames ? '' : 'category',
        subBuilder: $3.CategoryPb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CategoryRequest clone() => CategoryRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CategoryRequest copyWith(void Function(CategoryRequest) updates) =>
      super.copyWith((message) => updates(message as CategoryRequest))
          as CategoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CategoryRequest create() => CategoryRequest._();
  @$core.override
  CategoryRequest createEmptyInstance() => create();
  static $pb.PbList<CategoryRequest> createRepeated() =>
      $pb.PbList<CategoryRequest>();
  @$core.pragma('dart2js:noInline')
  static CategoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryRequest>(create);
  static CategoryRequest? _defaultInstance;

  /// below in case mutiple chains, permission check will still be applied to verify
  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $3.CategoryPb get category => $_getN(1);
  @$pb.TagNumber(2)
  set category($3.CategoryPb value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.CategoryPb ensureCategory() => $_ensure(1);
}

class CategoriesResponse extends $pb.GeneratedMessage {
  factory CategoriesResponse({
    $core.Iterable<$3.CategoryPb>? categories,
  }) {
    final result = create();
    if (categories != null) result.categories.addAll(categories);
    return result;
  }

  CategoriesResponse._();

  factory CategoriesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CategoriesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CategoriesResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..pc<$3.CategoryPb>(
        1, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM,
        subBuilder: $3.CategoryPb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CategoriesResponse clone() => CategoriesResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CategoriesResponse copyWith(void Function(CategoriesResponse) updates) =>
      super.copyWith((message) => updates(message as CategoriesResponse))
          as CategoriesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CategoriesResponse create() => CategoriesResponse._();
  @$core.override
  CategoriesResponse createEmptyInstance() => create();
  static $pb.PbList<CategoriesResponse> createRepeated() =>
      $pb.PbList<CategoriesResponse>();
  @$core.pragma('dart2js:noInline')
  static CategoriesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoriesResponse>(create);
  static CategoriesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$3.CategoryPb> get categories => $_getList(0);
}

/// / Photos
class FindPhotoRequest extends $pb.GeneratedMessage {
  factory FindPhotoRequest({
    $core.String? chainId,
    $core.String? calibreId,
    $core.String? id,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (calibreId != null) result.calibreId = calibreId;
    if (id != null) result.id = id;
    return result;
  }

  FindPhotoRequest._();

  factory FindPhotoRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindPhotoRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindPhotoRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aOS(3, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindPhotoRequest clone() => FindPhotoRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindPhotoRequest copyWith(void Function(FindPhotoRequest) updates) =>
      super.copyWith((message) => updates(message as FindPhotoRequest))
          as FindPhotoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindPhotoRequest create() => FindPhotoRequest._();
  @$core.override
  FindPhotoRequest createEmptyInstance() => create();
  static $pb.PbList<FindPhotoRequest> createRepeated() =>
      $pb.PbList<FindPhotoRequest>();
  @$core.pragma('dart2js:noInline')
  static FindPhotoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindPhotoRequest>(create);
  static FindPhotoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get calibreId => $_getSZ(1);
  @$pb.TagNumber(2)
  set calibreId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCalibreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCalibreId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get id => $_getSZ(2);
  @$pb.TagNumber(3)
  set id($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => $_clearField(3);
}

class ReadPhotosRequest extends $pb.GeneratedMessage {
  factory ReadPhotosRequest({
    $core.String? chainId,
    $5.Timestamp? lastFetchTimestampUTC,
    $core.int? offset,
    $core.int? limit,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (lastFetchTimestampUTC != null)
      result.lastFetchTimestampUTC = lastFetchTimestampUTC;
    if (offset != null) result.offset = offset;
    if (limit != null) result.limit = limit;
    return result;
  }

  ReadPhotosRequest._();

  factory ReadPhotosRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadPhotosRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadPhotosRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$5.Timestamp>(2, _omitFieldNames ? '' : 'lastFetchTimestampUTC',
        protoName: 'lastFetchTimestampUTC', subBuilder: $5.Timestamp.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadPhotosRequest clone() => ReadPhotosRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadPhotosRequest copyWith(void Function(ReadPhotosRequest) updates) =>
      super.copyWith((message) => updates(message as ReadPhotosRequest))
          as ReadPhotosRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadPhotosRequest create() => ReadPhotosRequest._();
  @$core.override
  ReadPhotosRequest createEmptyInstance() => create();
  static $pb.PbList<ReadPhotosRequest> createRepeated() =>
      $pb.PbList<ReadPhotosRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadPhotosRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadPhotosRequest>(create);
  static ReadPhotosRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $5.Timestamp get lastFetchTimestampUTC => $_getN(1);
  @$pb.TagNumber(2)
  set lastFetchTimestampUTC($5.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLastFetchTimestampUTC() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastFetchTimestampUTC() => $_clearField(2);
  @$pb.TagNumber(2)
  $5.Timestamp ensureLastFetchTimestampUTC() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get limit => $_getIZ(3);
  @$pb.TagNumber(4)
  set limit($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => $_clearField(4);
}

class PhotoRequest extends $pb.GeneratedMessage {
  factory PhotoRequest({
    $core.String? chainId,
    $4.ArticlePhotoPb? photo,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (photo != null) result.photo = photo;
    return result;
  }

  PhotoRequest._();

  factory PhotoRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PhotoRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PhotoRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$4.ArticlePhotoPb>(2, _omitFieldNames ? '' : 'photo',
        subBuilder: $4.ArticlePhotoPb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhotoRequest clone() => PhotoRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhotoRequest copyWith(void Function(PhotoRequest) updates) =>
      super.copyWith((message) => updates(message as PhotoRequest))
          as PhotoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhotoRequest create() => PhotoRequest._();
  @$core.override
  PhotoRequest createEmptyInstance() => create();
  static $pb.PbList<PhotoRequest> createRepeated() =>
      $pb.PbList<PhotoRequest>();
  @$core.pragma('dart2js:noInline')
  static PhotoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PhotoRequest>(create);
  static PhotoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $4.ArticlePhotoPb get photo => $_getN(1);
  @$pb.TagNumber(2)
  set photo($4.ArticlePhotoPb value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPhoto() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhoto() => $_clearField(2);
  @$pb.TagNumber(2)
  $4.ArticlePhotoPb ensurePhoto() => $_ensure(1);
}

class PhotosRequest extends $pb.GeneratedMessage {
  factory PhotosRequest({
    $core.String? chainId,
    $core.Iterable<$4.ArticlePhotoPb>? photos,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (photos != null) result.photos.addAll(photos);
    return result;
  }

  PhotosRequest._();

  factory PhotosRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PhotosRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PhotosRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..pc<$4.ArticlePhotoPb>(
        2, _omitFieldNames ? '' : 'photos', $pb.PbFieldType.PM,
        subBuilder: $4.ArticlePhotoPb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhotosRequest clone() => PhotosRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhotosRequest copyWith(void Function(PhotosRequest) updates) =>
      super.copyWith((message) => updates(message as PhotosRequest))
          as PhotosRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhotosRequest create() => PhotosRequest._();
  @$core.override
  PhotosRequest createEmptyInstance() => create();
  static $pb.PbList<PhotosRequest> createRepeated() =>
      $pb.PbList<PhotosRequest>();
  @$core.pragma('dart2js:noInline')
  static PhotosRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PhotosRequest>(create);
  static PhotosRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$4.ArticlePhotoPb> get photos => $_getList(1);
}

class PhotosResponse extends $pb.GeneratedMessage {
  factory PhotosResponse({
    $core.Iterable<$4.ArticlePhotoPb>? photos,
    $core.int? total,
    $core.int? offset,
    $core.bool? hasMore,
    $core.int? batchSize,
  }) {
    final result = create();
    if (photos != null) result.photos.addAll(photos);
    if (total != null) result.total = total;
    if (offset != null) result.offset = offset;
    if (hasMore != null) result.hasMore = hasMore;
    if (batchSize != null) result.batchSize = batchSize;
    return result;
  }

  PhotosResponse._();

  factory PhotosResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PhotosResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PhotosResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.article.service'),
      createEmptyInstance: create)
    ..pc<$4.ArticlePhotoPb>(
        1, _omitFieldNames ? '' : 'photos', $pb.PbFieldType.PM,
        subBuilder: $4.ArticlePhotoPb.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..aOB(4, _omitFieldNames ? '' : 'hasMore', protoName: 'hasMore')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'batchSize', $pb.PbFieldType.O3,
        protoName: 'batchSize')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhotosResponse clone() => PhotosResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhotosResponse copyWith(void Function(PhotosResponse) updates) =>
      super.copyWith((message) => updates(message as PhotosResponse))
          as PhotosResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhotosResponse create() => PhotosResponse._();
  @$core.override
  PhotosResponse createEmptyInstance() => create();
  static $pb.PbList<PhotosResponse> createRepeated() =>
      $pb.PbList<PhotosResponse>();
  @$core.pragma('dart2js:noInline')
  static PhotosResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PhotosResponse>(create);
  static PhotosResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$4.ArticlePhotoPb> get photos => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasMore => $_getBF(3);
  @$pb.TagNumber(4)
  set hasMore($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHasMore() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasMore() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get batchSize => $_getIZ(4);
  @$pb.TagNumber(5)
  set batchSize($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBatchSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearBatchSize() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
