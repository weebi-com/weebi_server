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

import 'package:protobuf/protobuf.dart' as $pb;

import '../common/address.pb.dart' as $20;
import '../common/phone.pb.dart' as $19;

/// / contactNonUniqueId is to be combined with userId
/// / local ids can lead to duplicates as each sellers from its own device can create contact
class ContactMongo extends $pb.GeneratedMessage {
  factory ContactMongo({
    ContactPb? contact,
    $core.int? contactNonUniqueId,
    $core.String? userId,
    $core.String? firmId,
    $core.String? chainId,
  }) {
    final $result = create();
    if (contact != null) {
      $result.contact = contact;
    }
    if (contactNonUniqueId != null) {
      $result.contactNonUniqueId = contactNonUniqueId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (chainId != null) {
      $result.chainId = chainId;
    }
    return $result;
  }
  ContactMongo._() : super();
  factory ContactMongo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactMongo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactMongo', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact'), createEmptyInstance: create)
    ..aOM<ContactPb>(1, _omitFieldNames ? '' : 'contact', subBuilder: ContactPb.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'contactNonUniqueId', $pb.PbFieldType.O3, protoName: 'contactNonUniqueId')
    ..aOS(3, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(5, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
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
  $core.int get contactNonUniqueId => $_getIZ(1);
  @$pb.TagNumber(2)
  set contactNonUniqueId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContactNonUniqueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearContactNonUniqueId() => clearField(2);

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
}

class ContactPb extends $pb.GeneratedMessage {
  factory ContactPb({
    $core.int? contactNonUniqueId,
    $core.String? dateCreation,
    $core.String? dateUpdate,
    $core.String? dateStatus,
    $core.bool? status,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? mail,
    $19.Phone? phone,
    $20.Address? address,
    $core.int? overdraft,
    $core.Iterable<$core.String>? tags,
    $core.Map<$core.String, $core.String>? othersAttributes,
  }) {
    final $result = create();
    if (contactNonUniqueId != null) {
      $result.contactNonUniqueId = contactNonUniqueId;
    }
    if (dateCreation != null) {
      $result.dateCreation = dateCreation;
    }
    if (dateUpdate != null) {
      $result.dateUpdate = dateUpdate;
    }
    if (dateStatus != null) {
      $result.dateStatus = dateStatus;
    }
    if (status != null) {
      $result.status = status;
    }
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (mail != null) {
      $result.mail = mail;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (address != null) {
      $result.address = address;
    }
    if (overdraft != null) {
      $result.overdraft = overdraft;
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    if (othersAttributes != null) {
      $result.othersAttributes.addAll(othersAttributes);
    }
    return $result;
  }
  ContactPb._() : super();
  factory ContactPb.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactPb.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactPb', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3, protoName: 'contactNonUniqueId')
    ..aOS(2, _omitFieldNames ? '' : 'creationDate', protoName: 'dateCreation')
    ..aOS(3, _omitFieldNames ? '' : 'updateDate', protoName: 'dateUpdate')
    ..aOS(4, _omitFieldNames ? '' : 'statusUpdateDate', protoName: 'dateStatus')
    ..aOB(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'firstName', protoName: 'firstName')
    ..aOS(7, _omitFieldNames ? '' : 'lastName', protoName: 'lastName')
    ..aOS(8, _omitFieldNames ? '' : 'mail')
    ..aOM<$19.Phone>(9, _omitFieldNames ? '' : 'phone', subBuilder: $19.Phone.create)
    ..aOM<$20.Address>(10, _omitFieldNames ? '' : 'addressFull', protoName: 'address', subBuilder: $20.Address.create)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'overdraft', $pb.PbFieldType.O3)
    ..pPS(12, _omitFieldNames ? '' : 'categories', protoName: 'tags')
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
  $core.int get contactNonUniqueId => $_getIZ(0);
  @$pb.TagNumber(1)
  set contactNonUniqueId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContactNonUniqueId() => $_has(0);
  @$pb.TagNumber(1)
  void clearContactNonUniqueId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get dateCreation => $_getSZ(1);
  @$pb.TagNumber(2)
  set dateCreation($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDateCreation() => $_has(1);
  @$pb.TagNumber(2)
  void clearDateCreation() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get dateUpdate => $_getSZ(2);
  @$pb.TagNumber(3)
  set dateUpdate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDateUpdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDateUpdate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get dateStatus => $_getSZ(3);
  @$pb.TagNumber(4)
  set dateStatus($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDateStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearDateStatus() => clearField(4);

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
  $20.Address get address => $_getN(9);
  @$pb.TagNumber(10)
  set address($20.Address v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAddress() => $_has(9);
  @$pb.TagNumber(10)
  void clearAddress() => clearField(10);
  @$pb.TagNumber(10)
  $20.Address ensureAddress() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.int get overdraft => $_getIZ(10);
  @$pb.TagNumber(11)
  set overdraft($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasOverdraft() => $_has(10);
  @$pb.TagNumber(11)
  void clearOverdraft() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.String> get tags => $_getList(11);

  @$pb.TagNumber(99)
  $core.Map<$core.String, $core.String> get othersAttributes => $_getMap(12);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
