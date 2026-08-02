// This is a generated file - do not edit.
//
// Generated from billing_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'billing_service.pb.dart' as $0;
import 'common/empty.pb.dart' as $1;
import 'common/g_common.pb.dart' as $2;

export 'billing_service.pb.dart';

/// / License CRUD and payment handling. Operates on Firm.licenses (embedded).
/// / firmId is derived from the authenticated user's context.
@$pb.GrpcServiceName('weebi.billing.service.BillingService')
class BillingServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  BillingServiceClient(super.channel, {super.options, super.interceptors});

  /// / Create a license and append to firm.licenses.
  $grpc.ResponseFuture<$0.CreateLicenseResponse> createLicense(
    $0.CreateLicenseRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createLicense, request, options: options);
  }

  /// / Read all licenses for the user's firm.
  $grpc.ResponseFuture<$0.ReadLicensesResponse> readLicenses(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readLicenses, request, options: options);
  }

  /// / Read available billing products (license plans). Used by webapp for checkout.
  $grpc.ResponseFuture<$0.ReadBillingProductsResponse> readBillingProducts(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readBillingProducts, request, options: options);
  }

  /// / Update an existing license by licenseId.
  $grpc.ResponseFuture<$2.StatusResponse> updateLicense(
    $0.UpdateLicenseRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateLicense, request, options: options);
  }

  /// / Remove a license from firm.licenses.
  $grpc.ResponseFuture<$2.StatusResponse> deleteLicense(
    $0.DeleteLicenseRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteLicense, request, options: options);
  }

  /// / Set the customer ID for a payment provider on the firm.
  $grpc.ResponseFuture<$2.StatusResponse> updatePaymentCustomerId(
    $0.UpdatePaymentCustomerIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updatePaymentCustomerId, request,
        options: options);
  }

  /// / Get referral code and credit balance for the user's firm.
  $grpc.ResponseFuture<$0.GetReferralInfoResponse> getReferralInfo(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getReferralInfo, request, options: options);
  }

  /// / Request cash-out of referral credit. Requires balance >= 1500 (€15). Payout to same payment customer.
  $grpc.ResponseFuture<$0.RequestReferralPayoutResponse> requestReferralPayout(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$requestReferralPayout, request, options: options);
  }

  /// / Create a Stripe Checkout Session for a license purchase. Returns URL to redirect the customer.
  $grpc.ResponseFuture<$0.CreateCheckoutSessionResponse> createCheckoutSession(
    $0.CreateCheckoutSessionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createCheckoutSession, request, options: options);
  }

  /// / Internal: fulfill a license after Stripe payment. Called by weebi_express webhook handler.
  /// / Requires service account auth.
  $grpc.ResponseFuture<$0.CreateLicenseResponse> fulfillLicenseFromStripe(
    $0.FulfillLicenseFromStripeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fulfillLicenseFromStripe, request,
        options: options);
  }

  /// / User-facing: ensure license is created from a paid Checkout Session (e.g. after redirect).
  /// / Use when webhook may have failed or not yet run. Idempotent; validates session belongs to user's firm.
  $grpc.ResponseFuture<$0.CreateLicenseResponse>
      fulfillFromStripeCheckoutSession(
    $0.FulfillFromStripeCheckoutSessionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fulfillFromStripeCheckoutSession, request,
        options: options);
  }

  /// / Create a PawaPay Checkout for a license / SYSCOHADA purchase. Returns hosted-page redirectUrl.
  $grpc.ResponseFuture<$0.CreatePawapayCheckoutResponse> createPawapayCheckout(
    $0.CreatePawapayCheckoutRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createPawapayCheckout, request, options: options);
  }

  /// / Internal: fulfill a license after PawaPay checkout COMPLETED. Called by weebi_express webhook handler.
  /// / Requires service account auth.
  $grpc.ResponseFuture<$0.CreateLicenseResponse> fulfillLicenseFromPawapay(
    $0.FulfillLicenseFromPawapayRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fulfillLicenseFromPawapay, request,
        options: options);
  }

  /// / User-facing: ensure license is created from a completed PawaPay checkout (e.g. after returnUrl).
  /// / Use when webhook may have failed or not yet run. Idempotent; validates checkout belongs to user's firm.
  $grpc.ResponseFuture<$0.CreateLicenseResponse> fulfillFromPawapayCheckout(
    $0.FulfillFromPawapayCheckoutRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fulfillFromPawapayCheckout, request,
        options: options);
  }

  /// / Read punctual SYSCOHADA fiscal-year purchases for the user's firm (not a subscription).
  $grpc.ResponseFuture<$0.ReadAccountingYearPurchasesResponse>
      readAccountingYearPurchases(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$readAccountingYearPurchases, request,
        options: options);
  }

  // method descriptors

  static final _$createLicense =
      $grpc.ClientMethod<$0.CreateLicenseRequest, $0.CreateLicenseResponse>(
          '/weebi.billing.service.BillingService/createLicense',
          ($0.CreateLicenseRequest value) => value.writeToBuffer(),
          $0.CreateLicenseResponse.fromBuffer);
  static final _$readLicenses =
      $grpc.ClientMethod<$1.Empty, $0.ReadLicensesResponse>(
          '/weebi.billing.service.BillingService/readLicenses',
          ($1.Empty value) => value.writeToBuffer(),
          $0.ReadLicensesResponse.fromBuffer);
  static final _$readBillingProducts =
      $grpc.ClientMethod<$1.Empty, $0.ReadBillingProductsResponse>(
          '/weebi.billing.service.BillingService/readBillingProducts',
          ($1.Empty value) => value.writeToBuffer(),
          $0.ReadBillingProductsResponse.fromBuffer);
  static final _$updateLicense =
      $grpc.ClientMethod<$0.UpdateLicenseRequest, $2.StatusResponse>(
          '/weebi.billing.service.BillingService/updateLicense',
          ($0.UpdateLicenseRequest value) => value.writeToBuffer(),
          $2.StatusResponse.fromBuffer);
  static final _$deleteLicense =
      $grpc.ClientMethod<$0.DeleteLicenseRequest, $2.StatusResponse>(
          '/weebi.billing.service.BillingService/deleteLicense',
          ($0.DeleteLicenseRequest value) => value.writeToBuffer(),
          $2.StatusResponse.fromBuffer);
  static final _$updatePaymentCustomerId =
      $grpc.ClientMethod<$0.UpdatePaymentCustomerIdRequest, $2.StatusResponse>(
          '/weebi.billing.service.BillingService/updatePaymentCustomerId',
          ($0.UpdatePaymentCustomerIdRequest value) => value.writeToBuffer(),
          $2.StatusResponse.fromBuffer);
  static final _$getReferralInfo =
      $grpc.ClientMethod<$1.Empty, $0.GetReferralInfoResponse>(
          '/weebi.billing.service.BillingService/getReferralInfo',
          ($1.Empty value) => value.writeToBuffer(),
          $0.GetReferralInfoResponse.fromBuffer);
  static final _$requestReferralPayout =
      $grpc.ClientMethod<$1.Empty, $0.RequestReferralPayoutResponse>(
          '/weebi.billing.service.BillingService/requestReferralPayout',
          ($1.Empty value) => value.writeToBuffer(),
          $0.RequestReferralPayoutResponse.fromBuffer);
  static final _$createCheckoutSession = $grpc.ClientMethod<
          $0.CreateCheckoutSessionRequest, $0.CreateCheckoutSessionResponse>(
      '/weebi.billing.service.BillingService/createCheckoutSession',
      ($0.CreateCheckoutSessionRequest value) => value.writeToBuffer(),
      $0.CreateCheckoutSessionResponse.fromBuffer);
  static final _$fulfillLicenseFromStripe = $grpc.ClientMethod<
          $0.FulfillLicenseFromStripeRequest, $0.CreateLicenseResponse>(
      '/weebi.billing.service.BillingService/fulfillLicenseFromStripe',
      ($0.FulfillLicenseFromStripeRequest value) => value.writeToBuffer(),
      $0.CreateLicenseResponse.fromBuffer);
  static final _$fulfillFromStripeCheckoutSession = $grpc.ClientMethod<
          $0.FulfillFromStripeCheckoutSessionRequest, $0.CreateLicenseResponse>(
      '/weebi.billing.service.BillingService/fulfillFromStripeCheckoutSession',
      ($0.FulfillFromStripeCheckoutSessionRequest value) =>
          value.writeToBuffer(),
      $0.CreateLicenseResponse.fromBuffer);
  static final _$createPawapayCheckout = $grpc.ClientMethod<
          $0.CreatePawapayCheckoutRequest, $0.CreatePawapayCheckoutResponse>(
      '/weebi.billing.service.BillingService/createPawapayCheckout',
      ($0.CreatePawapayCheckoutRequest value) => value.writeToBuffer(),
      $0.CreatePawapayCheckoutResponse.fromBuffer);
  static final _$fulfillLicenseFromPawapay = $grpc.ClientMethod<
          $0.FulfillLicenseFromPawapayRequest, $0.CreateLicenseResponse>(
      '/weebi.billing.service.BillingService/fulfillLicenseFromPawapay',
      ($0.FulfillLicenseFromPawapayRequest value) => value.writeToBuffer(),
      $0.CreateLicenseResponse.fromBuffer);
  static final _$fulfillFromPawapayCheckout = $grpc.ClientMethod<
          $0.FulfillFromPawapayCheckoutRequest, $0.CreateLicenseResponse>(
      '/weebi.billing.service.BillingService/fulfillFromPawapayCheckout',
      ($0.FulfillFromPawapayCheckoutRequest value) => value.writeToBuffer(),
      $0.CreateLicenseResponse.fromBuffer);
  static final _$readAccountingYearPurchases =
      $grpc.ClientMethod<$1.Empty, $0.ReadAccountingYearPurchasesResponse>(
          '/weebi.billing.service.BillingService/readAccountingYearPurchases',
          ($1.Empty value) => value.writeToBuffer(),
          $0.ReadAccountingYearPurchasesResponse.fromBuffer);
}

