//
//  Generated code. Do not modify.
//  source: ticket/ticket_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'ticket.pb.dart' as $14;

class FindTicketRequest extends $pb.GeneratedMessage {
  factory FindTicketRequest({
    $core.String? ticketChainId,
    $core.String? ticketUserId,
    $core.int? ticketNonUniqueId,
  }) {
    final $result = create();
    if (ticketChainId != null) {
      $result.ticketChainId = ticketChainId;
    }
    if (ticketUserId != null) {
      $result.ticketUserId = ticketUserId;
    }
    if (ticketNonUniqueId != null) {
      $result.ticketNonUniqueId = ticketNonUniqueId;
    }
    return $result;
  }
  FindTicketRequest._() : super();
  factory FindTicketRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindTicketRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindTicketRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ticketChainId', protoName: 'ticketChainId')
    ..aOS(2, _omitFieldNames ? '' : 'ticketUserId', protoName: 'ticketUserId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'ticketNonUniqueId', $pb.PbFieldType.O3, protoName: 'ticketNonUniqueId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindTicketRequest clone() => FindTicketRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindTicketRequest copyWith(void Function(FindTicketRequest) updates) => super.copyWith((message) => updates(message as FindTicketRequest)) as FindTicketRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindTicketRequest create() => FindTicketRequest._();
  FindTicketRequest createEmptyInstance() => create();
  static $pb.PbList<FindTicketRequest> createRepeated() => $pb.PbList<FindTicketRequest>();
  @$core.pragma('dart2js:noInline')
  static FindTicketRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindTicketRequest>(create);
  static FindTicketRequest? _defaultInstance;

  /// weebi.common.chained_ids.MallAndboutiqueIds chainAndboutiqueIds = 1 [json_name = 'mallAndboutiqueIds'];
  /// string firmId = 1 [json_name = 'firmId']; deduced from bearer token
  @$pb.TagNumber(1)
  $core.String get ticketChainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set ticketChainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTicketChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTicketChainId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ticketUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set ticketUserId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTicketUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTicketUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get ticketNonUniqueId => $_getIZ(2);
  @$pb.TagNumber(3)
  set ticketNonUniqueId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTicketNonUniqueId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTicketNonUniqueId() => clearField(3);
}

class TicketRequest extends $pb.GeneratedMessage {
  factory TicketRequest({
    $14.TicketPb? ticket,
  }) {
    final $result = create();
    if (ticket != null) {
      $result.ticket = ticket;
    }
    return $result;
  }
  TicketRequest._() : super();
  factory TicketRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TicketRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TicketRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket.service'), createEmptyInstance: create)
    ..aOM<$14.TicketPb>(2, _omitFieldNames ? '' : 'ticket', subBuilder: $14.TicketPb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TicketRequest clone() => TicketRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TicketRequest copyWith(void Function(TicketRequest) updates) => super.copyWith((message) => updates(message as TicketRequest)) as TicketRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketRequest create() => TicketRequest._();
  TicketRequest createEmptyInstance() => create();
  static $pb.PbList<TicketRequest> createRepeated() => $pb.PbList<TicketRequest>();
  @$core.pragma('dart2js:noInline')
  static TicketRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TicketRequest>(create);
  static TicketRequest? _defaultInstance;

  /// / restrict request on a single boutique to ease access verification
  ///   weebi.common.chained_ids.MallAndboutiqueIds chainAndboutiqueIds = 1 [json_name = 'mallAndboutiqueIds'];
  @$pb.TagNumber(2)
  $14.TicketPb get ticket => $_getN(0);
  @$pb.TagNumber(2)
  set ticket($14.TicketPb v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTicket() => $_has(0);
  @$pb.TagNumber(2)
  void clearTicket() => clearField(2);
  @$pb.TagNumber(2)
  $14.TicketPb ensureTicket() => $_ensure(0);
}

class TicketsResponse extends $pb.GeneratedMessage {
  factory TicketsResponse({
    $core.Iterable<$14.TicketPb>? tickets,
  }) {
    final $result = create();
    if (tickets != null) {
      $result.tickets.addAll(tickets);
    }
    return $result;
  }
  TicketsResponse._() : super();
  factory TicketsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TicketsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TicketsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.ticket.service'), createEmptyInstance: create)
    ..pc<$14.TicketPb>(1, _omitFieldNames ? '' : 'tickets', $pb.PbFieldType.PM, subBuilder: $14.TicketPb.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TicketsResponse clone() => TicketsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TicketsResponse copyWith(void Function(TicketsResponse) updates) => super.copyWith((message) => updates(message as TicketsResponse)) as TicketsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketsResponse create() => TicketsResponse._();
  TicketsResponse createEmptyInstance() => create();
  static $pb.PbList<TicketsResponse> createRepeated() => $pb.PbList<TicketsResponse>();
  @$core.pragma('dart2js:noInline')
  static TicketsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TicketsResponse>(create);
  static TicketsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$14.TicketPb> get tickets => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
