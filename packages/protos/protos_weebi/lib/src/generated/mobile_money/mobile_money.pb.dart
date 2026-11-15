// This is a generated file - do not edit.
//
// Generated from mobile_money/mobile_money.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'mobile_money.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'mobile_money.pbenum.dart';

/// / One operator in the global mobile-money catalog.
/// / Empty [country_codes] means the operator is available in every country.
class MobileMoneyOperatorPb extends $pb.GeneratedMessage {
  factory MobileMoneyOperatorPb({
    $core.String? code,
    $core.String? name,
    $core.Iterable<$core.String>? countryCodes,
    $core.List<$core.int>? logo,
    MobileMoneyOperatorPb_LogoExtensionPb? logoExtension,
    $core.bool? active,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (name != null) result.name = name;
    if (countryCodes != null) result.countryCodes.addAll(countryCodes);
    if (logo != null) result.logo = logo;
    if (logoExtension != null) result.logoExtension = logoExtension;
    if (active != null) result.active = active;
    return result;
  }

  MobileMoneyOperatorPb._();

  factory MobileMoneyOperatorPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MobileMoneyOperatorPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MobileMoneyOperatorPb',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.mobile_money.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pPS(3, _omitFieldNames ? '' : 'countryCodes')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'logo', $pb.PbFieldType.OY)
    ..aE<MobileMoneyOperatorPb_LogoExtensionPb>(
        5, _omitFieldNames ? '' : 'logoExtension',
        enumValues: MobileMoneyOperatorPb_LogoExtensionPb.values)
    ..aOB(6, _omitFieldNames ? '' : 'active')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MobileMoneyOperatorPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MobileMoneyOperatorPb copyWith(
          void Function(MobileMoneyOperatorPb) updates) =>
      super.copyWith((message) => updates(message as MobileMoneyOperatorPb))
          as MobileMoneyOperatorPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MobileMoneyOperatorPb create() => MobileMoneyOperatorPb._();
  @$core.override
  MobileMoneyOperatorPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MobileMoneyOperatorPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MobileMoneyOperatorPb>(create);
  static MobileMoneyOperatorPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// / ISO 3166-1 alpha-2. Empty list = global.
  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get countryCodes => $_getList(2);

  /// / Empty means the client uses its bundled mark (Orange / MTN / Airtel).
  @$pb.TagNumber(4)
  $core.List<$core.int> get logo => $_getN(3);
  @$pb.TagNumber(4)
  set logo($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLogo() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogo() => $_clearField(4);

  @$pb.TagNumber(5)
  MobileMoneyOperatorPb_LogoExtensionPb get logoExtension => $_getN(4);
  @$pb.TagNumber(5)
  set logoExtension(MobileMoneyOperatorPb_LogoExtensionPb value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasLogoExtension() => $_has(4);
  @$pb.TagNumber(5)
  void clearLogoExtension() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get active => $_getBF(5);
  @$pb.TagNumber(6)
  set active($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasActive() => $_has(5);
  @$pb.TagNumber(6)
  void clearActive() => $_clearField(6);
}

class ListMobileMoneyOperatorsRequest extends $pb.GeneratedMessage {
  factory ListMobileMoneyOperatorsRequest({
    $core.String? countryCode,
  }) {
    final result = create();
    if (countryCode != null) result.countryCode = countryCode;
    return result;
  }

  ListMobileMoneyOperatorsRequest._();

  factory ListMobileMoneyOperatorsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListMobileMoneyOperatorsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListMobileMoneyOperatorsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.mobile_money.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'countryCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListMobileMoneyOperatorsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListMobileMoneyOperatorsRequest copyWith(
          void Function(ListMobileMoneyOperatorsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListMobileMoneyOperatorsRequest))
          as ListMobileMoneyOperatorsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListMobileMoneyOperatorsRequest create() =>
      ListMobileMoneyOperatorsRequest._();
  @$core.override
  ListMobileMoneyOperatorsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListMobileMoneyOperatorsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListMobileMoneyOperatorsRequest>(
          create);
  static ListMobileMoneyOperatorsRequest? _defaultInstance;

  /// / ISO 3166-1 alpha-2. Empty returns only global (empty-countryCodes) operators.
  @$pb.TagNumber(1)
  $core.String get countryCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set countryCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCountryCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCountryCode() => $_clearField(1);
}

class ListMobileMoneyOperatorsResponse extends $pb.GeneratedMessage {
  factory ListMobileMoneyOperatorsResponse({
    $core.Iterable<MobileMoneyOperatorPb>? operators,
  }) {
    final result = create();
    if (operators != null) result.operators.addAll(operators);
    return result;
  }

  ListMobileMoneyOperatorsResponse._();

  factory ListMobileMoneyOperatorsResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListMobileMoneyOperatorsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListMobileMoneyOperatorsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.mobile_money.service'),
      createEmptyInstance: create)
    ..pPM<MobileMoneyOperatorPb>(1, _omitFieldNames ? '' : 'operators',
        subBuilder: MobileMoneyOperatorPb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListMobileMoneyOperatorsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListMobileMoneyOperatorsResponse copyWith(
          void Function(ListMobileMoneyOperatorsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListMobileMoneyOperatorsResponse))
          as ListMobileMoneyOperatorsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListMobileMoneyOperatorsResponse create() =>
      ListMobileMoneyOperatorsResponse._();
  @$core.override
  ListMobileMoneyOperatorsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListMobileMoneyOperatorsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListMobileMoneyOperatorsResponse>(
          create);
  static ListMobileMoneyOperatorsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MobileMoneyOperatorPb> get operators => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