@$pb.GrpcServiceName('weebi.billing.service.BillingService')
abstract class BillingServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.billing.service.BillingService';

  BillingServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.CreateLicenseRequest, $0.CreateLicenseResponse>(
            'createLicense',
            createLicense_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateLicenseRequest.fromBuffer(value),
            ($0.CreateLicenseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ReadLicensesResponse>(
        'readLicenses',
        readLicenses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ReadLicensesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ReadBillingProductsResponse>(
        'readBillingProducts',
        readBillingProducts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ReadBillingProductsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateLicenseRequest, $2.StatusResponse>(
        'updateLicense',
        updateLicense_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateLicenseRequest.fromBuffer(value),
        ($2.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteLicenseRequest, $2.StatusResponse>(
        'deleteLicense',
        deleteLicense_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteLicenseRequest.fromBuffer(value),
        ($2.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePaymentCustomerIdRequest,
            $2.StatusResponse>(
        'updatePaymentCustomerId',
        updatePaymentCustomerId_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdatePaymentCustomerIdRequest.fromBuffer(value),
        ($2.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GetReferralInfoResponse>(
        'getReferralInfo',
        getReferralInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GetReferralInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.RequestReferralPayoutResponse>(
        'requestReferralPayout',
        requestReferralPayout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.RequestReferralPayoutResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateCheckoutSessionRequest,
            $0.CreateCheckoutSessionResponse>(
        'createCheckoutSession',
        createCheckoutSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateCheckoutSessionRequest.fromBuffer(value),
        ($0.CreateCheckoutSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FulfillLicenseFromStripeRequest,
            $0.CreateLicenseResponse>(
        'fulfillLicenseFromStripe',
        fulfillLicenseFromStripe_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FulfillLicenseFromStripeRequest.fromBuffer(value),
        ($0.CreateLicenseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FulfillFromStripeCheckoutSessionRequest,
            $0.CreateLicenseResponse>(
        'fulfillFromStripeCheckoutSession',
        fulfillFromStripeCheckoutSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FulfillFromStripeCheckoutSessionRequest.fromBuffer(value),
        ($0.CreateLicenseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreatePawapayCheckoutRequest,
            $0.CreatePawapayCheckoutResponse>(
        'createPawapayCheckout',
        createPawapayCheckout_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreatePawapayCheckoutRequest.fromBuffer(value),
        ($0.CreatePawapayCheckoutResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FulfillLicenseFromPawapayRequest,
            $0.CreateLicenseResponse>(
        'fulfillLicenseFromPawapay',
        fulfillLicenseFromPawapay_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FulfillLicenseFromPawapayRequest.fromBuffer(value),
        ($0.CreateLicenseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FulfillFromPawapayCheckoutRequest,
            $0.CreateLicenseResponse>(
        'fulfillFromPawapayCheckout',
        fulfillFromPawapayCheckout_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FulfillFromPawapayCheckoutRequest.fromBuffer(value),
        ($0.CreateLicenseResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.Empty, $0.ReadAccountingYearPurchasesResponse>(
            'readAccountingYearPurchases',
            readAccountingYearPurchases_Pre,
            false,
            false,
            ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
            ($0.ReadAccountingYearPurchasesResponse value) =>
                value.writeToBuffer()));
  }

  $async.Future<$0.CreateLicenseResponse> createLicense_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateLicenseRequest> $request) async {
    return createLicense($call, await $request);
  }

  $async.Future<$0.CreateLicenseResponse> createLicense(
      $grpc.ServiceCall call, $0.CreateLicenseRequest request);

  $async.Future<$0.ReadLicensesResponse> readLicenses_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return readLicenses($call, await $request);
  }

  $async.Future<$0.ReadLicensesResponse> readLicenses(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.ReadBillingProductsResponse> readBillingProducts_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return readBillingProducts($call, await $request);
  }

  $async.Future<$0.ReadBillingProductsResponse> readBillingProducts(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$2.StatusResponse> updateLicense_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateLicenseRequest> $request) async {
    return updateLicense($call, await $request);
  }

  $async.Future<$2.StatusResponse> updateLicense(
      $grpc.ServiceCall call, $0.UpdateLicenseRequest request);

  $async.Future<$2.StatusResponse> deleteLicense_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteLicenseRequest> $request) async {
    return deleteLicense($call, await $request);
  }

  $async.Future<$2.StatusResponse> deleteLicense(
      $grpc.ServiceCall call, $0.DeleteLicenseRequest request);

  $async.Future<$2.StatusResponse> updatePaymentCustomerId_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.UpdatePaymentCustomerIdRequest> $request) async {
    return updatePaymentCustomerId($call, await $request);
  }

  $async.Future<$2.StatusResponse> updatePaymentCustomerId(
      $grpc.ServiceCall call, $0.UpdatePaymentCustomerIdRequest request);

  $async.Future<$0.GetReferralInfoResponse> getReferralInfo_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return getReferralInfo($call, await $request);
  }

  $async.Future<$0.GetReferralInfoResponse> getReferralInfo(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.RequestReferralPayoutResponse> requestReferralPayout_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return requestReferralPayout($call, await $request);
  }

  $async.Future<$0.RequestReferralPayoutResponse> requestReferralPayout(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.CreateCheckoutSessionResponse> createCheckoutSession_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateCheckoutSessionRequest> $request) async {
    return createCheckoutSession($call, await $request);
  }

  $async.Future<$0.CreateCheckoutSessionResponse> createCheckoutSession(
      $grpc.ServiceCall call, $0.CreateCheckoutSessionRequest request);

  $async.Future<$0.CreateLicenseResponse> fulfillLicenseFromStripe_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FulfillLicenseFromStripeRequest> $request) async {
    return fulfillLicenseFromStripe($call, await $request);
  }

  $async.Future<$0.CreateLicenseResponse> fulfillLicenseFromStripe(
      $grpc.ServiceCall call, $0.FulfillLicenseFromStripeRequest request);

  $async.Future<$0.CreateLicenseResponse> fulfillFromStripeCheckoutSession_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FulfillFromStripeCheckoutSessionRequest>
          $request) async {
    return fulfillFromStripeCheckoutSession($call, await $request);
  }

  $async.Future<$0.CreateLicenseResponse> fulfillFromStripeCheckoutSession(
      $grpc.ServiceCall call,
      $0.FulfillFromStripeCheckoutSessionRequest request);

  $async.Future<$0.CreatePawapayCheckoutResponse> createPawapayCheckout_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreatePawapayCheckoutRequest> $request) async {
    return createPawapayCheckout($call, await $request);
  }

  $async.Future<$0.CreatePawapayCheckoutResponse> createPawapayCheckout(
      $grpc.ServiceCall call, $0.CreatePawapayCheckoutRequest request);

  $async.Future<$0.CreateLicenseResponse> fulfillLicenseFromPawapay_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FulfillLicenseFromPawapayRequest> $request) async {
    return fulfillLicenseFromPawapay($call, await $request);
  }

  $async.Future<$0.CreateLicenseResponse> fulfillLicenseFromPawapay(
      $grpc.ServiceCall call, $0.FulfillLicenseFromPawapayRequest request);

  $async.Future<$0.CreateLicenseResponse> fulfillFromPawapayCheckout_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FulfillFromPawapayCheckoutRequest> $request) async {
    return fulfillFromPawapayCheckout($call, await $request);
  }

  $async.Future<$0.CreateLicenseResponse> fulfillFromPawapayCheckout(
      $grpc.ServiceCall call, $0.FulfillFromPawapayCheckoutRequest request);

  $async.Future<$0.ReadAccountingYearPurchasesResponse>
      readAccountingYearPurchases_Pre(
          $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return readAccountingYearPurchases($call, await $request);
  }

  $async.Future<$0.ReadAccountingYearPurchasesResponse>
      readAccountingYearPurchases($grpc.ServiceCall call, $1.Empty request);
}
