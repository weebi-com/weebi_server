//
//  Generated code. Do not modify.
//  source: contact_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common/address.pb.dart' as $20;
import 'common/phone.pb.dart' as $19;
import 'contact.pb.dart' as $5;

class FindContactRequest extends $pb.GeneratedMessage {
  factory FindContactRequest({
    $core.String? firmOid,
    $core.String? contactChainOid,
    $core.String? contactUserOid,
    $core.int? contactNonUniqueId,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? mail,
    $19.Phone? phone,
    $20.Address? address,
  }) {
    final $result = create();
    if (firmOid != null) {
      $result.firmOid = firmOid;
    }
    if (contactChainOid != null) {
      $result.contactChainOid = contactChainOid;
    }
    if (contactUserOid != null) {
      $result.contactUserOid = contactUserOid;
    }
    if (contactNonUniqueId != null) {
      $result.contactNonUniqueId = contactNonUniqueId;
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
    return $result;
  }
  FindContactRequest._() : super();
  factory FindContactRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindContactRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindContactRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmOid', protoName: 'firmOid')
    ..aOS(2, _omitFieldNames ? '' : 'contactChainOid', protoName: 'contactChainOid')
    ..aOS(3, _omitFieldNames ? '' : 'contactUserOid', protoName: 'contactUserOid')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'contactNonUniqueId', $pb.PbFieldType.O3, protoName: 'contactNonUniqueId')
    ..aOS(5, _omitFieldNames ? '' : 'firstName', protoName: 'firstName')
    ..aOS(6, _omitFieldNames ? '' : 'lastName', protoName: 'lastName')
    ..aOS(7, _omitFieldNames ? '' : 'mail')
    ..aOM<$19.Phone>(8, _omitFieldNames ? '' : 'phone', subBuilder: $19.Phone.create)
    ..aOM<$20.Address>(9, _omitFieldNames ? '' : 'addressFull', protoName: 'address', subBuilder: $20.Address.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindContactRequest clone() => FindContactRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindContactRequest copyWith(void Function(FindContactRequest) updates) => super.copyWith((message) => updates(message as FindContactRequest)) as FindContactRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindContactRequest create() => FindContactRequest._();
  FindContactRequest createEmptyInstance() => create();
  static $pb.PbList<FindContactRequest> createRepeated() => $pb.PbList<FindContactRequest>();
  @$core.pragma('dart2js:noInline')
  static FindContactRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindContactRequest>(create);
  static FindContactRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmOid => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmOid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmOid() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmOid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get contactChainOid => $_getSZ(1);
  @$pb.TagNumber(2)
  set contactChainOid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContactChainOid() => $_has(1);
  @$pb.TagNumber(2)
  void clearContactChainOid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get contactUserOid => $_getSZ(2);
  @$pb.TagNumber(3)
  set contactUserOid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContactUserOid() => $_has(2);
  @$pb.TagNumber(3)
  void clearContactUserOid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get contactNonUniqueId => $_getIZ(3);
  @$pb.TagNumber(4)
  set contactNonUniqueId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContactNonUniqueId() => $_has(3);
  @$pb.TagNumber(4)
  void clearContactNonUniqueId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get firstName => $_getSZ(4);
  @$pb.TagNumber(5)
  set firstName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFirstName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirstName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get lastName => $_getSZ(5);
  @$pb.TagNumber(6)
  set lastName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastName() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get mail => $_getSZ(6);
  @$pb.TagNumber(7)
  set mail($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMail() => $_has(6);
  @$pb.TagNumber(7)
  void clearMail() => clearField(7);

  @$pb.TagNumber(8)
  $19.Phone get phone => $_getN(7);
  @$pb.TagNumber(8)
  set phone($19.Phone v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPhone() => $_has(7);
  @$pb.TagNumber(8)
  void clearPhone() => clearField(8);
  @$pb.TagNumber(8)
  $19.Phone ensurePhone() => $_ensure(7);

  @$pb.TagNumber(9)
  $20.Address get address => $_getN(8);
  @$pb.TagNumber(9)
  set address($20.Address v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasAddress() => $_has(8);
  @$pb.TagNumber(9)
  void clearAddress() => clearField(9);
  @$pb.TagNumber(9)
  $20.Address ensureAddress() => $_ensure(8);
}

class ReadAllContactsRequest extends $pb.GeneratedMessage {
  factory ReadAllContactsRequest({
    $core.String? firmOid,
    $core.String? chainOid,
  }) {
    final $result = create();
    if (firmOid != null) {
      $result.firmOid = firmOid;
    }
    if (chainOid != null) {
      $result.chainOid = chainOid;
    }
    return $result;
  }
  ReadAllContactsRequest._() : super();
  factory ReadAllContactsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadAllContactsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadAllContactsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmOid', protoName: 'firmOid')
    ..aOS(2, _omitFieldNames ? '' : 'chainOid', protoName: 'chainOid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadAllContactsRequest clone() => ReadAllContactsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadAllContactsRequest copyWith(void Function(ReadAllContactsRequest) updates) => super.copyWith((message) => updates(message as ReadAllContactsRequest)) as ReadAllContactsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadAllContactsRequest create() => ReadAllContactsRequest._();
  ReadAllContactsRequest createEmptyInstance() => create();
  static $pb.PbList<ReadAllContactsRequest> createRepeated() => $pb.PbList<ReadAllContactsRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadAllContactsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadAllContactsRequest>(create);
  static ReadAllContactsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firmOid => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmOid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmOid() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmOid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainOid => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainOid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChainOid() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainOid() => clearField(2);
}

class ContactRequest extends $pb.GeneratedMessage {
  factory ContactRequest({
    $core.String? chainOid,
    $5.ContactPb? contact,
  }) {
    final $result = create();
    if (chainOid != null) {
      $result.chainOid = chainOid;
    }
    if (contact != null) {
      $result.contact = contact;
    }
    return $result;
  }
  ContactRequest._() : super();
  factory ContactRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainOid', protoName: 'chainOid')
    ..aOM<$5.ContactPb>(2, _omitFieldNames ? '' : 'contact', subBuilder: $5.ContactPb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactRequest clone() => ContactRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactRequest copyWith(void Function(ContactRequest) updates) => super.copyWith((message) => updates(message as ContactRequest)) as ContactRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContactRequest create() => ContactRequest._();
  ContactRequest createEmptyInstance() => create();
  static $pb.PbList<ContactRequest> createRepeated() => $pb.PbList<ContactRequest>();
  @$core.pragma('dart2js:noInline')
  static ContactRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactRequest>(create);
  static ContactRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainOid => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainOid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainOid() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainOid() => clearField(1);

  @$pb.TagNumber(2)
  $5.ContactPb get contact => $_getN(1);
  @$pb.TagNumber(2)
  set contact($5.ContactPb v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContact() => $_has(1);
  @$pb.TagNumber(2)
  void clearContact() => clearField(2);
  @$pb.TagNumber(2)
  $5.ContactPb ensureContact() => $_ensure(1);
}

class ContactsResponse extends $pb.GeneratedMessage {
  factory ContactsResponse({
    $core.Iterable<$5.ContactPb>? contacts,
  }) {
    final $result = create();
    if (contacts != null) {
      $result.contacts.addAll(contacts);
    }
    return $result;
  }
  ContactsResponse._() : super();
  factory ContactsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact.service'), createEmptyInstance: create)
    ..pc<$5.ContactPb>(1, _omitFieldNames ? '' : 'contacts', $pb.PbFieldType.PM, subBuilder: $5.ContactPb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactsResponse clone() => ContactsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactsResponse copyWith(void Function(ContactsResponse) updates) => super.copyWith((message) => updates(message as ContactsResponse)) as ContactsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContactsResponse create() => ContactsResponse._();
  ContactsResponse createEmptyInstance() => create();
  static $pb.PbList<ContactsResponse> createRepeated() => $pb.PbList<ContactsResponse>();
  @$core.pragma('dart2js:noInline')
  static ContactsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactsResponse>(create);
  static ContactsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$5.ContactPb> get contacts => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
