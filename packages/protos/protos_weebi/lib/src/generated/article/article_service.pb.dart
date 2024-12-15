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

import 'article.pb.dart' as $3;
import 'category.pb.dart' as $4;

class FindArticleRequest extends $pb.GeneratedMessage {
  factory FindArticleRequest({
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
  FindArticleRequest._() : super();
  factory FindArticleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindArticleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindArticleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindArticleRequest clone() => FindArticleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindArticleRequest copyWith(void Function(FindArticleRequest) updates) => super.copyWith((message) => updates(message as FindArticleRequest)) as FindArticleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindArticleRequest create() => FindArticleRequest._();
  FindArticleRequest createEmptyInstance() => create();
  static $pb.PbList<FindArticleRequest> createRepeated() => $pb.PbList<FindArticleRequest>();
  @$core.pragma('dart2js:noInline')
  static FindArticleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindArticleRequest>(create);
  static FindArticleRequest? _defaultInstance;

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
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    return $result;
  }
  ReadAllRequest._() : super();
  factory ReadAllRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadAllRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadAllRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
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
}

class ArticleRequest extends $pb.GeneratedMessage {
  factory ArticleRequest({
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
  ArticleRequest._() : super();
  factory ArticleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ArticleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$3.CalibrePb>(2, _omitFieldNames ? '' : 'calibre', subBuilder: $3.CalibrePb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArticleRequest clone() => ArticleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArticleRequest copyWith(void Function(ArticleRequest) updates) => super.copyWith((message) => updates(message as ArticleRequest)) as ArticleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticleRequest create() => ArticleRequest._();
  ArticleRequest createEmptyInstance() => create();
  static $pb.PbList<ArticleRequest> createRepeated() => $pb.PbList<ArticleRequest>();
  @$core.pragma('dart2js:noInline')
  static ArticleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticleRequest>(create);
  static ArticleRequest? _defaultInstance;

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

class ArticlesResponse extends $pb.GeneratedMessage {
  factory ArticlesResponse({
    $core.Iterable<$3.CalibrePb>? calibres,
  }) {
    final $result = create();
    if (calibres != null) {
      $result.calibres.addAll(calibres);
    }
    return $result;
  }
  ArticlesResponse._() : super();
  factory ArticlesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticlesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ArticlesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article.service'), createEmptyInstance: create)
    ..pc<$3.CalibrePb>(1, _omitFieldNames ? '' : 'calibres', $pb.PbFieldType.PM, subBuilder: $3.CalibrePb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArticlesResponse clone() => ArticlesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArticlesResponse copyWith(void Function(ArticlesResponse) updates) => super.copyWith((message) => updates(message as ArticlesResponse)) as ArticlesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticlesResponse create() => ArticlesResponse._();
  ArticlesResponse createEmptyInstance() => create();
  static $pb.PbList<ArticlesResponse> createRepeated() => $pb.PbList<ArticlesResponse>();
  @$core.pragma('dart2js:noInline')
  static ArticlesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticlesResponse>(create);
  static ArticlesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.CalibrePb> get calibres => $_getList(0);
}

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

/// / categories
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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
