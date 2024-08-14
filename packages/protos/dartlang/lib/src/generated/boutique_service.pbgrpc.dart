//
//  Generated code. Do not modify.
//  source: boutique_service.proto
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

import 'boutique.pb.dart' as $9;
import 'boutique_chain.pb.dart' as $7;
import 'boutique_service.pb.dart' as $8;
import 'common/empty.pb.dart' as $0;
import 'common/g_common.pb.dart' as $1;
import 'firm.pb.dart' as $6;

export 'boutique_service.pb.dart';

@$pb.GrpcServiceName('weebi.firm.service.BoutiqueService')
class BoutiqueServiceClient extends $grpc.Client {
  static final _$createOneFirm = $grpc.ClientMethod<$6.Firm, $1.StatusResponse>(
      '/weebi.firm.service.BoutiqueService/createOneFirm',
      ($6.Firm value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readOneFirm = $grpc.ClientMethod<$0.Empty, $6.Firm>(
      '/weebi.firm.service.BoutiqueService/readOneFirm',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.Firm.fromBuffer(value));
  static final _$createOneChain = $grpc.ClientMethod<$7.Chain, $1.StatusResponse>(
      '/weebi.firm.service.BoutiqueService/createOneChain',
      ($7.Chain value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updateOneChain = $grpc.ClientMethod<$7.Chain, $1.StatusResponse>(
      '/weebi.firm.service.BoutiqueService/updateOneChain',
      ($7.Chain value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$readDevices = $grpc.ClientMethod<$8.ReadRequest, $7.Devices>(
      '/weebi.firm.service.BoutiqueService/readDevices',
      ($8.ReadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.Devices.fromBuffer(value));
  static final _$deleteDevice = $grpc.ClientMethod<$8.DeleteDeviceRequest, $1.StatusResponse>(
      '/weebi.firm.service.BoutiqueService/deleteDevice',
      ($8.DeleteDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$createOneBoutique = $grpc.ClientMethod<$9.Boutique, $1.StatusResponse>(
      '/weebi.firm.service.BoutiqueService/createOneBoutique',
      ($9.Boutique value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));
  static final _$updateOneBoutique = $grpc.ClientMethod<$9.Boutique, $1.StatusResponse>(
      '/weebi.firm.service.BoutiqueService/updateOneBoutique',
      ($9.Boutique value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StatusResponse.fromBuffer(value));

  BoutiqueServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.StatusResponse> createOneFirm($6.Firm request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneFirm, request, options: options);
  }

  $grpc.ResponseFuture<$6.Firm> readOneFirm($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readOneFirm, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneChain($7.Chain request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneChain($7.Chain request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneChain, request, options: options);
  }

  $grpc.ResponseFuture<$7.Devices> readDevices($8.ReadRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readDevices, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> deleteDevice($8.DeleteDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> createOneBoutique($9.Boutique request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOneBoutique, request, options: options);
  }

  $grpc.ResponseFuture<$1.StatusResponse> updateOneBoutique($9.Boutique request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOneBoutique, request, options: options);
  }
}

@$pb.GrpcServiceName('weebi.firm.service.BoutiqueService')
abstract class BoutiqueServiceBase extends $grpc.Service {
  $core.String get $name => 'weebi.firm.service.BoutiqueService';

  BoutiqueServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.Firm, $1.StatusResponse>(
        'createOneFirm',
        createOneFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.Firm.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $6.Firm>(
        'readOneFirm',
        readOneFirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($6.Firm value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.Chain, $1.StatusResponse>(
        'createOneChain',
        createOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.Chain.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.Chain, $1.StatusResponse>(
        'updateOneChain',
        updateOneChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.Chain.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ReadRequest, $7.Devices>(
        'readDevices',
        readDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ReadRequest.fromBuffer(value),
        ($7.Devices value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.DeleteDeviceRequest, $1.StatusResponse>(
        'deleteDevice',
        deleteDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.DeleteDeviceRequest.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.Boutique, $1.StatusResponse>(
        'createOneBoutique',
        createOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.Boutique.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.Boutique, $1.StatusResponse>(
        'updateOneBoutique',
        updateOneBoutique_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.Boutique.fromBuffer(value),
        ($1.StatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.StatusResponse> createOneFirm_Pre($grpc.ServiceCall call, $async.Future<$6.Firm> request) async {
    return createOneFirm(call, await request);
  }

  $async.Future<$6.Firm> readOneFirm_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return readOneFirm(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneChain_Pre($grpc.ServiceCall call, $async.Future<$7.Chain> request) async {
    return createOneChain(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneChain_Pre($grpc.ServiceCall call, $async.Future<$7.Chain> request) async {
    return updateOneChain(call, await request);
  }

  $async.Future<$7.Devices> readDevices_Pre($grpc.ServiceCall call, $async.Future<$8.ReadRequest> request) async {
    return readDevices(call, await request);
  }

  $async.Future<$1.StatusResponse> deleteDevice_Pre($grpc.ServiceCall call, $async.Future<$8.DeleteDeviceRequest> request) async {
    return deleteDevice(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneBoutique_Pre($grpc.ServiceCall call, $async.Future<$9.Boutique> request) async {
    return createOneBoutique(call, await request);
  }

  $async.Future<$1.StatusResponse> updateOneBoutique_Pre($grpc.ServiceCall call, $async.Future<$9.Boutique> request) async {
    return updateOneBoutique(call, await request);
  }

  $async.Future<$1.StatusResponse> createOneFirm($grpc.ServiceCall call, $6.Firm request);
  $async.Future<$6.Firm> readOneFirm($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.StatusResponse> createOneChain($grpc.ServiceCall call, $7.Chain request);
  $async.Future<$1.StatusResponse> updateOneChain($grpc.ServiceCall call, $7.Chain request);
  $async.Future<$7.Devices> readDevices($grpc.ServiceCall call, $8.ReadRequest request);
  $async.Future<$1.StatusResponse> deleteDevice($grpc.ServiceCall call, $8.DeleteDeviceRequest request);
  $async.Future<$1.StatusResponse> createOneBoutique($grpc.ServiceCall call, $9.Boutique request);
  $async.Future<$1.StatusResponse> updateOneBoutique($grpc.ServiceCall call, $9.Boutique request);
}
