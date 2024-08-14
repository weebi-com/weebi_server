//
//  Generated code. Do not modify.
//  source: common/country.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Country extends $pb.GeneratedMessage {
  factory Country({
    $core.String? code2Letters,
    $core.String? namel10n,
  }) {
    final $result = create();
    if (code2Letters != null) {
      $result.code2Letters = code2Letters;
    }
    if (namel10n != null) {
      $result.namel10n = namel10n;
    }
    return $result;
  }
  Country._() : super();
  factory Country.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Country.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Country', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.common.country'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code2Letters', protoName: 'code2Letters')
    ..aOS(2, _omitFieldNames ? '' : 'namel10n')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Country clone() => Country()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Country copyWith(void Function(Country) updates) => super.copyWith((message) => updates(message as Country)) as Country;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Country create() => Country._();
  Country createEmptyInstance() => create();
  static $pb.PbList<Country> createRepeated() => $pb.PbList<Country>();
  @$core.pragma('dart2js:noInline')
  static Country getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Country>(create);
  static Country? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code2Letters => $_getSZ(0);
  @$pb.TagNumber(1)
  set code2Letters($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode2Letters() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode2Letters() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get namel10n => $_getSZ(1);
  @$pb.TagNumber(2)
  set namel10n($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNamel10n() => $_has(1);
  @$pb.TagNumber(2)
  void clearNamel10n() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
