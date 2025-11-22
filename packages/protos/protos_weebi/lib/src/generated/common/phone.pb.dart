// This is a generated file - do not edit.
//
// Generated from common/phone.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Phone extends $pb.GeneratedMessage {
  factory Phone({
    $core.int? countryCode,
    $core.String? number,
  }) {
    final result = create();
    if (countryCode != null) result.countryCode = countryCode;
    if (number != null) result.number = number;
    return result;
  }

  Phone._();

  factory Phone.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Phone.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Phone',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'weebi.common.phone'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'countryCode', protoName: 'countryCode')
    ..aOS(2, _omitFieldNames ? '' : 'number')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Phone clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Phone copyWith(void Function(Phone) updates) =>
      super.copyWith((message) => updates(message as Phone)) as Phone;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Phone create() => Phone._();
  @$core.override
  Phone createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Phone getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Phone>(create);
  static Phone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get countryCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set countryCode($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCountryCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCountryCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get number => $_getSZ(1);
  @$pb.TagNumber(2)
  set number($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
