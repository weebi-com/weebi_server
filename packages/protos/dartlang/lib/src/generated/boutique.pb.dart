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
import 'common/mongo.pb.dart' as $11;
import 'common/phone.pb.dart' as $19;

class Boutique extends $pb.GeneratedMessage {
  factory Boutique({
    $11.ObjectIdProto? id,
    $core.String? firmOid,
    $core.String? chainOid,
    $core.String? dateCreation,
    $core.String? dateUpdate,
    $core.String? dateStatus,
    $core.bool? status,
    $core.String? name,
    $19.Phone? phone,
    $20.Address? address,
    $core.double? promo,
    $core.String? promoStart,
    $core.String? promoEnd,
    $core.Map<$core.String, $core.String>? additionalAttributes,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (firmOid != null) {
      $result.firmOid = firmOid;
    }
    if (chainOid != null) {
      $result.chainOid = chainOid;
    }
    if (dateCreation != null) {
      $result.dateCreation = dateCreation;
    }
    if (dateUpdate != null) {
      $result.dateUpdate = dateUpdate;
    }
    if (dateStatus != null) {
      $result.dateStatus = dateStatus;
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
    if (address != null) {
      $result.address = address;
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
  Boutique._() : super();
  factory Boutique.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Boutique.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Boutique', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.boutique'), createEmptyInstance: create)
    ..aOM<$11.ObjectIdProto>(1, _omitFieldNames ? '' : '_id', subBuilder: $11.ObjectIdProto.create)
    ..aOS(2, _omitFieldNames ? '' : 'firmOid', protoName: 'firmOid')
    ..aOS(3, _omitFieldNames ? '' : 'chainOid', protoName: 'chainOid')
    ..aOS(4, _omitFieldNames ? '' : 'creationDate', protoName: 'dateCreation')
    ..aOS(5, _omitFieldNames ? '' : 'updateDate', protoName: 'dateUpdate')
    ..aOS(6, _omitFieldNames ? '' : 'statusUpdateDate', protoName: 'dateStatus')
    ..aOB(7, _omitFieldNames ? '' : 'status')
    ..aOS(8, _omitFieldNames ? '' : 'name')
    ..aOM<$19.Phone>(9, _omitFieldNames ? '' : 'phone', subBuilder: $19.Phone.create)
    ..aOM<$20.Address>(10, _omitFieldNames ? '' : 'addressFull', protoName: 'address', subBuilder: $20.Address.create)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'promo', $pb.PbFieldType.OD)
    ..aOS(12, _omitFieldNames ? '' : 'promoStart', protoName: 'promoStart')
    ..aOS(13, _omitFieldNames ? '' : 'promoEnd', protoName: 'promoEnd')
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

  /// safer to have firmOid and chainOid
  @$pb.TagNumber(1)
  $11.ObjectIdProto get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($11.ObjectIdProto v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
  @$pb.TagNumber(1)
  $11.ObjectIdProto ensureId() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get firmOid => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmOid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirmOid() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmOid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get chainOid => $_getSZ(2);
  @$pb.TagNumber(3)
  set chainOid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChainOid() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainOid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get dateCreation => $_getSZ(3);
  @$pb.TagNumber(4)
  set dateCreation($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDateCreation() => $_has(3);
  @$pb.TagNumber(4)
  void clearDateCreation() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get dateUpdate => $_getSZ(4);
  @$pb.TagNumber(5)
  set dateUpdate($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDateUpdate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDateUpdate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get dateStatus => $_getSZ(5);
  @$pb.TagNumber(6)
  set dateStatus($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDateStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearDateStatus() => clearField(6);

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
  $19.Phone get phone => $_getN(8);
  @$pb.TagNumber(9)
  set phone($19.Phone v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasPhone() => $_has(8);
  @$pb.TagNumber(9)
  void clearPhone() => clearField(9);
  @$pb.TagNumber(9)
  $19.Phone ensurePhone() => $_ensure(8);

  @$pb.TagNumber(10)
  $20.Address get address => $_getN(9);
  @$pb.TagNumber(10)
  set address($20.Address v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAddress() => $_has(9);
  @$pb.TagNumber(10)
  void clearAddress() => clearField(10);
  @$pb.TagNumber(10)
  $20.Address ensureAddress() => $_ensure(9);

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

  @$pb.TagNumber(99)
  $core.Map<$core.String, $core.String> get additionalAttributes => $_getMap(13);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
