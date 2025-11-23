//
//  Generated code. Do not modify.
//  source: ticket/ticket.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../article/article.pb.dart' as $3;
import '../common/g_timestamp.pb.dart' as $18;
import 'ticket.pbenum.dart';
import 'ticket_type.pbenum.dart' as $23;

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
    $18.Timestamp? lastTouchTimestampUTC,
    $core.bool? isDeleted,
    $core.int? contactId,
    $core.Map<$core.String, $core.String>? additionalAttributes,
  }) {
    final result = create();
    if (ticket != null) {
      result.ticket = ticket;
    }
    if (nonUniqueId != null) {
      result.nonUniqueId = nonUniqueId;
    }
    if (userId != null) {
      result.userId = userId;
    }
    if (boutiqueId != null) {
      result.boutiqueId = boutiqueId;
    }
    if (firmId != null) {
      result.firmId = firmId;
    }
    if (chainId != null) {
      result.chainId = chainId;
    }
    if (creationDate != null) {
      result.creationDate = creationDate;
    }
    if (lastTouchTimestampUTC != null) {
      result.lastTouchTimestampUTC = lastTouchTimestampUTC;
    }
    if (isDeleted != null) {
      result.isDeleted = isDeleted;
    }
    if (contactId != null) {
      result.contactId = contactId;
    }
    if (additionalAttributes != null) {
      result.additionalAttributes.addAll(additionalAttributes);
    }
    return result;
  }
  TicketMongo._() : super();
  factory TicketMongo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TicketMongo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TicketMongo', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'), createEmptyInstance: create)
    ..aOM<TicketPb>(1, _omitFieldNames ? '' : 'ticket', subBuilder: TicketPb.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'nonUniqueId', $pb.PbFieldType.O3, protoName: 'nonUniqueId')
    ..aOS(3, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOS(5, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(6, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(7, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOM<$18.Timestamp>(8, _omitFieldNames ? '' : 'lastTouchTimestampUTC', protoName: 'lastTouchTimestampUTC', subBuilder: $18.Timestamp.create)
    ..aOB(9, _omitFieldNames ? '' : 'isDeleted', protoName: 'isDeleted')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'contactId', $pb.PbFieldType.O3, protoName: 'contactId')
    ..m<$core.String, $core.String>(99, _omitFieldNames ? '' : 'additional_attributes', entryClassName: 'TicketMongo.AdditionalAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('weebi.ticket'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TicketMongo clone() => TicketMongo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TicketMongo copyWith(void Function(TicketMongo) updates) => super.copyWith((message) => updates(message as TicketMongo)) as TicketMongo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketMongo create() => TicketMongo._();
  TicketMongo createEmptyInstance() => create();
  static $pb.PbList<TicketMongo> createRepeated() => $pb.PbList<TicketMongo>();
  @$core.pragma('dart2js:noInline')
  static TicketMongo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TicketMongo>(create);
  static TicketMongo? _defaultInstance;

  @$pb.TagNumber(1)
  TicketPb get ticket => $_getN(0);
  @$pb.TagNumber(1)
  set ticket(TicketPb v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTicket() => $_has(0);
  @$pb.TagNumber(1)
  void clearTicket() => clearField(1);
  @$pb.TagNumber(1)
  TicketPb ensureTicket() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get nonUniqueId => $_getIZ(1);
  @$pb.TagNumber(2)
  set nonUniqueId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNonUniqueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonUniqueId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get boutiqueId => $_getSZ(3);
  @$pb.TagNumber(4)
  set boutiqueId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoutiqueId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoutiqueId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get firmId => $_getSZ(4);
  @$pb.TagNumber(5)
  set firmId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFirmId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirmId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get chainId => $_getSZ(5);
  @$pb.TagNumber(6)
  set chainId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasChainId() => $_has(5);
  @$pb.TagNumber(6)
  void clearChainId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get creationDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set creationDate($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreationDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreationDate() => clearField(7);

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
  $core.bool get isDeleted => $_getBF(8);
  @$pb.TagNumber(9)
  set isDeleted($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsDeleted() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsDeleted() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get contactId => $_getIZ(9);
  @$pb.TagNumber(10)
  set contactId($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasContactId() => $_has(9);
  @$pb.TagNumber(10)
  void clearContactId() => clearField(10);

  @$pb.TagNumber(99)
  $core.Map<$core.String, $core.String> get additionalAttributes => $_getMap(10);
}

class TicketPb extends $pb.GeneratedMessage {
  factory TicketPb({
    $core.int? nonUniqueId,
    Counterfoil? counterfoil,
    $core.String? date,
    $core.String? statusUpdateDate,
    $core.bool? status,
    $core.Iterable<ItemCartPb>? items,
    $23.TicketTypePb? ticketType,
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
  }) {
    final result = create();
    if (nonUniqueId != null) {
      result.nonUniqueId = nonUniqueId;
    }
    if (counterfoil != null) {
      result.counterfoil = counterfoil;
    }
    if (date != null) {
      result.date = date;
    }
    if (statusUpdateDate != null) {
      result.statusUpdateDate = statusUpdateDate;
    }
    if (status != null) {
      result.status = status;
    }
    if (items != null) {
      result.items.addAll(items);
    }
    if (ticketType != null) {
      result.ticketType = ticketType;
    }
    if (paymentType != null) {
      result.paymentType = paymentType;
    }
    if (contactId != null) {
      result.contactId = contactId;
    }
    if (taxe != null) {
      result.taxe = taxe;
    }
    if (promo != null) {
      result.promo = promo;
    }
    if (received != null) {
      result.received = received;
    }
    if (discountAmount != null) {
      result.discountAmount = discountAmount;
    }
    if (comment != null) {
      result.comment = comment;
    }
    if (creationDate != null) {
      result.creationDate = creationDate;
    }
    if (contactFirstName != null) {
      result.contactFirstName = contactFirstName;
    }
    if (contactLastName != null) {
      result.contactLastName = contactLastName;
    }
    if (contactPhone != null) {
      result.contactPhone = contactPhone;
    }
    if (contactMail != null) {
      result.contactMail = contactMail;
    }
    return result;
  }
  TicketPb._() : super();
  factory TicketPb.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TicketPb.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TicketPb', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3, protoName: 'nonUniqueId')
    ..aOM<Counterfoil>(2, _omitFieldNames ? '' : 'counterfoil', subBuilder: Counterfoil.create)
    ..aOS(3, _omitFieldNames ? '' : 'date')
    ..aOS(4, _omitFieldNames ? '' : 'statusUpdateDate', protoName: 'statusUpdateDate')
    ..aOB(5, _omitFieldNames ? '' : 'status')
    ..pc<ItemCartPb>(6, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: ItemCartPb.create)
    ..e<$23.TicketTypePb>(7, _omitFieldNames ? '' : 'ticketType', $pb.PbFieldType.OE, protoName: 'ticketType', defaultOrMaker: $23.TicketTypePb.unknown, valueOf: $23.TicketTypePb.valueOf, enumValues: $23.TicketTypePb.values)
    ..e<TicketPb_PaymentTypePb>(8, _omitFieldNames ? '' : 'paymentType', $pb.PbFieldType.OE, protoName: 'paymentType', defaultOrMaker: TicketPb_PaymentTypePb.unknown, valueOf: TicketPb_PaymentTypePb.valueOf, enumValues: TicketPb_PaymentTypePb.values)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'contactId', $pb.PbFieldType.O3, protoName: 'contactId')
    ..aOM<TaxPb>(10, _omitFieldNames ? '' : 'taxe', subBuilder: TaxPb.create)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'promo', $pb.PbFieldType.OD)
    ..a<$core.double>(12, _omitFieldNames ? '' : 'received', $pb.PbFieldType.OD)
    ..a<$core.double>(13, _omitFieldNames ? '' : 'discountAmount', $pb.PbFieldType.OD, protoName: 'discountAmount')
    ..aOS(14, _omitFieldNames ? '' : 'comment')
    ..aOS(15, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(16, _omitFieldNames ? '' : 'contactFirstName', protoName: 'contactFirstName')
    ..aOS(17, _omitFieldNames ? '' : 'contactLastName', protoName: 'contactLastName')
    ..aOS(18, _omitFieldNames ? '' : 'contactPhone', protoName: 'contactPhone')
    ..aOS(19, _omitFieldNames ? '' : 'contactMail', protoName: 'contactMail')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TicketPb clone() => TicketPb()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TicketPb copyWith(void Function(TicketPb) updates) => super.copyWith((message) => updates(message as TicketPb)) as TicketPb;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketPb create() => TicketPb._();
  TicketPb createEmptyInstance() => create();
  static $pb.PbList<TicketPb> createRepeated() => $pb.PbList<TicketPb>();
  @$core.pragma('dart2js:noInline')
  static TicketPb getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TicketPb>(create);
  static TicketPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nonUniqueId => $_getIZ(0);
  @$pb.TagNumber(1)
  set nonUniqueId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonUniqueId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonUniqueId() => clearField(1);

  /// different from article and contact
  /// a ticket must include a firm/chain/boutique/user
  /// the server will check they fit the permissions
  @$pb.TagNumber(2)
  Counterfoil get counterfoil => $_getN(1);
  @$pb.TagNumber(2)
  set counterfoil(Counterfoil v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCounterfoil() => $_has(1);
  @$pb.TagNumber(2)
  void clearCounterfoil() => clearField(2);
  @$pb.TagNumber(2)
  Counterfoil ensureCounterfoil() => $_ensure(1);

  /// / when the ticket should be taken into account accountingly speaking
  @$pb.TagNumber(3)
  $core.String get date => $_getSZ(2);
  @$pb.TagNumber(3)
  set date($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => clearField(3);

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
  $core.List<ItemCartPb> get items => $_getList(5);

  @$pb.TagNumber(7)
  $23.TicketTypePb get ticketType => $_getN(6);
  @$pb.TagNumber(7)
  set ticketType($23.TicketTypePb v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasTicketType() => $_has(6);
  @$pb.TagNumber(7)
  void clearTicketType() => clearField(7);

  @$pb.TagNumber(8)
  TicketPb_PaymentTypePb get paymentType => $_getN(7);
  @$pb.TagNumber(8)
  set paymentType(TicketPb_PaymentTypePb v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPaymentType() => $_has(7);
  @$pb.TagNumber(8)
  void clearPaymentType() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get contactId => $_getIZ(8);
  @$pb.TagNumber(9)
  set contactId($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasContactId() => $_has(8);
  @$pb.TagNumber(9)
  void clearContactId() => clearField(9);

  @$pb.TagNumber(10)
  TaxPb get taxe => $_getN(9);
  @$pb.TagNumber(10)
  set taxe(TaxPb v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasTaxe() => $_has(9);
  @$pb.TagNumber(10)
  void clearTaxe() => clearField(10);
  @$pb.TagNumber(10)
  TaxPb ensureTaxe() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.double get promo => $_getN(10);
  @$pb.TagNumber(11)
  set promo($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasPromo() => $_has(10);
  @$pb.TagNumber(11)
  void clearPromo() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get received => $_getN(11);
  @$pb.TagNumber(12)
  set received($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasReceived() => $_has(11);
  @$pb.TagNumber(12)
  void clearReceived() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get discountAmount => $_getN(12);
  @$pb.TagNumber(13)
  set discountAmount($core.double v) { $_setDouble(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasDiscountAmount() => $_has(12);
  @$pb.TagNumber(13)
  void clearDiscountAmount() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get comment => $_getSZ(13);
  @$pb.TagNumber(14)
  set comment($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasComment() => $_has(13);
  @$pb.TagNumber(14)
  void clearComment() => clearField(14);

  /// / when the ticket was created
  @$pb.TagNumber(15)
  $core.String get creationDate => $_getSZ(14);
  @$pb.TagNumber(15)
  set creationDate($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasCreationDate() => $_has(14);
  @$pb.TagNumber(15)
  void clearCreationDate() => clearField(15);

  /// complementary contact fields that need to be stored on ticket in case contacts change
  @$pb.TagNumber(16)
  $core.String get contactFirstName => $_getSZ(15);
  @$pb.TagNumber(16)
  set contactFirstName($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasContactFirstName() => $_has(15);
  @$pb.TagNumber(16)
  void clearContactFirstName() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get contactLastName => $_getSZ(16);
  @$pb.TagNumber(17)
  set contactLastName($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasContactLastName() => $_has(16);
  @$pb.TagNumber(17)
  void clearContactLastName() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get contactPhone => $_getSZ(17);
  @$pb.TagNumber(18)
  set contactPhone($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasContactPhone() => $_has(17);
  @$pb.TagNumber(18)
  void clearContactPhone() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get contactMail => $_getSZ(18);
  @$pb.TagNumber(19)
  set contactMail($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasContactMail() => $_has(18);
  @$pb.TagNumber(19)
  void clearContactMail() => clearField(19);
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
    if (firmId != null) {
      result.firmId = firmId;
    }
    if (firmName != null) {
      result.firmName = firmName;
    }
    if (chainId != null) {
      result.chainId = chainId;
    }
    if (chainName != null) {
      result.chainName = chainName;
    }
    if (deviceId != null) {
      result.deviceId = deviceId;
    }
    if (deviceName != null) {
      result.deviceName = deviceName;
    }
    if (boutiqueId != null) {
      result.boutiqueId = boutiqueId;
    }
    if (boutiqueName != null) {
      result.boutiqueName = boutiqueName;
    }
    if (userId != null) {
      result.userId = userId;
    }
    if (userName != null) {
      result.userName = userName;
    }
    return result;
  }
  Counterfoil._() : super();
  factory Counterfoil.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Counterfoil.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Counterfoil', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'), createEmptyInstance: create)
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
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Counterfoil clone() => Counterfoil()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Counterfoil copyWith(void Function(Counterfoil) updates) => super.copyWith((message) => updates(message as Counterfoil)) as Counterfoil;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Counterfoil create() => Counterfoil._();
  Counterfoil createEmptyInstance() => create();
  static $pb.PbList<Counterfoil> createRepeated() => $pb.PbList<Counterfoil>();
  @$core.pragma('dart2js:noInline')
  static Counterfoil getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Counterfoil>(create);
  static Counterfoil? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firmName => $_getSZ(1);
  @$pb.TagNumber(2)
  set firmName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirmName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirmName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get chainId => $_getSZ(2);
  @$pb.TagNumber(3)
  set chainId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChainId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get chainName => $_getSZ(3);
  @$pb.TagNumber(4)
  set chainName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChainName() => $_has(3);
  @$pb.TagNumber(4)
  void clearChainName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceId => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get deviceName => $_getSZ(5);
  @$pb.TagNumber(6)
  set deviceName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeviceName() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeviceName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get boutiqueId => $_getSZ(6);
  @$pb.TagNumber(7)
  set boutiqueId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBoutiqueId() => $_has(6);
  @$pb.TagNumber(7)
  void clearBoutiqueId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get boutiqueName => $_getSZ(7);
  @$pb.TagNumber(8)
  set boutiqueName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBoutiqueName() => $_has(7);
  @$pb.TagNumber(8)
  void clearBoutiqueName() => clearField(8);

  /// / userId is the user who synced the ticket, not necessarily the one who created it
  @$pb.TagNumber(9)
  $core.String get userId => $_getSZ(8);
  @$pb.TagNumber(9)
  set userId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasUserId() => $_has(8);
  @$pb.TagNumber(9)
  void clearUserId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get userName => $_getSZ(9);
  @$pb.TagNumber(10)
  set userName($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUserName() => $_has(9);
  @$pb.TagNumber(10)
  void clearUserName() => clearField(10);
}

class TaxPb extends $pb.GeneratedMessage {
  factory TaxPb({
    $core.String? id,
    $core.String? name,
    $core.double? percentage,
  }) {
    final result = create();
    if (id != null) {
      result.id = id;
    }
    if (name != null) {
      result.name = name;
    }
    if (percentage != null) {
      result.percentage = percentage;
    }
    return result;
  }
  TaxPb._() : super();
  factory TaxPb.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaxPb.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaxPb', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'percentage', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaxPb clone() => TaxPb()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaxPb copyWith(void Function(TaxPb) updates) => super.copyWith((message) => updates(message as TaxPb)) as TaxPb;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaxPb create() => TaxPb._();
  TaxPb createEmptyInstance() => create();
  static $pb.PbList<TaxPb> createRepeated() => $pb.PbList<TaxPb>();
  @$core.pragma('dart2js:noInline')
  static TaxPb getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaxPb>(create);
  static TaxPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get percentage => $_getN(2);
  @$pb.TagNumber(3)
  set percentage($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPercentage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPercentage() => clearField(3);
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
    if (calibreId != null) {
      result.calibreId = calibreId;
    }
    if (articleId != null) {
      result.articleId = articleId;
    }
    if (id != null) {
      result.id = id;
    }
    if (status != null) {
      result.status = status;
    }
    if (proxyCalibreId != null) {
      result.proxyCalibreId = proxyCalibreId;
    }
    if (proxyArticleId != null) {
      result.proxyArticleId = proxyArticleId;
    }
    if (minimumUnitPerBasket != null) {
      result.minimumUnitPerBasket = minimumUnitPerBasket;
    }
    if (articleWeight != null) {
      result.articleWeight = articleWeight;
    }
    if (price != null) {
      result.price = price;
    }
    if (cost != null) {
      result.cost = cost;
    }
    return result;
  }
  ProxyArticleWorthPb._() : super();
  factory ProxyArticleWorthPb.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProxyArticleWorthPb.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProxyArticleWorthPb', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'calibreId', $pb.PbFieldType.O3, protoName: 'calibreId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'articleId', $pb.PbFieldType.O3, protoName: 'articleId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOB(4, _omitFieldNames ? '' : 'status')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'proxyCalibreId', $pb.PbFieldType.O3, protoName: 'proxyCalibreId')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'proxyArticleId', $pb.PbFieldType.O3, protoName: 'proxyArticleId')
    ..a<$core.double>(7, _omitFieldNames ? '' : 'minimumUnitPerBasket', $pb.PbFieldType.OD, protoName: 'minimumUnitPerBasket')
    ..a<$core.double>(8, _omitFieldNames ? '' : 'articleWeight', $pb.PbFieldType.OD, protoName: 'articleWeight')
    ..a<$core.double>(9, _omitFieldNames ? '' : 'price', $pb.PbFieldType.OD)
    ..a<$core.double>(10, _omitFieldNames ? '' : 'cost', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProxyArticleWorthPb clone() => ProxyArticleWorthPb()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProxyArticleWorthPb copyWith(void Function(ProxyArticleWorthPb) updates) => super.copyWith((message) => updates(message as ProxyArticleWorthPb)) as ProxyArticleWorthPb;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProxyArticleWorthPb create() => ProxyArticleWorthPb._();
  ProxyArticleWorthPb createEmptyInstance() => create();
  static $pb.PbList<ProxyArticleWorthPb> createRepeated() => $pb.PbList<ProxyArticleWorthPb>();
  @$core.pragma('dart2js:noInline')
  static ProxyArticleWorthPb getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProxyArticleWorthPb>(create);
  static ProxyArticleWorthPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get calibreId => $_getIZ(0);
  @$pb.TagNumber(1)
  set calibreId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCalibreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalibreId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get articleId => $_getIZ(1);
  @$pb.TagNumber(2)
  set articleId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasArticleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearArticleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get id => $_getIZ(2);
  @$pb.TagNumber(3)
  set id($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get status => $_getBF(3);
  @$pb.TagNumber(4)
  set status($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get proxyCalibreId => $_getIZ(4);
  @$pb.TagNumber(5)
  set proxyCalibreId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasProxyCalibreId() => $_has(4);
  @$pb.TagNumber(5)
  void clearProxyCalibreId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get proxyArticleId => $_getIZ(5);
  @$pb.TagNumber(6)
  set proxyArticleId($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasProxyArticleId() => $_has(5);
  @$pb.TagNumber(6)
  void clearProxyArticleId() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get minimumUnitPerBasket => $_getN(6);
  @$pb.TagNumber(7)
  set minimumUnitPerBasket($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMinimumUnitPerBasket() => $_has(6);
  @$pb.TagNumber(7)
  void clearMinimumUnitPerBasket() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get articleWeight => $_getN(7);
  @$pb.TagNumber(8)
  set articleWeight($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasArticleWeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearArticleWeight() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get price => $_getN(8);
  @$pb.TagNumber(9)
  set price($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPrice() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrice() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get cost => $_getN(9);
  @$pb.TagNumber(10)
  set cost($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCost() => $_has(9);
  @$pb.TagNumber(10)
  void clearCost() => clearField(10);
}

class ItemCartPb extends $pb.GeneratedMessage {
  factory ItemCartPb({
    $3.ArticleRetailOnTicketPb? articleRetail,
    $3.ArticleBasketOnTicketPb? articleBasket,
    $3.ArticleUncountableOnTicketPb? articleUncountable,
    $core.double? quantity,
    $core.Iterable<ProxyArticleWorthPb>? proxiesWorth,
    $core.double? inventoryAbsoluteQt,
  }) {
    final result = create();
    if (articleRetail != null) {
      result.articleRetail = articleRetail;
    }
    if (articleBasket != null) {
      result.articleBasket = articleBasket;
    }
    if (articleUncountable != null) {
      result.articleUncountable = articleUncountable;
    }
    if (quantity != null) {
      result.quantity = quantity;
    }
    if (proxiesWorth != null) {
      result.proxiesWorth.addAll(proxiesWorth);
    }
    if (inventoryAbsoluteQt != null) {
      result.inventoryAbsoluteQt = inventoryAbsoluteQt;
    }
    return result;
  }
  ItemCartPb._() : super();
  factory ItemCartPb.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ItemCartPb.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ItemCartPb', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket'), createEmptyInstance: create)
    ..aOM<$3.ArticleRetailOnTicketPb>(1, _omitFieldNames ? '' : 'articleRetail', protoName: 'articleRetail', subBuilder: $3.ArticleRetailOnTicketPb.create)
    ..aOM<$3.ArticleBasketOnTicketPb>(2, _omitFieldNames ? '' : 'articleBasket', protoName: 'articleBasket', subBuilder: $3.ArticleBasketOnTicketPb.create)
    ..aOM<$3.ArticleUncountableOnTicketPb>(3, _omitFieldNames ? '' : 'articleUncountable', protoName: 'articleUncountable', subBuilder: $3.ArticleUncountableOnTicketPb.create)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.OD)
    ..pc<ProxyArticleWorthPb>(5, _omitFieldNames ? '' : 'proxiesWorth', $pb.PbFieldType.PM, subBuilder: ProxyArticleWorthPb.create)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'inventoryAbsoluteQt', $pb.PbFieldType.OD, protoName: 'inventoryAbsoluteQt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ItemCartPb clone() => ItemCartPb()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ItemCartPb copyWith(void Function(ItemCartPb) updates) => super.copyWith((message) => updates(message as ItemCartPb)) as ItemCartPb;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ItemCartPb create() => ItemCartPb._();
  ItemCartPb createEmptyInstance() => create();
  static $pb.PbList<ItemCartPb> createRepeated() => $pb.PbList<ItemCartPb>();
  @$core.pragma('dart2js:noInline')
  static ItemCartPb getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ItemCartPb>(create);
  static ItemCartPb? _defaultInstance;

  @$pb.TagNumber(1)
  $3.ArticleRetailOnTicketPb get articleRetail => $_getN(0);
  @$pb.TagNumber(1)
  set articleRetail($3.ArticleRetailOnTicketPb v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasArticleRetail() => $_has(0);
  @$pb.TagNumber(1)
  void clearArticleRetail() => clearField(1);
  @$pb.TagNumber(1)
  $3.ArticleRetailOnTicketPb ensureArticleRetail() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.ArticleBasketOnTicketPb get articleBasket => $_getN(1);
  @$pb.TagNumber(2)
  set articleBasket($3.ArticleBasketOnTicketPb v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasArticleBasket() => $_has(1);
  @$pb.TagNumber(2)
  void clearArticleBasket() => clearField(2);
  @$pb.TagNumber(2)
  $3.ArticleBasketOnTicketPb ensureArticleBasket() => $_ensure(1);

  @$pb.TagNumber(3)
  $3.ArticleUncountableOnTicketPb get articleUncountable => $_getN(2);
  @$pb.TagNumber(3)
  set articleUncountable($3.ArticleUncountableOnTicketPb v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasArticleUncountable() => $_has(2);
  @$pb.TagNumber(3)
  void clearArticleUncountable() => clearField(3);
  @$pb.TagNumber(3)
  $3.ArticleUncountableOnTicketPb ensureArticleUncountable() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.double get quantity => $_getN(3);
  @$pb.TagNumber(4)
  set quantity($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasQuantity() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuantity() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<ProxyArticleWorthPb> get proxiesWorth => $_getList(4);

  @$pb.TagNumber(6)
  $core.double get inventoryAbsoluteQt => $_getN(5);
  @$pb.TagNumber(6)
  set inventoryAbsoluteQt($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasInventoryAbsoluteQt() => $_has(5);
  @$pb.TagNumber(6)
  void clearInventoryAbsoluteQt() => clearField(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
