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

import 'common/address.pb.dart' as $19;
import 'common/phone.pb.dart' as $18;
import 'contact.pb.dart' as $5;

class FindContactRequest extends $pb.GeneratedMessage {
  factory FindContactRequest({
    $core.String? contactchainId,
    $core.String? contactuserId,
    $core.int? contactNonUniqueId,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? mail,
    $18.Phone? phone,
    $19.Address? address,
  }) {
    final $result = create();
    if (contactchainId != null) {
      $result.contactchainId = contactchainId;
    }
    if (contactuserId != null) {
      $result.contactuserId = contactuserId;
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
    ..aOS(1, _omitFieldNames ? '' : 'contactchainId', protoName: 'contactchainId')
    ..aOS(2, _omitFieldNames ? '' : 'contactuserId', protoName: 'contactuserId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'contactNonUniqueId', $pb.PbFieldType.O3, protoName: 'contactNonUniqueId')
    ..aOS(4, _omitFieldNames ? '' : 'firstName', protoName: 'firstName')
    ..aOS(5, _omitFieldNames ? '' : 'lastName', protoName: 'lastName')
    ..aOS(6, _omitFieldNames ? '' : 'mail')
    ..aOM<$18.Phone>(7, _omitFieldNames ? '' : 'phone', subBuilder: $18.Phone.create)
    ..aOM<$19.Address>(8, _omitFieldNames ? '' : 'addressFull', protoName: 'address', subBuilder: $19.Address.create)
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

  /// string firmId = 1 [json_name = 'firmId']; // deduced from bearer token
  @$pb.TagNumber(1)
  $core.String get contactchainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set contactchainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContactchainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearContactchainId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get contactuserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set contactuserId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContactuserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearContactuserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get contactNonUniqueId => $_getIZ(2);
  @$pb.TagNumber(3)
  set contactNonUniqueId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContactNonUniqueId() => $_has(2);
  @$pb.TagNumber(3)
  void clearContactNonUniqueId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get firstName => $_getSZ(3);
  @$pb.TagNumber(4)
  set firstName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirstName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirstName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get lastName => $_getSZ(4);
  @$pb.TagNumber(5)
  set lastName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastName() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get mail => $_getSZ(5);
  @$pb.TagNumber(6)
  set mail($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMail() => $_has(5);
  @$pb.TagNumber(6)
  void clearMail() => clearField(6);

  @$pb.TagNumber(7)
  $18.Phone get phone => $_getN(6);
  @$pb.TagNumber(7)
  set phone($18.Phone v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasPhone() => $_has(6);
  @$pb.TagNumber(7)
  void clearPhone() => clearField(7);
  @$pb.TagNumber(7)
  $18.Phone ensurePhone() => $_ensure(6);

  @$pb.TagNumber(8)
  $19.Address get address => $_getN(7);
  @$pb.TagNumber(8)
  set address($19.Address v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAddress() => $_has(7);
  @$pb.TagNumber(8)
  void clearAddress() => clearField(8);
  @$pb.TagNumber(8)
  $19.Address ensureAddress() => $_ensure(7);
}

class ReadAllContactsRequest extends $pb.GeneratedMessage {
  factory ReadAllContactsRequest({
    $core.String? firmId,
    $core.String? chainId,
  }) {
    final $result = create();
    if (firmId != null) {
      $result.firmId = firmId;
    }
    if (chainId != null) {
      $result.chainId = chainId;
    }
    return $result;
  }
  ReadAllContactsRequest._() : super();
  factory ReadAllContactsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadAllContactsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadAllContactsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(2, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
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
  $core.String get firmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set firmId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirmId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get chainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainId() => clearField(2);
}

class ContactRequest extends $pb.GeneratedMessage {
  factory ContactRequest({
    $core.String? chainId,
    $core.String? contactuserId,
    $5.ContactPb? contact,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (contactuserId != null) {
      $result.contactuserId = contactuserId;
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
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'contactuserId', protoName: 'contactuserId')
    ..aOM<$5.ContactPb>(3, _omitFieldNames ? '' : 'contact', subBuilder: $5.ContactPb.create)
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
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get contactuserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set contactuserId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContactuserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearContactuserId() => clearField(2);

  @$pb.TagNumber(3)
  $5.ContactPb get contact => $_getN(2);
  @$pb.TagNumber(3)
  set contact($5.ContactPb v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasContact() => $_has(2);
  @$pb.TagNumber(3)
  void clearContact() => clearField(3);
  @$pb.TagNumber(3)
  $5.ContactPb ensureContact() => $_ensure(2);
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
