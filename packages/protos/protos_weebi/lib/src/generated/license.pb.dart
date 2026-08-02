// This is a generated file - do not edit.
//
// Generated from license.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/g_timestamp.pb.dart' as $0;
import 'license.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

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
    $0.Timestamp? validFrom,
    $0.Timestamp? validUntil,
    $core.Iterable<LicenseSeat>? seats,
    PaymentProvider? paymentProvider,
    $core.String? referredByFirmId,
    $core.int? creditAppliedCents,
    $core.String? legalTermsVersionDate,
  }) {
    final result = create();
    if (licenseId != null) result.licenseId = licenseId;
    if (licensePlan != null) result.licensePlan = licensePlan;
    if (providerProductId != null) result.providerProductId = providerProductId;
    if (providerPriceId != null) result.providerPriceId = providerPriceId;
    if (maxUsers != null) result.maxUsers = maxUsers;
    if (validFrom != null) result.validFrom = validFrom;
    if (validUntil != null) result.validUntil = validUntil;
    if (seats != null) result.seats.addAll(seats);
    if (paymentProvider != null) result.paymentProvider = paymentProvider;
    if (referredByFirmId != null) result.referredByFirmId = referredByFirmId;
    if (creditAppliedCents != null)
      result.creditAppliedCents = creditAppliedCents;
    if (legalTermsVersionDate != null)
      result.legalTermsVersionDate = legalTermsVersionDate;
    return result;
  }

  License._();

  factory License.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory License.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'License',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.license'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'licenseId', protoName: 'licenseId')
    ..aE<LicensePlan>(2, _omitFieldNames ? '' : 'licensePlan',
        protoName: 'licensePlan', enumValues: LicensePlan.values)
    ..aOS(3, _omitFieldNames ? '' : 'providerProductId',
        protoName: 'providerProductId')
    ..aOS(4, _omitFieldNames ? '' : 'providerPriceId',
        protoName: 'providerPriceId')
    ..aI(5, _omitFieldNames ? '' : 'maxUsers', protoName: 'maxUsers')
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'validFrom',
        protoName: 'validFrom', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'validUntil',
        protoName: 'validUntil', subBuilder: $0.Timestamp.create)
    ..pPM<LicenseSeat>(8, _omitFieldNames ? '' : 'seats',
        subBuilder: LicenseSeat.create)
    ..aE<PaymentProvider>(9, _omitFieldNames ? '' : 'paymentProvider',
        protoName: 'paymentProvider', enumValues: PaymentProvider.values)
    ..aOS(10, _omitFieldNames ? '' : 'referredByFirmId',
        protoName: 'referredByFirmId')
    ..aI(11, _omitFieldNames ? '' : 'creditAppliedCents',
        protoName: 'creditAppliedCents')
    ..aOS(12, _omitFieldNames ? '' : 'legalTermsVersionDate',
        protoName: 'legalTermsVersionDate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  License clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  License copyWith(void Function(License) updates) =>
      super.copyWith((message) => updates(message as License)) as License;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static License create() => License._();
  @$core.override
  License createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static License getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<License>(create);
  static License? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get licenseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set licenseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLicenseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseId() => $_clearField(1);

  @$pb.TagNumber(2)
  LicensePlan get licensePlan => $_getN(1);
  @$pb.TagNumber(2)
  set licensePlan(LicensePlan value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLicensePlan() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicensePlan() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get providerProductId => $_getSZ(2);
  @$pb.TagNumber(3)
  set providerProductId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasProviderProductId() => $_has(2);
  @$pb.TagNumber(3)
  void clearProviderProductId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get providerPriceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set providerPriceId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasProviderPriceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearProviderPriceId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxUsers => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxUsers($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMaxUsers() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxUsers() => $_clearField(5);

  @$pb.TagNumber(6)
  $0.Timestamp get validFrom => $_getN(5);
  @$pb.TagNumber(6)
  set validFrom($0.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasValidFrom() => $_has(5);
  @$pb.TagNumber(6)
  void clearValidFrom() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureValidFrom() => $_ensure(5);

  /// / Omitted = lifetime license
  @$pb.TagNumber(7)
  $0.Timestamp get validUntil => $_getN(6);
  @$pb.TagNumber(7)
  set validUntil($0.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasValidUntil() => $_has(6);
  @$pb.TagNumber(7)
  void clearValidUntil() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureValidUntil() => $_ensure(6);

  @$pb.TagNumber(8)
  $pb.PbList<LicenseSeat> get seats => $_getList(7);

  /// / Which provider processed this purchase.
  @$pb.TagNumber(9)
  PaymentProvider get paymentProvider => $_getN(8);
  @$pb.TagNumber(9)
  set paymentProvider(PaymentProvider value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasPaymentProvider() => $_has(8);
  @$pb.TagNumber(9)
  void clearPaymentProvider() => $_clearField(9);

  /// / Firm that referred this purchase (referrer). Set when buyer used referrer's code.
  @$pb.TagNumber(10)
  $core.String get referredByFirmId => $_getSZ(9);
  @$pb.TagNumber(10)
  set referredByFirmId($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasReferredByFirmId() => $_has(9);
  @$pb.TagNumber(10)
  void clearReferredByFirmId() => $_clearField(10);

  /// / Amount of referral credit (cents) applied to this purchase. Deducted from buyer's firm.
  @$pb.TagNumber(11)
  $core.int get creditAppliedCents => $_getIZ(10);
  @$pb.TagNumber(11)
  set creditAppliedCents($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCreditAppliedCents() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreditAppliedCents() => $_clearField(11);

  /// / CGV / terms version accepted for this purchase (YYYY-MM-DD).
  @$pb.TagNumber(12)
  $core.String get legalTermsVersionDate => $_getSZ(11);
  @$pb.TagNumber(12)
  set legalTermsVersionDate($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasLegalTermsVersionDate() => $_has(11);
  @$pb.TagNumber(12)
  void clearLegalTermsVersionDate() => $_clearField(12);
}

/// / Per-seat validity. Each user (seat) has its own start/end dates.
/// / firmId is denormalized for efficient MongoDB queries (no joins).
class LicenseSeat extends $pb.GeneratedMessage {
  factory LicenseSeat({
    $core.String? firmId,
    $core.String? userId,
    $0.Timestamp? validFrom,
    $0.Timestamp? validUntil,
  }) {
    final result = create();
    if (firmId != null) result.firmId = firmId;
    if (userId != null) result.userId = userId;
    if (validFrom != null) result.validFrom = validFrom;
    if (validUntil != null) result.validUntil = validUntil;
    return result;
  }

  LicenseSeat._();

  factory LicenseSeat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LicenseSeat.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LicenseSeat',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.license'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'validFrom',
        protoName: 'validFrom', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'validUntil',
        protoName: 'validUntil', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LicenseSeat clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LicenseSeat copyWith(void Function(LicenseSeat) updates) =>
      super.copyWith((message) => updates(message as LicenseSeat))
          as LicenseSeat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LicenseSeat create() => LicenseSeat._();
  @$core.override
  LicenseSeat createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LicenseSeat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LicenseSeat>(create);
  static LicenseSeat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get validFrom => $_getN(2);
  @$pb.TagNumber(3)
  set validFrom($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasValidFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidFrom() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureValidFrom() => $_ensure(2);

  /// / Omitted = lifetime for this seat
  @$pb.TagNumber(4)
  $0.Timestamp get validUntil => $_getN(3);
  @$pb.TagNumber(4)
  set validUntil($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasValidUntil() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidUntil() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureValidUntil() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
