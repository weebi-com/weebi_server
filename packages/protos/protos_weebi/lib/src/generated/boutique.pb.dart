// This is a generated file - do not edit.
//
// Generated from boutique.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'boutique.pbenum.dart';
import 'common/address.pb.dart' as $3;
import 'common/g_timestamp.pb.dart' as $0;
import 'common/phone.pb.dart' as $2;
import 'device.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'boutique.pbenum.dart';

/// / One self-declared business classification (ISIC-oriented).
/// / Not an enum: the authoritative list lives in protos_weebi data.
/// / Composite unique key: ([isic_code], [sub_code]). [isic_code] may repeat;
/// / [sub_code] distinguishes Weebi refinements (empty when ISIC alone is enough).
class BusinessClassification extends $pb.GeneratedMessage {
  factory BusinessClassification({
    $core.String? isicCode,
    $core.String? subCode,
    $core.String? emoji,
    $core.String? labelFr,
    $core.String? isicLabelFr,
    $core.String? isicLabelEn,
    $core.String? isicLabelEs,
    CommerceTypePb? smtRegime,
  }) {
    final result = create();
    if (isicCode != null) result.isicCode = isicCode;
    if (subCode != null) result.subCode = subCode;
    if (emoji != null) result.emoji = emoji;
    if (labelFr != null) result.labelFr = labelFr;
    if (isicLabelFr != null) result.isicLabelFr = isicLabelFr;
    if (isicLabelEn != null) result.isicLabelEn = isicLabelEn;
    if (isicLabelEs != null) result.isicLabelEs = isicLabelEs;
    if (smtRegime != null) result.smtRegime = smtRegime;
    return result;
  }

  BusinessClassification._();

