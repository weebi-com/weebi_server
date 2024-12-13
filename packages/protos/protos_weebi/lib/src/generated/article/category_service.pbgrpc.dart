//
//  Generated code. Do not modify.
//  source: article/category_service.proto
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
import 'category.pb.dart' as $3;
import 'category_service.pb.dart' as $2;

export 'category_service.pb.dart';

@$pb.GrpcServiceName('weebi.category.service.CategoryService')
class CategoryServiceClient extends $grpc.Client {
  static final _$createOne = $grpc.ClientMethod<$2.CategoryRequest, $1.StatusResponse>(
      '/weebi.category.service.CategoryService/createOne',
      ($2.CategoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readOne = $grpc.ClientMethod<$2.FindCategoryRequest, $3.CategoryPb>(
      '/weebi.category.service.CategoryService/readOne',
      ($2.FindCategoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.CategoryPb.fromBuffer(value));
  static final _$readAll = $grpc.ClientMethod<$2.ReadCategoriesRequest, $2.CategoriesResponse>(
      '/weebi.category.service.CategoryService/readAll',
      ($2.ReadCategoriesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CategoriesResponse.fromBuffer(value));
  static final _$replaceOne = $grpc.ClientMethod<$2.CategoryRequest, $1.StatusResponse>(
      '/weebi.category.service.CategoryService/replaceOne',
      ($2.CategoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOne = $grpc.ClientMethod<$2.CategoryRequest, $1.StatusResponse>(
      '/weebi.category.service.CategoryService/deleteOne',
      ($2.CategoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  CategoryServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.StatusResponse> createOne($2.CategoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOne, request, options: options);
  }

  $grpc.ResponseFuture<$3.CategoryPb> readOne($2.FindCategoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOne, request, options: options);
  }

  $grpc.ResponseFuture<$2.CategoriesResponse> readAll($2.ReadCategoriesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAll, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> replaceOne($2.CategoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$replaceOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOne($2.CategoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOne, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.category.service.CategoryService')
abstract class CategoryServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.category.service.CategoryService';

  CategoryServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.CategoryRequest, $1.StatusResponse>(
        'createOne',
        createOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CategoryRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.FindCategoryRequest, $3.CategoryPb>(
        'readOne',
        readOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.FindCategoryRequest.fromBuffer(value),
        ($3.CategoryPb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ReadCategoriesRequest, $2.CategoriesResponse>(
        'readAll',
        readAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ReadCategoriesRequest.fromBuffer(value),
        ($2.CategoriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CategoryRequest, $1.StatusResponse>(
        'replaceOne',
        replaceOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CategoryRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CategoryRequest, $1.StatusResponse>(
        'deleteOne',
        deleteOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CategoryRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.StatusResponse> createOne_Pre($grpc.ServiceCall call, $async.Future<$2.CategoryRequest> request) async {
    return createOne(call, await request);
  }

  $async.Future<$3.CategoryPb> readOne_Pre($grpc.ServiceCall call, $async.Future<$2.FindCategoryRequest> request) async {
    return readOne(call, await request);
  }

  $async.Future<$2.CategoriesResponse> readAll_Pre($grpc.ServiceCall call, $async.Future<$2.ReadCategoriesRequest> request) async {
    return readAll(call, await request);
  }

  $async.Future<$1.StatusResponse> replaceOne_Pre($grpc.ServiceCall call, $async.Future<$2.CategoryRequest> request) async {
    return replaceOne(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOne_Pre($grpc.ServiceCall call, $async.Future<$2.CategoryRequest> request) async {
    return deleteOne(call, await request);
  }

  $async.Future<$1.StatusResponse> createOne($grpc.ServiceCall call, $2.CategoryRequest request);
  $async.Future<$3.CategoryPb> readOne($grpc.ServiceCall call, $2.FindCategoryRequest request);
  $async.Future<$2.CategoriesResponse> readAll($grpc.ServiceCall call, $2.ReadCategoriesRequest request);
  $async.Future<$1.StatusResponse> replaceOne($grpc.ServiceCall call, $2.CategoryRequest request);
  $async.Future<$1.StatusResponse> deleteOne($grpc.ServiceCall call, $2.CategoryRequest request);
}
