//
//  Generated code. Do not modify.
//  source: license.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/g_timestamp.pb.dart' as $19;
import 'license.pbenum.dart';

export 'license.pbenum.dart';

/// / A license purchase. One purchase can cover multiple users (seats).
/// / Each seat has its own validity period.
class License extends $pb.GeneratedMessage {
  factory License({
    $core.String? licenseId,
    LicensePlan? licensePlan,
    $core.String? providerProductId,
    $core.String? providerPriceId,
    $core.int? maxUsers,
    $19.Timestamp? validFrom,
    $19.Timestamp? validUntil,
    $core.Iterable<LicenseSeat>? seats,
    PaymentProvider? paymentProvider,
    $core.String? referredByFirmId,
    $core.int? creditAppliedCents,
  }) {
    final result = create();
    if (licenseId != null) {
      result.licenseId = licenseId;
    }
    if (licensePlan != null) {
      result.licensePlan = licensePlan;
    }
    if (providerProductId != null) {
      result.providerProductId = providerProductId;
    }
    if (providerPriceId != null) {
      result.providerPriceId = providerPriceId;
    }
    if (maxUsers != null) {
      result.maxUsers = maxUsers;
    }
    if (validFrom != null) {
      result.validFrom = validFrom;
    }
    if (validUntil != null) {
      result.validUntil = validUntil;
    }
    if (seats != null) {
      result.seats.addAll(seats);
    }
    if (paymentProvider != null) {
      result.paymentProvider = paymentProvider;
    }
    if (referredByFirmId != null) {
      result.referredByFirmId = referredByFirmId;
    }
    if (creditAppliedCents != null) {
      result.creditAppliedCents = creditAppliedCents;
    }
    return result;
  }
  License._() : super();
  factory License.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory License.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'License', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.license'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'licenseId', protoName: 'licenseId')
    ..e<LicensePlan>(2, _omitFieldNames ? '' : 'licensePlan', $pb.PbFieldType.OE, protoName: 'licensePlan', defaultOrMaker: LicensePlan.LICENSE_PLAN_UNKNOWN, valueOf: LicensePlan.valueOf, enumValues: LicensePlan.values)
    ..aOS(3, _omitFieldNames ? '' : 'providerProductId', protoName: 'providerProductId')
    ..aOS(4, _omitFieldNames ? '' : 'providerPriceId', protoName: 'providerPriceId')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'maxUsers', $pb.PbFieldType.O3, protoName: 'maxUsers')
    ..aOM<$19.Timestamp>(6, _omitFieldNames ? '' : 'validFrom', protoName: 'validFrom', subBuilder: $19.Timestamp.create)
    ..aOM<$19.Timestamp>(7, _omitFieldNames ? '' : 'validUntil', protoName: 'validUntil', subBuilder: $19.Timestamp.create)
    ..pc<LicenseSeat>(8, _omitFieldNames ? '' : 'seats', $pb.PbFieldType.PM, subBuilder: LicenseSeat.create)
    ..e<PaymentProvider>(9, _omitFieldNames ? '' : 'paymentProvider', $pb.PbFieldType.OE, protoName: 'paymentProvider', defaultOrMaker: PaymentProvider.PAYMENT_PROVIDER_UNKNOWN, valueOf: PaymentProvider.valueOf, enumValues: PaymentProvider.values)
    ..aOS(10, _omitFieldNames ? '' : 'referredByFirmId', protoName: 'referredByFirmId')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'creditAppliedCents', $pb.PbFieldType.O3, protoName: 'creditAppliedCents')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  License clone() => License()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  License copyWith(void Function(License) updates) => super.copyWith((message) => updates(message as License)) as License;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static License create() => License._();
  License createEmptyInstance() => create();
  static $pb.PbList<License> createRepeated() => $pb.PbList<License>();
  @$core.pragma('dart2js:noInline')
  static License getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<License>(create);
  static License? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get licenseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set licenseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicenseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseId() => clearField(1);

  @$pb.TagNumber(2)
  LicensePlan get licensePlan => $_getN(1);
  @$pb.TagNumber(2)
  set licensePlan(LicensePlan v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLicensePlan() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicensePlan() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get providerProductId => $_getSZ(2);
  @$pb.TagNumber(3)
  set providerProductId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProviderProductId() => $_has(2);
  @$pb.TagNumber(3)
  void clearProviderProductId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get providerPriceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set providerPriceId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProviderPriceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearProviderPriceId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxUsers => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxUsers($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMaxUsers() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxUsers() => clearField(5);

  @$pb.TagNumber(6)
  $19.Timestamp get validFrom => $_getN(5);
  @$pb.TagNumber(6)
  set validFrom($19.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasValidFrom() => $_has(5);
  @$pb.TagNumber(6)
  void clearValidFrom() => clearField(6);
  @$pb.TagNumber(6)
  $19.Timestamp ensureValidFrom() => $_ensure(5);

  /// / Omitted = lifetime license
  @$pb.TagNumber(7)
  $19.Timestamp get validUntil => $_getN(6);
  @$pb.TagNumber(7)
  set validUntil($19.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasValidUntil() => $_has(6);
  @$pb.TagNumber(7)
  void clearValidUntil() => clearField(7);
  @$pb.TagNumber(7)
  $19.Timestamp ensureValidUntil() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<LicenseSeat> get seats => $_getList(7);

  /// / Which provider processed this purchase.
  @$pb.TagNumber(9)
  PaymentProvider get paymentProvider => $_getN(8);
  @$pb.TagNumber(9)
  set paymentProvider(PaymentProvider v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasPaymentProvider() => $_has(8);
  @$pb.TagNumber(9)
  void clearPaymentProvider() => clearField(9);

  /// / Firm that referred this purchase (referrer). Set when buyer used referrer's code.
  @$pb.TagNumber(10)
  $core.String get referredByFirmId => $_getSZ(9);
  @$pb.TagNumber(10)
  set referredByFirmId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasReferredByFirmId() => $_has(9);
  @$pb.TagNumber(10)
  void clearReferredByFirmId() => clearField(10);

  /// / Amount of referral credit (cents) applied to this purchase. Deducted from buyer's firm.
  @$pb.TagNumber(11)
  $core.int get creditAppliedCents => $_getIZ(10);
  @$pb.TagNumber(11)
  set creditAppliedCents($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreditAppliedCents() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreditAppliedCents() => clearField(11);
}

/// / Per-seat validity. Each user (seat) has its own start/end dates.
/// / firmId is denormalized for efficient MongoDB queries (no joins).
class LicenseSeat extends $pb.GeneratedMessage {
  factory LicenseSeat({
    $core.String? firmId,
    $core.String? userId,
    $19.Timestamp? validFrom,
    $19.Timestamp? validUntil,
  }) {
    final result = create();
    if (firmId != null) {
      result.firmId = firmId;
    }
    if (userId != null) {
      result.userId = userId;
    }
    if (validFrom != null) {
      result.validFrom = validFrom;
    }
    if (validUntil != null) {
      result.validUntil = validUntil;
    }
    return result;
  }
  LicenseSeat._() : super();
  factory LicenseSeat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LicenseSeat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LicenseSeat', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.license'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOM<$19.Timestamp>(3, _omitFieldNames ? '' : 'validFrom', protoName: 'validFrom', subBuilder: $19.Timestamp.create)
    ..aOM<$19.Timestamp>(4, _omitFieldNames ? '' : 'validUntil', protoName: 'validUntil', subBuilder: $19.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LicenseSeat clone() => LicenseSeat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LicenseSeat copyWith(void Function(LicenseSeat) updates) => super.copyWith((message) => updates(message as LicenseSeat)) as LicenseSeat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LicenseSeat create() => LicenseSeat._();
  LicenseSeat createEmptyInstance() => create();
  static $pb.PbList<LicenseSeat> createRepeated() => $pb.PbList<LicenseSeat>();
  @$core.pragma('dart2js:noInline')
  static LicenseSeat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LicenseSeat>(create);
  static LicenseSeat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $19.Timestamp get validFrom => $_getN(2);
  @$pb.TagNumber(3)
  set validFrom($19.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasValidFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidFrom() => clearField(3);
  @$pb.TagNumber(3)
  $19.Timestamp ensureValidFrom() => $_ensure(2);

  /// / Omitted = lifetime for this seat
  @$pb.TagNumber(4)
  $19.Timestamp get validUntil => $_getN(3);
  @$pb.TagNumber(4)
  set validUntil($19.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasValidUntil() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidUntil() => clearField(4);
  @$pb.TagNumber(4)
  $19.Timestamp ensureValidUntil() => $_ensure(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
