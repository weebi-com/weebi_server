// This is a generated file - do not edit.
//
// Generated from weebi_app_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class AppMinVersionRequest extends $pb.GeneratedMessage {
  factory AppMinVersionRequest() => create();

  AppMinVersionRequest._();

  factory AppMinVersionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AppMinVersionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AppMinVersionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.weebi_app.service'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppMinVersionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppMinVersionRequest copyWith(void Function(AppMinVersionRequest) updates) =>
      super.copyWith((message) => updates(message as AppMinVersionRequest))
          as AppMinVersionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AppMinVersionRequest create() => AppMinVersionRequest._();
  @$core.override
  AppMinVersionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AppMinVersionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppMinVersionRequest>(create);
  static AppMinVersionRequest? _defaultInstance;
}

class AppMinVersionResponse extends $pb.GeneratedMessage {
  factory AppMinVersionResponse({
    $core.int? minVersion,
    $core.bool? isUpgradeImperative,
  }) {
    final result = create();
    if (minVersion != null) result.minVersion = minVersion;
    if (isUpgradeImperative != null)
      result.isUpgradeImperative = isUpgradeImperative;
    return result;
  }

  AppMinVersionResponse._();

  factory AppMinVersionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AppMinVersionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AppMinVersionResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.weebi_app.service'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'minVersion', protoName: 'minVersion')
    ..aOB(2, _omitFieldNames ? '' : 'isUpgradeImperative',
        protoName: 'isUpgradeImperative')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppMinVersionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppMinVersionResponse copyWith(
          void Function(AppMinVersionResponse) updates) =>
      super.copyWith((message) => updates(message as AppMinVersionResponse))
          as AppMinVersionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AppMinVersionResponse create() => AppMinVersionResponse._();
  @$core.override
  AppMinVersionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AppMinVersionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppMinVersionResponse>(create);
  static AppMinVersionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get minVersion => $_getIZ(0);
  @$pb.TagNumber(1)
  set minVersion($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMinVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isUpgradeImperative => $_getBF(1);
  @$pb.TagNumber(2)
  set isUpgradeImperative($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsUpgradeImperative() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsUpgradeImperative() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