  factory BusinessClassification.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BusinessClassification.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BusinessClassification',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.boutique'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'isicCode')
    ..aOS(2, _omitFieldNames ? '' : 'subCode')
    ..aOS(3, _omitFieldNames ? '' : 'emoji')
    ..aOS(4, _omitFieldNames ? '' : 'labelFr')
    ..aOS(5, _omitFieldNames ? '' : 'isicLabelFr')
    ..aOS(6, _omitFieldNames ? '' : 'isicLabelEn')
    ..aOS(7, _omitFieldNames ? '' : 'isicLabelEs')
    ..aE<CommerceTypePb>(8, _omitFieldNames ? '' : 'smtRegime',
        enumValues: CommerceTypePb.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusinessClassification clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusinessClassification copyWith(
          void Function(BusinessClassification) updates) =>
      super.copyWith((message) => updates(message as BusinessClassification))
          as BusinessClassification;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusinessClassification create() => BusinessClassification._();
  @$core.override
  BusinessClassification createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BusinessClassification getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusinessClassification>(create);
  static BusinessClassification? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get isicCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set isicCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsicCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsicCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get subCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set subCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSubCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get emoji => $_getSZ(2);
  @$pb.TagNumber(3)
  set emoji($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmoji() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmoji() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get labelFr => $_getSZ(3);
  @$pb.TagNumber(4)
  set labelFr($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLabelFr() => $_has(3);
  @$pb.TagNumber(4)
  void clearLabelFr() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get isicLabelFr => $_getSZ(4);
  @$pb.TagNumber(5)
  set isicLabelFr($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsicLabelFr() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsicLabelFr() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get isicLabelEn => $_getSZ(5);
  @$pb.TagNumber(6)
  set isicLabelEn($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsicLabelEn() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsicLabelEn() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get isicLabelEs => $_getSZ(6);
  @$pb.TagNumber(7)
  set isicLabelEs($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIsicLabelEs() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsicLabelEs() => $_clearField(7);

  @$pb.TagNumber(8)
  CommerceTypePb get smtRegime => $_getN(7);
  @$pb.TagNumber(8)
  set smtRegime(CommerceTypePb value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasSmtRegime() => $_has(7);
  @$pb.TagNumber(8)
  void clearSmtRegime() => $_clearField(8);
}

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
    ..pPM<$1.Device>(7, _omitFieldNames ? '' : 'devices',
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
  BoutiqueMongo clone() => deepCopy();
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
    $core.String? currency,
    $core.bool? isDualCurrencyEnabled,
    $core.String? secondaryDisplayCurrency,
    BusinessRules? businessRules,
    $core.Iterable<ClosedYearPb>? closedYears,
    $core.String? commercialRegisterNumber,
    CommerceTypePb? commerceType,
    $core.String? isicCode,
    $core.String? isicSubCode,
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
    if (currency != null) result.currency = currency;
    if (isDualCurrencyEnabled != null)
      result.isDualCurrencyEnabled = isDualCurrencyEnabled;
    if (secondaryDisplayCurrency != null)
      result.secondaryDisplayCurrency = secondaryDisplayCurrency;
    if (businessRules != null) result.businessRules = businessRules;
    if (closedYears != null) result.closedYears.addAll(closedYears);
    if (commercialRegisterNumber != null)
      result.commercialRegisterNumber = commercialRegisterNumber;
    if (commerceType != null) result.commerceType = commerceType;
    if (isicCode != null) result.isicCode = isicCode;
    if (isicSubCode != null) result.isicSubCode = isicSubCode;
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
    ..aD(9, _omitFieldNames ? '' : 'promo')
    ..aOS(10, _omitFieldNames ? '' : 'promoStart', protoName: 'promoStart')
    ..aOS(11, _omitFieldNames ? '' : 'promoEnd', protoName: 'promoEnd')
    ..aOB(12, _omitFieldNames ? '' : 'isDeleted', protoName: 'isDeleted')
    ..aOS(13, _omitFieldNames ? '' : 'deletedBy', protoName: 'deletedBy')
    ..aOS(14, _omitFieldNames ? '' : 'restoredBy', protoName: 'restoredBy')
    ..aOS(15, _omitFieldNames ? '' : 'mail')
    ..aOS(16, _omitFieldNames ? '' : 'currency')
    ..aOB(17, _omitFieldNames ? '' : 'dualCurrencyEnabled',
        protoName: 'isDualCurrencyEnabled')
    ..aOS(18, _omitFieldNames ? '' : 'secondaryDisplayCurrency',
        protoName: 'secondaryDisplayCurrency')
    ..aOM<BusinessRules>(19, _omitFieldNames ? '' : 'businessRules',
        protoName: 'businessRules', subBuilder: BusinessRules.create)
    ..pPM<ClosedYearPb>(20, _omitFieldNames ? '' : 'closedYears',
        subBuilder: ClosedYearPb.create)
    ..aOS(21, _omitFieldNames ? '' : 'commercialRegisterNumber')
    ..aE<CommerceTypePb>(22, _omitFieldNames ? '' : 'commerceType',
        enumValues: CommerceTypePb.values)
    ..aOS(23, _omitFieldNames ? '' : 'isicCode')
    ..aOS(24, _omitFieldNames ? '' : 'isicSubCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiquePb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoutiquePb copyWith(void Function(BoutiquePb) updates) =>
      super.copyWith((message) => updates(message as BoutiquePb)) as BoutiquePb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoutiquePb create() => BoutiquePb._();
  @$core.override
  BoutiquePb createEmptyInstance() => create();
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

  /// / ISO 4217 billing currency for this boutique. Empty: inherit chain then firm then platform default.
  @$pb.TagNumber(16)
  $core.String get currency => $_getSZ(15);
  @$pb.TagNumber(16)
  set currency($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasCurrency() => $_has(15);
  @$pb.TagNumber(16)
  void clearCurrency() => $_clearField(16);

  /// / When true, PoS/web clients may show amounts in secondaryDisplayCurrency (display-only; same semantics as chain/firm).
  @$pb.TagNumber(17)
  $core.bool get isDualCurrencyEnabled => $_getBF(16);
  @$pb.TagNumber(17)
  set isDualCurrencyEnabled($core.bool value) => $_setBool(16, value);
  @$pb.TagNumber(17)
  $core.bool hasIsDualCurrencyEnabled() => $_has(16);
  @$pb.TagNumber(17)
  void clearIsDualCurrencyEnabled() => $_clearField(17);

  /// / ISO 4217 secondary display code (e.g. USD). Meaningful when isDualCurrencyEnabled is true.
  @$pb.TagNumber(18)
  $core.String get secondaryDisplayCurrency => $_getSZ(17);
  @$pb.TagNumber(18)
  set secondaryDisplayCurrency($core.String value) => $_setString(17, value);
  @$pb.TagNumber(18)
  $core.bool hasSecondaryDisplayCurrency() => $_has(17);
  @$pb.TagNumber(18)
  void clearSecondaryDisplayCurrency() => $_clearField(18);

  @$pb.TagNumber(19)
  BusinessRules get businessRules => $_getN(18);
  @$pb.TagNumber(19)
  set businessRules(BusinessRules value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasBusinessRules() => $_has(18);
  @$pb.TagNumber(19)
  void clearBusinessRules() => $_clearField(19);
  @$pb.TagNumber(19)
  BusinessRules ensureBusinessRules() => $_ensure(18);

  /// / Soft-closed calendar years for SYSCOHADA SMT (client writes; server may
  /// / ignore until fence supports it). Carries résultat + treasury for ranking.
  @$pb.TagNumber(20)
  $pb.PbList<ClosedYearPb> get closedYears => $_getList(19);

  /// / RCCM / registre de commerce (optional; required at SMT year close).
  @$pb.TagNumber(21)
  $core.String get commercialRegisterNumber => $_getSZ(20);
  @$pb.TagNumber(21)
  set commercialRegisterNumber($core.String value) => $_setString(20, value);
  @$pb.TagNumber(21)
  $core.bool hasCommercialRegisterNumber() => $_has(20);
  @$pb.TagNumber(21)
  void clearCommercialRegisterNumber() => $_clearField(21);

  /// / SMT regime A/B/C; unknown defaults to négoce ceiling.
  @$pb.TagNumber(22)
  CommerceTypePb get commerceType => $_getN(21);
  @$pb.TagNumber(22)
  set commerceType(CommerceTypePb value) => $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasCommerceType() => $_has(21);
  @$pb.TagNumber(22)
  void clearCommerceType() => $_clearField(22);

  /// / ISIC code from the chosen classification (string; may keep leading zeros).
  @$pb.TagNumber(23)
  $core.String get isicCode => $_getSZ(22);
  @$pb.TagNumber(23)
  set isicCode($core.String value) => $_setString(22, value);
  @$pb.TagNumber(23)
  $core.bool hasIsicCode() => $_has(22);
  @$pb.TagNumber(23)
  void clearIsicCode() => $_clearField(23);

  /// / Weebi refinement when several activities share the same ISIC (e.g. coiffure).
  @$pb.TagNumber(24)
  $core.String get isicSubCode => $_getSZ(23);
  @$pb.TagNumber(24)
  set isicSubCode($core.String value) => $_setString(23, value);
  @$pb.TagNumber(24)
  $core.bool hasIsicSubCode() => $_has(23);
  @$pb.TagNumber(24)
  void clearIsicSubCode() => $_clearField(24);
}

/// / One soft-closed calendar year + minimal SMT snapshot (loan-potential hook).
class ClosedYearPb extends $pb.GeneratedMessage {
  factory ClosedYearPb({
    $core.int? year,
    $core.double? resultat,
    $core.double? treasuryTotal,
    $core.String? closedAt,
    $core.String? commercialRegisterNumber,
    CommerceTypePb? commerceType,
    $core.String? isicCode,
    $core.String? isicSubCode,
  }) {
    final result = create();
    if (year != null) result.year = year;
    if (resultat != null) result.resultat = resultat;
    if (treasuryTotal != null) result.treasuryTotal = treasuryTotal;
    if (closedAt != null) result.closedAt = closedAt;
    if (commercialRegisterNumber != null)
      result.commercialRegisterNumber = commercialRegisterNumber;
    if (commerceType != null) result.commerceType = commerceType;
    if (isicCode != null) result.isicCode = isicCode;
    if (isicSubCode != null) result.isicSubCode = isicSubCode;
    return result;
  }

  ClosedYearPb._();

  factory ClosedYearPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClosedYearPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClosedYearPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.boutique'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'year')
    ..aD(2, _omitFieldNames ? '' : 'resultat')
    ..aD(3, _omitFieldNames ? '' : 'treasuryTotal')
    ..aOS(4, _omitFieldNames ? '' : 'closedAt')
    ..aOS(5, _omitFieldNames ? '' : 'commercialRegisterNumber')
    ..aE<CommerceTypePb>(6, _omitFieldNames ? '' : 'commerceType',
        enumValues: CommerceTypePb.values)
    ..aOS(7, _omitFieldNames ? '' : 'isicCode')
    ..aOS(8, _omitFieldNames ? '' : 'isicSubCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosedYearPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosedYearPb copyWith(void Function(ClosedYearPb) updates) =>
      super.copyWith((message) => updates(message as ClosedYearPb))
          as ClosedYearPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClosedYearPb create() => ClosedYearPb._();
  @$core.override
  ClosedYearPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClosedYearPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClosedYearPb>(create);
  static ClosedYearPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get year => $_getIZ(0);
  @$pb.TagNumber(1)
  set year($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasYear() => $_has(0);
  @$pb.TagNumber(1)
  void clearYear() => $_clearField(1);

  /// / Cash-basis SMT résultat (recettes − dépenses) for the closed year.
  @$pb.TagNumber(2)
  $core.double get resultat => $_getN(1);
  @$pb.TagNumber(2)
  set resultat($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasResultat() => $_has(1);
  @$pb.TagNumber(2)
  void clearResultat() => $_clearField(2);

  /// / Sum of treasury closing balances (571+521+554) at 31/12.
  @$pb.TagNumber(3)
  $core.double get treasuryTotal => $_getN(2);
  @$pb.TagNumber(3)
  set treasuryTotal($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTreasuryTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTreasuryTotal() => $_clearField(3);

  /// / ISO-8601 when the year was closed (optional; client fill).
  @$pb.TagNumber(4)
  $core.String get closedAt => $_getSZ(3);
  @$pb.TagNumber(4)
  set closedAt($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasClosedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearClosedAt() => $_clearField(4);

  /// / Snapshot at close time (appears on SMT PDF/Excel).
  @$pb.TagNumber(5)
  $core.String get commercialRegisterNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set commercialRegisterNumber($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCommercialRegisterNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearCommercialRegisterNumber() => $_clearField(5);

  @$pb.TagNumber(6)
  CommerceTypePb get commerceType => $_getN(5);
  @$pb.TagNumber(6)
  set commerceType(CommerceTypePb value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCommerceType() => $_has(5);
  @$pb.TagNumber(6)
  void clearCommerceType() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get isicCode => $_getSZ(6);
  @$pb.TagNumber(7)
  set isicCode($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIsicCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsicCode() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get isicSubCode => $_getSZ(7);
  @$pb.TagNumber(8)
  set isicSubCode($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsicSubCode() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsicSubCode() => $_clearField(8);
}

/// since a firm may contain different chains with different business realities.
/// we prefer to put business rules at the chain level
/// declared here to avoid circular dependency with boutique.proto
class BusinessRules extends $pb.GeneratedMessage {
  factory BusinessRules({
    $core.bool? isNegativeStockGuardEnabled,
    $core.bool? isRecentTicketEditEnabled,
    $core.int? recentTicketEditWindowMinutes,
    $core.bool? isVatSelectionEnabled,
  }) {
    final result = create();
    if (isNegativeStockGuardEnabled != null)
      result.isNegativeStockGuardEnabled = isNegativeStockGuardEnabled;
    if (isRecentTicketEditEnabled != null)
      result.isRecentTicketEditEnabled = isRecentTicketEditEnabled;
    if (recentTicketEditWindowMinutes != null)
      result.recentTicketEditWindowMinutes = recentTicketEditWindowMinutes;
    if (isVatSelectionEnabled != null)
      result.isVatSelectionEnabled = isVatSelectionEnabled;
    return result;
  }

  BusinessRules._();

  factory BusinessRules.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BusinessRules.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BusinessRules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.boutique'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isNegativeStockGuardEnabled',
        protoName: 'isNegativeStockGuardEnabled')
    ..aOB(2, _omitFieldNames ? '' : 'isRecentTicketEditEnabled',
        protoName: 'isRecentTicketEditEnabled')
    ..aI(3, _omitFieldNames ? '' : 'recentTicketEditWindowMinutes',
        protoName: 'recentTicketEditWindowMinutes')
    ..aOB(4, _omitFieldNames ? '' : 'isVatSelectionEnabled',
        protoName: 'isVatSelectionEnabled')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusinessRules clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusinessRules copyWith(void Function(BusinessRules) updates) =>
      super.copyWith((message) => updates(message as BusinessRules))
          as BusinessRules;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusinessRules create() => BusinessRules._();
  @$core.override
  BusinessRules createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BusinessRules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusinessRules>(create);
  static BusinessRules? _defaultInstance;

  /// guard against negative stocks in the chain when true
  @$pb.TagNumber(1)
  $core.bool get isNegativeStockGuardEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set isNegativeStockGuardEnabled($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsNegativeStockGuardEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsNegativeStockGuardEnabled() => $_clearField(1);

  /// allow recent ticket edit in the chain when true
  @$pb.TagNumber(2)
  $core.bool get isRecentTicketEditEnabled => $_getBF(1);
  @$pb.TagNumber(2)
  set isRecentTicketEditEnabled($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsRecentTicketEditEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsRecentTicketEditEnabled() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get recentTicketEditWindowMinutes => $_getIZ(2);
  @$pb.TagNumber(3)
  set recentTicketEditWindowMinutes($core.int value) =>
      $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRecentTicketEditWindowMinutes() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecentTicketEditWindowMinutes() => $_clearField(3);

  /// OHADA: when true, show VAT selection on tickets (hidden by default for OHADA countries)
  @$pb.TagNumber(4)
  $core.bool get isVatSelectionEnabled => $_getBF(3);
  @$pb.TagNumber(4)
  set isVatSelectionEnabled($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsVatSelectionEnabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsVatSelectionEnabled() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
