//
//  Generated code. Do not modify.
//  source: article/article_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../common/g_common.pb.dart' as $1;
import 'article.pb.dart' as $3;
import 'article_service.pb.dart' as $2;
import 'category.pb.dart' as $4;

export 'article_service.pb.dart';

@$pb.GrpcServiceName('weebi.article.service.ArticleService')
class ArticleServiceClient extends $grpc.Client {
  static final _$createOne = $grpc.ClientMethod<$2.ArticleRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/createOne',
      ($2.ArticleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readOne = $grpc.ClientMethod<$2.FindArticleRequest, $3.CalibrePb>(
      '/weebi.article.service.ArticleService/readOne',
      ($2.FindArticleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.CalibrePb.fromBuffer(value));
  static final _$readAll = $grpc.ClientMethod<$2.ReadAllRequest, $2.ArticlesResponse>(
      '/weebi.article.service.ArticleService/readAll',
      ($2.ReadAllRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ArticlesResponse.fromBuffer(value));
  static final _$replaceOne = $grpc.ClientMethod<$2.ArticleRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/replaceOne',
      ($2.ArticleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOne = $grpc.ClientMethod<$2.ArticleRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/deleteOne',
      ($2.ArticleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOneCategory = $grpc.ClientMethod<$2.CategoryRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/createOneCategory',
      ($2.CategoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readOneCategory = $grpc.ClientMethod<$2.FindCategoryRequest, $4.CategoryPb>(
      '/weebi.article.service.ArticleService/readOneCategory',
      ($2.FindCategoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.CategoryPb.fromBuffer(value));
  static final _$readAllCategories = $grpc.ClientMethod<$2.ReadCategoriesRequest, $2.CategoriesResponse>(
      '/weebi.article.service.ArticleService/readAllCategories',
      ($2.ReadCategoriesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CategoriesResponse.fromBuffer(value));
  static final _$replaceOneCategory = $grpc.ClientMethod<$2.CategoryRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/replaceOneCategory',
      ($2.CategoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneCategory = $grpc.ClientMethod<$2.CategoryRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/deleteOneCategory',
      ($2.CategoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  ArticleServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.StatusResponse> createOne($2.ArticleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOne, request, options: options);
  }

  $grpc.ResponseFuture<$3.CalibrePb> readOne($2.FindArticleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOne, request, options: options);
  }

  $grpc.ResponseFuture<$2.ArticlesResponse> readAll($2.ReadAllRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAll, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> replaceOne($2.ArticleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$replaceOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOne($2.ArticleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneCategory($2.CategoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneCategory, request, options: options);
  }

  $grpc.ResponseFuture<$4.CategoryPb> readOneCategory($2.FindCategoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneCategory, request, options: options);
  }

  $grpc.ResponseFuture<$2.CategoriesResponse> readAllCategories($2.ReadCategoriesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllCategories, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> replaceOneCategory($2.CategoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$replaceOneCategory, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneCategory($2.CategoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneCategory, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.article.service.ArticleService')
abstract class ArticleServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.article.service.ArticleService';

  ArticleServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.ArticleRequest, $1.StatusResponse>(
        'createOne',
        createOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ArticleRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.FindArticleRequest, $3.CalibrePb>(
        'readOne',
        readOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.FindArticleRequest.fromBuffer(value),
        ($3.CalibrePb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ReadAllRequest, $2.ArticlesResponse>(
        'readAll',
        readAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ReadAllRequest.fromBuffer(value),
        ($2.ArticlesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ArticleRequest, $1.StatusResponse>(
        'replaceOne',
        replaceOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ArticleRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ArticleRequest, $1.StatusResponse>(
        'deleteOne',
        deleteOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ArticleRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CategoryRequest, $1.StatusResponse>(
        'createOneCategory',
        createOneCategory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CategoryRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.FindCategoryRequest, $4.CategoryPb>(
        'readOneCategory',
        readOneCategory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.FindCategoryRequest.fromBuffer(value),
        ($4.CategoryPb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ReadCategoriesRequest, $2.CategoriesResponse>(
        'readAllCategories',
        readAllCategories_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ReadCategoriesRequest.fromBuffer(value),
        ($2.CategoriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CategoryRequest, $1.StatusResponse>(
        'replaceOneCategory',
        replaceOneCategory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CategoryRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CategoryRequest, $1.StatusResponse>(
        'deleteOneCategory',
        deleteOneCategory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CategoryRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.StatusResponse> createOne_Pre($grpc.ServiceCall call, $async.Future<$2.ArticleRequest> request) async {
    return createOne(call, await request);
  }

  $async.Future<$3.CalibrePb> readOne_Pre($grpc.ServiceCall call, $async.Future<$2.FindArticleRequest> request) async {
    return readOne(call, await request);
  }

  $async.Future<$2.ArticlesResponse> readAll_Pre($grpc.ServiceCall call, $async.Future<$2.ReadAllRequest> request) async {
    return readAll(call, await request);
  }

  $async.Future<$1.StatusResponse> replaceOne_Pre($grpc.ServiceCall call, $async.Future<$2.ArticleRequest> request) async {
    return replaceOne(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOne_Pre($grpc.ServiceCall call, $async.Future<$2.ArticleRequest> request) async {
    return deleteOne(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneCategory_Pre($grpc.ServiceCall call, $async.Future<$2.CategoryRequest> request) async {
    return createOneCategory(call, await request);
  }

  $async.Future<$4.CategoryPb> readOneCategory_Pre($grpc.ServiceCall call, $async.Future<$2.FindCategoryRequest> request) async {
    return readOneCategory(call, await request);
  }

  $async.Future<$2.CategoriesResponse> readAllCategories_Pre($grpc.ServiceCall call, $async.Future<$2.ReadCategoriesRequest> request) async {
    return readAllCategories(call, await request);
  }

  $async.Future<$1.StatusResponse> replaceOneCategory_Pre($grpc.ServiceCall call, $async.Future<$2.CategoryRequest> request) async {
    return replaceOneCategory(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOneCategory_Pre($grpc.ServiceCall call, $async.Future<$2.CategoryRequest> request) async {
    return deleteOneCategory(call, await request);
  }

  $async.Future<$1.StatusResponse> createOne($grpc.ServiceCall call, $2.ArticleRequest request);
  $async.Future<$3.CalibrePb> readOne($grpc.ServiceCall call, $2.FindArticleRequest request);
  $async.Future<$2.ArticlesResponse> readAll($grpc.ServiceCall call, $2.ReadAllRequest request);
  $async.Future<$1.StatusResponse> replaceOne($grpc.ServiceCall call, $2.ArticleRequest request);
  $async.Future<$1.StatusResponse> deleteOne($grpc.ServiceCall call, $2.ArticleRequest request);
  $async.Future<$1.StatusResponse> createOneCategory($grpc.ServiceCall call, $2.CategoryRequest request);
  $async.Future<$4.CategoryPb> readOneCategory($grpc.ServiceCall call, $2.FindCategoryRequest request);
  $async.Future<$2.CategoriesResponse> readAllCategories($grpc.ServiceCall call, $2.ReadCategoriesRequest request);
  $async.Future<$1.StatusResponse> replaceOneCategory($grpc.ServiceCall call, $2.CategoryRequest request);
  $async.Future<$1.StatusResponse> deleteOneCategory($grpc.ServiceCall call, $2.CategoryRequest request);
}
