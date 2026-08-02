// This is a generated file - do not edit.
//
// Generated from btq_chain.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'boutique.pb.dart' as $0;
import 'common/g_timestamp.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Chain extends $pb.GeneratedMessage {
  factory Chain({
    $core.String? chainId,
    $core.String? firmId,
    $core.String? name,
    $core.Iterable<$0.BoutiqueMongo>? boutiques,
    $1.Timestamp? creationDateUTC,
    $1.Timestamp? lastUpdateTimestampUTC,
    $core.String? lastUpdatedByuserId,
    $core.bool? isDeleted,
    $core.String? deletedBy,
    $core.String? restoredBy,
    $core.String? currency,
    $core.bool? isDualCurrencyEnabled,
    $core.String? secondaryDisplayCurrency,
    $0.BusinessRules? businessRules,
    $core.Iterable<$0.ClosedYearPb>? closedYears,
    $core.String? commercialRegisterNumber,
    $0.CommerceTypePb? commerceType,
    $core.String? isicCode,
    $core.String? isicSubCode,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (firmId != null) result.firmId = firmId;
    if (name != null) result.name = name;
    if (boutiques != null) result.boutiques.addAll(boutiques);
    if (creationDateUTC != null) result.creationDateUTC = creationDateUTC;
    if (lastUpdateTimestampUTC != null)
      result.lastUpdateTimestampUTC = lastUpdateTimestampUTC;
    if (lastUpdatedByuserId != null)
      result.lastUpdatedByuserId = lastUpdatedByuserId;
    if (isDeleted != null) result.isDeleted = isDeleted;
    if (deletedBy != null) result.deletedBy = deletedBy;
    if (restoredBy != null) result.restoredBy = restoredBy;
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

  Chain._();

  factory Chain.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Chain.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Chain',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.chain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..pPM<$0.BoutiqueMongo>(4, _omitFieldNames ? '' : 'boutiques',
        subBuilder: $0.BoutiqueMongo.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'creationDateUTC',
        protoName: 'creationDateUTC', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'lastUpdateTimestampUTC',
        protoName: 'lastUpdateTimestampUTC', subBuilder: $1.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'lastUpdatedByuserId',
        protoName: 'lastUpdatedByuserId')
    ..aOB(8, _omitFieldNames ? '' : 'isDeleted', protoName: 'isDeleted')
    ..aOS(9, _omitFieldNames ? '' : 'deletedBy', protoName: 'deletedBy')
    ..aOS(10, _omitFieldNames ? '' : 'restoredBy', protoName: 'restoredBy')
    ..aOS(11, _omitFieldNames ? '' : 'currency')
    ..aOB(12, _omitFieldNames ? '' : 'isDualCurrencyEnabled',
        protoName: 'isDualCurrencyEnabled')
    ..aOS(13, _omitFieldNames ? '' : 'secondaryDisplayCurrency',
        protoName: 'secondaryDisplayCurrency')
    ..aOM<$0.BusinessRules>(14, _omitFieldNames ? '' : 'businessRules',
        protoName: 'businessRules', subBuilder: $0.BusinessRules.create)
    ..pPM<$0.ClosedYearPb>(15, _omitFieldNames ? '' : 'closedYears',
        subBuilder: $0.ClosedYearPb.create)
    ..aOS(16, _omitFieldNames ? '' : 'commercialRegisterNumber')
    ..aE<$0.CommerceTypePb>(17, _omitFieldNames ? '' : 'commerceType',
        enumValues: $0.CommerceTypePb.values)
    ..aOS(18, _omitFieldNames ? '' : 'isicCode')
    ..aOS(19, _omitFieldNames ? '' : 'isicSubCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Chain clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Chain copyWith(void Function(Chain) updates) =>
      super.copyWith((message) => updates(message as Chain)) as Chain;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Chain create() => Chain._();
  @$core.override
  Chain createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Chain getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chain>(create);
  static Chain? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get firmId => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFirmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$0.BoutiqueMongo> get boutiques => $_getList(3);

  @$pb.TagNumber(5)
  $1.Timestamp get creationDateUTC => $_getN(4);
  @$pb.TagNumber(5)
  set creationDateUTC($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCreationDateUTC() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreationDateUTC() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureCreationDateUTC() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Timestamp get lastUpdateTimestampUTC => $_getN(5);
  @$pb.TagNumber(6)
  set lastUpdateTimestampUTC($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasLastUpdateTimestampUTC() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastUpdateTimestampUTC() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get lastUpdatedByuserId => $_getSZ(6);
  @$pb.TagNumber(7)
  set lastUpdatedByuserId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLastUpdatedByuserId() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastUpdatedByuserId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isDeleted => $_getBF(7);
  @$pb.TagNumber(8)
  set isDeleted($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsDeleted() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsDeleted() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get deletedBy => $_getSZ(8);
  @$pb.TagNumber(9)
  set deletedBy($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDeletedBy() => $_has(8);
  @$pb.TagNumber(9)
  void clearDeletedBy() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get restoredBy => $_getSZ(9);
  @$pb.TagNumber(10)
  set restoredBy($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasRestoredBy() => $_has(9);
  @$pb.TagNumber(10)
  void clearRestoredBy() => $_clearField(10);

  /// / ISO 4217; overrides firm default_currency for boutiques in this chain when boutique.currency is empty.
  @$pb.TagNumber(11)
  $core.String get currency => $_getSZ(10);
  @$pb.TagNumber(11)
  set currency($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCurrency() => $_has(10);
  @$pb.TagNumber(11)
  void clearCurrency() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isDualCurrencyEnabled => $_getBF(11);
  @$pb.TagNumber(12)
  set isDualCurrencyEnabled($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasIsDualCurrencyEnabled() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsDualCurrencyEnabled() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get secondaryDisplayCurrency => $_getSZ(12);
  @$pb.TagNumber(13)
  set secondaryDisplayCurrency($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasSecondaryDisplayCurrency() => $_has(12);
  @$pb.TagNumber(13)
  void clearSecondaryDisplayCurrency() => $_clearField(13);

  @$pb.TagNumber(14)
  $0.BusinessRules get businessRules => $_getN(13);
  @$pb.TagNumber(14)
  set businessRules($0.BusinessRules value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasBusinessRules() => $_has(13);
  @$pb.TagNumber(14)
  void clearBusinessRules() => $_clearField(14);
  @$pb.TagNumber(14)
  $0.BusinessRules ensureBusinessRules() => $_ensure(13);

  /// / Soft-closed calendar years for SMT (waterfall with firm + boutique).
  @$pb.TagNumber(15)
  $pb.PbList<$0.ClosedYearPb> get closedYears => $_getList(14);

  /// / RCCM / registre de commerce (optional; required at SMT year close).
  @$pb.TagNumber(16)
  $core.String get commercialRegisterNumber => $_getSZ(15);
  @$pb.TagNumber(16)
  set commercialRegisterNumber($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasCommercialRegisterNumber() => $_has(15);
  @$pb.TagNumber(16)
  void clearCommercialRegisterNumber() => $_clearField(16);

  /// / SMT regime A/B/C; unknown defaults to négoce ceiling.
  @$pb.TagNumber(17)
  $0.CommerceTypePb get commerceType => $_getN(16);
  @$pb.TagNumber(17)
  set commerceType($0.CommerceTypePb value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasCommerceType() => $_has(16);
  @$pb.TagNumber(17)
  void clearCommerceType() => $_clearField(17);

  /// / ISIC code from the chosen classification (string; may keep leading zeros).
  @$pb.TagNumber(18)
  $core.String get isicCode => $_getSZ(17);
  @$pb.TagNumber(18)
  set isicCode($core.String value) => $_setString(17, value);
  @$pb.TagNumber(18)
  $core.bool hasIsicCode() => $_has(17);
  @$pb.TagNumber(18)
  void clearIsicCode() => $_clearField(18);

  /// / Weebi refinement when several activities share the same ISIC.
  @$pb.TagNumber(19)
  $core.String get isicSubCode => $_getSZ(18);
  @$pb.TagNumber(19)
  set isicSubCode($core.String value) => $_setString(18, value);
  @$pb.TagNumber(19)
  $core.bool hasIsicSubCode() => $_has(18);
  @$pb.TagNumber(19)
  void clearIsicSubCode() => $_clearField(19);
}

class Chains extends $pb.GeneratedMessage {
  factory Chains({
    $core.Iterable<Chain>? chains,
  }) {
    final result = create();
    if (chains != null) result.chains.addAll(chains);
    return result;
  }

  Chains._();

  factory Chains.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Chains.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Chains',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.chain'),
      createEmptyInstance: create)
    ..pPM<Chain>(1, _omitFieldNames ? '' : 'chains', subBuilder: Chain.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Chains clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Chains copyWith(void Function(Chains) updates) =>
      super.copyWith((message) => updates(message as Chains)) as Chains;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Chains create() => Chains._();
  @$core.override
  Chains createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Chains getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chains>(create);
  static Chains? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Chain> get chains => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
