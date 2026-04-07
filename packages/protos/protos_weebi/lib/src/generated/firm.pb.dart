//
//  Generated code. Do not modify.
//  source: firm.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/g_common.pb.dart' as $1;
import 'common/g_timestamp.pb.dart' as $19;
import 'license.pb.dart' as $23;

class Firm extends $pb.GeneratedMessage {
  factory Firm({
    $core.String? firmId,
    $core.String? name,
  @$core.Deprecated('This field is deprecated.')
    $core.String? subscriptionPlan,
  @$core.Deprecated('This field is deprecated.')
    $core.int? subscriptionSeats,
  @$core.Deprecated('This field is deprecated.')
    $19.Timestamp? subscriptionStartTimestampUTC,
  @$core.Deprecated('This field is deprecated.')
    $19.Timestamp? subscriptionEndTimestampUTC,
    $core.bool? status,
    $19.Timestamp? statusUpdateTimestampUTC,
    $19.Timestamp? lastUpdateTimestampUTC,
    $core.String? lastUpdatedByuserId,
    $core.bool? isMailVerified,
    $19.Timestamp? creationDateUTC,
    $core.String? stripeCustomerId,
    $core.Iterable<$23.License>? licenses,
    $core.Map<$core.String, $core.String>? providerCustomerIds,
    $core.String? referralCode,
    $core.int? referralCreditBalanceCents,
    $core.String? currency,
    $core.bool? isDualCurrencyEnabled,
    $core.String? secondaryDisplayCurrency,
  }) {
    final result = create();
    if (firmId != null) {
      result.firmId = firmId;
    }
    if (name != null) {
      result.name = name;
    }
    if (subscriptionPlan != null) {
      // ignore: deprecated_member_use_from_same_package
      result.subscriptionPlan = subscriptionPlan;
    }
    if (subscriptionSeats != null) {
      // ignore: deprecated_member_use_from_same_package
      result.subscriptionSeats = subscriptionSeats;
    }
    if (subscriptionStartTimestampUTC != null) {
      // ignore: deprecated_member_use_from_same_package
      result.subscriptionStartTimestampUTC = subscriptionStartTimestampUTC;
    }
    if (subscriptionEndTimestampUTC != null) {
      // ignore: deprecated_member_use_from_same_package
      result.subscriptionEndTimestampUTC = subscriptionEndTimestampUTC;
    }
    if (status != null) {
      result.status = status;
    }
    if (statusUpdateTimestampUTC != null) {
      result.statusUpdateTimestampUTC = statusUpdateTimestampUTC;
    }
    if (lastUpdateTimestampUTC != null) {
      result.lastUpdateTimestampUTC = lastUpdateTimestampUTC;
    }
    if (lastUpdatedByuserId != null) {
      result.lastUpdatedByuserId = lastUpdatedByuserId;
    }
    if (isMailVerified != null) {
      result.isMailVerified = isMailVerified;
    }
    if (creationDateUTC != null) {
      result.creationDateUTC = creationDateUTC;
    }
    if (stripeCustomerId != null) {
      result.stripeCustomerId = stripeCustomerId;
    }
    if (licenses != null) {
      result.licenses.addAll(licenses);
    }
    if (providerCustomerIds != null) {
      result.providerCustomerIds.addAll(providerCustomerIds);
    }
    if (referralCode != null) {
      result.referralCode = referralCode;
    }
    if (referralCreditBalanceCents != null) {
      result.referralCreditBalanceCents = referralCreditBalanceCents;
    }
    if (currency != null) {
      result.currency = currency;
    }
    if (isDualCurrencyEnabled != null) {
      result.isDualCurrencyEnabled = isDualCurrencyEnabled;
    }
    if (secondaryDisplayCurrency != null) {
      result.secondaryDisplayCurrency = secondaryDisplayCurrency;
    }
    return result;
  }
  Firm._() : super();
  factory Firm.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Firm.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Firm', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.firm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'subscriptionPlan', protoName: 'subscriptionPlan')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'subscriptionSeats', $pb.PbFieldType.O3, protoName: 'subscriptionSeats')
    ..aOM<$19.Timestamp>(5, _omitFieldNames ? '' : 'subscriptionStartTimestampUTC', protoName: 'subscriptionStartTimestampUTC', subBuilder: $19.Timestamp.create)
    ..aOM<$19.Timestamp>(6, _omitFieldNames ? '' : 'subscriptionEndTimestampUTC', protoName: 'subscriptionEndTimestampUTC', subBuilder: $19.Timestamp.create)
    ..aOB(7, _omitFieldNames ? '' : 'status')
    ..aOM<$19.Timestamp>(8, _omitFieldNames ? '' : 'statusUpdateTimestampUTC', protoName: 'statusUpdateTimestampUTC', subBuilder: $19.Timestamp.create)
    ..aOM<$19.Timestamp>(9, _omitFieldNames ? '' : 'lastUpdateTimestampUTC', protoName: 'lastUpdateTimestampUTC', subBuilder: $19.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'lastUpdatedByuserId', protoName: 'lastUpdatedByuserId')
    ..aOB(11, _omitFieldNames ? '' : 'isMailVerified', protoName: 'isMailVerified')
    ..aOM<$19.Timestamp>(12, _omitFieldNames ? '' : 'creationDateUTC', protoName: 'creationDateUTC', subBuilder: $19.Timestamp.create)
    ..aOS(13, _omitFieldNames ? '' : 'stripeCustomerId', protoName: 'stripeCustomerId')
    ..pc<$23.License>(14, _omitFieldNames ? '' : 'licenses', $pb.PbFieldType.PM, subBuilder: $23.License.create)
    ..m<$core.String, $core.String>(15, _omitFieldNames ? '' : 'providerCustomerIds', protoName: 'providerCustomerIds', entryClassName: 'Firm.ProviderCustomerIdsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('weebi.firm'))
    ..aOS(16, _omitFieldNames ? '' : 'referralCode', protoName: 'referralCode')
    ..a<$core.int>(17, _omitFieldNames ? '' : 'referralCreditBalanceCents', $pb.PbFieldType.O3, protoName: 'referralCreditBalanceCents')
    ..aOS(18, _omitFieldNames ? '' : 'currency')
    ..aOB(19, _omitFieldNames ? '' : 'isDualCurrencyEnabled', protoName: 'isDualCurrencyEnabled')
    ..aOS(20, _omitFieldNames ? '' : 'secondaryDisplayCurrency', protoName: 'secondaryDisplayCurrency')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Firm clone() => Firm()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Firm copyWith(void Function(Firm) updates) => super.copyWith((message) => updates(message as Firm)) as Firm;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Firm create() => Firm._();
  Firm createEmptyInstance() => create();
  static $pb.PbList<Firm> createRepeated() => $pb.PbList<Firm>();
  @$core.pragma('dart2js:noInline')
  static Firm getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Firm>(create);
  static Firm? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  /// / @deprecated Use licenses instead.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.String get subscriptionPlan => $_getSZ(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  set subscriptionPlan($core.String v) { $_setString(2, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool hasSubscriptionPlan() => $_has(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  void clearSubscriptionPlan() => clearField(3);

  /// / @deprecated Use licenses[].maxUsers instead.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.int get subscriptionSeats => $_getIZ(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set subscriptionSeats($core.int v) { $_setSignedInt32(3, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasSubscriptionSeats() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearSubscriptionSeats() => clearField(4);

  /// / @deprecated Use licenses[].validFrom instead.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $19.Timestamp get subscriptionStartTimestampUTC => $_getN(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set subscriptionStartTimestampUTC($19.Timestamp v) { setField(5, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasSubscriptionStartTimestampUTC() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearSubscriptionStartTimestampUTC() => clearField(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $19.Timestamp ensureSubscriptionStartTimestampUTC() => $_ensure(4);

  /// / @deprecated Use licenses[].validUntil and LicenseSeat.validUntil instead.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $19.Timestamp get subscriptionEndTimestampUTC => $_getN(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set subscriptionEndTimestampUTC($19.Timestamp v) { setField(6, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasSubscriptionEndTimestampUTC() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearSubscriptionEndTimestampUTC() => clearField(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $19.Timestamp ensureSubscriptionEndTimestampUTC() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.bool get status => $_getBF(6);
  @$pb.TagNumber(7)
  set status($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);

  @$pb.TagNumber(8)
  $19.Timestamp get statusUpdateTimestampUTC => $_getN(7);
  @$pb.TagNumber(8)
  set statusUpdateTimestampUTC($19.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatusUpdateTimestampUTC() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatusUpdateTimestampUTC() => clearField(8);
  @$pb.TagNumber(8)
  $19.Timestamp ensureStatusUpdateTimestampUTC() => $_ensure(7);

  @$pb.TagNumber(9)
  $19.Timestamp get lastUpdateTimestampUTC => $_getN(8);
  @$pb.TagNumber(9)
  set lastUpdateTimestampUTC($19.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasLastUpdateTimestampUTC() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastUpdateTimestampUTC() => clearField(9);
  @$pb.TagNumber(9)
  $19.Timestamp ensureLastUpdateTimestampUTC() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get lastUpdatedByuserId => $_getSZ(9);
  @$pb.TagNumber(10)
  set lastUpdatedByuserId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLastUpdatedByuserId() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastUpdatedByuserId() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isMailVerified => $_getBF(10);
  @$pb.TagNumber(11)
  set isMailVerified($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasIsMailVerified() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsMailVerified() => clearField(11);

  @$pb.TagNumber(12)
  $19.Timestamp get creationDateUTC => $_getN(11);
  @$pb.TagNumber(12)
  set creationDateUTC($19.Timestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasCreationDateUTC() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreationDateUTC() => clearField(12);
  @$pb.TagNumber(12)
  $19.Timestamp ensureCreationDateUTC() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.String get stripeCustomerId => $_getSZ(12);
  @$pb.TagNumber(13)
  set stripeCustomerId($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasStripeCustomerId() => $_has(12);
  @$pb.TagNumber(13)
  void clearStripeCustomerId() => clearField(13);

  /// / Active licenses. A firm can have multiple licenses (e.g. add-ons, renewals).
  @$pb.TagNumber(14)
  $core.List<$23.License> get licenses => $_getList(13);

  /// / Customer IDs per payment provider. Keys: "stripe", "pawapay", etc.
  @$pb.TagNumber(15)
  $core.Map<$core.String, $core.String> get providerCustomerIds => $_getMap(14);

  /// / Per-firm referral code. Share with others; 20% commission on referred license sales.
  @$pb.TagNumber(16)
  $core.String get referralCode => $_getSZ(15);
  @$pb.TagNumber(16)
  set referralCode($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasReferralCode() => $_has(15);
  @$pb.TagNumber(16)
  void clearReferralCode() => clearField(16);

  /// / Referral credit balance in EUR cents. Auto-applied at checkout or cash-out above €15.
  @$pb.TagNumber(17)
  $core.int get referralCreditBalanceCents => $_getIZ(16);
  @$pb.TagNumber(17)
  set referralCreditBalanceCents($core.int v) { $_setSignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasReferralCreditBalanceCents() => $_has(16);
  @$pb.TagNumber(17)
  void clearReferralCreditBalanceCents() => clearField(17);

  /// / ISO 4217 code (e.g. EUR, XOF). Default for new chains/boutiques; resolved with platform default if empty.
  @$pb.TagNumber(18)
  $core.String get currency => $_getSZ(17);
  @$pb.TagNumber(18)
  set currency($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasCurrency() => $_has(17);
  @$pb.TagNumber(18)
  void clearCurrency() => clearField(18);

  /// / When true, clients may show amounts in secondaryDisplayCurrency using per-ticket FX snapshot.
  @$pb.TagNumber(19)
  $core.bool get isDualCurrencyEnabled => $_getBF(18);
  @$pb.TagNumber(19)
  set isDualCurrencyEnabled($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasIsDualCurrencyEnabled() => $_has(18);
  @$pb.TagNumber(19)
  void clearIsDualCurrencyEnabled() => clearField(19);

  /// / ISO 4217 secondary display code (e.g. USD). Meaningful when dualCurrencyEnabled is true.
  @$pb.TagNumber(20)
  $core.String get secondaryDisplayCurrency => $_getSZ(19);
  @$pb.TagNumber(20)
  set secondaryDisplayCurrency($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasSecondaryDisplayCurrency() => $_has(19);
  @$pb.TagNumber(20)
  void clearSecondaryDisplayCurrency() => clearField(20);
}

class CreateFirmRequest extends $pb.GeneratedMessage {
  factory CreateFirmRequest({
    $core.String? name,
    $core.String? currency,
  }) {
    final result = create();
    if (name != null) {
      result.name = name;
    }
    if (currency != null) {
      result.currency = currency;
    }
    return result;
  }
  CreateFirmRequest._() : super();
  factory CreateFirmRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFirmRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFirmRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.firm'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'currency')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFirmRequest clone() => CreateFirmRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFirmRequest copyWith(void Function(CreateFirmRequest) updates) => super.copyWith((message) => updates(message as CreateFirmRequest)) as CreateFirmRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFirmRequest create() => CreateFirmRequest._();
  CreateFirmRequest createEmptyInstance() => create();
  static $pb.PbList<CreateFirmRequest> createRepeated() => $pb.PbList<CreateFirmRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateFirmRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFirmRequest>(create);
  static CreateFirmRequest? _defaultInstance;

  /// / mandatory
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// / Optional ISO 4217 default stamped on firm and first chain/boutique; server fills platform default if omitted.
  @$pb.TagNumber(2)
  $core.String get currency => $_getSZ(1);
  @$pb.TagNumber(2)
  set currency($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrency() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrency() => clearField(2);
}

class CreateFirmResponse extends $pb.GeneratedMessage {
  factory CreateFirmResponse({
    $1.StatusResponse? statusResponse,
    Firm? firm,
  }) {
    final result = create();
    if (statusResponse != null) {
      result.statusResponse = statusResponse;
    }
    if (firm != null) {
      result.firm = firm;
    }
    return result;
  }
  CreateFirmResponse._() : super();
  factory CreateFirmResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFirmResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFirmResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.firm'), createEmptyInstance: create)
    ..aOM<$1.StatusResponse>(1, _omitFieldNames ? '' : 'statusResponse', protoName: 'statusResponse', subBuilder: $1.StatusResponse.create)
    ..aOM<Firm>(2, _omitFieldNames ? '' : 'firm', subBuilder: Firm.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFirmResponse clone() => CreateFirmResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFirmResponse copyWith(void Function(CreateFirmResponse) updates) => super.copyWith((message) => updates(message as CreateFirmResponse)) as CreateFirmResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFirmResponse create() => CreateFirmResponse._();
  CreateFirmResponse createEmptyInstance() => create();
  static $pb.PbList<CreateFirmResponse> createRepeated() => $pb.PbList<CreateFirmResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateFirmResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFirmResponse>(create);
  static CreateFirmResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StatusResponse get statusResponse => $_getN(0);
  @$pb.TagNumber(1)
  set statusResponse($1.StatusResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatusResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusResponse() => clearField(1);
  @$pb.TagNumber(1)
  $1.StatusResponse ensureStatusResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  Firm get firm => $_getN(1);
  @$pb.TagNumber(2)
  set firm(Firm v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirm() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirm() => clearField(2);
  @$pb.TagNumber(2)
  Firm ensureFirm() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
