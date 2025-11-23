//
//  Generated code. Do not modify.
//  source: contact/contact_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../common/address.pb.dart' as $20;
import '../common/g_timestamp.pb.dart' as $18;
import '../common/phone.pb.dart' as $19;
import 'contact.pb.dart' as $7;

class ReadContactRequest extends $pb.GeneratedMessage {
  factory ReadContactRequest({
    $core.String? contactChainId,
    $core.int? contactId,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? mail,
    $19.Phone? phone,
    $20.Address? address,
  }) {
    final result = create();
    if (contactChainId != null) {
      result.contactChainId = contactChainId;
    }
    if (contactId != null) {
      result.contactId = contactId;
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
    if (address != null) {
      result.address = address;
    }
    return result;
  }
  ReadContactRequest._() : super();
  factory ReadContactRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadContactRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadContactRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'contactChainId', protoName: 'contactChainId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'contactId', $pb.PbFieldType.O3, protoName: 'contactId')
    ..aOS(4, _omitFieldNames ? '' : 'firstName', protoName: 'firstName')
    ..aOS(5, _omitFieldNames ? '' : 'lastName', protoName: 'lastName')
    ..aOS(6, _omitFieldNames ? '' : 'mail')
    ..aOM<$19.Phone>(7, _omitFieldNames ? '' : 'phone', subBuilder: $19.Phone.create)
    ..aOM<$20.Address>(8, _omitFieldNames ? '' : 'addressFull', protoName: 'address', subBuilder: $20.Address.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadContactRequest clone() => ReadContactRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadContactRequest copyWith(void Function(ReadContactRequest) updates) => super.copyWith((message) => updates(message as ReadContactRequest)) as ReadContactRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadContactRequest create() => ReadContactRequest._();
  ReadContactRequest createEmptyInstance() => create();
  static $pb.PbList<ReadContactRequest> createRepeated() => $pb.PbList<ReadContactRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadContactRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadContactRequest>(create);
  static ReadContactRequest? _defaultInstance;

  /// string firmId = 1 [json_name = 'firmId']; // deduced from bearer token
  @$pb.TagNumber(1)
  $core.String get contactChainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set contactChainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContactChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearContactChainId() => clearField(1);

  @$pb.TagNumber(3)
  $core.int get contactId => $_getIZ(1);
  @$pb.TagNumber(3)
  set contactId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasContactId() => $_has(1);
  @$pb.TagNumber(3)
  void clearContactId() => clearField(3);

  /// optional
  @$pb.TagNumber(4)
  $core.String get firstName => $_getSZ(2);
  @$pb.TagNumber(4)
  set firstName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirstName() => $_has(2);
  @$pb.TagNumber(4)
  void clearFirstName() => clearField(4);

  /// optional
  @$pb.TagNumber(5)
  $core.String get lastName => $_getSZ(3);
  @$pb.TagNumber(5)
  set lastName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastName() => $_has(3);
  @$pb.TagNumber(5)
  void clearLastName() => clearField(5);

  /// optional
  @$pb.TagNumber(6)
  $core.String get mail => $_getSZ(4);
  @$pb.TagNumber(6)
  set mail($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasMail() => $_has(4);
  @$pb.TagNumber(6)
  void clearMail() => clearField(6);

  /// optional
  @$pb.TagNumber(7)
  $19.Phone get phone => $_getN(5);
  @$pb.TagNumber(7)
  set phone($19.Phone v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasPhone() => $_has(5);
  @$pb.TagNumber(7)
  void clearPhone() => clearField(7);
  @$pb.TagNumber(7)
  $19.Phone ensurePhone() => $_ensure(5);

  /// optional
  @$pb.TagNumber(8)
  $20.Address get address => $_getN(6);
  @$pb.TagNumber(8)
  set address($20.Address v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAddress() => $_has(6);
  @$pb.TagNumber(8)
  void clearAddress() => clearField(8);
  @$pb.TagNumber(8)
  $20.Address ensureAddress() => $_ensure(6);
}

/// optional used for weebi_app device back online
class ReadAllContactsRequest extends $pb.GeneratedMessage {
  factory ReadAllContactsRequest({
    $core.String? chainId,
    $18.Timestamp? lastFetchTimestampUTC,
  }) {
    final result = create();
    if (chainId != null) {
      result.chainId = chainId;
    }
    if (lastFetchTimestampUTC != null) {
      result.lastFetchTimestampUTC = lastFetchTimestampUTC;
    }
    return result;
  }
  ReadAllContactsRequest._() : super();
  factory ReadAllContactsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadAllContactsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadAllContactsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$18.Timestamp>(2, _omitFieldNames ? '' : 'lastFetchTimestampUTC', protoName: 'lastFetchTimestampUTC', subBuilder: $18.Timestamp.create)
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
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  /// optional used for weebi_app device back online
  @$pb.TagNumber(2)
  $18.Timestamp get lastFetchTimestampUTC => $_getN(1);
  @$pb.TagNumber(2)
  set lastFetchTimestampUTC($18.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastFetchTimestampUTC() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastFetchTimestampUTC() => clearField(2);
  @$pb.TagNumber(2)
  $18.Timestamp ensureLastFetchTimestampUTC() => $_ensure(1);
}

class ContactRequest extends $pb.GeneratedMessage {
  factory ContactRequest({
    $core.String? chainId,
    $7.ContactPb? contact,
  }) {
    final result = create();
    if (chainId != null) {
      result.chainId = chainId;
    }
    if (contact != null) {
      result.contact = contact;
    }
    return result;
  }
  ContactRequest._() : super();
  factory ContactRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOM<$7.ContactPb>(2, _omitFieldNames ? '' : 'contact', subBuilder: $7.ContactPb.create)
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
  $7.ContactPb get contact => $_getN(1);
  @$pb.TagNumber(2)
  set contact($7.ContactPb v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContact() => $_has(1);
  @$pb.TagNumber(2)
  void clearContact() => clearField(2);
  @$pb.TagNumber(2)
  $7.ContactPb ensureContact() => $_ensure(1);
}

class ContactsRequest extends $pb.GeneratedMessage {
  factory ContactsRequest({
    $core.String? chainId,
    $core.Iterable<$7.ContactPb>? contacts,
  }) {
    final result = create();
    if (chainId != null) {
      result.chainId = chainId;
    }
    if (contacts != null) {
      result.contacts.addAll(contacts);
    }
    return result;
  }
  ContactsRequest._() : super();
  factory ContactsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..pc<$7.ContactPb>(2, _omitFieldNames ? '' : 'contacts', $pb.PbFieldType.PM, subBuilder: $7.ContactPb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactsRequest clone() => ContactsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactsRequest copyWith(void Function(ContactsRequest) updates) => super.copyWith((message) => updates(message as ContactsRequest)) as ContactsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContactsRequest create() => ContactsRequest._();
  ContactsRequest createEmptyInstance() => create();
  static $pb.PbList<ContactsRequest> createRepeated() => $pb.PbList<ContactsRequest>();
  @$core.pragma('dart2js:noInline')
  static ContactsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactsRequest>(create);
  static ContactsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$7.ContactPb> get contacts => $_getList(1);
}

class ContactsResponse extends $pb.GeneratedMessage {
  factory ContactsResponse({
    $core.Iterable<$7.ContactPb>? contacts,
  }) {
    final result = create();
    if (contacts != null) {
      result.contacts.addAll(contacts);
    }
    return result;
  }
  ContactsResponse._() : super();
  factory ContactsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact.service'), createEmptyInstance: create)
    ..pc<$7.ContactPb>(1, _omitFieldNames ? '' : 'contacts', $pb.PbFieldType.PM, subBuilder: $7.ContactPb.create)
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
  $core.List<$7.ContactPb> get contacts => $_getList(0);
}

class ReadContactsIdsRequest extends $pb.GeneratedMessage {
  factory ReadContactsIdsRequest({
    $core.String? chainId,
  }) {
    final result = create();
    if (chainId != null) {
      result.chainId = chainId;
    }
    return result;
  }
  ReadContactsIdsRequest._() : super();
  factory ReadContactsIdsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadContactsIdsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadContactsIdsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadContactsIdsRequest clone() => ReadContactsIdsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadContactsIdsRequest copyWith(void Function(ReadContactsIdsRequest) updates) => super.copyWith((message) => updates(message as ReadContactsIdsRequest)) as ReadContactsIdsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadContactsIdsRequest create() => ReadContactsIdsRequest._();
  ReadContactsIdsRequest createEmptyInstance() => create();
  static $pb.PbList<ReadContactsIdsRequest> createRepeated() => $pb.PbList<ReadContactsIdsRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadContactsIdsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadContactsIdsRequest>(create);
  static ReadContactsIdsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);
}

/// / include all ids so that offline device can delete objects removed by another user/device
class ContactsIdsResponse extends $pb.GeneratedMessage {
  factory ContactsIdsResponse({
    $core.Iterable<$core.int>? ids,
  }) {
    final result = create();
    if (ids != null) {
      result.ids.addAll(ids);
    }
    return result;
  }
  ContactsIdsResponse._() : super();
  factory ContactsIdsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactsIdsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactsIdsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.contact.service'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactsIdsResponse clone() => ContactsIdsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactsIdsResponse copyWith(void Function(ContactsIdsResponse) updates) => super.copyWith((message) => updates(message as ContactsIdsResponse)) as ContactsIdsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContactsIdsResponse create() => ContactsIdsResponse._();
  ContactsIdsResponse createEmptyInstance() => create();
  static $pb.PbList<ContactsIdsResponse> createRepeated() => $pb.PbList<ContactsIdsResponse>();
  @$core.pragma('dart2js:noInline')
  static ContactsIdsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactsIdsResponse>(create);
  static ContactsIdsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ids => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
