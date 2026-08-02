// This is a generated file - do not edit.
//
// Generated from ticket/ticket.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../article/article.pb.dart' as $1;
import '../common/g_timestamp.pb.dart' as $0;
import 'ticket.pbenum.dart';
import 'ticket_type.pbenum.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'ticket.pbenum.dart';

/// / ticketNonUniqueId is to be combined with userId
/// / local ids can lead to duplicates as each sellers from its own device can create contact
class TicketMongo extends $pb.GeneratedMessage {
  factory TicketMongo({
    TicketPb? ticket,
    $core.int? nonUniqueId,
    $core.String? userId,
    $core.String? boutiqueId,
    $core.String? firmId,
    $core.String? chainId,
    $core.String? creationDate,
    $0.Timestamp? lastTouchTimestampUTC,
    $core.bool? isDeleted,
    $core.int? contactId,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        additionalAttributes,
  }) {
    final result = create();
    if (ticket != null) result.ticket = ticket;
    if (nonUniqueId != null) result.nonUniqueId = nonUniqueId;
    if (userId != null) result.userId = userId;
    if (boutiqueId != null) result.boutiqueId = boutiqueId;
    if (firmId != null) result.firmId = firmId;
    if (chainId != null) result.chainId = chainId;
    if (creationDate != null) result.creationDate = creationDate;
    if (lastTouchTimestampUTC != null)
      result.lastTouchTimestampUTC = lastTouchTimestampUTC;
    if (isDeleted != null) result.isDeleted = isDeleted;
    if (contactId != null) result.contactId = contactId;
    if (additionalAttributes != null)
      result.additionalAttributes.addEntries(additionalAttributes);
    return result;
  }

  TicketMongo._();

