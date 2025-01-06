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

import 'common/address.pb.dart' as $20;
import 'common/g_timestamp.pb.dart' as $18;
import 'common/phone.pb.dart' as $19;
import 'device.pb.dart' as $12;

class BoutiqueMongo extends $pb.GeneratedMessage {
  factory BoutiqueMongo({
    BoutiquePb? boutique,
    $core.String? boutiqueId,
    $core.String? firmId,
    $core.String? chainId,
    $18.Timestamp? creationTimestampUTC,
    $core.String? name,
    $core.Iterable<$12.Device>? devices,
    $18.Timestamp? lastTouchTimestampUTC,
    $core.List<$core.int>? logo,
    $core.Map<$core.String, $core.String>? additionalAttributes,
  }) {
    final $result = create();
    if (boutique != null) {
      $result.boutique = boutique;
    }
    if (boutiqueId != null) {
      $result.boutiqueId = boutiqueId;
    }
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (creationTimestampUTC != null) {
      $result.creationTimestampUTC = creationTimestampUTC;
    }
    if (name != null) {
      $result.name = name;
    }
    if (devices != null) {
      $result.devices.addAll(devices);
    }
    if (lastTouchTimestampUTC != null) {
      $result.lastTouchTimestampUTC = lastTouchTimestampUTC;
    }
    if (logo != null) {
      $result.logo = logo;
    }
    if (additionalAttributes != null) {
      $result.additionalAttributes.addAll(additionalAttributes);
    }
    return $result;
  }
  BoutiqueMongo._() : super();
  factory BoutiqueMongo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoutiqueMongo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoutiqueMongo', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.boutique'), createEmptyInstance: create)
    ..aOM<BoutiquePb>(1, _omitFieldNames ? '' : 'boutique', subBuilder: BoutiquePb.create)
    ..aOS(2, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(3, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(4, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$18.Timestamp>(5, _omitFieldNames ? '' : 'creationTimestampUTC', protoName: 'creationTimestampUTC', subBuilder: $18.Timestamp.create)
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..pc<$12.Device>(7, _omitFieldNames ? '' : 'devices', $pb.PbFieldType.PM, subBuilder: $12.Device.create)
    ..aOM<$18.Timestamp>(8, _omitFieldNames ? '' : 'lastTouchTimestampUTC', protoName: 'lastTouchTimestampUTC', subBuilder: $18.Timestamp.create)
    ..a<$core.List<$core.int>>(9, _omitFieldNames ? '' : 'logo', $pb.PbFieldType.OY)
    ..m<$core.String, $core.String>(99, _omitFieldNames ? '' : 'additional_attributes', entryClassName: 'BoutiqueMongo.AdditionalAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('weebi.boutique'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoutiqueMongo clone() => BoutiqueMongo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoutiqueMongo copyWith(void Function(BoutiqueMongo) updates) => super.copyWith((message) => updates(message as BoutiqueMongo)) as BoutiqueMongo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiqueMongo create() => BoutiqueMongo._();
  BoutiqueMongo createEmptyInstance() => create();
  static $pb.PbList<BoutiqueMongo> createRepeated() => $pb.PbList<BoutiqueMongo>();
  @$core.pragma('dart2js:noInline')
  static BoutiqueMongo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoutiqueMongo>(create);
  static BoutiqueMongo? _defaultInstance;

  @$pb.TagNumber(1)
  BoutiquePb get boutique => $_getN(0);
  @$pb.TagNumber(1)
  set boutique(BoutiquePb v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoutique() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoutique() => clearField(1);
  @$pb.TagNumber(1)
  BoutiquePb ensureBoutique() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get boutiqueId => $_getSZ(1);
  @$pb.TagNumber(2)
  set boutiqueId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoutiqueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiqueId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get firmId => $_getSZ(2);
  @$pb.TagNumber(3)
  set firmId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirmId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirmId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get chainId => $_getSZ(3);
  @$pb.TagNumber(4)
  set chainId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChainId() => $_has(3);
  @$pb.TagNumber(4)
  void clearChainId() => clearField(4);

  @$pb.TagNumber(5)
  $18.Timestamp get creationTimestampUTC => $_getN(4);
  @$pb.TagNumber(5)
  set creationTimestampUTC($18.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreationTimestampUTC() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreationTimestampUTC() => clearField(5);
  @$pb.TagNumber(5)
  $18.Timestamp ensureCreationTimestampUTC() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$12.Device> get devices => $_getList(6);

  @$pb.TagNumber(8)
  $18.Timestamp get lastTouchTimestampUTC => $_getN(7);
  @$pb.TagNumber(8)
  set lastTouchTimestampUTC($18.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasLastTouchTimestampUTC() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastTouchTimestampUTC() => clearField(8);
  @$pb.TagNumber(8)
  $18.Timestamp ensureLastTouchTimestampUTC() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.List<$core.int> get logo => $_getN(8);
  @$pb.TagNumber(9)
  set logo($core.List<$core.int> v) { $_setBytes(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLogo() => $_has(8);
  @$pb.TagNumber(9)
  void clearLogo() => clearField(9);

  @$pb.TagNumber(99)
  $core.Map<$core.String, $core.String> get additionalAttributes => $_getMap(9);
}

class BoutiquePb extends $pb.GeneratedMessage {
  factory BoutiquePb({
    $core.String? boutiqueId,
    $core.String? creationDate,
    $core.String? updateDate,
    $core.String? statusUpdateDate,
    $core.bool? status,
    $core.String? name,
    $19.Phone? phone,
    $20.Address? addressFull,
    $core.double? promo,
    $core.String? promoStart,
    $core.String? promoEnd,
    $core.Map<$core.String, $core.String>? additionalAttributes,
  }) {
    final $result = create();
    if (boutiqueId != null) {
      $result.boutiqueId = boutiqueId;
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
    if (additionalAttributes != null) {
      $result.additionalAttributes.addAll(additionalAttributes);
    }
    return $result;
  }
  BoutiquePb._() : super();
  factory BoutiquePb.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoutiquePb.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoutiquePb', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.boutique'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(2, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(3, _omitFieldNames ? '' : 'updateDate', protoName: 'updateDate')
    ..aOS(4, _omitFieldNames ? '' : 'statusUpdateDate', protoName: 'statusUpdateDate')
    ..aOB(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..aOM<$19.Phone>(7, _omitFieldNames ? '' : 'phone', subBuilder: $19.Phone.create)
    ..aOM<$20.Address>(8, _omitFieldNames ? '' : 'addressFull', protoName: 'addressFull', subBuilder: $20.Address.create)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'promo', $pb.PbFieldType.OD)
    ..aOS(10, _omitFieldNames ? '' : 'promoStart', protoName: 'promoStart')
    ..aOS(11, _omitFieldNames ? '' : 'promoEnd', protoName: 'promoEnd')
    ..m<$core.String, $core.String>(99, _omitFieldNames ? '' : 'additional_attributes', entryClassName: 'BoutiquePb.AdditionalAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('weebi.boutique'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoutiquePb clone() => BoutiquePb()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoutiquePb copyWith(void Function(BoutiquePb) updates) => super.copyWith((message) => updates(message as BoutiquePb)) as BoutiquePb;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiquePb create() => BoutiquePb._();
  BoutiquePb createEmptyInstance() => create();
  static $pb.PbList<BoutiquePb> createRepeated() => $pb.PbList<BoutiquePb>();
  @$core.pragma('dart2js:noInline')
  static BoutiquePb getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoutiquePb>(create);
  static BoutiquePb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get boutiqueId => $_getSZ(0);
  @$pb.TagNumber(1)
  set boutiqueId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoutiqueId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoutiqueId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get creationDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set creationDate($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreationDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreationDate() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get updateDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set updateDate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdateDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateDate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get statusUpdateDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set statusUpdateDate($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatusUpdateDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatusUpdateDate() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get status => $_getBF(4);
  @$pb.TagNumber(5)
  set status($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  $19.Phone get phone => $_getN(6);
  @$pb.TagNumber(7)
  set phone($19.Phone v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasPhone() => $_has(6);
  @$pb.TagNumber(7)
  void clearPhone() => clearField(7);
  @$pb.TagNumber(7)
  $19.Phone ensurePhone() => $_ensure(6);

  @$pb.TagNumber(8)
  $20.Address get addressFull => $_getN(7);
  @$pb.TagNumber(8)
  set addressFull($20.Address v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAddressFull() => $_has(7);
  @$pb.TagNumber(8)
  void clearAddressFull() => clearField(8);
  @$pb.TagNumber(8)
  $20.Address ensureAddressFull() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.double get promo => $_getN(8);
  @$pb.TagNumber(9)
  set promo($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPromo() => $_has(8);
  @$pb.TagNumber(9)
  void clearPromo() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get promoStart => $_getSZ(9);
  @$pb.TagNumber(10)
  set promoStart($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPromoStart() => $_has(9);
  @$pb.TagNumber(10)
  void clearPromoStart() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get promoEnd => $_getSZ(10);
  @$pb.TagNumber(11)
  set promoEnd($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasPromoEnd() => $_has(10);
  @$pb.TagNumber(11)
  void clearPromoEnd() => clearField(11);

  @$pb.TagNumber(99)
  $core.Map<$core.String, $core.String> get additionalAttributes => $_getMap(11);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
