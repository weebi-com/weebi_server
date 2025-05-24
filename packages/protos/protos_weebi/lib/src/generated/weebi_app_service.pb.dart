//
//  Generated code. Do not modify.
//  source: weebi_app_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class AppMinVersionRequest extends $pb.GeneratedMessage {
  factory AppMinVersionRequest() => create();
  AppMinVersionRequest._() : super();
  factory AppMinVersionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppMinVersionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AppMinVersionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.weebi_app.service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppMinVersionRequest clone() => AppMinVersionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppMinVersionRequest copyWith(void Function(AppMinVersionRequest) updates) => super.copyWith((message) => updates(message as AppMinVersionRequest)) as AppMinVersionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AppMinVersionRequest create() => AppMinVersionRequest._();
  AppMinVersionRequest createEmptyInstance() => create();
  static $pb.PbList<AppMinVersionRequest> createRepeated() => $pb.PbList<AppMinVersionRequest>();
  @$core.pragma('dart2js:noInline')
  static AppMinVersionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppMinVersionRequest>(create);
  static AppMinVersionRequest? _defaultInstance;
}

class AppMinVersionResponse extends $pb.GeneratedMessage {
  factory AppMinVersionResponse({
    $core.int? minVersion,
    $core.bool? isUpgradeImperative,
  }) {
    final $result = create();
    if (minVersion != null) {
      $result.minVersion = minVersion;
    }
    if (isUpgradeImperative != null) {
      $result.isUpgradeImperative = isUpgradeImperative;
    }
    return $result;
  }
  AppMinVersionResponse._() : super();
  factory AppMinVersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppMinVersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AppMinVersionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.weebi_app.service'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'minVersion', $pb.PbFieldType.O3, protoName: 'minVersion')
    ..aOB(2, _omitFieldNames ? '' : 'isUpgradeImperative', protoName: 'isUpgradeImperative')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppMinVersionResponse clone() => AppMinVersionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppMinVersionResponse copyWith(void Function(AppMinVersionResponse) updates) => super.copyWith((message) => updates(message as AppMinVersionResponse)) as AppMinVersionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AppMinVersionResponse create() => AppMinVersionResponse._();
  AppMinVersionResponse createEmptyInstance() => create();
  static $pb.PbList<AppMinVersionResponse> createRepeated() => $pb.PbList<AppMinVersionResponse>();
  @$core.pragma('dart2js:noInline')
  static AppMinVersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppMinVersionResponse>(create);
  static AppMinVersionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get minVersion => $_getIZ(0);
  @$pb.TagNumber(1)
  set minVersion($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMinVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isUpgradeImperative => $_getBF(1);
  @$pb.TagNumber(2)
  set isUpgradeImperative($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsUpgradeImperative() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsUpgradeImperative() => $_clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
