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
import 'photo.pb.dart' as $5;

export 'article_service.pb.dart';

@$pb.GrpcServiceName('weebi.article.service.ArticleService')
class ArticleServiceClient extends $grpc.Client {
  static final _$createOne = $grpc.ClientMethod<$2.CalibreRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/createOne',
      ($2.CalibreRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createMany = $grpc.ClientMethod<$2.CalibresRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/createMany',
      ($2.CalibresRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readOne = $grpc.ClientMethod<$2.ReadCalibreRequest, $3.CalibrePb>(
      '/weebi.article.service.ArticleService/readOne',
      ($2.ReadCalibreRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.CalibrePb.fromBuffer(value));
  static final _$readAll = $grpc.ClientMethod<$2.ReadAllRequest, $2.CalibresResponse>(
      '/weebi.article.service.ArticleService/readAll',
      ($2.ReadAllRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CalibresResponse.fromBuffer(value));
  static final _$readAllIds = $grpc.ClientMethod<$2.ReadIdsRequest, $2.CalibresIdsResponse>(
      '/weebi.article.service.ArticleService/readAllIds',
      ($2.ReadIdsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CalibresIdsResponse.fromBuffer(value));
  static final _$updateOne = $grpc.ClientMethod<$2.CalibreRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/updateOne',
      ($2.CalibreRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOne = $grpc.ClientMethod<$2.CalibreRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/deleteOne',
      ($2.CalibreRequest value) => value.writeToBuffer(),
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
  static final _$updateOneCategory = $grpc.ClientMethod<$2.CategoryRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/updateOneCategory',
      ($2.CategoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOneCategory = $grpc.ClientMethod<$2.CategoryRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/deleteOneCategory',
      ($2.CategoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOnePhoto = $grpc.ClientMethod<$2.PhotoRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/createOnePhoto',
      ($2.PhotoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createManyPhotos = $grpc.ClientMethod<$2.PhotosRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/createManyPhotos',
      ($2.PhotosRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readOnePhoto = $grpc.ClientMethod<$2.FindPhotoRequest, $5.ArticlePhotoPb>(
      '/weebi.article.service.ArticleService/readOnePhoto',
      ($2.FindPhotoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.ArticlePhotoPb.fromBuffer(value));
  static final _$readAllPhotos = $grpc.ClientMethod<$2.ReadPhotosRequest, $2.PhotosResponse>(
      '/weebi.article.service.ArticleService/readAllPhotos',
      ($2.ReadPhotosRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.PhotosResponse.fromBuffer(value));
  static final _$updateOnePhoto = $grpc.ClientMethod<$2.PhotoRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/updateOnePhoto',
      ($2.PhotoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOnePhoto = $grpc.ClientMethod<$2.PhotoRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/deleteOnePhoto',
      ($2.PhotoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  ArticleServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.StatusResponse> createOne($2.CalibreRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createMany($2.CalibresRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMany, request, options: options);
  }

  $grpc.ResponseFuture<$3.CalibrePb> readOne($2.ReadCalibreRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOne, request, options: options);
  }

  $grpc.ResponseFuture<$2.CalibresResponse> readAll($2.ReadAllRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAll, request, options: options);
  }

  $grpc.ResponseFuture<$2.CalibresIdsResponse> readAllIds($2.ReadIdsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllIds, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOne($2.CalibreRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOne($2.CalibreRequest request, {$grpc.CallOptions? options}) {
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

  $grpc.ResponseFuture<$1.StatusResponse> updateOneCategory($2.CategoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneCategory, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneCategory($2.CategoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOneCategory, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOnePhoto($2.PhotoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOnePhoto, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createManyPhotos($2.PhotosRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createManyPhotos, request, options: options);
  }

  $grpc.ResponseFuture<$5.ArticlePhotoPb> readOnePhoto($2.FindPhotoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOnePhoto, request, options: options);
  }

  $grpc.ResponseFuture<$2.PhotosResponse> readAllPhotos($2.ReadPhotosRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAllPhotos, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOnePhoto($2.PhotoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOnePhoto, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOnePhoto($2.PhotoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOnePhoto, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.article.service.ArticleService')
abstract class ArticleServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.article.service.ArticleService';

  ArticleServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.CalibreRequest, $1.StatusResponse>(
        'createOne',
        createOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CalibreRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CalibresRequest, $1.StatusResponse>(
        'createMany',
        createMany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CalibresRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ReadCalibreRequest, $3.CalibrePb>(
        'readOne',
        readOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ReadCalibreRequest.fromBuffer(value),
        ($3.CalibrePb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ReadAllRequest, $2.CalibresResponse>(
        'readAll',
        readAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ReadAllRequest.fromBuffer(value),
        ($2.CalibresResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ReadIdsRequest, $2.CalibresIdsResponse>(
        'readAllIds',
        readAllIds_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ReadIdsRequest.fromBuffer(value),
        ($2.CalibresIdsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CalibreRequest, $1.StatusResponse>(
        'updateOne',
        updateOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CalibreRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CalibreRequest, $1.StatusResponse>(
        'deleteOne',
        deleteOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CalibreRequest.fromBuffer(value),
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
        'updateOneCategory',
        updateOneCategory_Pre,
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
    $addMethod($grpc.ServiceMethod<$2.PhotoRequest, $1.StatusResponse>(
        'createOnePhoto',
        createOnePhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.PhotoRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.PhotosRequest, $1.StatusResponse>(
        'createManyPhotos',
        createManyPhotos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.PhotosRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.FindPhotoRequest, $5.ArticlePhotoPb>(
        'readOnePhoto',
        readOnePhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.FindPhotoRequest.fromBuffer(value),
        ($5.ArticlePhotoPb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ReadPhotosRequest, $2.PhotosResponse>(
        'readAllPhotos',
        readAllPhotos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ReadPhotosRequest.fromBuffer(value),
        ($2.PhotosResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.PhotoRequest, $1.StatusResponse>(
        'updateOnePhoto',
        updateOnePhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.PhotoRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.PhotoRequest, $1.StatusResponse>(
        'deleteOnePhoto',
        deleteOnePhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.PhotoRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.StatusResponse> createOne_Pre($grpc.ServiceCall call, $async.Future<$2.CalibreRequest> request) async {
    return createOne(call, await request);
  }

  $async.Future<$1.StatusResponse> createMany_Pre($grpc.ServiceCall call, $async.Future<$2.CalibresRequest> request) async {
    return createMany(call, await request);
  }

  $async.Future<$3.CalibrePb> readOne_Pre($grpc.ServiceCall call, $async.Future<$2.ReadCalibreRequest> request) async {
    return readOne(call, await request);
  }

  $async.Future<$2.CalibresResponse> readAll_Pre($grpc.ServiceCall call, $async.Future<$2.ReadAllRequest> request) async {
    return readAll(call, await request);
  }

  $async.Future<$2.CalibresIdsResponse> readAllIds_Pre($grpc.ServiceCall call, $async.Future<$2.ReadIdsRequest> request) async {
    return readAllIds(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOne_Pre($grpc.ServiceCall call, $async.Future<$2.CalibreRequest> request) async {
    return updateOne(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOne_Pre($grpc.ServiceCall call, $async.Future<$2.CalibreRequest> request) async {
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

  $async.Future<$1.StatusResponse> updateOneCategory_Pre($grpc.ServiceCall call, $async.Future<$2.CategoryRequest> request) async {
    return updateOneCategory(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOneCategory_Pre($grpc.ServiceCall call, $async.Future<$2.CategoryRequest> request) async {
    return deleteOneCategory(call, await request);
  }

  $async.Future<$1.StatusResponse> createOnePhoto_Pre($grpc.ServiceCall call, $async.Future<$2.PhotoRequest> request) async {
    return createOnePhoto(call, await request);
  }

  $async.Future<$1.StatusResponse> createManyPhotos_Pre($grpc.ServiceCall call, $async.Future<$2.PhotosRequest> request) async {
    return createManyPhotos(call, await request);
  }

  $async.Future<$5.ArticlePhotoPb> readOnePhoto_Pre($grpc.ServiceCall call, $async.Future<$2.FindPhotoRequest> request) async {
    return readOnePhoto(call, await request);
  }

  $async.Future<$2.PhotosResponse> readAllPhotos_Pre($grpc.ServiceCall call, $async.Future<$2.ReadPhotosRequest> request) async {
    return readAllPhotos(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOnePhoto_Pre($grpc.ServiceCall call, $async.Future<$2.PhotoRequest> request) async {
    return updateOnePhoto(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOnePhoto_Pre($grpc.ServiceCall call, $async.Future<$2.PhotoRequest> request) async {
    return deleteOnePhoto(call, await request);
  }

  $async.Future<$1.StatusResponse> createOne($grpc.ServiceCall call, $2.CalibreRequest request);
  $async.Future<$1.StatusResponse> createMany($grpc.ServiceCall call, $2.CalibresRequest request);
  $async.Future<$3.CalibrePb> readOne($grpc.ServiceCall call, $2.ReadCalibreRequest request);
  $async.Future<$2.CalibresResponse> readAll($grpc.ServiceCall call, $2.ReadAllRequest request);
  $async.Future<$2.CalibresIdsResponse> readAllIds($grpc.ServiceCall call, $2.ReadIdsRequest request);
  $async.Future<$1.StatusResponse> updateOne($grpc.ServiceCall call, $2.CalibreRequest request);
  $async.Future<$1.StatusResponse> deleteOne($grpc.ServiceCall call, $2.CalibreRequest request);
  $async.Future<$1.StatusResponse> createOneCategory($grpc.ServiceCall call, $2.CategoryRequest request);
  $async.Future<$4.CategoryPb> readOneCategory($grpc.ServiceCall call, $2.FindCategoryRequest request);
  $async.Future<$2.CategoriesResponse> readAllCategories($grpc.ServiceCall call, $2.ReadCategoriesRequest request);
  $async.Future<$1.StatusResponse> updateOneCategory($grpc.ServiceCall call, $2.CategoryRequest request);
  $async.Future<$1.StatusResponse> deleteOneCategory($grpc.ServiceCall call, $2.CategoryRequest request);
  $async.Future<$1.StatusResponse> createOnePhoto($grpc.ServiceCall call, $2.PhotoRequest request);
  $async.Future<$1.StatusResponse> createManyPhotos($grpc.ServiceCall call, $2.PhotosRequest request);
  $async.Future<$5.ArticlePhotoPb> readOnePhoto($grpc.ServiceCall call, $2.FindPhotoRequest request);
  $async.Future<$2.PhotosResponse> readAllPhotos($grpc.ServiceCall call, $2.ReadPhotosRequest request);
  $async.Future<$1.StatusResponse> updateOnePhoto($grpc.ServiceCall call, $2.PhotoRequest request);
  $async.Future<$1.StatusResponse> deleteOnePhoto($grpc.ServiceCall call, $2.PhotoRequest request);
}
