// This is a generated file - do not edit.
//
// Generated from article/article_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../common/g_common.pb.dart' as $1;
import 'article.pb.dart' as $2;
import 'article_service.pb.dart' as $0;
import 'category.pb.dart' as $3;
import 'photo.pb.dart' as $4;

export 'article_service.pb.dart';

/// / articles are contained in calibres
/// / we keep article as the service name for clarity
/// / but the list of objects are Calibres and we use calibreId
@$pb.GrpcServiceName('weebi.article.service.ArticleService')
class ArticleServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ArticleServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.StatusResponse> createOne(
    $0.CalibreRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createMany(
    $0.CalibresRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createMany, request, options: options);
  }

  $grpc.ResponseFuture<$2.CalibrePb> readOne(
    $0.ReadCalibreRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readOne, request, options: options);
  }

  /// / use [lastFetchTimestampUTC] to only read the latest changes since last fetch
  $grpc.ResponseFuture<$0.CalibresResponse> readAll(
    $0.ReadAllRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readAll, request, options: options);
  }

  $grpc.ResponseFuture<$0.CalibresIdsResponse> readAllIds(
    $0.ReadIdsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readAllIds, request, options: options);
  }

  /// / update == upsert (replaceOne upsert)
  $grpc.ResponseFuture<$1.StatusResponse> updateOne(
    $0.CalibreRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateOne, request, options: options);
  }

  /// / hard delete
  $grpc.ResponseFuture<$1.StatusResponse> deleteOne(
    $0.CalibreRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteOne, request, options: options);
  }

  /// /
  /// / category
  /// /
  $grpc.ResponseFuture<$1.StatusResponse> createOneCategory(
    $0.CategoryRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createOneCategory, request, options: options);
  }

  $grpc.ResponseFuture<$3.CategoryPb> readOneCategory(
    $0.FindCategoryRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readOneCategory, request, options: options);
  }

  $grpc.ResponseFuture<$0.CategoriesResponse> readAllCategories(
    $0.ReadCategoriesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readAllCategories, request, options: options);
  }

  /// / upsert works with replaceOne upsert true
  $grpc.ResponseFuture<$1.StatusResponse> updateOneCategory(
    $0.CategoryRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateOneCategory, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOneCategory(
    $0.CategoryRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteOneCategory, request, options: options);
  }

  /// /
  /// / photo
  /// /
  $grpc.ResponseFuture<$1.StatusResponse> createOnePhoto(
    $0.PhotoRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createOnePhoto, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createManyPhotos(
    $0.PhotosRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createManyPhotos, request, options: options);
  }

  $grpc.ResponseFuture<$4.ArticlePhotoPb> readOnePhoto(
    $0.FindPhotoRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readOnePhoto, request, options: options);
  }

  /// / use [lastFetchTimestampUTC] to only read the latest changes since last fetch
  $grpc.ResponseFuture<$0.PhotosResponse> readAllPhotos(
    $0.ReadPhotosRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readAllPhotos, request, options: options);
  }

  /// / upsert
  $grpc.ResponseFuture<$1.StatusResponse> updateOnePhoto(
    $0.PhotoRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateOnePhoto, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOnePhoto(
    $0.PhotoRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteOnePhoto, request, options: options);
  }

  // method descriptors

  static final _$createOne =
      $grpc.ClientMethod<$0.CalibreRequest, $1.StatusResponse>(
          '/weebi.article.service.ArticleService/createOne',
          ($0.CalibreRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$createMany =
      $grpc.ClientMethod<$0.CalibresRequest, $1.StatusResponse>(
          '/weebi.article.service.ArticleService/createMany',
          ($0.CalibresRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$readOne =
      $grpc.ClientMethod<$0.ReadCalibreRequest, $2.CalibrePb>(
          '/weebi.article.service.ArticleService/readOne',
          ($0.ReadCalibreRequest value) => value.writeToBuffer(),
          $2.CalibrePb.fromBuffer);
  static final _$readAll =
      $grpc.ClientMethod<$0.ReadAllRequest, $0.CalibresResponse>(
          '/weebi.article.service.ArticleService/readAll',
          ($0.ReadAllRequest value) => value.writeToBuffer(),
          $0.CalibresResponse.fromBuffer);
  static final _$readAllIds =
      $grpc.ClientMethod<$0.ReadIdsRequest, $0.CalibresIdsResponse>(
          '/weebi.article.service.ArticleService/readAllIds',
          ($0.ReadIdsRequest value) => value.writeToBuffer(),
          $0.CalibresIdsResponse.fromBuffer);
  static final _$updateOne =
      $grpc.ClientMethod<$0.CalibreRequest, $1.StatusResponse>(
          '/weebi.article.service.ArticleService/updateOne',
          ($0.CalibreRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$deleteOne =
      $grpc.ClientMethod<$0.CalibreRequest, $1.StatusResponse>(
          '/weebi.article.service.ArticleService/deleteOne',
          ($0.CalibreRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$createOneCategory =
      $grpc.ClientMethod<$0.CategoryRequest, $1.StatusResponse>(
          '/weebi.article.service.ArticleService/createOneCategory',
          ($0.CategoryRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$readOneCategory =
      $grpc.ClientMethod<$0.FindCategoryRequest, $3.CategoryPb>(
          '/weebi.article.service.ArticleService/readOneCategory',
          ($0.FindCategoryRequest value) => value.writeToBuffer(),
          $3.CategoryPb.fromBuffer);
  static final _$readAllCategories =
      $grpc.ClientMethod<$0.ReadCategoriesRequest, $0.CategoriesResponse>(
          '/weebi.article.service.ArticleService/readAllCategories',
          ($0.ReadCategoriesRequest value) => value.writeToBuffer(),
          $0.CategoriesResponse.fromBuffer);
  static final _$updateOneCategory =
      $grpc.ClientMethod<$0.CategoryRequest, $1.StatusResponse>(
          '/weebi.article.service.ArticleService/updateOneCategory',
          ($0.CategoryRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$deleteOneCategory =
      $grpc.ClientMethod<$0.CategoryRequest, $1.StatusResponse>(
          '/weebi.article.service.ArticleService/deleteOneCategory',
          ($0.CategoryRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$createOnePhoto =
      $grpc.ClientMethod<$0.PhotoRequest, $1.StatusResponse>(
          '/weebi.article.service.ArticleService/createOnePhoto',
          ($0.PhotoRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$createManyPhotos =
      $grpc.ClientMethod<$0.PhotosRequest, $1.StatusResponse>(
          '/weebi.article.service.ArticleService/createManyPhotos',
          ($0.PhotosRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$readOnePhoto =
      $grpc.ClientMethod<$0.FindPhotoRequest, $4.ArticlePhotoPb>(
          '/weebi.article.service.ArticleService/readOnePhoto',
          ($0.FindPhotoRequest value) => value.writeToBuffer(),
          $4.ArticlePhotoPb.fromBuffer);
  static final _$readAllPhotos =
      $grpc.ClientMethod<$0.ReadPhotosRequest, $0.PhotosResponse>(
          '/weebi.article.service.ArticleService/readAllPhotos',
          ($0.ReadPhotosRequest value) => value.writeToBuffer(),
          $0.PhotosResponse.fromBuffer);
  static final _$updateOnePhoto =
      $grpc.ClientMethod<$0.PhotoRequest, $1.StatusResponse>(
          '/weebi.article.service.ArticleService/updateOnePhoto',
          ($0.PhotoRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
  static final _$deleteOnePhoto =
      $grpc.ClientMethod<$0.PhotoRequest, $1.StatusResponse>(
          '/weebi.article.service.ArticleService/deleteOnePhoto',
          ($0.PhotoRequest value) => value.writeToBuffer(),
          $1.StatusResponse.fromBuffer);
}

@$pb.GrpcServiceName('weebi.article.service.ArticleService')
abstract class ArticleServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.article.service.ArticleService';

  ArticleServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CalibreRequest, $1.StatusResponse>(
        'createOne',
        createOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CalibreRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CalibresRequest, $1.StatusResponse>(
        'createMany',
        createMany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CalibresRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReadCalibreRequest, $2.CalibrePb>(
        'readOne',
        readOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ReadCalibreRequest.fromBuffer(value),
        ($2.CalibrePb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReadAllRequest, $0.CalibresResponse>(
        'readAll',
        readAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReadAllRequest.fromBuffer(value),
        ($0.CalibresResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReadIdsRequest, $0.CalibresIdsResponse>(
        'readAllIds',
        readAllIds_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReadIdsRequest.fromBuffer(value),
        ($0.CalibresIdsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CalibreRequest, $1.StatusResponse>(
        'updateOne',
        updateOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CalibreRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CalibreRequest, $1.StatusResponse>(
        'deleteOne',
        deleteOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CalibreRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CategoryRequest, $1.StatusResponse>(
        'createOneCategory',
        createOneCategory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CategoryRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FindCategoryRequest, $3.CategoryPb>(
        'readOneCategory',
        readOneCategory_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FindCategoryRequest.fromBuffer(value),
        ($3.CategoryPb value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ReadCategoriesRequest, $0.CategoriesResponse>(
            'readAllCategories',
            readAllCategories_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ReadCategoriesRequest.fromBuffer(value),
            ($0.CategoriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CategoryRequest, $1.StatusResponse>(
        'updateOneCategory',
        updateOneCategory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CategoryRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CategoryRequest, $1.StatusResponse>(
        'deleteOneCategory',
        deleteOneCategory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CategoryRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PhotoRequest, $1.StatusResponse>(
        'createOnePhoto',
        createOnePhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PhotoRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PhotosRequest, $1.StatusResponse>(
        'createManyPhotos',
        createManyPhotos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PhotosRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FindPhotoRequest, $4.ArticlePhotoPb>(
        'readOnePhoto',
        readOnePhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FindPhotoRequest.fromBuffer(value),
        ($4.ArticlePhotoPb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReadPhotosRequest, $0.PhotosResponse>(
        'readAllPhotos',
        readAllPhotos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReadPhotosRequest.fromBuffer(value),
        ($0.PhotosResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PhotoRequest, $1.StatusResponse>(
        'updateOnePhoto',
        updateOnePhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PhotoRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PhotoRequest, $1.StatusResponse>(
        'deleteOnePhoto',
        deleteOnePhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PhotoRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.StatusResponse> createOne_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CalibreRequest> $request) async {
    return createOne($call, await $request);
  }

  $async.Future<$1.StatusResponse> createOne(
      $grpc.ServiceCall call, $0.CalibreRequest request);

  $async.Future<$1.StatusResponse> createMany_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CalibresRequest> $request) async {
    return createMany($call, await $request);
  }

  $async.Future<$1.StatusResponse> createMany(
      $grpc.ServiceCall call, $0.CalibresRequest request);

  $async.Future<$2.CalibrePb> readOne_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ReadCalibreRequest> $request) async {
    return readOne($call, await $request);
  }

  $async.Future<$2.CalibrePb> readOne(
      $grpc.ServiceCall call, $0.ReadCalibreRequest request);

  $async.Future<$0.CalibresResponse> readAll_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ReadAllRequest> $request) async {
    return readAll($call, await $request);
  }

  $async.Future<$0.CalibresResponse> readAll(
      $grpc.ServiceCall call, $0.ReadAllRequest request);

  $async.Future<$0.CalibresIdsResponse> readAllIds_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ReadIdsRequest> $request) async {
    return readAllIds($call, await $request);
  }

  $async.Future<$0.CalibresIdsResponse> readAllIds(
      $grpc.ServiceCall call, $0.ReadIdsRequest request);

  $async.Future<$1.StatusResponse> updateOne_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CalibreRequest> $request) async {
    return updateOne($call, await $request);
  }

  $async.Future<$1.StatusResponse> updateOne(
      $grpc.ServiceCall call, $0.CalibreRequest request);

  $async.Future<$1.StatusResponse> deleteOne_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CalibreRequest> $request) async {
    return deleteOne($call, await $request);
  }

  $async.Future<$1.StatusResponse> deleteOne(
      $grpc.ServiceCall call, $0.CalibreRequest request);

  $async.Future<$1.StatusResponse> createOneCategory_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CategoryRequest> $request) async {
    return createOneCategory($call, await $request);
  }

  $async.Future<$1.StatusResponse> createOneCategory(
      $grpc.ServiceCall call, $0.CategoryRequest request);

  $async.Future<$3.CategoryPb> readOneCategory_Pre($grpc.ServiceCall $call,
      $async.Future<$0.FindCategoryRequest> $request) async {
    return readOneCategory($call, await $request);
  }

  $async.Future<$3.CategoryPb> readOneCategory(
      $grpc.ServiceCall call, $0.FindCategoryRequest request);

  $async.Future<$0.CategoriesResponse> readAllCategories_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ReadCategoriesRequest> $request) async {
    return readAllCategories($call, await $request);
  }

  $async.Future<$0.CategoriesResponse> readAllCategories(
      $grpc.ServiceCall call, $0.ReadCategoriesRequest request);

  $async.Future<$1.StatusResponse> updateOneCategory_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CategoryRequest> $request) async {
    return updateOneCategory($call, await $request);
  }

  $async.Future<$1.StatusResponse> updateOneCategory(
      $grpc.ServiceCall call, $0.CategoryRequest request);

  $async.Future<$1.StatusResponse> deleteOneCategory_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CategoryRequest> $request) async {
    return deleteOneCategory($call, await $request);
  }

  $async.Future<$1.StatusResponse> deleteOneCategory(
      $grpc.ServiceCall call, $0.CategoryRequest request);

  $async.Future<$1.StatusResponse> createOnePhoto_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.PhotoRequest> $request) async {
    return createOnePhoto($call, await $request);
  }

  $async.Future<$1.StatusResponse> createOnePhoto(
      $grpc.ServiceCall call, $0.PhotoRequest request);

  $async.Future<$1.StatusResponse> createManyPhotos_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.PhotosRequest> $request) async {
    return createManyPhotos($call, await $request);
  }

  $async.Future<$1.StatusResponse> createManyPhotos(
      $grpc.ServiceCall call, $0.PhotosRequest request);

  $async.Future<$4.ArticlePhotoPb> readOnePhoto_Pre($grpc.ServiceCall $call,
      $async.Future<$0.FindPhotoRequest> $request) async {
    return readOnePhoto($call, await $request);
  }

  $async.Future<$4.ArticlePhotoPb> readOnePhoto(
      $grpc.ServiceCall call, $0.FindPhotoRequest request);

  $async.Future<$0.PhotosResponse> readAllPhotos_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ReadPhotosRequest> $request) async {
    return readAllPhotos($call, await $request);
  }

  $async.Future<$0.PhotosResponse> readAllPhotos(
      $grpc.ServiceCall call, $0.ReadPhotosRequest request);

  $async.Future<$1.StatusResponse> updateOnePhoto_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.PhotoRequest> $request) async {
    return updateOnePhoto($call, await $request);
  }

  $async.Future<$1.StatusResponse> updateOnePhoto(
      $grpc.ServiceCall call, $0.PhotoRequest request);

  $async.Future<$1.StatusResponse> deleteOnePhoto_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.PhotoRequest> $request) async {
    return deleteOnePhoto($call, await $request);
  }

  $async.Future<$1.StatusResponse> deleteOnePhoto(
      $grpc.ServiceCall call, $0.PhotoRequest request);
}
