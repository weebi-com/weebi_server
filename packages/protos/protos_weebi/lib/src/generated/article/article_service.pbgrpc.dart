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
import 'article.pb.dart' as $5;
import 'article_service.pb.dart' as $4;

export 'article_service.pb.dart';

@$pb.GrpcServiceName('weebi.article.service.ArticleService')
class ArticleServiceClient extends $grpc.Client {
  static final _$createOne = $grpc.ClientMethod<$4.ArticleRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/createOne',
      ($4.ArticleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readOne = $grpc.ClientMethod<$4.FindArticleRequest, $5.CalibrePb>(
      '/weebi.article.service.ArticleService/readOne',
      ($4.FindArticleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.CalibrePb.fromBuffer(value));
  static final _$readAll = $grpc.ClientMethod<$4.ReadAllRequest, $4.ArticlesResponse>(
      '/weebi.article.service.ArticleService/readAll',
      ($4.ReadAllRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.ArticlesResponse.fromBuffer(value));
  static final _$replaceOne = $grpc.ClientMethod<$4.ArticleRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/replaceOne',
      ($4.ArticleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteOne = $grpc.ClientMethod<$4.ArticleRequest, $1.StatusResponse>(
      '/weebi.article.service.ArticleService/deleteOne',
      ($4.ArticleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  ArticleServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.StatusResponse> createOne($4.ArticleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOne, request, options: options);
  }

  $grpc.ResponseFuture<$5.CalibrePb> readOne($4.FindArticleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOne, request, options: options);
  }

  $grpc.ResponseFuture<$4.ArticlesResponse> readAll($4.ReadAllRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readAll, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> replaceOne($4.ArticleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$replaceOne, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteOne($4.ArticleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOne, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.article.service.ArticleService')
abstract class ArticleServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.article.service.ArticleService';

  ArticleServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.ArticleRequest, $1.StatusResponse>(
        'createOne',
        createOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.ArticleRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.FindArticleRequest, $5.CalibrePb>(
        'readOne',
        readOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.FindArticleRequest.fromBuffer(value),
        ($5.CalibrePb value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.ReadAllRequest, $4.ArticlesResponse>(
        'readAll',
        readAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.ReadAllRequest.fromBuffer(value),
        ($4.ArticlesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.ArticleRequest, $1.StatusResponse>(
        'replaceOne',
        replaceOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.ArticleRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.ArticleRequest, $1.StatusResponse>(
        'deleteOne',
        deleteOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.ArticleRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.StatusResponse> createOne_Pre($grpc.ServiceCall call, $async.Future<$4.ArticleRequest> request) async {
    return createOne(call, await request);
  }

  $async.Future<$5.CalibrePb> readOne_Pre($grpc.ServiceCall call, $async.Future<$4.FindArticleRequest> request) async {
    return readOne(call, await request);
  }

  $async.Future<$4.ArticlesResponse> readAll_Pre($grpc.ServiceCall call, $async.Future<$4.ReadAllRequest> request) async {
    return readAll(call, await request);
  }

  $async.Future<$1.StatusResponse> replaceOne_Pre($grpc.ServiceCall call, $async.Future<$4.ArticleRequest> request) async {
    return replaceOne(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteOne_Pre($grpc.ServiceCall call, $async.Future<$4.ArticleRequest> request) async {
    return deleteOne(call, await request);
  }

  $async.Future<$1.StatusResponse> createOne($grpc.ServiceCall call, $4.ArticleRequest request);
  $async.Future<$5.CalibrePb> readOne($grpc.ServiceCall call, $4.FindArticleRequest request);
  $async.Future<$4.ArticlesResponse> readAll($grpc.ServiceCall call, $4.ReadAllRequest request);
  $async.Future<$1.StatusResponse> replaceOne($grpc.ServiceCall call, $4.ArticleRequest request);
  $async.Future<$1.StatusResponse> deleteOne($grpc.ServiceCall call, $4.ArticleRequest request);
}
