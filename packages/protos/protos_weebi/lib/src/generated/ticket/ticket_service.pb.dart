// This is a generated file - do not edit.
//
// Generated from ticket/ticket_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../common/g_timestamp.pb.dart' as $3;
import 'ticket.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ReadAllTicketsRequest extends $pb.GeneratedMessage {
  factory ReadAllTicketsRequest({
    $core.String? chainId,
    $core.String? boutiqueId,
    $3.Timestamp? lastFetchTimestampUTC,
    $core.bool? isDeleted,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (boutiqueId != null) result.boutiqueId = boutiqueId;
    if (lastFetchTimestampUTC != null)
      result.lastFetchTimestampUTC = lastFetchTimestampUTC;
    if (isDeleted != null) result.isDeleted = isDeleted;
    return result;
  }

  ReadAllTicketsRequest._();

  factory ReadAllTicketsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReadAllTicketsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadAllTicketsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.ticket.service'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(3, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..aOM<$3.Timestamp>(4, _omitFieldNames ? '' : 'lastFetchTimestampUTC',
        protoName: 'lastFetchTimestampUTC', subBuilder: $3.Timestamp.create)
    ..aOB(5, _omitFieldNames ? '' : 'isDeleted', protoName: 'isDeleted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadAllTicketsRequest clone() =>
      ReadAllTicketsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReadAllTicketsRequest copyWith(
          void Function(ReadAllTicketsRequest) updates) =>
      super.copyWith((message) => updates(message as ReadAllTicketsRequest))
          as ReadAllTicketsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadAllTicketsRequest create() => ReadAllTicketsRequest._();
  @$core.override
  ReadAllTicketsRequest createEmptyInstance() => create();
  static $pb.PbList<ReadAllTicketsRequest> createRepeated() =>
      $pb.PbList<ReadAllTicketsRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadAllTicketsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadAllTicketsRequest>(create);
  static ReadAllTicketsRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(2)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(2)
  void clearChainId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get boutiqueId => $_getSZ(1);
  @$pb.TagNumber(3)
  set boutiqueId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasBoutiqueId() => $_has(1);
  @$pb.TagNumber(3)
  void clearBoutiqueId() => $_clearField(3);

  /// optional used for weebi_app device back online
  @$pb.TagNumber(4)
  $3.Timestamp get lastFetchTimestampUTC => $_getN(2);
  @$pb.TagNumber(4)
  set lastFetchTimestampUTC($3.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasLastFetchTimestampUTC() => $_has(2);
  @$pb.TagNumber(4)
  void clearLastFetchTimestampUTC() => $_clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensureLastFetchTimestampUTC() => $_ensure(2);

  /// optional used for weebi_app device to remove deleted tickets
  @$pb.TagNumber(5)
  $core.bool get isDeleted => $_getBF(3);
  @$pb.TagNumber(5)
  set isDeleted($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(5)
  $core.bool hasIsDeleted() => $_has(3);
  @$pb.TagNumber(5)
  void clearIsDeleted() => $_clearField(5);
}

/// consider adding isDeleted param
class FindTicketRequest extends $pb.GeneratedMessage {
  factory FindTicketRequest({
    $core.String? ticketChainId,
    $core.String? ticketBoutiqueId,
    $core.String? creationDate,
    $core.String? ticketUserId,
    $core.int? nonUniqueId,
  }) {
    final result = create();
    if (ticketChainId != null) result.ticketChainId = ticketChainId;
    if (ticketBoutiqueId != null) result.ticketBoutiqueId = ticketBoutiqueId;
    if (creationDate != null) result.creationDate = creationDate;
    if (ticketUserId != null) result.ticketUserId = ticketUserId;
    if (nonUniqueId != null) result.nonUniqueId = nonUniqueId;
    return result;
  }

  FindTicketRequest._();

  factory FindTicketRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindTicketRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindTicketRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.ticket.service'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ticketChainId', protoName: 'ticketChainId')
    ..aOS(2, _omitFieldNames ? '' : 'ticketBoutiqueId',
        protoName: 'ticketBoutiqueId')
    ..aOS(3, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(4, _omitFieldNames ? '' : 'ticketUserId', protoName: 'ticketUserId')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'nonUniqueId', $pb.PbFieldType.O3,
        protoName: 'nonUniqueId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindTicketRequest clone() => FindTicketRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindTicketRequest copyWith(void Function(FindTicketRequest) updates) =>
      super.copyWith((message) => updates(message as FindTicketRequest))
          as FindTicketRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindTicketRequest create() => FindTicketRequest._();
  @$core.override
  FindTicketRequest createEmptyInstance() => create();
  static $pb.PbList<FindTicketRequest> createRepeated() =>
      $pb.PbList<FindTicketRequest>();
  @$core.pragma('dart2js:noInline')
  static FindTicketRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindTicketRequest>(create);
  static FindTicketRequest? _defaultInstance;

  /// mandatory
  @$pb.TagNumber(1)
  $core.String get ticketChainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set ticketChainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTicketChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTicketChainId() => $_clearField(1);

  /// mandatory
  @$pb.TagNumber(2)
  $core.String get ticketBoutiqueId => $_getSZ(1);
  @$pb.TagNumber(2)
  set ticketBoutiqueId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTicketBoutiqueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTicketBoutiqueId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get creationDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set creationDate($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCreationDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreationDate() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get ticketUserId => $_getSZ(3);
  @$pb.TagNumber(4)
  set ticketUserId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTicketUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearTicketUserId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get nonUniqueId => $_getIZ(4);
  @$pb.TagNumber(5)
  set nonUniqueId($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNonUniqueId() => $_has(4);
  @$pb.TagNumber(5)
  void clearNonUniqueId() => $_clearField(5);
}

class TicketRequest extends $pb.GeneratedMessage {
  factory TicketRequest({
    $1.TicketPb? ticket,
  }) {
    final result = create();
    if (ticket != null) result.ticket = ticket;
    return result;
  }

  TicketRequest._();

  factory TicketRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TicketRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TicketRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.ticket.service'),
      createEmptyInstance: create)
    ..aOM<$1.TicketPb>(1, _omitFieldNames ? '' : 'ticket',
        subBuilder: $1.TicketPb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketRequest clone() => TicketRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketRequest copyWith(void Function(TicketRequest) updates) =>
      super.copyWith((message) => updates(message as TicketRequest))
          as TicketRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketRequest create() => TicketRequest._();
  @$core.override
  TicketRequest createEmptyInstance() => create();
  static $pb.PbList<TicketRequest> createRepeated() =>
      $pb.PbList<TicketRequest>();
  @$core.pragma('dart2js:noInline')
  static TicketRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TicketRequest>(create);
  static TicketRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.TicketPb get ticket => $_getN(0);
  @$pb.TagNumber(1)
  set ticket($1.TicketPb value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTicket() => $_has(0);
  @$pb.TagNumber(1)
  void clearTicket() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.TicketPb ensureTicket() => $_ensure(0);
}

class TicketsRequest extends $pb.GeneratedMessage {
  factory TicketsRequest({
    $core.Iterable<$1.TicketPb>? tickets,
  }) {
    final result = create();
    if (tickets != null) result.tickets.addAll(tickets);
    return result;
  }

  TicketsRequest._();

  factory TicketsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TicketsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TicketsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.ticket.service'),
      createEmptyInstance: create)
    ..pc<$1.TicketPb>(1, _omitFieldNames ? '' : 'tickets', $pb.PbFieldType.PM,
        subBuilder: $1.TicketPb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketsRequest clone() => TicketsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketsRequest copyWith(void Function(TicketsRequest) updates) =>
      super.copyWith((message) => updates(message as TicketsRequest))
          as TicketsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketsRequest create() => TicketsRequest._();
  @$core.override
  TicketsRequest createEmptyInstance() => create();
  static $pb.PbList<TicketsRequest> createRepeated() =>
      $pb.PbList<TicketsRequest>();
  @$core.pragma('dart2js:noInline')
  static TicketsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TicketsRequest>(create);
  static TicketsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$1.TicketPb> get tickets => $_getList(0);
}

class TicketsResponse extends $pb.GeneratedMessage {
  factory TicketsResponse({
    $core.Iterable<$1.TicketPb>? tickets,
  }) {
    final result = create();
    if (tickets != null) result.tickets.addAll(tickets);
    return result;
  }

  TicketsResponse._();

  factory TicketsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TicketsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TicketsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'weebi.ticket.service'),
      createEmptyInstance: create)
    ..pc<$1.TicketPb>(1, _omitFieldNames ? '' : 'tickets', $pb.PbFieldType.PM,
        subBuilder: $1.TicketPb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketsResponse clone() => TicketsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TicketsResponse copyWith(void Function(TicketsResponse) updates) =>
      super.copyWith((message) => updates(message as TicketsResponse))
          as TicketsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketsResponse create() => TicketsResponse._();
  @$core.override
  TicketsResponse createEmptyInstance() => create();
  static $pb.PbList<TicketsResponse> createRepeated() =>
      $pb.PbList<TicketsResponse>();
  @$core.pragma('dart2js:noInline')
  static TicketsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TicketsResponse>(create);
  static TicketsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$1.TicketPb> get tickets => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
