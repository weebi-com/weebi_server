//
//  Generated code. Do not modify.
//  source: billing_service.proto
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

import 'billing_service.pb.dart' as $14;
import 'common/empty.pb.dart' as $0;
import 'common/g_common.pb.dart' as $1;

export 'billing_service.pb.dart';

@$pb.GrpcServiceName('weebi.billing.service.BillingService')
class BillingServiceClient extends $grpc.Client {
  static final _$createLicense = $grpc.ClientMethod<$14.CreateLicenseRequest, $14.CreateLicenseResponse>(
      '/weebi.billing.service.BillingService/createLicense',
      ($14.CreateLicenseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.CreateLicenseResponse.fromBuffer(value));
  static final _$readLicenses = $grpc.ClientMethod<$0.Empty, $14.ReadLicensesResponse>(
      '/weebi.billing.service.BillingService/readLicenses',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.ReadLicensesResponse.fromBuffer(value));
  static final _$updateLicense = $grpc.ClientMethod<$14.UpdateLicenseRequest, $1.StatusResponse>(
      '/weebi.billing.service.BillingService/updateLicense',
      ($14.UpdateLicenseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$deleteLicense = $grpc.ClientMethod<$14.DeleteLicenseRequest, $1.StatusResponse>(
      '/weebi.billing.service.BillingService/deleteLicense',
      ($14.DeleteLicenseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updatePaymentCustomerId = $grpc.ClientMethod<$14.UpdatePaymentCustomerIdRequest, $1.StatusResponse>(
      '/weebi.billing.service.BillingService/updatePaymentCustomerId',
      ($14.UpdatePaymentCustomerIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  BillingServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$14.CreateLicenseResponse> createLicense($14.CreateLicenseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createLicense, request, options: options);
  }

  $grpc.ResponseFuture<$14.ReadLicensesResponse> readLicenses($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readLicenses, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateLicense($14.UpdateLicenseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateLicense, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteLicense($14.DeleteLicenseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteLicense, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updatePaymentCustomerId($14.UpdatePaymentCustomerIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePaymentCustomerId, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.billing.service.BillingService')
abstract class BillingServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.billing.service.BillingService';

  BillingServiceBase() {
    $addMethod($grpc.ServiceMethod<$14.CreateLicenseRequest, $14.CreateLicenseResponse>(
        'createLicense',
        createLicense_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.CreateLicenseRequest.fromBuffer(value),
        ($14.CreateLicenseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $14.ReadLicensesResponse>(
        'readLicenses',
        readLicenses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($14.ReadLicensesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.UpdateLicenseRequest, $1.StatusResponse>(
        'updateLicense',
        updateLicense_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.UpdateLicenseRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.DeleteLicenseRequest, $1.StatusResponse>(
        'deleteLicense',
        deleteLicense_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.DeleteLicenseRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.UpdatePaymentCustomerIdRequest, $1.StatusResponse>(
        'updatePaymentCustomerId',
        updatePaymentCustomerId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.UpdatePaymentCustomerIdRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$14.CreateLicenseResponse> createLicense_Pre($grpc.ServiceCall call, $async.Future<$14.CreateLicenseRequest> request) async {
    return createLicense(call, await request);
  }

  $async.Future<$14.ReadLicensesResponse> readLicenses_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readLicenses(call, await request);
  }

  $async.Future<$1.StatusResponse> updateLicense_Pre($grpc.ServiceCall call, $async.Future<$14.UpdateLicenseRequest> request) async {
    return updateLicense(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteLicense_Pre($grpc.ServiceCall call, $async.Future<$14.DeleteLicenseRequest> request) async {
    return deleteLicense(call, await request);
  }

  $async.Future<$1.StatusResponse> updatePaymentCustomerId_Pre($grpc.ServiceCall call, $async.Future<$14.UpdatePaymentCustomerIdRequest> request) async {
    return updatePaymentCustomerId(call, await request);
  }

  $async.Future<$14.CreateLicenseResponse> createLicense($grpc.ServiceCall call, $14.CreateLicenseRequest request);
  $async.Future<$14.ReadLicensesResponse> readLicenses($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.StatusResponse> updateLicense($grpc.ServiceCall call, $14.UpdateLicenseRequest request);
  $async.Future<$1.StatusResponse> deleteLicense($grpc.ServiceCall call, $14.DeleteLicenseRequest request);
  $async.Future<$1.StatusResponse> updatePaymentCustomerId($grpc.ServiceCall call, $14.UpdatePaymentCustomerIdRequest request);
}
