//
//  Generated code. Do not modify.
//  source: common/chained_ids.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ChainIdAndboutiqueId extends $pb.GeneratedMessage {
  factory ChainIdAndboutiqueId({
    $core.String? chainId,
    $core.String? boutiqueId,
  }) {
    final $result = create();
    if (chainId != null) {
      $result.chainId = chainId;
    }
    if (boutiqueId != null) {
      $result.boutiqueId = boutiqueId;
    }
    return $result;
  }
  ChainIdAndboutiqueId._() : super();
  factory ChainIdAndboutiqueId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainIdAndboutiqueId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChainIdAndboutiqueId', package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.common.chained_ids'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(2, _omitFieldNames ? '' : 'boutiqueId', protoName: 'boutiqueId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChainIdAndboutiqueId clone() => ChainIdAndboutiqueId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChainIdAndboutiqueId copyWith(void Function(ChainIdAndboutiqueId) updates) => super.copyWith((message) => updates(message as ChainIdAndboutiqueId)) as ChainIdAndboutiqueId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainIdAndboutiqueId create() => ChainIdAndboutiqueId._();
  ChainIdAndboutiqueId createEmptyInstance() => create();
  static $pb.PbList<ChainIdAndboutiqueId> createRepeated() => $pb.PbList<ChainIdAndboutiqueId>();
  @$core.pragma('dart2js:noInline')
  static ChainIdAndboutiqueId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainIdAndboutiqueId>(create);
  static ChainIdAndboutiqueId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get boutiqueId => $_getSZ(1);
  @$pb.TagNumber(2)
  set boutiqueId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoutiqueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoutiqueId() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
