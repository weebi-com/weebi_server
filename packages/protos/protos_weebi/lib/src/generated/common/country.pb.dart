// This is a generated file - do not edit.
//
// Generated from common/country.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Country extends $pb.GeneratedMessage {
  factory Country({
    $core.String? code2Letters,
    $core.String? namel10n,
  }) {
    final result = create();
    if (code2Letters != null) result.code2Letters = code2Letters;
    if (namel10n != null) result.namel10n = namel10n;
    return result;
  }

  Country._();

  factory Country.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Country.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Country',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.common.country'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code2Letters', protoName: 'code2Letters')
    ..aOS(2, _omitFieldNames ? '' : 'namel10n')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Country clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Country copyWith(void Function(Country) updates) =>
      super.copyWith((message) => updates(message as Country)) as Country;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Country create() => Country._();
  @$core.override
  Country createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Country getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Country>(create);
  static Country? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code2Letters => $_getSZ(0);
  @$pb.TagNumber(1)
  set code2Letters($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode2Letters() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode2Letters() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get namel10n => $_getSZ(1);
  @$pb.TagNumber(2)
  set namel10n($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNamel10n() => $_has(1);
  @$pb.TagNumber(2)
  void clearNamel10n() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
