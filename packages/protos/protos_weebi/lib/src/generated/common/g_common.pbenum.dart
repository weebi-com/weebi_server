//
//  Generated code. Do not modify.
//  source: common/g_common.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StatusResponse_Type extends $pb.ProtobufEnum {
  static const StatusResponse_Type SUCCESS = StatusResponse_Type._(0, _omitEnumNames ? '' : 'SUCCESS');
  static const StatusResponse_Type ERROR = StatusResponse_Type._(1, _omitEnumNames ? '' : 'ERROR');
  static const StatusResponse_Type CREATED = StatusResponse_Type._(2, _omitEnumNames ? '' : 'CREATED');
  static const StatusResponse_Type UPDATED = StatusResponse_Type._(3, _omitEnumNames ? '' : 'UPDATED');
  static const StatusResponse_Type DELETED = StatusResponse_Type._(4, _omitEnumNames ? '' : 'DELETED');

  static const $core.List<StatusResponse_Type> values = <StatusResponse_Type> [
    SUCCESS,
    ERROR,
    CREATED,
    UPDATED,
    DELETED,
  ];

  static final $core.List<StatusResponse_Type?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 4);
  static StatusResponse_Type? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StatusResponse_Type._(super.v, super.n);
}

class HealthCheckResponse_ServingStatus extends $pb.ProtobufEnum {
  static const HealthCheckResponse_ServingStatus UNKNOWN = HealthCheckResponse_ServingStatus._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const HealthCheckResponse_ServingStatus SERVING = HealthCheckResponse_ServingStatus._(1, _omitEnumNames ? '' : 'SERVING');
  static const HealthCheckResponse_ServingStatus NOT_SERVING = HealthCheckResponse_ServingStatus._(2, _omitEnumNames ? '' : 'NOT_SERVING');
  static const HealthCheckResponse_ServingStatus SERVICE_UNKNOWN = HealthCheckResponse_ServingStatus._(3, _omitEnumNames ? '' : 'SERVICE_UNKNOWN');

  static const $core.List<HealthCheckResponse_ServingStatus> values = <HealthCheckResponse_ServingStatus> [
    UNKNOWN,
    SERVING,
    NOT_SERVING,
    SERVICE_UNKNOWN,
  ];

  static final $core.List<HealthCheckResponse_ServingStatus?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 3);
  static HealthCheckResponse_ServingStatus? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HealthCheckResponse_ServingStatus._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
