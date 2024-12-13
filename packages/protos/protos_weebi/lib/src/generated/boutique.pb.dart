//
//  Generated code. Do not modify.
//  source: boutique.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/address.pb.dart' as $22;
import 'common/phone.pb.dart' as $21;
import 'device.pb.dart' as $14;

class Boutique extends $pb.GeneratedMessage {
  factory Boutique({
    $core.String? boutiqueId,
    $core.String? firmId,
    $core.String? chainId,
    $core.String? creationDate,
    $core.String? updateDate,
    $core.String? statusUpdateDate,
    $core.bool? status,
    $core.String? name,
    $21.Phone? phone,
    $22.Address? addressFull,
    $core.double? promo,
    $core.String? promoStart,
    $core.String? promoEnd,
    $core.Iterable<$14.Device>? devices,
    $core.Map<$core.String, $core.String>? additionalAttributes,
  }) {
    final $result = create();
    if (boutiqueId != null) {
      $result.boutiqueId = boutiqueId;
    }
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (creationDate != null) {
      $result.creationDate = creationDate;
    }
    if (updateDate != null) {
      $result.updateDate = updateDate;
    }
    if (statusUpdateDate != null) {
      $result.statusUpdateDate = statusUpdateDate;
    }
    if (status != null) {
      $result.status = status;
    }
    if (name != null) {
      $result.name = name;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (addressFull != null) {
      $result.addressFull = addressFull;
    }
    if (promo != null) {
      $result.promo = promo;
    }
    if (promoStart != null) {
      $result.promoStart = promoStart;
    }
    if (promoEnd != null) {
      $result.promoEnd = promoEnd;
    }
    if (devices != null) {
      $result.devices.addAll(devices);
    }
    if (additionalAttributes != null) {
      $result.additionalAttributes.addAll(additionalAttributes);
    }
    return $result;
  }
  Boutique._() : super();
  factory Boutique.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Boutique.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Boutique', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.boutique'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(3, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(4, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(5, _omitFieldNames ? '' : 'updateDate', protoName: 'updateDate')
    ..aOS(6, _omitFieldNames ? '' : 'statusUpdateDate', protoName: 'statusUpdateDate')
    ..aOB(7, _omitFieldNames ? '' : 'status')
    ..aOS(8, _omitFieldNames ? '' : 'name')
    ..aOM<$21.Phone>(9, _omitFieldNames ? '' : 'phone', subBuilder: $21.Phone.create)
    ..aOM<$22.Address>(10, _omitFieldNames ? '' : 'addressFull', protoName: 'addressFull', subBuilder: $22.Address.create)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'promo', $pb.PbFieldType.OD)
    ..aOS(12, _omitFieldNames ? '' : 'promoStart', protoName: 'promoStart')
    ..aOS(13, _omitFieldNames ? '' : 'promoEnd', protoName: 'promoEnd')
    ..pc<$14.Device>(14, _omitFieldNames ? '' : 'devices', $pb.PbFieldType.PM, subBuilder: $14.Device.create)
    ..m<$core.String, $core.String>(99, _omitFieldNames ? '' : 'additional_attributes', entryClassName: 'Boutique.AdditionalAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('weebi.boutique'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Boutique clone() => Boutique()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Boutique copyWith(void Function(Boutique) updates) => super.copyWith((message) => updates(message as Boutique)) as Boutique;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Boutique create() => Boutique._();
  Boutique createEmptyInstance() => create();
  static $pb.PbList<Boutique> createRepeated() => $pb.PbList<Boutique>();
  @$core.pragma('dart2js:noInline')
  static Boutique getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Boutique>(create);
  static Boutique? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get boutiqueId => $_getSZ(0);
  @$pb.TagNumber(1)
  set boutiqueId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoutiqueId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoutiqueId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firmId => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get chainId => $_getSZ(2);
  @$pb.TagNumber(3)
  set chainId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChainId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get creationDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set creationDate($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreationDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreationDate() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get updateDate => $_getSZ(4);
  @$pb.TagNumber(5)
  set updateDate($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdateDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdateDate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get statusUpdateDate => $_getSZ(5);
  @$pb.TagNumber(6)
  set statusUpdateDate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatusUpdateDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatusUpdateDate() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get status => $_getBF(6);
  @$pb.TagNumber(7)
  set status($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);

  @$pb.TagNumber(9)
  $21.Phone get phone => $_getN(8);
  @$pb.TagNumber(9)
  set phone($21.Phone v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasPhone() => $_has(8);
  @$pb.TagNumber(9)
  void clearPhone() => clearField(9);
  @$pb.TagNumber(9)
  $21.Phone ensurePhone() => $_ensure(8);

  @$pb.TagNumber(10)
  $22.Address get addressFull => $_getN(9);
  @$pb.TagNumber(10)
  set addressFull($22.Address v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAddressFull() => $_has(9);
  @$pb.TagNumber(10)
  void clearAddressFull() => clearField(10);
  @$pb.TagNumber(10)
  $22.Address ensureAddressFull() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.double get promo => $_getN(10);
  @$pb.TagNumber(11)
  set promo($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasPromo() => $_has(10);
  @$pb.TagNumber(11)
  void clearPromo() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get promoStart => $_getSZ(11);
  @$pb.TagNumber(12)
  set promoStart($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPromoStart() => $_has(11);
  @$pb.TagNumber(12)
  void clearPromoStart() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get promoEnd => $_getSZ(12);
  @$pb.TagNumber(13)
  set promoEnd($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasPromoEnd() => $_has(12);
  @$pb.TagNumber(13)
  void clearPromoEnd() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<$14.Device> get devices => $_getList(13);

  @$pb.TagNumber(99)
  $core.Map<$core.String, $core.String> get additionalAttributes => $_getMap(14);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
