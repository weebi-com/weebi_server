//
//  Generated code. Do not modify.
//  source: common/address.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'country.pb.dart' as $21;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Address extends $pb.GeneratedMessage {
  factory Address({
    $core.String? street,
    $core.String? code,
    $core.String? city,
    $21.Country? country,
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final $result = create();
    if (street != null) {
      $result.street = street;
    }
    if (code != null) {
      $result.code = code;
    }
    if (city != null) {
      $result.city = city;
    }
    if (country != null) {
      $result.country = country;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    return $result;
  }
  Address._() : super();
  factory Address.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Address.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Address', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.common.address'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'street')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'city')
    ..aOM<$21.Country>(4, _omitFieldNames ? '' : 'country', subBuilder: $21.Country.create)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Address clone() => Address()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Address copyWith(void Function(Address) updates) => super.copyWith((message) => updates(message as Address)) as Address;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Address create() => Address._();
  Address createEmptyInstance() => create();
  static $pb.PbList<Address> createRepeated() => $pb.PbList<Address>();
  @$core.pragma('dart2js:noInline')
  static Address getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Address>(create);
  static Address? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get street => $_getSZ(0);
  @$pb.TagNumber(1)
  set street($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStreet() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreet() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get city => $_getSZ(2);
  @$pb.TagNumber(3)
  set city($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCity() => $_has(2);
  @$pb.TagNumber(3)
  void clearCity() => $_clearField(3);

  @$pb.TagNumber(4)
  $21.Country get country => $_getN(3);
  @$pb.TagNumber(4)
  set country($21.Country v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCountry() => $_has(3);
  @$pb.TagNumber(4)
  void clearCountry() => $_clearField(4);
  @$pb.TagNumber(4)
  $21.Country ensureCountry() => $_ensure(3);

  /// optional
  @$pb.TagNumber(5)
  $core.double get latitude => $_getN(4);
  @$pb.TagNumber(5)
  set latitude($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLatitude() => $_has(4);
  @$pb.TagNumber(5)
  void clearLatitude() => $_clearField(5);

  /// optional
  @$pb.TagNumber(6)
  $core.double get longitude => $_getN(5);
  @$pb.TagNumber(6)
  set longitude($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLongitude() => $_has(5);
  @$pb.TagNumber(6)
  void clearLongitude() => $_clearField(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
