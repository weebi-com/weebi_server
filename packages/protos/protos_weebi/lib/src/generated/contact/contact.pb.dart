//
//  Generated code. Do not modify.
//  source: contact/contact.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../common/address.pb.dart' as $20;
import '../common/g_timestamp.pb.dart' as $18;
import '../common/phone.pb.dart' as $19;

/// / contactId is unique
class ContactMongo extends $pb.GeneratedMessage {
  factory ContactMongo({
    ContactPb? contact,
    $core.int? contactId,
    $core.String? userId,
    $core.String? firmId,
    $core.String? chainId,
    $core.String? creationDate,
    $18.Timestamp? lastTouchTimestampUTC,
    $core.Map<$core.String, $core.String>? additionalAttributes,
  }) {
    final result = create();
    if (contact != null) {
      result.contact = contact;
    }
    if (contactId != null) {
      result.contactId = contactId;
    }
    if (userId != null) {
      result.userId = userId;
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
    if (additionalAttributes != null) {
      result.additionalAttributes.addAll(additionalAttributes);
    }
    return result;
  }
  ContactMongo._() : super();
  factory ContactMongo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactMongo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactMongo', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact'), createEmptyInstance: create)
    ..aOM<ContactPb>(1, _omitFieldNames ? '' : 'contact', subBuilder: ContactPb.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'contactId', $pb.PbFieldType.O3, protoName: 'contactId')
    ..aOS(3, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(5, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(6, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOM<$18.Timestamp>(7, _omitFieldNames ? '' : 'lastTouchTimestampUTC', protoName: 'lastTouchTimestampUTC', subBuilder: $18.Timestamp.create)
    ..m<$core.String, $core.String>(99, _omitFieldNames ? '' : 'additional_attributes', entryClassName: 'ContactMongo.AdditionalAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('weebi.contact'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactMongo clone() => ContactMongo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactMongo copyWith(void Function(ContactMongo) updates) => super.copyWith((message) => updates(message as ContactMongo)) as ContactMongo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContactMongo create() => ContactMongo._();
  ContactMongo createEmptyInstance() => create();
  static $pb.PbList<ContactMongo> createRepeated() => $pb.PbList<ContactMongo>();
  @$core.pragma('dart2js:noInline')
  static ContactMongo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactMongo>(create);
  static ContactMongo? _defaultInstance;

  @$pb.TagNumber(1)
  ContactPb get contact => $_getN(0);
  @$pb.TagNumber(1)
  set contact(ContactPb v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContact() => $_has(0);
  @$pb.TagNumber(1)
  void clearContact() => clearField(1);
  @$pb.TagNumber(1)
  ContactPb ensureContact() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get contactId => $_getIZ(1);
  @$pb.TagNumber(2)
  set contactId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContactId() => $_has(1);
  @$pb.TagNumber(2)
  void clearContactId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get firmId => $_getSZ(3);
  @$pb.TagNumber(4)
  set firmId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirmId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirmId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get chainId => $_getSZ(4);
  @$pb.TagNumber(5)
  set chainId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChainId() => $_has(4);
  @$pb.TagNumber(5)
  void clearChainId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get creationDate => $_getSZ(5);
  @$pb.TagNumber(6)
  set creationDate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreationDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreationDate() => clearField(6);

  @$pb.TagNumber(7)
  $18.Timestamp get lastTouchTimestampUTC => $_getN(6);
  @$pb.TagNumber(7)
  set lastTouchTimestampUTC($18.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastTouchTimestampUTC() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastTouchTimestampUTC() => clearField(7);
  @$pb.TagNumber(7)
  $18.Timestamp ensureLastTouchTimestampUTC() => $_ensure(6);

  @$pb.TagNumber(99)
  $core.Map<$core.String, $core.String> get additionalAttributes => $_getMap(7);
}

class ContactPb extends $pb.GeneratedMessage {
  factory ContactPb({
    $core.int? id,
    $core.String? creationDate,
    $core.String? updateDate,
    $core.String? statusUpdateDate,
    $core.bool? status,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? mail,
    $19.Phone? phone,
    $20.Address? addressFull,
    $fixnum.Int64? overdraft,
    $core.Iterable<$core.String>? tags,
    $core.bool? isClient,
    $core.bool? isSupplier,
    $core.Map<$core.String, $core.String>? othersAttributes,
  }) {
    final result = create();
    if (id != null) {
      result.id = id;
    }
    if (creationDate != null) {
      result.creationDate = creationDate;
    }
    if (updateDate != null) {
      result.updateDate = updateDate;
    }
    if (statusUpdateDate != null) {
      result.statusUpdateDate = statusUpdateDate;
    }
    if (status != null) {
      result.status = status;
    }
    if (firstName != null) {
      result.firstName = firstName;
    }
    if (lastName != null) {
      result.lastName = lastName;
    }
    if (mail != null) {
      result.mail = mail;
    }
    if (phone != null) {
      result.phone = phone;
    }
    if (addressFull != null) {
      result.addressFull = addressFull;
    }
    if (overdraft != null) {
      result.overdraft = overdraft;
    }
    if (tags != null) {
      result.tags.addAll(tags);
    }
    if (isClient != null) {
      result.isClient = isClient;
    }
    if (isSupplier != null) {
      result.isSupplier = isSupplier;
    }
    if (othersAttributes != null) {
      result.othersAttributes.addAll(othersAttributes);
    }
    return result;
  }
  ContactPb._() : super();
  factory ContactPb.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactPb.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactPb', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(3, _omitFieldNames ? '' : 'updateDate', protoName: 'updateDate')
    ..aOS(4, _omitFieldNames ? '' : 'statusUpdateDate', protoName: 'statusUpdateDate')
    ..aOB(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'firstName', protoName: 'firstName')
    ..aOS(7, _omitFieldNames ? '' : 'lastName', protoName: 'lastName')
    ..aOS(8, _omitFieldNames ? '' : 'mail')
    ..aOM<$19.Phone>(9, _omitFieldNames ? '' : 'phone', subBuilder: $19.Phone.create)
    ..aOM<$20.Address>(10, _omitFieldNames ? '' : 'addressFull', protoName: 'addressFull', subBuilder: $20.Address.create)
    ..aInt64(11, _omitFieldNames ? '' : 'overdraft')
    ..pPS(12, _omitFieldNames ? '' : 'categories', protoName: 'tags')
    ..aOB(13, _omitFieldNames ? '' : 'isClient', protoName: 'isClient')
    ..aOB(14, _omitFieldNames ? '' : 'isSupplier', protoName: 'isSupplier')
    ..m<$core.String, $core.String>(99, _omitFieldNames ? '' : 'othersAttributes', protoName: 'othersAttributes', entryClassName: 'ContactPb.OthersAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('weebi.contact'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactPb clone() => ContactPb()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactPb copyWith(void Function(ContactPb) updates) => super.copyWith((message) => updates(message as ContactPb)) as ContactPb;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContactPb create() => ContactPb._();
  ContactPb createEmptyInstance() => create();
  static $pb.PbList<ContactPb> createRepeated() => $pb.PbList<ContactPb>();
  @$core.pragma('dart2js:noInline')
  static ContactPb getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactPb>(create);
  static ContactPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get creationDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set creationDate($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreationDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreationDate() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get updateDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set updateDate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdateDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateDate() => clearField(3);

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
  $core.String get firstName => $_getSZ(5);
  @$pb.TagNumber(6)
  set firstName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFirstName() => $_has(5);
  @$pb.TagNumber(6)
  void clearFirstName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get lastName => $_getSZ(6);
  @$pb.TagNumber(7)
  set lastName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastName() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get mail => $_getSZ(7);
  @$pb.TagNumber(8)
  set mail($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMail() => $_has(7);
  @$pb.TagNumber(8)
  void clearMail() => clearField(8);

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
  $20.Address get addressFull => $_getN(9);
  @$pb.TagNumber(10)
  set addressFull($20.Address v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAddressFull() => $_has(9);
  @$pb.TagNumber(10)
  void clearAddressFull() => clearField(10);
  @$pb.TagNumber(10)
  $20.Address ensureAddressFull() => $_ensure(9);

  /// legacy intt32 might be an issue
  @$pb.TagNumber(11)
  $fixnum.Int64 get overdraft => $_getI64(10);
  @$pb.TagNumber(11)
  set overdraft($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasOverdraft() => $_has(10);
  @$pb.TagNumber(11)
  void clearOverdraft() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.String> get tags => $_getList(11);

  @$pb.TagNumber(13)
  $core.bool get isClient => $_getBF(12);
  @$pb.TagNumber(13)
  set isClient($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIsClient() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsClient() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get isSupplier => $_getBF(13);
  @$pb.TagNumber(14)
  set isSupplier($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasIsSupplier() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsSupplier() => clearField(14);

  @$pb.TagNumber(99)
  $core.Map<$core.String, $core.String> get othersAttributes => $_getMap(14);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