  factory TicketMongo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TicketMongo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TicketMongo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'),
      createEmptyInstance: create)
    ..aOM<TicketPb>(1, _omitFieldNames ? '' : 'ticket',
        subBuilder: TicketPb.create)
    ..aI(2, _omitFieldNames ? '' : 'nonUniqueId', protoName: 'nonUniqueId')
    ..aOS(3, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(5, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(6, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(7, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'lastTouchTimestampUTC',
        protoName: 'lastTouchTimestampUTC', subBuilder: $0.Timestamp.create)
    ..aOB(9, _omitFieldNames ? '' : 'isDeleted', protoName: 'isDeleted')
    ..aI(10, _omitFieldNames ? '' : 'contactId', protoName: 'contactId')
    ..m<$core.String, $core.String>(
        99, _omitFieldNames ? '' : 'additional_attributes',
        entryClassName: 'TicketMongo.AdditionalAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('weebi.ticket'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketMongo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketMongo copyWith(void Function(TicketMongo) updates) =>
      super.copyWith((message) => updates(message as TicketMongo))
          as TicketMongo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketMongo create() => TicketMongo._();
  @$core.override
  TicketMongo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TicketMongo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TicketMongo>(create);
  static TicketMongo? _defaultInstance;

  @$pb.TagNumber(1)
  TicketPb get ticket => $_getN(0);
  @$pb.TagNumber(1)
  set ticket(TicketPb value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTicket() => $_has(0);
  @$pb.TagNumber(1)
  void clearTicket() => $_clearField(1);
  @$pb.TagNumber(1)
  TicketPb ensureTicket() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get nonUniqueId => $_getIZ(1);
  @$pb.TagNumber(2)
  set nonUniqueId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNonUniqueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonUniqueId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get boutiqueId => $_getSZ(3);
  @$pb.TagNumber(4)
  set boutiqueId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBoutiqueId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoutiqueId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get firmId => $_getSZ(4);
  @$pb.TagNumber(5)
  set firmId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFirmId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirmId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get chainId => $_getSZ(5);
  @$pb.TagNumber(6)
  set chainId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasChainId() => $_has(5);
  @$pb.TagNumber(6)
  void clearChainId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get creationDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set creationDate($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreationDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreationDate() => $_clearField(7);

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
  $core.bool get isDeleted => $_getBF(8);
  @$pb.TagNumber(9)
  set isDeleted($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIsDeleted() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsDeleted() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get contactId => $_getIZ(9);
  @$pb.TagNumber(10)
  set contactId($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasContactId() => $_has(9);
  @$pb.TagNumber(10)
  void clearContactId() => $_clearField(10);

  @$pb.TagNumber(99)
  $pb.PbMap<$core.String, $core.String> get additionalAttributes =>
      $_getMap(10);
}

/// Sell totals — set when ticketType is sell or sellDeferred.
class TicketSellTotalsPb extends $pb.GeneratedMessage {
  factory TicketSellTotalsPb({
    $core.double? itemsOnly,
    $core.double? promoVal,
    $core.double? markdownsVal,
    $core.double? markdownsIncludedTaxExcluded,
    $core.double? taxesValue,
    $core.double? markdownsAndTaxIncluded,
    $core.double? change,
  }) {
    final result = create();
    if (itemsOnly != null) result.itemsOnly = itemsOnly;
    if (promoVal != null) result.promoVal = promoVal;
    if (markdownsVal != null) result.markdownsVal = markdownsVal;
    if (markdownsIncludedTaxExcluded != null)
      result.markdownsIncludedTaxExcluded = markdownsIncludedTaxExcluded;
    if (taxesValue != null) result.taxesValue = taxesValue;
    if (markdownsAndTaxIncluded != null)
      result.markdownsAndTaxIncluded = markdownsAndTaxIncluded;
    if (change != null) result.change = change;
    return result;
  }

  TicketSellTotalsPb._();

  factory TicketSellTotalsPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TicketSellTotalsPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TicketSellTotalsPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'itemsOnly')
    ..aD(2, _omitFieldNames ? '' : 'promoVal')
    ..aD(3, _omitFieldNames ? '' : 'markdownsVal')
    ..aD(4, _omitFieldNames ? '' : 'markdownsIncludedTaxExcluded')
    ..aD(5, _omitFieldNames ? '' : 'taxesValue')
    ..aD(6, _omitFieldNames ? '' : 'markdownsAndTaxIncluded')
    ..aD(7, _omitFieldNames ? '' : 'change')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketSellTotalsPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketSellTotalsPb copyWith(void Function(TicketSellTotalsPb) updates) =>
      super.copyWith((message) => updates(message as TicketSellTotalsPb))
          as TicketSellTotalsPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketSellTotalsPb create() => TicketSellTotalsPb._();
  @$core.override
  TicketSellTotalsPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TicketSellTotalsPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TicketSellTotalsPb>(create);
  static TicketSellTotalsPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get itemsOnly => $_getN(0);
  @$pb.TagNumber(1)
  set itemsOnly($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItemsOnly() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemsOnly() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get promoVal => $_getN(1);
  @$pb.TagNumber(2)
  set promoVal($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPromoVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearPromoVal() => $_clearField(2);

  /// promo_val + discountAmount
  @$pb.TagNumber(3)
  $core.double get markdownsVal => $_getN(2);
  @$pb.TagNumber(3)
  set markdownsVal($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMarkdownsVal() => $_has(2);
  @$pb.TagNumber(3)
  void clearMarkdownsVal() => $_clearField(3);

  /// items_only minus all markdowns, before taxes
  @$pb.TagNumber(4)
  $core.double get markdownsIncludedTaxExcluded => $_getN(3);
  @$pb.TagNumber(4)
  set markdownsIncludedTaxExcluded($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMarkdownsIncludedTaxExcluded() => $_has(3);
  @$pb.TagNumber(4)
  void clearMarkdownsIncludedTaxExcluded() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get taxesValue => $_getN(4);
  @$pb.TagNumber(5)
  set taxesValue($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTaxesValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearTaxesValue() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get markdownsAndTaxIncluded => $_getN(5);
  @$pb.TagNumber(6)
  set markdownsAndTaxIncluded($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMarkdownsAndTaxIncluded() => $_has(5);
  @$pb.TagNumber(6)
  void clearMarkdownsAndTaxIncluded() => $_clearField(6);

  /// received − markdowns_and_tax_included; 0 when sellDeferred
  @$pb.TagNumber(7)
  $core.double get change => $_getN(6);
  @$pb.TagNumber(7)
  set change($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasChange() => $_has(6);
  @$pb.TagNumber(7)
  void clearChange() => $_clearField(7);
}

/// Spend totals — set when ticketType is spend or spendDeferred.
/// Same computation chain as TicketSellTotalsPb but items_only sums total_cost.
class TicketSpendTotalsPb extends $pb.GeneratedMessage {
  factory TicketSpendTotalsPb({
    $core.double? itemsOnly,
    $core.double? promoVal,
    $core.double? markdownsVal,
    $core.double? markdownsIncludedTaxExcluded,
    $core.double? taxesValue,
    $core.double? markdownsAndTaxIncluded,
    $core.double? change,
  }) {
    final result = create();
    if (itemsOnly != null) result.itemsOnly = itemsOnly;
    if (promoVal != null) result.promoVal = promoVal;
    if (markdownsVal != null) result.markdownsVal = markdownsVal;
    if (markdownsIncludedTaxExcluded != null)
      result.markdownsIncludedTaxExcluded = markdownsIncludedTaxExcluded;
    if (taxesValue != null) result.taxesValue = taxesValue;
    if (markdownsAndTaxIncluded != null)
      result.markdownsAndTaxIncluded = markdownsAndTaxIncluded;
    if (change != null) result.change = change;
    return result;
  }

  TicketSpendTotalsPb._();

  factory TicketSpendTotalsPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TicketSpendTotalsPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TicketSpendTotalsPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'itemsOnly')
    ..aD(2, _omitFieldNames ? '' : 'promoVal')
    ..aD(3, _omitFieldNames ? '' : 'markdownsVal')
    ..aD(4, _omitFieldNames ? '' : 'markdownsIncludedTaxExcluded')
    ..aD(5, _omitFieldNames ? '' : 'taxesValue')
    ..aD(6, _omitFieldNames ? '' : 'markdownsAndTaxIncluded')
    ..aD(7, _omitFieldNames ? '' : 'change')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketSpendTotalsPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketSpendTotalsPb copyWith(void Function(TicketSpendTotalsPb) updates) =>
      super.copyWith((message) => updates(message as TicketSpendTotalsPb))
          as TicketSpendTotalsPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketSpendTotalsPb create() => TicketSpendTotalsPb._();
  @$core.override
  TicketSpendTotalsPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TicketSpendTotalsPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TicketSpendTotalsPb>(create);
  static TicketSpendTotalsPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get itemsOnly => $_getN(0);
  @$pb.TagNumber(1)
  set itemsOnly($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItemsOnly() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemsOnly() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get promoVal => $_getN(1);
  @$pb.TagNumber(2)
  set promoVal($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPromoVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearPromoVal() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get markdownsVal => $_getN(2);
  @$pb.TagNumber(3)
  set markdownsVal($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMarkdownsVal() => $_has(2);
  @$pb.TagNumber(3)
  void clearMarkdownsVal() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get markdownsIncludedTaxExcluded => $_getN(3);
  @$pb.TagNumber(4)
  set markdownsIncludedTaxExcluded($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMarkdownsIncludedTaxExcluded() => $_has(3);
  @$pb.TagNumber(4)
  void clearMarkdownsIncludedTaxExcluded() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get taxesValue => $_getN(4);
  @$pb.TagNumber(5)
  set taxesValue($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTaxesValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearTaxesValue() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get markdownsAndTaxIncluded => $_getN(5);
  @$pb.TagNumber(6)
  set markdownsAndTaxIncluded($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMarkdownsAndTaxIncluded() => $_has(5);
  @$pb.TagNumber(6)
  void clearMarkdownsAndTaxIncluded() => $_clearField(6);

  /// received − markdowns_and_tax_included; 0 when spendDeferred
  @$pb.TagNumber(7)
  $core.double get change => $_getN(6);
  @$pb.TagNumber(7)
  set change($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasChange() => $_has(6);
  @$pb.TagNumber(7)
  void clearChange() => $_clearField(7);
}

/// Cover totals — set when ticketType is sellCovered, spendCovered, or rebalance.
/// No item computation: total equals the received amount.
class TicketCoverTotalPb extends $pb.GeneratedMessage {
  factory TicketCoverTotalPb({
    $core.double? total,
  }) {
    final result = create();
    if (total != null) result.total = total;
    return result;
  }

  TicketCoverTotalPb._();

  factory TicketCoverTotalPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TicketCoverTotalPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TicketCoverTotalPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'total')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketCoverTotalPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketCoverTotalPb copyWith(void Function(TicketCoverTotalPb) updates) =>
      super.copyWith((message) => updates(message as TicketCoverTotalPb))
          as TicketCoverTotalPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketCoverTotalPb create() => TicketCoverTotalPb._();
  @$core.override
  TicketCoverTotalPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TicketCoverTotalPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TicketCoverTotalPb>(create);
  static TicketCoverTotalPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get total => $_getN(0);
  @$pb.TagNumber(1)
  set total($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);
}

enum TicketPb_Totals { sellTotals, spendTotals, coverTotals, notSet }

class TicketPb extends $pb.GeneratedMessage {
  factory TicketPb({
    $core.int? nonUniqueId,
    Counterfoil? counterfoil,
    $core.String? date,
    $core.String? statusUpdateDate,
    $core.bool? status,
    $core.Iterable<ItemCartPb>? items,
    $2.TicketTypePb? ticketType,
    TicketPb_PaymentTypePb? paymentType,
    $core.int? contactId,
    TaxPb? taxe,
    $core.double? promo,
    $core.double? received,
    $core.double? discountAmount,
    $core.String? comment,
    $core.String? creationDate,
    $core.String? contactFirstName,
    $core.String? contactLastName,
    $core.String? contactPhone,
    $core.String? contactMail,
    $core.String? currency,
    $core.String? snapshotSecondaryCurrency,
    $core.double? snapshotLocalPerSecondary,
    TicketSellTotalsPb? sellTotals,
    TicketSpendTotalsPb? spendTotals,
    TicketCoverTotalPb? coverTotals,
    $core.String? replacedTicketId,
    $core.String? ohadaAccountCode,
    $core.String? treasuryFrom,
    $core.String? treasuryTo,
  }) {
    final result = create();
    if (nonUniqueId != null) result.nonUniqueId = nonUniqueId;
    if (counterfoil != null) result.counterfoil = counterfoil;
    if (date != null) result.date = date;
    if (statusUpdateDate != null) result.statusUpdateDate = statusUpdateDate;
    if (status != null) result.status = status;
    if (items != null) result.items.addAll(items);
    if (ticketType != null) result.ticketType = ticketType;
    if (paymentType != null) result.paymentType = paymentType;
    if (contactId != null) result.contactId = contactId;
    if (taxe != null) result.taxe = taxe;
    if (promo != null) result.promo = promo;
    if (received != null) result.received = received;
    if (discountAmount != null) result.discountAmount = discountAmount;
    if (comment != null) result.comment = comment;
    if (creationDate != null) result.creationDate = creationDate;
    if (contactFirstName != null) result.contactFirstName = contactFirstName;
    if (contactLastName != null) result.contactLastName = contactLastName;
    if (contactPhone != null) result.contactPhone = contactPhone;
    if (contactMail != null) result.contactMail = contactMail;
    if (currency != null) result.currency = currency;
    if (snapshotSecondaryCurrency != null)
      result.snapshotSecondaryCurrency = snapshotSecondaryCurrency;
    if (snapshotLocalPerSecondary != null)
      result.snapshotLocalPerSecondary = snapshotLocalPerSecondary;
    if (sellTotals != null) result.sellTotals = sellTotals;
    if (spendTotals != null) result.spendTotals = spendTotals;
    if (coverTotals != null) result.coverTotals = coverTotals;
    if (replacedTicketId != null) result.replacedTicketId = replacedTicketId;
    if (ohadaAccountCode != null) result.ohadaAccountCode = ohadaAccountCode;
    if (treasuryFrom != null) result.treasuryFrom = treasuryFrom;
    if (treasuryTo != null) result.treasuryTo = treasuryTo;
    return result;
  }

  TicketPb._();

  factory TicketPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TicketPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, TicketPb_Totals> _TicketPb_TotalsByTag = {
    23: TicketPb_Totals.sellTotals,
    24: TicketPb_Totals.spendTotals,
    25: TicketPb_Totals.coverTotals,
    0: TicketPb_Totals.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TicketPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'),
      createEmptyInstance: create)
    ..oo(0, [23, 24, 25])
    ..aI(1, _omitFieldNames ? '' : 'id', protoName: 'nonUniqueId')
    ..aOM<Counterfoil>(2, _omitFieldNames ? '' : 'counterfoil',
        subBuilder: Counterfoil.create)
    ..aOS(3, _omitFieldNames ? '' : 'date')
    ..aOS(4, _omitFieldNames ? '' : 'statusUpdateDate',
        protoName: 'statusUpdateDate')
    ..aOB(5, _omitFieldNames ? '' : 'status')
    ..pPM<ItemCartPb>(6, _omitFieldNames ? '' : 'items',
        subBuilder: ItemCartPb.create)
    ..aE<$2.TicketTypePb>(7, _omitFieldNames ? '' : 'ticketType',
        protoName: 'ticketType', enumValues: $2.TicketTypePb.values)
    ..aE<TicketPb_PaymentTypePb>(8, _omitFieldNames ? '' : 'paymentType',
        protoName: 'paymentType', enumValues: TicketPb_PaymentTypePb.values)
    ..aI(9, _omitFieldNames ? '' : 'contactId', protoName: 'contactId')
    ..aOM<TaxPb>(10, _omitFieldNames ? '' : 'taxe', subBuilder: TaxPb.create)
    ..aD(11, _omitFieldNames ? '' : 'promo')
    ..aD(12, _omitFieldNames ? '' : 'received')
    ..aD(13, _omitFieldNames ? '' : 'discountAmount',
        protoName: 'discountAmount')
    ..aOS(14, _omitFieldNames ? '' : 'comment')
    ..aOS(15, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(16, _omitFieldNames ? '' : 'contactFirstName',
        protoName: 'contactFirstName')
    ..aOS(17, _omitFieldNames ? '' : 'contactLastName',
        protoName: 'contactLastName')
    ..aOS(18, _omitFieldNames ? '' : 'contactPhone', protoName: 'contactPhone')
    ..aOS(19, _omitFieldNames ? '' : 'contactMail', protoName: 'contactMail')
    ..aOS(20, _omitFieldNames ? '' : 'currency')
    ..aOS(21, _omitFieldNames ? '' : 'snapshotSecondaryCurrency')
    ..aD(22, _omitFieldNames ? '' : 'snapshotLocalPerSecondary')
    ..aOM<TicketSellTotalsPb>(23, _omitFieldNames ? '' : 'sellTotals',
        subBuilder: TicketSellTotalsPb.create)
    ..aOM<TicketSpendTotalsPb>(24, _omitFieldNames ? '' : 'spendTotals',
        subBuilder: TicketSpendTotalsPb.create)
    ..aOM<TicketCoverTotalPb>(25, _omitFieldNames ? '' : 'coverTotals',
        subBuilder: TicketCoverTotalPb.create)
    ..aOS(26, _omitFieldNames ? '' : 'replacedTicketId')
    ..aOS(27, _omitFieldNames ? '' : 'ohadaAccountCode')
    ..aOS(28, _omitFieldNames ? '' : 'treasuryFrom')
    ..aOS(29, _omitFieldNames ? '' : 'treasuryTo')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketPb copyWith(void Function(TicketPb) updates) =>
      super.copyWith((message) => updates(message as TicketPb)) as TicketPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketPb create() => TicketPb._();
  @$core.override
  TicketPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TicketPb getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TicketPb>(create);
  static TicketPb? _defaultInstance;

  @$pb.TagNumber(23)
  @$pb.TagNumber(24)
  @$pb.TagNumber(25)
  TicketPb_Totals whichTotals() => _TicketPb_TotalsByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(23)
  @$pb.TagNumber(24)
  @$pb.TagNumber(25)
  void clearTotals() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get nonUniqueId => $_getIZ(0);
  @$pb.TagNumber(1)
  set nonUniqueId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNonUniqueId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonUniqueId() => $_clearField(1);

  /// different from article and contact
  /// a ticket must include a firm/chain/boutique/user
  /// the server will check they fit the permissions
  @$pb.TagNumber(2)
  Counterfoil get counterfoil => $_getN(1);
  @$pb.TagNumber(2)
  set counterfoil(Counterfoil value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCounterfoil() => $_has(1);
  @$pb.TagNumber(2)
  void clearCounterfoil() => $_clearField(2);
  @$pb.TagNumber(2)
  Counterfoil ensureCounterfoil() => $_ensure(1);

  /// / when the ticket should be taken into account accountingly speaking
  @$pb.TagNumber(3)
  $core.String get date => $_getSZ(2);
  @$pb.TagNumber(3)
  set date($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get statusUpdateDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set statusUpdateDate($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatusUpdateDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatusUpdateDate() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get status => $_getBF(4);
  @$pb.TagNumber(5)
  set status($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<ItemCartPb> get items => $_getList(5);

  @$pb.TagNumber(7)
  $2.TicketTypePb get ticketType => $_getN(6);
  @$pb.TagNumber(7)
  set ticketType($2.TicketTypePb value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasTicketType() => $_has(6);
  @$pb.TagNumber(7)
  void clearTicketType() => $_clearField(7);

  @$pb.TagNumber(8)
  TicketPb_PaymentTypePb get paymentType => $_getN(7);
  @$pb.TagNumber(8)
  set paymentType(TicketPb_PaymentTypePb value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasPaymentType() => $_has(7);
  @$pb.TagNumber(8)
  void clearPaymentType() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get contactId => $_getIZ(8);
  @$pb.TagNumber(9)
  set contactId($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasContactId() => $_has(8);
  @$pb.TagNumber(9)
  void clearContactId() => $_clearField(9);

  @$pb.TagNumber(10)
  TaxPb get taxe => $_getN(9);
  @$pb.TagNumber(10)
  set taxe(TaxPb value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasTaxe() => $_has(9);
  @$pb.TagNumber(10)
  void clearTaxe() => $_clearField(10);
  @$pb.TagNumber(10)
  TaxPb ensureTaxe() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.double get promo => $_getN(10);
  @$pb.TagNumber(11)
  set promo($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(11)
  $core.bool hasPromo() => $_has(10);
  @$pb.TagNumber(11)
  void clearPromo() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get received => $_getN(11);
  @$pb.TagNumber(12)
  set received($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasReceived() => $_has(11);
  @$pb.TagNumber(12)
  void clearReceived() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.double get discountAmount => $_getN(12);
  @$pb.TagNumber(13)
  set discountAmount($core.double value) => $_setDouble(12, value);
  @$pb.TagNumber(13)
  $core.bool hasDiscountAmount() => $_has(12);
  @$pb.TagNumber(13)
  void clearDiscountAmount() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get comment => $_getSZ(13);
  @$pb.TagNumber(14)
  set comment($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasComment() => $_has(13);
  @$pb.TagNumber(14)
  void clearComment() => $_clearField(14);

  /// / when the ticket was created
  @$pb.TagNumber(15)
  $core.String get creationDate => $_getSZ(14);
  @$pb.TagNumber(15)
  set creationDate($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasCreationDate() => $_has(14);
  @$pb.TagNumber(15)
  void clearCreationDate() => $_clearField(15);

  /// complementary contact fields that need to be stored on ticket in case contacts change
  @$pb.TagNumber(16)
  $core.String get contactFirstName => $_getSZ(15);
  @$pb.TagNumber(16)
  set contactFirstName($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasContactFirstName() => $_has(15);
  @$pb.TagNumber(16)
  void clearContactFirstName() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.String get contactLastName => $_getSZ(16);
  @$pb.TagNumber(17)
  set contactLastName($core.String value) => $_setString(16, value);
  @$pb.TagNumber(17)
  $core.bool hasContactLastName() => $_has(16);
  @$pb.TagNumber(17)
  void clearContactLastName() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.String get contactPhone => $_getSZ(17);
  @$pb.TagNumber(18)
  set contactPhone($core.String value) => $_setString(17, value);
  @$pb.TagNumber(18)
  $core.bool hasContactPhone() => $_has(17);
  @$pb.TagNumber(18)
  void clearContactPhone() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.String get contactMail => $_getSZ(18);
  @$pb.TagNumber(19)
  set contactMail($core.String value) => $_setString(18, value);
  @$pb.TagNumber(19)
  $core.bool hasContactMail() => $_has(18);
  @$pb.TagNumber(19)
  void clearContactMail() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get currency => $_getSZ(19);
  @$pb.TagNumber(20)
  set currency($core.String value) => $_setString(19, value);
  @$pb.TagNumber(20)
  $core.bool hasCurrency() => $_has(19);
  @$pb.TagNumber(20)
  void clearCurrency() => $_clearField(20);

  /// / ISO 4217 secondary currency (e.g. USD) shown at sale time alongside local amounts. Empty = no snapshot.
  @$pb.TagNumber(21)
  $core.String get snapshotSecondaryCurrency => $_getSZ(20);
  @$pb.TagNumber(21)
  set snapshotSecondaryCurrency($core.String value) => $_setString(20, value);
  @$pb.TagNumber(21)
  $core.bool hasSnapshotSecondaryCurrency() => $_has(20);
  @$pb.TagNumber(21)
  void clearSnapshotSecondaryCurrency() => $_clearField(21);

  /// / Units of local (boutique) currency for one unit of snapshot_secondary_currency (e.g. 2800 means 1 USD = 2800 CDF).
  @$pb.TagNumber(22)
  $core.double get snapshotLocalPerSecondary => $_getN(21);
  @$pb.TagNumber(22)
  set snapshotLocalPerSecondary($core.double value) => $_setDouble(21, value);
  @$pb.TagNumber(22)
  $core.bool hasSnapshotLocalPerSecondary() => $_has(21);
  @$pb.TagNumber(22)
  void clearSnapshotLocalPerSecondary() => $_clearField(22);

  @$pb.TagNumber(23)
  TicketSellTotalsPb get sellTotals => $_getN(22);
  @$pb.TagNumber(23)
  set sellTotals(TicketSellTotalsPb value) => $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasSellTotals() => $_has(22);
  @$pb.TagNumber(23)
  void clearSellTotals() => $_clearField(23);
  @$pb.TagNumber(23)
  TicketSellTotalsPb ensureSellTotals() => $_ensure(22);

  @$pb.TagNumber(24)
  TicketSpendTotalsPb get spendTotals => $_getN(23);
  @$pb.TagNumber(24)
  set spendTotals(TicketSpendTotalsPb value) => $_setField(24, value);
  @$pb.TagNumber(24)
  $core.bool hasSpendTotals() => $_has(23);
  @$pb.TagNumber(24)
  void clearSpendTotals() => $_clearField(24);
  @$pb.TagNumber(24)
  TicketSpendTotalsPb ensureSpendTotals() => $_ensure(23);

  @$pb.TagNumber(25)
  TicketCoverTotalPb get coverTotals => $_getN(24);
  @$pb.TagNumber(25)
  set coverTotals(TicketCoverTotalPb value) => $_setField(25, value);
  @$pb.TagNumber(25)
  $core.bool hasCoverTotals() => $_has(24);
  @$pb.TagNumber(25)
  void clearCoverTotals() => $_clearField(25);
  @$pb.TagNumber(25)
  TicketCoverTotalPb ensureCoverTotals() => $_ensure(24);

  @$pb.TagNumber(26)
  $core.String get replacedTicketId => $_getSZ(25);
  @$pb.TagNumber(26)
  set replacedTicketId($core.String value) => $_setString(25, value);
  @$pb.TagNumber(26)
  $core.bool hasReplacedTicketId() => $_has(25);
  @$pb.TagNumber(26)
  void clearReplacedTicketId() => $_clearField(26);

  /// / SYSCOHADA account code for hors-catalogue sell/spend (owner-classified).
  @$pb.TagNumber(27)
  $core.String get ohadaAccountCode => $_getSZ(26);
  @$pb.TagNumber(27)
  set ohadaAccountCode($core.String value) => $_setString(26, value);
  @$pb.TagNumber(27)
  $core.bool hasOhadaAccountCode() => $_has(26);
  @$pb.TagNumber(27)
  void clearOhadaAccountCode() => $_clearField(27);

  /// / SMT treasury pocket leaving (571 / 521 / 554) for ticketType rebalance.
  @$pb.TagNumber(28)
  $core.String get treasuryFrom => $_getSZ(27);
  @$pb.TagNumber(28)
  set treasuryFrom($core.String value) => $_setString(27, value);
  @$pb.TagNumber(28)
  $core.bool hasTreasuryFrom() => $_has(27);
  @$pb.TagNumber(28)
  void clearTreasuryFrom() => $_clearField(28);

  /// / SMT treasury pocket receiving (571 / 521 / 554) for ticketType rebalance.
  @$pb.TagNumber(29)
  $core.String get treasuryTo => $_getSZ(28);
  @$pb.TagNumber(29)
  set treasuryTo($core.String value) => $_setString(28, value);
  @$pb.TagNumber(29)
  $core.bool hasTreasuryTo() => $_has(28);
  @$pb.TagNumber(29)
  void clearTreasuryTo() => $_clearField(29);
}

class Counterfoil extends $pb.GeneratedMessage {
  factory Counterfoil({
    $core.String? firmId,
    $core.String? firmName,
    $core.String? chainId,
    $core.String? chainName,
    $core.String? deviceId,
    $core.String? deviceName,
    $core.String? boutiqueId,
    $core.String? boutiqueName,
    $core.String? userId,
    $core.String? userName,
  }) {
    final result = create();
    if (firmId != null) result.firmId = firmId;
    if (firmName != null) result.firmName = firmName;
    if (chainId != null) result.chainId = chainId;
    if (chainName != null) result.chainName = chainName;
    if (deviceId != null) result.deviceId = deviceId;
    if (deviceName != null) result.deviceName = deviceName;
    if (boutiqueId != null) result.boutiqueId = boutiqueId;
    if (boutiqueName != null) result.boutiqueName = boutiqueName;
    if (userId != null) result.userId = userId;
    if (userName != null) result.userName = userName;
    return result;
  }

  Counterfoil._();

  factory Counterfoil.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Counterfoil.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Counterfoil',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'firmName', protoName: 'firmName')
    ..aOS(3, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(4, _omitFieldNames ? '' : 'chainName', protoName: 'chainName')
    ..aOS(5, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(6, _omitFieldNames ? '' : 'deviceName', protoName: 'deviceName')
    ..aOS(7, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(8, _omitFieldNames ? '' : 'boutiqueName', protoName: 'boutiqueName')
    ..aOS(9, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(10, _omitFieldNames ? '' : 'userName', protoName: 'userName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Counterfoil clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Counterfoil copyWith(void Function(Counterfoil) updates) =>
      super.copyWith((message) => updates(message as Counterfoil))
          as Counterfoil;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Counterfoil create() => Counterfoil._();
  @$core.override
  Counterfoil createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Counterfoil getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Counterfoil>(create);
  static Counterfoil? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get firmName => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFirmName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get chainId => $_getSZ(2);
  @$pb.TagNumber(3)
  set chainId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChainId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get chainName => $_getSZ(3);
  @$pb.TagNumber(4)
  set chainName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChainName() => $_has(3);
  @$pb.TagNumber(4)
  void clearChainName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceId => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get deviceName => $_getSZ(5);
  @$pb.TagNumber(6)
  set deviceName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDeviceName() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeviceName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get boutiqueId => $_getSZ(6);
  @$pb.TagNumber(7)
  set boutiqueId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBoutiqueId() => $_has(6);
  @$pb.TagNumber(7)
  void clearBoutiqueId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get boutiqueName => $_getSZ(7);
  @$pb.TagNumber(8)
  set boutiqueName($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBoutiqueName() => $_has(7);
  @$pb.TagNumber(8)
  void clearBoutiqueName() => $_clearField(8);

  /// / userId is the user who synced the ticket, not necessarily the one who created it
  @$pb.TagNumber(9)
  $core.String get userId => $_getSZ(8);
  @$pb.TagNumber(9)
  set userId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUserId() => $_has(8);
  @$pb.TagNumber(9)
  void clearUserId() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get userName => $_getSZ(9);
  @$pb.TagNumber(10)
  set userName($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasUserName() => $_has(9);
  @$pb.TagNumber(10)
  void clearUserName() => $_clearField(10);
}

class TaxPb extends $pb.GeneratedMessage {
  factory TaxPb({
    $core.String? id,
    $core.String? name,
    $core.double? percentage,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (percentage != null) result.percentage = percentage;
    return result;
  }

  TaxPb._();

  factory TaxPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaxPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaxPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aD(3, _omitFieldNames ? '' : 'percentage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaxPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaxPb copyWith(void Function(TaxPb) updates) =>
      super.copyWith((message) => updates(message as TaxPb)) as TaxPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaxPb create() => TaxPb._();
  @$core.override
  TaxPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TaxPb getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaxPb>(create);
  static TaxPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get percentage => $_getN(2);
  @$pb.TagNumber(3)
  set percentage($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPercentage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPercentage() => $_clearField(3);
}

class ProxyArticleWorthPb extends $pb.GeneratedMessage {
  factory ProxyArticleWorthPb({
    $core.int? calibreId,
    $core.int? articleId,
    $core.int? id,
    $core.bool? status,
    $core.int? proxyCalibreId,
    $core.int? proxyArticleId,
    $core.double? minimumUnitPerBasket,
    $core.double? articleWeight,
    $core.double? price,
    $core.double? cost,
  }) {
    final result = create();
    if (calibreId != null) result.calibreId = calibreId;
    if (articleId != null) result.articleId = articleId;
    if (id != null) result.id = id;
    if (status != null) result.status = status;
    if (proxyCalibreId != null) result.proxyCalibreId = proxyCalibreId;
    if (proxyArticleId != null) result.proxyArticleId = proxyArticleId;
    if (minimumUnitPerBasket != null)
      result.minimumUnitPerBasket = minimumUnitPerBasket;
    if (articleWeight != null) result.articleWeight = articleWeight;
    if (price != null) result.price = price;
    if (cost != null) result.cost = cost;
    return result;
  }

  ProxyArticleWorthPb._();

  factory ProxyArticleWorthPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProxyArticleWorthPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProxyArticleWorthPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aI(2, _omitFieldNames ? '' : 'articleId', protoName: 'articleId')
    ..aI(3, _omitFieldNames ? '' : 'id')
    ..aOB(4, _omitFieldNames ? '' : 'status')
    ..aI(5, _omitFieldNames ? '' : 'proxyCalibreId',
        protoName: 'proxyCalibreId')
    ..aI(6, _omitFieldNames ? '' : 'proxyArticleId',
        protoName: 'proxyArticleId')
    ..aD(7, _omitFieldNames ? '' : 'minimumUnitPerBasket',
        protoName: 'minimumUnitPerBasket')
    ..aD(8, _omitFieldNames ? '' : 'articleWeight', protoName: 'articleWeight')
    ..aD(9, _omitFieldNames ? '' : 'price')
    ..aD(10, _omitFieldNames ? '' : 'cost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProxyArticleWorthPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProxyArticleWorthPb copyWith(void Function(ProxyArticleWorthPb) updates) =>
      super.copyWith((message) => updates(message as ProxyArticleWorthPb))
          as ProxyArticleWorthPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProxyArticleWorthPb create() => ProxyArticleWorthPb._();
  @$core.override
  ProxyArticleWorthPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProxyArticleWorthPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProxyArticleWorthPb>(create);
  static ProxyArticleWorthPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get calibreId => $_getIZ(0);
  @$pb.TagNumber(1)
  set calibreId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCalibreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalibreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get articleId => $_getIZ(1);
  @$pb.TagNumber(2)
  set articleId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasArticleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearArticleId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get id => $_getIZ(2);
  @$pb.TagNumber(3)
  set id($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get status => $_getBF(3);
  @$pb.TagNumber(4)
  set status($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get proxyCalibreId => $_getIZ(4);
  @$pb.TagNumber(5)
  set proxyCalibreId($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasProxyCalibreId() => $_has(4);
  @$pb.TagNumber(5)
  void clearProxyCalibreId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get proxyArticleId => $_getIZ(5);
  @$pb.TagNumber(6)
  set proxyArticleId($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasProxyArticleId() => $_has(5);
  @$pb.TagNumber(6)
  void clearProxyArticleId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get minimumUnitPerBasket => $_getN(6);
  @$pb.TagNumber(7)
  set minimumUnitPerBasket($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMinimumUnitPerBasket() => $_has(6);
  @$pb.TagNumber(7)
  void clearMinimumUnitPerBasket() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get articleWeight => $_getN(7);
  @$pb.TagNumber(8)
  set articleWeight($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasArticleWeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearArticleWeight() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get price => $_getN(8);
  @$pb.TagNumber(9)
  set price($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPrice() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrice() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get cost => $_getN(9);
  @$pb.TagNumber(10)
  set cost($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCost() => $_has(9);
  @$pb.TagNumber(10)
  void clearCost() => $_clearField(10);
}

class ItemCartPb extends $pb.GeneratedMessage {
  factory ItemCartPb({
    $1.ArticleRetailOnTicketPb? articleRetail,
    $1.ArticleBasketOnTicketPb? articleBasket,
    $1.ArticleUncountableOnTicketPb? articleUncountable,
    $core.double? quantity,
    $core.Iterable<ProxyArticleWorthPb>? proxiesWorth,
    $core.double? inventoryAbsoluteQt,
    $core.double? totalPrice,
    $core.double? totalCost,
  }) {
    final result = create();
    if (articleRetail != null) result.articleRetail = articleRetail;
    if (articleBasket != null) result.articleBasket = articleBasket;
    if (articleUncountable != null)
      result.articleUncountable = articleUncountable;
    if (quantity != null) result.quantity = quantity;
    if (proxiesWorth != null) result.proxiesWorth.addAll(proxiesWorth);
    if (inventoryAbsoluteQt != null)
      result.inventoryAbsoluteQt = inventoryAbsoluteQt;
    if (totalPrice != null) result.totalPrice = totalPrice;
    if (totalCost != null) result.totalCost = totalCost;
    return result;
  }

  ItemCartPb._();

  factory ItemCartPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ItemCartPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ItemCartPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'),
      createEmptyInstance: create)
    ..aOM<$1.ArticleRetailOnTicketPb>(1, _omitFieldNames ? '' : 'articleRetail',
        protoName: 'articleRetail',
        subBuilder: $1.ArticleRetailOnTicketPb.create)
    ..aOM<$1.ArticleBasketOnTicketPb>(2, _omitFieldNames ? '' : 'articleBasket',
        protoName: 'articleBasket',
        subBuilder: $1.ArticleBasketOnTicketPb.create)
    ..aOM<$1.ArticleUncountableOnTicketPb>(
        3, _omitFieldNames ? '' : 'articleUncountable',
        protoName: 'articleUncountable',
        subBuilder: $1.ArticleUncountableOnTicketPb.create)
    ..aD(4, _omitFieldNames ? '' : 'quantity')
    ..pPM<ProxyArticleWorthPb>(5, _omitFieldNames ? '' : 'proxiesWorth',
        subBuilder: ProxyArticleWorthPb.create)
    ..aD(6, _omitFieldNames ? '' : 'inventoryAbsoluteQt',
        protoName: 'inventoryAbsoluteQt')
    ..aD(7, _omitFieldNames ? '' : 'totalPrice')
    ..aD(8, _omitFieldNames ? '' : 'totalCost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ItemCartPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ItemCartPb copyWith(void Function(ItemCartPb) updates) =>
      super.copyWith((message) => updates(message as ItemCartPb)) as ItemCartPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ItemCartPb create() => ItemCartPb._();
  @$core.override
  ItemCartPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ItemCartPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ItemCartPb>(create);
  static ItemCartPb? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ArticleRetailOnTicketPb get articleRetail => $_getN(0);
  @$pb.TagNumber(1)
  set articleRetail($1.ArticleRetailOnTicketPb value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasArticleRetail() => $_has(0);
  @$pb.TagNumber(1)
  void clearArticleRetail() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.ArticleRetailOnTicketPb ensureArticleRetail() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.ArticleBasketOnTicketPb get articleBasket => $_getN(1);
  @$pb.TagNumber(2)
  set articleBasket($1.ArticleBasketOnTicketPb value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasArticleBasket() => $_has(1);
  @$pb.TagNumber(2)
  void clearArticleBasket() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.ArticleBasketOnTicketPb ensureArticleBasket() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.ArticleUncountableOnTicketPb get articleUncountable => $_getN(2);
  @$pb.TagNumber(3)
  set articleUncountable($1.ArticleUncountableOnTicketPb value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasArticleUncountable() => $_has(2);
  @$pb.TagNumber(3)
  void clearArticleUncountable() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.ArticleUncountableOnTicketPb ensureArticleUncountable() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.double get quantity => $_getN(3);
  @$pb.TagNumber(4)
  set quantity($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuantity() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuantity() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<ProxyArticleWorthPb> get proxiesWorth => $_getList(4);

  @$pb.TagNumber(6)
  $core.double get inventoryAbsoluteQt => $_getN(5);
  @$pb.TagNumber(6)
  set inventoryAbsoluteQt($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasInventoryAbsoluteQt() => $_has(5);
  @$pb.TagNumber(6)
  void clearInventoryAbsoluteQt() => $_clearField(6);

  /// client_computed
  /// quantity × articlePrice, where articlePrice resolves as:
  ///   retail      → articleRetail.price
  ///   uncountable → articleUncountable.price  (quantity is always 1)
  ///   basket      → sum(round(p.price × p.minimumUnitPerBasket) for p in proxies_worth)
  ///                 − articleBasket.discountAmount + articleBasket.markupAmount
  @$pb.TagNumber(7)
  $core.double get totalPrice => $_getN(6);
  @$pb.TagNumber(7)
  set totalPrice($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTotalPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalPrice() => $_clearField(7);

  /// client_computed
  /// quantity × articleCost, where articleCost resolves as:
  ///   retail      → articleRetail.cost
  ///   uncountable → articleUncountable.cost   (quantity is always 1)
  ///   basket      → sum(round(p.cost × p.minimumUnitPerBasket) for p in proxies_worth)
  ///                 (no discount or markup on the cost side — purchase)
  @$pb.TagNumber(8)
  $core.double get totalCost => $_getN(7);
  @$pb.TagNumber(8)
  set totalCost($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalCost() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalCost() => $_clearField(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
