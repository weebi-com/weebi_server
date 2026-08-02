// This is a generated file - do not edit.
//
// Generated from firm.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'boutique.pb.dart' as $2;
import 'common/g_common.pb.dart' as $3;
import 'common/g_timestamp.pb.dart' as $0;
import 'license.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Firm extends $pb.GeneratedMessage {
  factory Firm({
    $core.String? firmId,
    $core.String? name,
    @$core.Deprecated('This field is deprecated.')
    $core.String? subscriptionPlan,
    @$core.Deprecated('This field is deprecated.') $core.int? subscriptionSeats,
    @$core.Deprecated('This field is deprecated.')
    $0.Timestamp? subscriptionStartTimestampUTC,
    @$core.Deprecated('This field is deprecated.')
    $0.Timestamp? subscriptionEndTimestampUTC,
    $core.bool? status,
    $0.Timestamp? statusUpdateTimestampUTC,
    $0.Timestamp? lastUpdateTimestampUTC,
    $core.String? lastUpdatedByuserId,
    $core.bool? isMailVerified,
    $0.Timestamp? creationDateUTC,
    $core.String? stripeCustomerId,
    $core.Iterable<$1.License>? licenses,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        providerCustomerIds,
    $core.String? referralCode,
    $core.int? referralCreditBalanceCents,
    $core.String? currency,
    $core.bool? isDualCurrencyEnabled,
    $core.String? secondaryDisplayCurrency,
    $core.Iterable<$2.ClosedYearPb>? closedYears,
  }) {
    final result = create();
    if (firmId != null) result.firmId = firmId;
    if (name != null) result.name = name;
    if (subscriptionPlan != null) result.subscriptionPlan = subscriptionPlan;
    if (subscriptionSeats != null) result.subscriptionSeats = subscriptionSeats;
    if (subscriptionStartTimestampUTC != null)
      result.subscriptionStartTimestampUTC = subscriptionStartTimestampUTC;
    if (subscriptionEndTimestampUTC != null)
      result.subscriptionEndTimestampUTC = subscriptionEndTimestampUTC;
    if (status != null) result.status = status;
    if (statusUpdateTimestampUTC != null)
      result.statusUpdateTimestampUTC = statusUpdateTimestampUTC;
    if (lastUpdateTimestampUTC != null)
      result.lastUpdateTimestampUTC = lastUpdateTimestampUTC;
    if (lastUpdatedByuserId != null)
      result.lastUpdatedByuserId = lastUpdatedByuserId;
    if (isMailVerified != null) result.isMailVerified = isMailVerified;
    if (creationDateUTC != null) result.creationDateUTC = creationDateUTC;
    if (stripeCustomerId != null) result.stripeCustomerId = stripeCustomerId;
    if (licenses != null) result.licenses.addAll(licenses);
    if (providerCustomerIds != null)
      result.providerCustomerIds.addEntries(providerCustomerIds);
    if (referralCode != null) result.referralCode = referralCode;
    if (referralCreditBalanceCents != null)
      result.referralCreditBalanceCents = referralCreditBalanceCents;
    if (currency != null) result.currency = currency;
    if (isDualCurrencyEnabled != null)
      result.isDualCurrencyEnabled = isDualCurrencyEnabled;
    if (secondaryDisplayCurrency != null)
      result.secondaryDisplayCurrency = secondaryDisplayCurrency;
    if (closedYears != null) result.closedYears.addAll(closedYears);
    return result;
  }

  Firm._();

  factory Firm.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Firm.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Firm',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.firm'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'subscriptionPlan',
        protoName: 'subscriptionPlan')
    ..aI(4, _omitFieldNames ? '' : 'subscriptionSeats',
        protoName: 'subscriptionSeats')
    ..aOM<$0.Timestamp>(
        5, _omitFieldNames ? '' : 'subscriptionStartTimestampUTC',
        protoName: 'subscriptionStartTimestampUTC',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'subscriptionEndTimestampUTC',
        protoName: 'subscriptionEndTimestampUTC',
        subBuilder: $0.Timestamp.create)
    ..aOB(7, _omitFieldNames ? '' : 'status')
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'statusUpdateTimestampUTC',
        protoName: 'statusUpdateTimestampUTC', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'lastUpdateTimestampUTC',
        protoName: 'lastUpdateTimestampUTC', subBuilder: $0.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'lastUpdatedByuserId',
        protoName: 'lastUpdatedByuserId')
    ..aOB(11, _omitFieldNames ? '' : 'isMailVerified',
        protoName: 'isMailVerified')
    ..aOM<$0.Timestamp>(12, _omitFieldNames ? '' : 'creationDateUTC',
        protoName: 'creationDateUTC', subBuilder: $0.Timestamp.create)
    ..aOS(13, _omitFieldNames ? '' : 'stripeCustomerId',
        protoName: 'stripeCustomerId')
    ..pPM<$1.License>(14, _omitFieldNames ? '' : 'licenses',
        subBuilder: $1.License.create)
    ..m<$core.String, $core.String>(
        15, _omitFieldNames ? '' : 'providerCustomerIds',
        protoName: 'providerCustomerIds',
        entryClassName: 'Firm.ProviderCustomerIdsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('weebi.firm'))
    ..aOS(16, _omitFieldNames ? '' : 'referralCode', protoName: 'referralCode')
    ..aI(17, _omitFieldNames ? '' : 'referralCreditBalanceCents',
        protoName: 'referralCreditBalanceCents')
    ..aOS(18, _omitFieldNames ? '' : 'currency')
    ..aOB(19, _omitFieldNames ? '' : 'isDualCurrencyEnabled',
        protoName: 'isDualCurrencyEnabled')
    ..aOS(20, _omitFieldNames ? '' : 'secondaryDisplayCurrency',
        protoName: 'secondaryDisplayCurrency')
    ..pPM<$2.ClosedYearPb>(21, _omitFieldNames ? '' : 'closedYears',
        subBuilder: $2.ClosedYearPb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Firm clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Firm copyWith(void Function(Firm) updates) =>
      super.copyWith((message) => updates(message as Firm)) as Firm;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Firm create() => Firm._();
  @$core.override
  Firm createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Firm getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Firm>(create);
  static Firm? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// / @deprecated Use licenses[].licensePlan instead.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.String get subscriptionPlan => $_getSZ(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  set subscriptionPlan($core.String value) => $_setString(2, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool hasSubscriptionPlan() => $_has(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  void clearSubscriptionPlan() => $_clearField(3);

  /// / @deprecated Use licenses[].maxUsers instead (per purchased seat).
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.int get subscriptionSeats => $_getIZ(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set subscriptionSeats($core.int value) => $_setSignedInt32(3, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasSubscriptionSeats() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearSubscriptionSeats() => $_clearField(4);

  /// / @deprecated Use licenses[].validFrom instead.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $0.Timestamp get subscriptionStartTimestampUTC => $_getN(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set subscriptionStartTimestampUTC($0.Timestamp value) => $_setField(5, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasSubscriptionStartTimestampUTC() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearSubscriptionStartTimestampUTC() => $_clearField(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $0.Timestamp ensureSubscriptionStartTimestampUTC() => $_ensure(4);

  /// / @deprecated Use licenses[].validUntil and LicenseSeat.validUntil instead.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $0.Timestamp get subscriptionEndTimestampUTC => $_getN(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set subscriptionEndTimestampUTC($0.Timestamp value) => $_setField(6, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasSubscriptionEndTimestampUTC() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearSubscriptionEndTimestampUTC() => $_clearField(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $0.Timestamp ensureSubscriptionEndTimestampUTC() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.bool get status => $_getBF(6);
  @$pb.TagNumber(7)
  set status($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $0.Timestamp get statusUpdateTimestampUTC => $_getN(7);
  @$pb.TagNumber(8)
  set statusUpdateTimestampUTC($0.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasStatusUpdateTimestampUTC() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatusUpdateTimestampUTC() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureStatusUpdateTimestampUTC() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.Timestamp get lastUpdateTimestampUTC => $_getN(8);
  @$pb.TagNumber(9)
  set lastUpdateTimestampUTC($0.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasLastUpdateTimestampUTC() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastUpdateTimestampUTC() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get lastUpdatedByuserId => $_getSZ(9);
  @$pb.TagNumber(10)
  set lastUpdatedByuserId($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLastUpdatedByuserId() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastUpdatedByuserId() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isMailVerified => $_getBF(10);
  @$pb.TagNumber(11)
  set isMailVerified($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasIsMailVerified() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsMailVerified() => $_clearField(11);

  @$pb.TagNumber(12)
  $0.Timestamp get creationDateUTC => $_getN(11);
  @$pb.TagNumber(12)
  set creationDateUTC($0.Timestamp value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasCreationDateUTC() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreationDateUTC() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.Timestamp ensureCreationDateUTC() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.String get stripeCustomerId => $_getSZ(12);
  @$pb.TagNumber(13)
  set stripeCustomerId($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasStripeCustomerId() => $_has(12);
  @$pb.TagNumber(13)
  void clearStripeCustomerId() => $_clearField(13);

  /// / Active licenses. A firm can have multiple licenses (e.g. seat packs, renewals).
  @$pb.TagNumber(14)
  $pb.PbList<$1.License> get licenses => $_getList(13);

  /// / Customer IDs per payment provider. Keys: "stripe", "pawapay", etc.
  @$pb.TagNumber(15)
  $pb.PbMap<$core.String, $core.String> get providerCustomerIds => $_getMap(14);

  /// / Per-firm referral code. Share with others; 20% commission on referred license sales.
  @$pb.TagNumber(16)
  $core.String get referralCode => $_getSZ(15);
  @$pb.TagNumber(16)
  set referralCode($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasReferralCode() => $_has(15);
  @$pb.TagNumber(16)
  void clearReferralCode() => $_clearField(16);

  /// / Referral credit balance in EUR cents. Auto-applied at checkout or cash-out above €15.
  @$pb.TagNumber(17)
  $core.int get referralCreditBalanceCents => $_getIZ(16);
  @$pb.TagNumber(17)
  set referralCreditBalanceCents($core.int value) =>
      $_setSignedInt32(16, value);
  @$pb.TagNumber(17)
  $core.bool hasReferralCreditBalanceCents() => $_has(16);
  @$pb.TagNumber(17)
  void clearReferralCreditBalanceCents() => $_clearField(17);

  /// / ISO 4217 code (e.g. EUR, XOF). Default for new chains/boutiques; resolved with platform default if empty.
  @$pb.TagNumber(18)
  $core.String get currency => $_getSZ(17);
  @$pb.TagNumber(18)
  set currency($core.String value) => $_setString(17, value);
  @$pb.TagNumber(18)
  $core.bool hasCurrency() => $_has(17);
  @$pb.TagNumber(18)
  void clearCurrency() => $_clearField(18);

  /// / When true, clients may show amounts in secondaryDisplayCurrency using per-ticket FX snapshot.
  @$pb.TagNumber(19)
  $core.bool get isDualCurrencyEnabled => $_getBF(18);
  @$pb.TagNumber(19)
  set isDualCurrencyEnabled($core.bool value) => $_setBool(18, value);
  @$pb.TagNumber(19)
  $core.bool hasIsDualCurrencyEnabled() => $_has(18);
  @$pb.TagNumber(19)
  void clearIsDualCurrencyEnabled() => $_clearField(19);

  /// / ISO 4217 secondary display code (e.g. USD). Meaningful when dualCurrencyEnabled is true.
  @$pb.TagNumber(20)
  $core.String get secondaryDisplayCurrency => $_getSZ(19);
  @$pb.TagNumber(20)
  set secondaryDisplayCurrency($core.String value) => $_setString(19, value);
  @$pb.TagNumber(20)
  $core.bool hasSecondaryDisplayCurrency() => $_has(19);
  @$pb.TagNumber(20)
  void clearSecondaryDisplayCurrency() => $_clearField(20);

  /// / Soft-closed calendar years for SMT (waterfall with chain + boutique).
  @$pb.TagNumber(21)
  $pb.PbList<$2.ClosedYearPb> get closedYears => $_getList(20);
}

class CreateFirmRequest extends $pb.GeneratedMessage {
  factory CreateFirmRequest({
    $core.String? name,
    $core.String? currency,
    $core.String? commercialRegisterNumber,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (currency != null) result.currency = currency;
    if (commercialRegisterNumber != null)
      result.commercialRegisterNumber = commercialRegisterNumber;
    return result;
  }

  CreateFirmRequest._();

  factory CreateFirmRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateFirmRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFirmRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.firm'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'currency')
    ..aOS(3, _omitFieldNames ? '' : 'commercialRegisterNumber')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFirmRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFirmRequest copyWith(void Function(CreateFirmRequest) updates) =>
      super.copyWith((message) => updates(message as CreateFirmRequest))
          as CreateFirmRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFirmRequest create() => CreateFirmRequest._();
  @$core.override
  CreateFirmRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateFirmRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFirmRequest>(create);
  static CreateFirmRequest? _defaultInstance;

  /// / mandatory
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// / Optional ISO 4217 default stamped on firm and first chain/boutique; server fills platform default if omitted.
  @$pb.TagNumber(2)
  $core.String get currency => $_getSZ(1);
  @$pb.TagNumber(2)
  set currency($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrency() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrency() => $_clearField(2);

  /// / Optional RCCM; copied to first chain + boutique only (not stored on Firm).
  @$pb.TagNumber(3)
  $core.String get commercialRegisterNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set commercialRegisterNumber($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCommercialRegisterNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommercialRegisterNumber() => $_clearField(3);
}

class CreateFirmResponse extends $pb.GeneratedMessage {
  factory CreateFirmResponse({
    $3.StatusResponse? statusResponse,
    Firm? firm,
  }) {
    final result = create();
    if (statusResponse != null) result.statusResponse = statusResponse;
    if (firm != null) result.firm = firm;
    return result;
  }

  CreateFirmResponse._();

  factory CreateFirmResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateFirmResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFirmResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.firm'),
      createEmptyInstance: create)
    ..aOM<$3.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse',
        protoName: 'statusResponse', subBuilder: $3.StatusResponse.create)
    ..aOM<Firm>(2, _omitFieldNames ? '' : 'firm', subBuilder: Firm.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFirmResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFirmResponse copyWith(void Function(CreateFirmResponse) updates) =>
      super.copyWith((message) => updates(message as CreateFirmResponse))
          as CreateFirmResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFirmResponse create() => CreateFirmResponse._();
  @$core.override
  CreateFirmResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateFirmResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFirmResponse>(create);
  static CreateFirmResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.StatusResponse get statusResponse => $_getN(0);
  @$pb.TagNumber(1)
  set statusResponse($3.StatusResponse value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  Firm get firm => $_getN(1);
  @$pb.TagNumber(2)
  set firm(Firm value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFirm() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirm() => $_clearField(2);
  @$pb.TagNumber(2)
  Firm ensureFirm() => $_ensure(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
