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
  static final _$readBillingProducts = $grpc.ClientMethod<$0.Empty, $14.ReadBillingProductsResponse>(
      '/weebi.billing.service.BillingService/readBillingProducts',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.ReadBillingProductsResponse.fromBuffer(value));
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
  static final _$getReferralInfo = $grpc.ClientMethod<$0.Empty, $14.GetReferralInfoResponse>(
      '/weebi.billing.service.BillingService/getReferralInfo',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.GetReferralInfoResponse.fromBuffer(value));
  static final _$requestReferralPayout = $grpc.ClientMethod<$0.Empty, $14.RequestReferralPayoutResponse>(
      '/weebi.billing.service.BillingService/requestReferralPayout',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.RequestReferralPayoutResponse.fromBuffer(value));
  static final _$createCheckoutSession = $grpc.ClientMethod<$14.CreateCheckoutSessionRequest, $14.CreateCheckoutSessionResponse>(
      '/weebi.billing.service.BillingService/createCheckoutSession',
      ($14.CreateCheckoutSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.CreateCheckoutSessionResponse.fromBuffer(value));
  static final _$fulfillLicenseFromStripe = $grpc.ClientMethod<$14.FulfillLicenseFromStripeRequest, $14.CreateLicenseResponse>(
      '/weebi.billing.service.BillingService/fulfillLicenseFromStripe',
      ($14.FulfillLicenseFromStripeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.CreateLicenseResponse.fromBuffer(value));
  static final _$fulfillFromStripeCheckoutSession = $grpc.ClientMethod<$14.FulfillFromStripeCheckoutSessionRequest, $14.CreateLicenseResponse>(
      '/weebi.billing.service.BillingService/fulfillFromStripeCheckoutSession',
      ($14.FulfillFromStripeCheckoutSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.CreateLicenseResponse.fromBuffer(value));

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

  $grpc.ResponseFuture<$14.ReadBillingProductsResponse> readBillingProducts($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readBillingProducts, request, options: options);
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

  $grpc.ResponseFuture<$14.GetReferralInfoResponse> getReferralInfo($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getReferralInfo, request, options: options);
  }

  $grpc.ResponseFuture<$14.RequestReferralPayoutResponse> requestReferralPayout($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$requestReferralPayout, request, options: options);
  }

  $grpc.ResponseFuture<$14.CreateCheckoutSessionResponse> createCheckoutSession($14.CreateCheckoutSessionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createCheckoutSession, request, options: options);
  }

  $grpc.ResponseFuture<$14.CreateLicenseResponse> fulfillLicenseFromStripe($14.FulfillLicenseFromStripeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fulfillLicenseFromStripe, request, options: options);
  }

  $grpc.ResponseFuture<$14.CreateLicenseResponse> fulfillFromStripeCheckoutSession($14.FulfillFromStripeCheckoutSessionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fulfillFromStripeCheckoutSession, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.Empty, $14.ReadBillingProductsResponse>(
        'readBillingProducts',
        readBillingProducts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($14.ReadBillingProductsResponse value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.Empty, $14.GetReferralInfoResponse>(
        'getReferralInfo',
        getReferralInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($14.GetReferralInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $14.RequestReferralPayoutResponse>(
        'requestReferralPayout',
        requestReferralPayout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($14.RequestReferralPayoutResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.CreateCheckoutSessionRequest, $14.CreateCheckoutSessionResponse>(
        'createCheckoutSession',
        createCheckoutSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.CreateCheckoutSessionRequest.fromBuffer(value),
        ($14.CreateCheckoutSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.FulfillLicenseFromStripeRequest, $14.CreateLicenseResponse>(
        'fulfillLicenseFromStripe',
        fulfillLicenseFromStripe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.FulfillLicenseFromStripeRequest.fromBuffer(value),
        ($14.CreateLicenseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.FulfillFromStripeCheckoutSessionRequest, $14.CreateLicenseResponse>(
        'fulfillFromStripeCheckoutSession',
        fulfillFromStripeCheckoutSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.FulfillFromStripeCheckoutSessionRequest.fromBuffer(value),
        ($14.CreateLicenseResponse value) => value.writeToBuffer()));
  }

  $async.Future<$14.CreateLicenseResponse> createLicense_Pre($grpc.ServiceCall call, $async.Future<$14.CreateLicenseRequest> request) async {
    return createLicense(call, await request);
  }

  $async.Future<$14.ReadLicensesResponse> readLicenses_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readLicenses(call, await request);
  }

  $async.Future<$14.ReadBillingProductsResponse> readBillingProducts_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readBillingProducts(call, await request);
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

  $async.Future<$14.GetReferralInfoResponse> getReferralInfo_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getReferralInfo(call, await request);
  }

  $async.Future<$14.RequestReferralPayoutResponse> requestReferralPayout_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return requestReferralPayout(call, await request);
  }

  $async.Future<$14.CreateCheckoutSessionResponse> createCheckoutSession_Pre($grpc.ServiceCall call, $async.Future<$14.CreateCheckoutSessionRequest> request) async {
    return createCheckoutSession(call, await request);
  }

  $async.Future<$14.CreateLicenseResponse> fulfillLicenseFromStripe_Pre($grpc.ServiceCall call, $async.Future<$14.FulfillLicenseFromStripeRequest> request) async {
    return fulfillLicenseFromStripe(call, await request);
  }

  $async.Future<$14.CreateLicenseResponse> fulfillFromStripeCheckoutSession_Pre($grpc.ServiceCall call, $async.Future<$14.FulfillFromStripeCheckoutSessionRequest> request) async {
    return fulfillFromStripeCheckoutSession(call, await request);
  }

  $async.Future<$14.CreateLicenseResponse> createLicense($grpc.ServiceCall call, $14.CreateLicenseRequest request);
  $async.Future<$14.ReadLicensesResponse> readLicenses($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$14.ReadBillingProductsResponse> readBillingProducts($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.StatusResponse> updateLicense($grpc.ServiceCall call, $14.UpdateLicenseRequest request);
  $async.Future<$1.StatusResponse> deleteLicense($grpc.ServiceCall call, $14.DeleteLicenseRequest request);
  $async.Future<$1.StatusResponse> updatePaymentCustomerId($grpc.ServiceCall call, $14.UpdatePaymentCustomerIdRequest request);
  $async.Future<$14.GetReferralInfoResponse> getReferralInfo($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$14.RequestReferralPayoutResponse> requestReferralPayout($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$14.CreateCheckoutSessionResponse> createCheckoutSession($grpc.ServiceCall call, $14.CreateCheckoutSessionRequest request);
  $async.Future<$14.CreateLicenseResponse> fulfillLicenseFromStripe($grpc.ServiceCall call, $14.FulfillLicenseFromStripeRequest request);
  $async.Future<$14.CreateLicenseResponse> fulfillFromStripeCheckoutSession($grpc.ServiceCall call, $14.FulfillFromStripeCheckoutSessionRequest request);
}
