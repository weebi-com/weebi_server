// This is a generated file - do not edit.
//
// Generated from boutique.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/address.pb.dart' as $3;
import 'common/g_timestamp.pb.dart' as $0;
import 'common/phone.pb.dart' as $2;
import 'device.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class BoutiqueMongo extends $pb.GeneratedMessage {
  factory BoutiqueMongo({
    BoutiquePb? boutique,
    $core.String? boutiqueId,
    $core.String? firmId,
    $core.String? chainId,
    $0.Timestamp? creationTimestampUTC,
    $core.String? name,
    $core.Iterable<$1.Device>? devices,
    $0.Timestamp? lastTouchTimestampUTC,
    $core.List<$core.int>? logo,
    $core.String? logoExtension,
    $core.bool? isDeleted,
    $core.String? deletedBy,
    $core.String? restoredBy,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        additionalAttributes,
  }) {
    final result = create();
    if (boutique != null) result.boutique = boutique;
    if (boutiqueId != null) result.boutiqueId = boutiqueId;
    if (firmId != null) result.firmId = firmId;
    if (chainId != null) result.chainId = chainId;
    if (creationTimestampUTC != null)
      result.creationTimestampUTC = creationTimestampUTC;
    if (name != null) result.name = name;
    if (devices != null) result.devices.addAll(devices);
    if (lastTouchTimestampUTC != null)
      result.lastTouchTimestampUTC = lastTouchTimestampUTC;
    if (logo != null) result.logo = logo;
    if (logoExtension != null) result.logoExtension = logoExtension;
    if (isDeleted != null) result.isDeleted = isDeleted;
    if (deletedBy != null) result.deletedBy = deletedBy;
    if (restoredBy != null) result.restoredBy = restoredBy;
    if (additionalAttributes != null)
      result.additionalAttributes.addEntries(additionalAttributes);
    return result;
  }

  BoutiqueMongo._();

  factory BoutiqueMongo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoutiqueMongo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoutiqueMongo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.boutique'),
      createEmptyInstance: create)
    ..aOM<BoutiquePb>(1, _omitFieldNames ? '' : 'boutique',
        subBuilder: BoutiquePb.create)
    ..aOS(2, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(3, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(4, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$0.Timestamp>(5, _omitFieldNames ? '' : 'creationTimestampUTC',
        protoName: 'creationTimestampUTC', subBuilder: $0.Timestamp.create)
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..pc<$1.Device>(7, _omitFieldNames ? '' : 'devices', $pb.PbFieldType.PM,
        subBuilder: $1.Device.create)
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'lastTouchTimestampUTC',
        protoName: 'lastTouchTimestampUTC', subBuilder: $0.Timestamp.create)
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'logo', $pb.PbFieldType.OY)
    ..aOS(10, _omitFieldNames ? '' : 'logoExtension',
        protoName: 'logoExtension')
    ..aOB(11, _omitFieldNames ? '' : 'isDeleted', protoName: 'isDeleted')
    ..aOS(12, _omitFieldNames ? '' : 'deletedBy', protoName: 'deletedBy')
    ..aOS(13, _omitFieldNames ? '' : 'restoredBy', protoName: 'restoredBy')
    ..m<$core.String, $core.String>(
        99, _omitFieldNames ? '' : 'additional_attributes',
        entryClassName: 'BoutiqueMongo.AdditionalAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('weebi.boutique'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueMongo clone() => BoutiqueMongo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiqueMongo copyWith(void Function(BoutiqueMongo) updates) =>
      super.copyWith((message) => updates(message as BoutiqueMongo))
          as BoutiqueMongo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiqueMongo create() => BoutiqueMongo._();
  @$core.override
  BoutiqueMongo createEmptyInstance() => create();
  static $pb.PbList<BoutiqueMongo> createRepeated() =>
      $pb.PbList<BoutiqueMongo>();
  @$core.pragma('dart2js:noInline')
  static BoutiqueMongo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoutiqueMongo>(create);
  static BoutiqueMongo? _defaultInstance;

  @$pb.TagNumber(1)
  BoutiquePb get boutique => $_getN(0);
  @$pb.TagNumber(1)
  set boutique(BoutiquePb value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBoutique() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoutique() => $_clearField(1);
  @$pb.TagNumber(1)
  BoutiquePb ensureBoutique() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get boutiqueId => $_getSZ(1);
  @$pb.TagNumber(2)
  set boutiqueId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBoutiqueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiqueId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get firmId => $_getSZ(2);
  @$pb.TagNumber(3)
  set firmId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFirmId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirmId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get chainId => $_getSZ(3);
  @$pb.TagNumber(4)
  set chainId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChainId() => $_has(3);
  @$pb.TagNumber(4)
  void clearChainId() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.Timestamp get creationTimestampUTC => $_getN(4);
  @$pb.TagNumber(5)
  set creationTimestampUTC($0.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCreationTimestampUTC() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreationTimestampUTC() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureCreationTimestampUTC() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<$1.Device> get devices => $_getList(6);

  @$pb.TagNumber(8)
  $0.Timestamp get lastTouchTimestampUTC => $_getN(7);
  @$pb.TagNumber(8)
  set lastTouchTimestampUTC($0.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasLastTouchTimestampUTC() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastTouchTimestampUTC() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureLastTouchTimestampUTC() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.List<$core.int> get logo => $_getN(8);
  @$pb.TagNumber(9)
  set logo($core.List<$core.int> value) => $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasLogo() => $_has(8);
  @$pb.TagNumber(9)
  void clearLogo() => $_clearField(9);

  /// / extension here is a string, e.g. png or jpeg (!= enum in ArticlePhotoPb)
  @$pb.TagNumber(10)
  $core.String get logoExtension => $_getSZ(9);
  @$pb.TagNumber(10)
  set logoExtension($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLogoExtension() => $_has(9);
  @$pb.TagNumber(10)
  void clearLogoExtension() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isDeleted => $_getBF(10);
  @$pb.TagNumber(11)
  set isDeleted($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasIsDeleted() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsDeleted() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get deletedBy => $_getSZ(11);
  @$pb.TagNumber(12)
  set deletedBy($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasDeletedBy() => $_has(11);
  @$pb.TagNumber(12)
  void clearDeletedBy() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get restoredBy => $_getSZ(12);
  @$pb.TagNumber(13)
  set restoredBy($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasRestoredBy() => $_has(12);
  @$pb.TagNumber(13)
  void clearRestoredBy() => $_clearField(13);

  @$pb.TagNumber(99)
  $pb.PbMap<$core.String, $core.String> get additionalAttributes =>
      $_getMap(13);
}

class BoutiquePb extends $pb.GeneratedMessage {
  factory BoutiquePb({
    $core.String? boutiqueId,
    $core.String? creationDate,
    $core.String? updateDate,
    @$core.Deprecated('This field is deprecated.')
    $core.String? statusUpdateDate,
    @$core.Deprecated('This field is deprecated.') $core.bool? status,
    $core.String? name,
    $2.Phone? phone,
    $3.Address? addressFull,
    $core.double? promo,
    $core.String? promoStart,
    $core.String? promoEnd,
    $core.bool? isDeleted,
    $core.String? deletedBy,
    $core.String? restoredBy,
    $core.String? mail,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        additionalAttributes,
  }) {
    final result = create();
    if (boutiqueId != null) result.boutiqueId = boutiqueId;
    if (creationDate != null) result.creationDate = creationDate;
    if (updateDate != null) result.updateDate = updateDate;
    if (statusUpdateDate != null) result.statusUpdateDate = statusUpdateDate;
    if (status != null) result.status = status;
    if (name != null) result.name = name;
    if (phone != null) result.phone = phone;
    if (addressFull != null) result.addressFull = addressFull;
    if (promo != null) result.promo = promo;
    if (promoStart != null) result.promoStart = promoStart;
    if (promoEnd != null) result.promoEnd = promoEnd;
    if (isDeleted != null) result.isDeleted = isDeleted;
    if (deletedBy != null) result.deletedBy = deletedBy;
    if (restoredBy != null) result.restoredBy = restoredBy;
    if (mail != null) result.mail = mail;
    if (additionalAttributes != null)
      result.additionalAttributes.addEntries(additionalAttributes);
    return result;
  }

  BoutiquePb._();

  factory BoutiquePb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoutiquePb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoutiquePb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.boutique'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(2, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(3, _omitFieldNames ? '' : 'updateDate', protoName: 'updateDate')
    ..aOS(4, _omitFieldNames ? '' : 'statusUpdateDate',
        protoName: 'statusUpdateDate')
    ..aOB(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..aOM<$2.Phone>(7, _omitFieldNames ? '' : 'phone',
        subBuilder: $2.Phone.create)
    ..aOM<$3.Address>(8, _omitFieldNames ? '' : 'addressFull',
        protoName: 'addressFull', subBuilder: $3.Address.create)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'promo', $pb.PbFieldType.OD)
    ..aOS(10, _omitFieldNames ? '' : 'promoStart', protoName: 'promoStart')
    ..aOS(11, _omitFieldNames ? '' : 'promoEnd', protoName: 'promoEnd')
    ..aOB(12, _omitFieldNames ? '' : 'isDeleted', protoName: 'isDeleted')
    ..aOS(13, _omitFieldNames ? '' : 'deletedBy', protoName: 'deletedBy')
    ..aOS(14, _omitFieldNames ? '' : 'restoredBy', protoName: 'restoredBy')
    ..aOS(15, _omitFieldNames ? '' : 'mail')
    ..m<$core.String, $core.String>(
        99, _omitFieldNames ? '' : 'additional_attributes',
        entryClassName: 'BoutiquePb.AdditionalAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('weebi.boutique'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiquePb clone() => BoutiquePb()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiquePb copyWith(void Function(BoutiquePb) updates) =>
      super.copyWith((message) => updates(message as BoutiquePb)) as BoutiquePb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiquePb create() => BoutiquePb._();
  @$core.override
  BoutiquePb createEmptyInstance() => create();
  static $pb.PbList<BoutiquePb> createRepeated() => $pb.PbList<BoutiquePb>();
  @$core.pragma('dart2js:noInline')
  static BoutiquePb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoutiquePb>(create);
  static BoutiquePb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get boutiqueId => $_getSZ(0);
  @$pb.TagNumber(1)
  set boutiqueId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBoutiqueId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoutiqueId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get creationDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set creationDate($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreationDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreationDate() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get updateDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set updateDate($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdateDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateDate() => $_clearField(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.String get statusUpdateDate => $_getSZ(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set statusUpdateDate($core.String value) => $_setString(3, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasStatusUpdateDate() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearStatusUpdateDate() => $_clearField(4);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool get status => $_getBF(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set status($core.bool value) => $_setBool(4, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => $_clearField(6);

  @$pb.TagNumber(7)
  $2.Phone get phone => $_getN(6);
  @$pb.TagNumber(7)
  set phone($2.Phone value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasPhone() => $_has(6);
  @$pb.TagNumber(7)
  void clearPhone() => $_clearField(7);
  @$pb.TagNumber(7)
  $2.Phone ensurePhone() => $_ensure(6);

  @$pb.TagNumber(8)
  $3.Address get addressFull => $_getN(7);
  @$pb.TagNumber(8)
  set addressFull($3.Address value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasAddressFull() => $_has(7);
  @$pb.TagNumber(8)
  void clearAddressFull() => $_clearField(8);
  @$pb.TagNumber(8)
  $3.Address ensureAddressFull() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.double get promo => $_getN(8);
  @$pb.TagNumber(9)
  set promo($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPromo() => $_has(8);
  @$pb.TagNumber(9)
  void clearPromo() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get promoStart => $_getSZ(9);
  @$pb.TagNumber(10)
  set promoStart($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPromoStart() => $_has(9);
  @$pb.TagNumber(10)
  void clearPromoStart() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get promoEnd => $_getSZ(10);
  @$pb.TagNumber(11)
  set promoEnd($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasPromoEnd() => $_has(10);
  @$pb.TagNumber(11)
  void clearPromoEnd() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isDeleted => $_getBF(11);
  @$pb.TagNumber(12)
  set isDeleted($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasIsDeleted() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsDeleted() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get deletedBy => $_getSZ(12);
  @$pb.TagNumber(13)
  set deletedBy($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasDeletedBy() => $_has(12);
  @$pb.TagNumber(13)
  void clearDeletedBy() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get restoredBy => $_getSZ(13);
  @$pb.TagNumber(14)
  set restoredBy($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasRestoredBy() => $_has(13);
  @$pb.TagNumber(14)
  void clearRestoredBy() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get mail => $_getSZ(14);
  @$pb.TagNumber(15)
  set mail($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasMail() => $_has(14);
  @$pb.TagNumber(15)
  void clearMail() => $_clearField(15);

  @$pb.TagNumber(99)
  $pb.PbMap<$core.String, $core.String> get additionalAttributes =>
      $_getMap(15);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
