//
//  Generated code. Do not modify.
//  source: article/article_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../common/g_timestamp.pb.dart' as $19;
import 'article.pb.dart' as $3;
import 'category.pb.dart' as $4;
import 'photo.pb.dart' as $5;

/// / A Calibre includes Articles
class FindCalibreRequest extends $pb.GeneratedMessage {
  factory FindCalibreRequest({
    $core.String? chainId,
    $core.String? title,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (title != null) {
      $result.title = title;
    }
    return $result;
  }
  FindCalibreRequest._() : super();
  factory FindCalibreRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindCalibreRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindCalibreRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindCalibreRequest clone() => FindCalibreRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindCalibreRequest copyWith(void Function(FindCalibreRequest) updates) => super.copyWith((message) => updates(message as FindCalibreRequest)) as FindCalibreRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindCalibreRequest create() => FindCalibreRequest._();
  FindCalibreRequest createEmptyInstance() => create();
  static $pb.PbList<FindCalibreRequest> createRepeated() => $pb.PbList<FindCalibreRequest>();
  @$core.pragma('dart2js:noInline')
  static FindCalibreRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindCalibreRequest>(create);
  static FindCalibreRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);
}

class ReadAllRequest extends $pb.GeneratedMessage {
  factory ReadAllRequest({
    $core.String? chainId,
    $19.Timestamp? lastFetchTimestampUTC,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (lastFetchTimestampUTC != null) {
      $result.lastFetchTimestampUTC = lastFetchTimestampUTC;
    }
    return $result;
  }
  ReadAllRequest._() : super();
  factory ReadAllRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadAllRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadAllRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$19.Timestamp>(2, _omitFieldNames ? '' : 'lastFetchTimestampUTC', protoName: 'lastFetchTimestampUTC', subBuilder: $19.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadAllRequest clone() => ReadAllRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadAllRequest copyWith(void Function(ReadAllRequest) updates) => super.copyWith((message) => updates(message as ReadAllRequest)) as ReadAllRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadAllRequest create() => ReadAllRequest._();
  ReadAllRequest createEmptyInstance() => create();
  static $pb.PbList<ReadAllRequest> createRepeated() => $pb.PbList<ReadAllRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadAllRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadAllRequest>(create);
  static ReadAllRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  /// optional used for weebi_app device back online
  @$pb.TagNumber(2)
  $19.Timestamp get lastFetchTimestampUTC => $_getN(1);
  @$pb.TagNumber(2)
  set lastFetchTimestampUTC($19.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastFetchTimestampUTC() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastFetchTimestampUTC() => clearField(2);
  @$pb.TagNumber(2)
  $19.Timestamp ensureLastFetchTimestampUTC() => $_ensure(1);
}

class CalibreRequest extends $pb.GeneratedMessage {
  factory CalibreRequest({
    $core.String? chainId,
    $3.CalibrePb? calibre,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (calibre != null) {
      $result.calibre = calibre;
    }
    return $result;
  }
  CalibreRequest._() : super();
  factory CalibreRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CalibreRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CalibreRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$3.CalibrePb>(2, _omitFieldNames ? '' : 'calibre', subBuilder: $3.CalibrePb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CalibreRequest clone() => CalibreRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CalibreRequest copyWith(void Function(CalibreRequest) updates) => super.copyWith((message) => updates(message as CalibreRequest)) as CalibreRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalibreRequest create() => CalibreRequest._();
  CalibreRequest createEmptyInstance() => create();
  static $pb.PbList<CalibreRequest> createRepeated() => $pb.PbList<CalibreRequest>();
  @$core.pragma('dart2js:noInline')
  static CalibreRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalibreRequest>(create);
  static CalibreRequest? _defaultInstance;

  /// below in case mutiple chains, permission check will still be applied to verify
  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $3.CalibrePb get calibre => $_getN(1);
  @$pb.TagNumber(2)
  set calibre($3.CalibrePb v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCalibre() => $_has(1);
  @$pb.TagNumber(2)
  void clearCalibre() => clearField(2);
  @$pb.TagNumber(2)
  $3.CalibrePb ensureCalibre() => $_ensure(1);
}

class CalibresRequest extends $pb.GeneratedMessage {
  factory CalibresRequest({
    $core.String? chainId,
    $core.Iterable<$3.CalibrePb>? calibres,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (calibres != null) {
      $result.calibres.addAll(calibres);
    }
    return $result;
  }
  CalibresRequest._() : super();
  factory CalibresRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CalibresRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CalibresRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..pc<$3.CalibrePb>(2, _omitFieldNames ? '' : 'calibres', $pb.PbFieldType.PM, subBuilder: $3.CalibrePb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CalibresRequest clone() => CalibresRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CalibresRequest copyWith(void Function(CalibresRequest) updates) => super.copyWith((message) => updates(message as CalibresRequest)) as CalibresRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalibresRequest create() => CalibresRequest._();
  CalibresRequest createEmptyInstance() => create();
  static $pb.PbList<CalibresRequest> createRepeated() => $pb.PbList<CalibresRequest>();
  @$core.pragma('dart2js:noInline')
  static CalibresRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalibresRequest>(create);
  static CalibresRequest? _defaultInstance;

  /// below in case mutiple chains, permission check will still be applied to verify
  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$3.CalibrePb> get calibres => $_getList(1);
}

class CalibresResponse extends $pb.GeneratedMessage {
  factory CalibresResponse({
    $core.Iterable<$3.CalibrePb>? calibres,
  }) {
    final $result = create();
    if (calibres != null) {
      $result.calibres.addAll(calibres);
    }
    return $result;
  }
  CalibresResponse._() : super();
  factory CalibresResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CalibresResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CalibresResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..pc<$3.CalibrePb>(1, _omitFieldNames ? '' : 'calibres', $pb.PbFieldType.PM, subBuilder: $3.CalibrePb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CalibresResponse clone() => CalibresResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CalibresResponse copyWith(void Function(CalibresResponse) updates) => super.copyWith((message) => updates(message as CalibresResponse)) as CalibresResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalibresResponse create() => CalibresResponse._();
  CalibresResponse createEmptyInstance() => create();
  static $pb.PbList<CalibresResponse> createRepeated() => $pb.PbList<CalibresResponse>();
  @$core.pragma('dart2js:noInline')
  static CalibresResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalibresResponse>(create);
  static CalibresResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.CalibrePb> get calibres => $_getList(0);
}

/// / categories
class FindCategoryRequest extends $pb.GeneratedMessage {
  factory FindCategoryRequest({
    $core.String? chainId,
    $core.String? title,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (title != null) {
      $result.title = title;
    }
    return $result;
  }
  FindCategoryRequest._() : super();
  factory FindCategoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindCategoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindCategoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindCategoryRequest clone() => FindCategoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindCategoryRequest copyWith(void Function(FindCategoryRequest) updates) => super.copyWith((message) => updates(message as FindCategoryRequest)) as FindCategoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindCategoryRequest create() => FindCategoryRequest._();
  FindCategoryRequest createEmptyInstance() => create();
  static $pb.PbList<FindCategoryRequest> createRepeated() => $pb.PbList<FindCategoryRequest>();
  @$core.pragma('dart2js:noInline')
  static FindCategoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindCategoryRequest>(create);
  static FindCategoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);
}

class ReadCategoriesRequest extends $pb.GeneratedMessage {
  factory ReadCategoriesRequest({
    $core.String? chainId,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    return $result;
  }
  ReadCategoriesRequest._() : super();
  factory ReadCategoriesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadCategoriesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadCategoriesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadCategoriesRequest clone() => ReadCategoriesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadCategoriesRequest copyWith(void Function(ReadCategoriesRequest) updates) => super.copyWith((message) => updates(message as ReadCategoriesRequest)) as ReadCategoriesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadCategoriesRequest create() => ReadCategoriesRequest._();
  ReadCategoriesRequest createEmptyInstance() => create();
  static $pb.PbList<ReadCategoriesRequest> createRepeated() => $pb.PbList<ReadCategoriesRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadCategoriesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadCategoriesRequest>(create);
  static ReadCategoriesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);
}

class CategoryRequest extends $pb.GeneratedMessage {
  factory CategoryRequest({
    $core.String? chainId,
    $4.CategoryPb? category,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (category != null) {
      $result.category = category;
    }
    return $result;
  }
  CategoryRequest._() : super();
  factory CategoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CategoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CategoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$4.CategoryPb>(2, _omitFieldNames ? '' : 'category', subBuilder: $4.CategoryPb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CategoryRequest clone() => CategoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CategoryRequest copyWith(void Function(CategoryRequest) updates) => super.copyWith((message) => updates(message as CategoryRequest)) as CategoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CategoryRequest create() => CategoryRequest._();
  CategoryRequest createEmptyInstance() => create();
  static $pb.PbList<CategoryRequest> createRepeated() => $pb.PbList<CategoryRequest>();
  @$core.pragma('dart2js:noInline')
  static CategoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CategoryRequest>(create);
  static CategoryRequest? _defaultInstance;

  /// below in case mutiple chains, permission check will still be applied to verify
  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $4.CategoryPb get category => $_getN(1);
  @$pb.TagNumber(2)
  set category($4.CategoryPb v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => clearField(2);
  @$pb.TagNumber(2)
  $4.CategoryPb ensureCategory() => $_ensure(1);
}

class CategoriesResponse extends $pb.GeneratedMessage {
  factory CategoriesResponse({
    $core.Iterable<$4.CategoryPb>? categories,
  }) {
    final $result = create();
    if (categories != null) {
      $result.categories.addAll(categories);
    }
    return $result;
  }
  CategoriesResponse._() : super();
  factory CategoriesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CategoriesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CategoriesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..pc<$4.CategoryPb>(1, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM, subBuilder: $4.CategoryPb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CategoriesResponse clone() => CategoriesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CategoriesResponse copyWith(void Function(CategoriesResponse) updates) => super.copyWith((message) => updates(message as CategoriesResponse)) as CategoriesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CategoriesResponse create() => CategoriesResponse._();
  CategoriesResponse createEmptyInstance() => create();
  static $pb.PbList<CategoriesResponse> createRepeated() => $pb.PbList<CategoriesResponse>();
  @$core.pragma('dart2js:noInline')
  static CategoriesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CategoriesResponse>(create);
  static CategoriesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$4.CategoryPb> get categories => $_getList(0);
}

/// / Photos
class FindPhotoRequest extends $pb.GeneratedMessage {
  factory FindPhotoRequest({
    $core.String? chainId,
    $core.String? calibreId,
    $core.String? id,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (calibreId != null) {
      $result.calibreId = calibreId;
    }
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  FindPhotoRequest._() : super();
  factory FindPhotoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindPhotoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindPhotoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aOS(3, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindPhotoRequest clone() => FindPhotoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindPhotoRequest copyWith(void Function(FindPhotoRequest) updates) => super.copyWith((message) => updates(message as FindPhotoRequest)) as FindPhotoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindPhotoRequest create() => FindPhotoRequest._();
  FindPhotoRequest createEmptyInstance() => create();
  static $pb.PbList<FindPhotoRequest> createRepeated() => $pb.PbList<FindPhotoRequest>();
  @$core.pragma('dart2js:noInline')
  static FindPhotoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindPhotoRequest>(create);
  static FindPhotoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get calibreId => $_getSZ(1);
  @$pb.TagNumber(2)
  set calibreId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCalibreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCalibreId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get id => $_getSZ(2);
  @$pb.TagNumber(3)
  set id($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);
}

class ReadPhotosRequest extends $pb.GeneratedMessage {
  factory ReadPhotosRequest({
    $core.String? chainId,
    $19.Timestamp? lastFetchTimestampUTC,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (lastFetchTimestampUTC != null) {
      $result.lastFetchTimestampUTC = lastFetchTimestampUTC;
    }
    return $result;
  }
  ReadPhotosRequest._() : super();
  factory ReadPhotosRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadPhotosRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadPhotosRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$19.Timestamp>(2, _omitFieldNames ? '' : 'lastFetchTimestampUTC', protoName: 'lastFetchTimestampUTC', subBuilder: $19.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadPhotosRequest clone() => ReadPhotosRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadPhotosRequest copyWith(void Function(ReadPhotosRequest) updates) => super.copyWith((message) => updates(message as ReadPhotosRequest)) as ReadPhotosRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadPhotosRequest create() => ReadPhotosRequest._();
  ReadPhotosRequest createEmptyInstance() => create();
  static $pb.PbList<ReadPhotosRequest> createRepeated() => $pb.PbList<ReadPhotosRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadPhotosRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadPhotosRequest>(create);
  static ReadPhotosRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $19.Timestamp get lastFetchTimestampUTC => $_getN(1);
  @$pb.TagNumber(2)
  set lastFetchTimestampUTC($19.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastFetchTimestampUTC() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastFetchTimestampUTC() => clearField(2);
  @$pb.TagNumber(2)
  $19.Timestamp ensureLastFetchTimestampUTC() => $_ensure(1);
}

class PhotoRequest extends $pb.GeneratedMessage {
  factory PhotoRequest({
    $core.String? chainId,
    $5.ArticlePhotoPb? photo,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (photo != null) {
      $result.photo = photo;
    }
    return $result;
  }
  PhotoRequest._() : super();
  factory PhotoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PhotoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PhotoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$5.ArticlePhotoPb>(2, _omitFieldNames ? '' : 'photo', subBuilder: $5.ArticlePhotoPb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PhotoRequest clone() => PhotoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PhotoRequest copyWith(void Function(PhotoRequest) updates) => super.copyWith((message) => updates(message as PhotoRequest)) as PhotoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhotoRequest create() => PhotoRequest._();
  PhotoRequest createEmptyInstance() => create();
  static $pb.PbList<PhotoRequest> createRepeated() => $pb.PbList<PhotoRequest>();
  @$core.pragma('dart2js:noInline')
  static PhotoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhotoRequest>(create);
  static PhotoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $5.ArticlePhotoPb get photo => $_getN(1);
  @$pb.TagNumber(2)
  set photo($5.ArticlePhotoPb v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhoto() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhoto() => clearField(2);
  @$pb.TagNumber(2)
  $5.ArticlePhotoPb ensurePhoto() => $_ensure(1);
}

class PhotosRequest extends $pb.GeneratedMessage {
  factory PhotosRequest({
    $core.String? chainId,
    $core.Iterable<$5.ArticlePhotoPb>? photos,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (photos != null) {
      $result.photos.addAll(photos);
    }
    return $result;
  }
  PhotosRequest._() : super();
  factory PhotosRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PhotosRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PhotosRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..pc<$5.ArticlePhotoPb>(2, _omitFieldNames ? '' : 'photos', $pb.PbFieldType.PM, subBuilder: $5.ArticlePhotoPb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PhotosRequest clone() => PhotosRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PhotosRequest copyWith(void Function(PhotosRequest) updates) => super.copyWith((message) => updates(message as PhotosRequest)) as PhotosRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhotosRequest create() => PhotosRequest._();
  PhotosRequest createEmptyInstance() => create();
  static $pb.PbList<PhotosRequest> createRepeated() => $pb.PbList<PhotosRequest>();
  @$core.pragma('dart2js:noInline')
  static PhotosRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhotosRequest>(create);
  static PhotosRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$5.ArticlePhotoPb> get photos => $_getList(1);
}

class PhotosResponse extends $pb.GeneratedMessage {
  factory PhotosResponse({
    $core.Iterable<$5.ArticlePhotoPb>? photos,
  }) {
    final $result = create();
    if (photos != null) {
      $result.photos.addAll(photos);
    }
    return $result;
  }
  PhotosResponse._() : super();
  factory PhotosResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PhotosResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PhotosResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..pc<$5.ArticlePhotoPb>(1, _omitFieldNames ? '' : 'photos', $pb.PbFieldType.PM, subBuilder: $5.ArticlePhotoPb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PhotosResponse clone() => PhotosResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PhotosResponse copyWith(void Function(PhotosResponse) updates) => super.copyWith((message) => updates(message as PhotosResponse)) as PhotosResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhotosResponse create() => PhotosResponse._();
  PhotosResponse createEmptyInstance() => create();
  static $pb.PbList<PhotosResponse> createRepeated() => $pb.PbList<PhotosResponse>();
  @$core.pragma('dart2js:noInline')
  static PhotosResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhotosResponse>(create);
  static PhotosResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$5.ArticlePhotoPb> get photos => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
