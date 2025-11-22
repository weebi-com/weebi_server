// This is a generated file - do not edit.
//
// Generated from article/article.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../common/g_timestamp.pb.dart' as $0;
import 'article.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'article.pbenum.dart';

class CalibreMongo extends $pb.GeneratedMessage {
  factory CalibreMongo({
    CalibrePb? calibre,
    $core.int? calibreId,
    $core.String? firmId,
    $core.String? chainId,
    $core.String? userId,
    $core.String? creationDate,
    $0.Timestamp? lastTouchTimestampUTC,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        additionalAttributes,
  }) {
    final result = create();
    if (calibre != null) result.calibre = calibre;
    if (calibreId != null) result.calibreId = calibreId;
    if (firmId != null) result.firmId = firmId;
    if (chainId != null) result.chainId = chainId;
    if (userId != null) result.userId = userId;
    if (creationDate != null) result.creationDate = creationDate;
    if (lastTouchTimestampUTC != null)
      result.lastTouchTimestampUTC = lastTouchTimestampUTC;
    if (additionalAttributes != null)
      result.additionalAttributes.addEntries(additionalAttributes);
    return result;
  }

  CalibreMongo._();

  factory CalibreMongo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CalibreMongo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CalibreMongo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article'),
      createEmptyInstance: create)
    ..aOM<CalibrePb>(1, _omitFieldNames ? '' : 'calibre',
        subBuilder: CalibrePb.create)
    ..aI(2, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aOS(3, _omitFieldNames ? '' : 'firmId', protoName: 'firmId')
    ..aOS(4, _omitFieldNames ? '' : 'chainId', protoName: 'chainId')
    ..aOS(5, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(6, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'lastTouchTimestampUTC',
        protoName: 'lastTouchTimestampUTC', subBuilder: $0.Timestamp.create)
    ..m<$core.String, $core.String>(
        99, _omitFieldNames ? '' : 'additional_attributes',
        entryClassName: 'CalibreMongo.AdditionalAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('weebi.article'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalibreMongo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalibreMongo copyWith(void Function(CalibreMongo) updates) =>
      super.copyWith((message) => updates(message as CalibreMongo))
          as CalibreMongo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalibreMongo create() => CalibreMongo._();
  @$core.override
  CalibreMongo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CalibreMongo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CalibreMongo>(create);
  static CalibreMongo? _defaultInstance;

  /// faster object read
  @$pb.TagNumber(1)
  CalibrePb get calibre => $_getN(0);
  @$pb.TagNumber(1)
  set calibre(CalibrePb value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCalibre() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalibre() => $_clearField(1);
  @$pb.TagNumber(1)
  CalibrePb ensureCalibre() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get calibreId => $_getIZ(1);
  @$pb.TagNumber(2)
  set calibreId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCalibreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCalibreId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get firmId => $_getSZ(2);
  @$pb.TagNumber(3)
  set firmId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFirmId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirmId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get chainId => $_getSZ(3);
  @$pb.TagNumber(4)
  set chainId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChainId() => $_has(3);
  @$pb.TagNumber(4)
  void clearChainId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get userId => $_getSZ(4);
  @$pb.TagNumber(5)
  set userId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get creationDate => $_getSZ(5);
  @$pb.TagNumber(6)
  set creationDate($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreationDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreationDate() => $_clearField(6);

  @$pb.TagNumber(7)
  $0.Timestamp get lastTouchTimestampUTC => $_getN(6);
  @$pb.TagNumber(7)
  set lastTouchTimestampUTC($0.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasLastTouchTimestampUTC() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastTouchTimestampUTC() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureLastTouchTimestampUTC() => $_ensure(6);

  @$pb.TagNumber(99)
  $pb.PbMap<$core.String, $core.String> get additionalAttributes => $_getMap(7);
}

/// / Wrapping articles, using Pb to differentiate from Calibre Dart in models weebi
class CalibrePb extends $pb.GeneratedMessage {
  factory CalibrePb({
    $core.int? id,
    $core.String? creationDate,
    $core.String? updateDate,
    $core.String? statusUpdateDate,
    $core.bool? status,
    $core.String? title,
    CalibrePb_StockUnit? stockUnit,
    ArticleKindPb? kind,
    $core.Iterable<ArticleRetailPb>? articlesRetail,
    $core.Iterable<ArticleBasketPb>? articlesBasket,
    $core.Iterable<ArticleUncountablePb>? articlesUncountable,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (creationDate != null) result.creationDate = creationDate;
    if (updateDate != null) result.updateDate = updateDate;
    if (statusUpdateDate != null) result.statusUpdateDate = statusUpdateDate;
    if (status != null) result.status = status;
    if (title != null) result.title = title;
    if (stockUnit != null) result.stockUnit = stockUnit;
    if (kind != null) result.kind = kind;
    if (articlesRetail != null) result.articlesRetail.addAll(articlesRetail);
    if (articlesBasket != null) result.articlesBasket.addAll(articlesBasket);
    if (articlesUncountable != null)
      result.articlesUncountable.addAll(articlesUncountable);
    return result;
  }

  CalibrePb._();

  factory CalibrePb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CalibrePb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CalibrePb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(3, _omitFieldNames ? '' : 'updateDate', protoName: 'updateDate')
    ..aOS(4, _omitFieldNames ? '' : 'statusUpdateDate',
        protoName: 'statusUpdateDate')
    ..aOB(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'title')
    ..aE<CalibrePb_StockUnit>(7, _omitFieldNames ? '' : 'stockUnit',
        protoName: 'stockUnit', enumValues: CalibrePb_StockUnit.values)
    ..aE<ArticleKindPb>(8, _omitFieldNames ? '' : 'kind',
        enumValues: ArticleKindPb.values)
    ..pPM<ArticleRetailPb>(9, _omitFieldNames ? '' : 'articlesRetail',
        protoName: 'articlesRetail', subBuilder: ArticleRetailPb.create)
    ..pPM<ArticleBasketPb>(10, _omitFieldNames ? '' : 'articlesBasket',
        protoName: 'articlesBasket', subBuilder: ArticleBasketPb.create)
    ..pPM<ArticleUncountablePb>(
        11, _omitFieldNames ? '' : 'articlesUncountable',
        protoName: 'articlesUncountable',
        subBuilder: ArticleUncountablePb.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalibrePb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalibrePb copyWith(void Function(CalibrePb) updates) =>
      super.copyWith((message) => updates(message as CalibrePb)) as CalibrePb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalibrePb create() => CalibrePb._();
  @$core.override
  CalibrePb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CalibrePb getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalibrePb>(create);
  static CalibrePb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get creationDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set creationDate($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreationDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreationDate() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get updateDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set updateDate($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdateDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateDate() => $_clearField(3);

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
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => $_clearField(6);

  @$pb.TagNumber(7)
  CalibrePb_StockUnit get stockUnit => $_getN(6);
  @$pb.TagNumber(7)
  set stockUnit(CalibrePb_StockUnit value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasStockUnit() => $_has(6);
  @$pb.TagNumber(7)
  void clearStockUnit() => $_clearField(7);

  @$pb.TagNumber(8)
  ArticleKindPb get kind => $_getN(7);
  @$pb.TagNumber(8)
  set kind(ArticleKindPb value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasKind() => $_has(7);
  @$pb.TagNumber(8)
  void clearKind() => $_clearField(8);

  @$pb.TagNumber(9)
  $pb.PbList<ArticleRetailPb> get articlesRetail => $_getList(8);

  @$pb.TagNumber(10)
  $pb.PbList<ArticleBasketPb> get articlesBasket => $_getList(9);

  @$pb.TagNumber(11)
  $pb.PbList<ArticleUncountablePb> get articlesUncountable => $_getList(10);
}

class ArticleId extends $pb.GeneratedMessage {
  factory ArticleId({
    $core.int? calibreId,
    $core.int? id,
  }) {
    final result = create();
    if (calibreId != null) result.calibreId = calibreId;
    if (id != null) result.id = id;
    return result;
  }

  ArticleId._();

  factory ArticleId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArticleId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArticleId',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aI(2, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleId copyWith(void Function(ArticleId) updates) =>
      super.copyWith((message) => updates(message as ArticleId)) as ArticleId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticleId create() => ArticleId._();
  @$core.override
  ArticleId createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArticleId getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticleId>(create);
  static ArticleId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get calibreId => $_getIZ(0);
  @$pb.TagNumber(1)
  set calibreId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCalibreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalibreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);
}

/// / default type of article shortened on ticket
class ArticleRetailOnTicketPb extends $pb.GeneratedMessage {
  factory ArticleRetailOnTicketPb({
    $core.int? calibreId,
    $core.int? id,
    $core.String? designation,
    $core.double? price,
    $core.double? cost,
    $core.double? unitsInOnePiece,
  }) {
    final result = create();
    if (calibreId != null) result.calibreId = calibreId;
    if (id != null) result.id = id;
    if (designation != null) result.designation = designation;
    if (price != null) result.price = price;
    if (cost != null) result.cost = cost;
    if (unitsInOnePiece != null) result.unitsInOnePiece = unitsInOnePiece;
    return result;
  }

  ArticleRetailOnTicketPb._();

  factory ArticleRetailOnTicketPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArticleRetailOnTicketPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArticleRetailOnTicketPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aI(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'designation')
    ..aD(4, _omitFieldNames ? '' : 'price')
    ..aD(5, _omitFieldNames ? '' : 'cost')
    ..aD(6, _omitFieldNames ? '' : 'unitsInOnePiece',
        protoName: 'unitsInOnePiece')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleRetailOnTicketPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleRetailOnTicketPb copyWith(
          void Function(ArticleRetailOnTicketPb) updates) =>
      super.copyWith((message) => updates(message as ArticleRetailOnTicketPb))
          as ArticleRetailOnTicketPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticleRetailOnTicketPb create() => ArticleRetailOnTicketPb._();
  @$core.override
  ArticleRetailOnTicketPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArticleRetailOnTicketPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArticleRetailOnTicketPb>(create);
  static ArticleRetailOnTicketPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get calibreId => $_getIZ(0);
  @$pb.TagNumber(1)
  set calibreId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCalibreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalibreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get designation => $_getSZ(2);
  @$pb.TagNumber(3)
  set designation($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesignation() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesignation() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get price => $_getN(3);
  @$pb.TagNumber(4)
  set price($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get cost => $_getN(4);
  @$pb.TagNumber(5)
  set cost($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCost() => $_has(4);
  @$pb.TagNumber(5)
  void clearCost() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get unitsInOnePiece => $_getN(5);
  @$pb.TagNumber(6)
  set unitsInOnePiece($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasUnitsInOnePiece() => $_has(5);
  @$pb.TagNumber(6)
  void clearUnitsInOnePiece() => $_clearField(6);
}

/// / default type of article
class ArticleRetailPb extends $pb.GeneratedMessage {
  factory ArticleRetailPb({
    $core.int? calibreId,
    $core.int? id,
    $core.String? designation,
    ArticleKindPb? kind,
    $core.bool? status,
    @$core.Deprecated('This field is deprecated.') $core.int? codeShortcut,
    $core.String? creationDate,
    $core.String? updateDate,
    $core.String? statusUpdateDate,
    $core.double? price,
    $core.double? cost,
    $core.double? unitsInOnePiece,
    $core.String? barcodeEAN,
  }) {
    final result = create();
    if (calibreId != null) result.calibreId = calibreId;
    if (id != null) result.id = id;
    if (designation != null) result.designation = designation;
    if (kind != null) result.kind = kind;
    if (status != null) result.status = status;
    if (codeShortcut != null) result.codeShortcut = codeShortcut;
    if (creationDate != null) result.creationDate = creationDate;
    if (updateDate != null) result.updateDate = updateDate;
    if (statusUpdateDate != null) result.statusUpdateDate = statusUpdateDate;
    if (price != null) result.price = price;
    if (cost != null) result.cost = cost;
    if (unitsInOnePiece != null) result.unitsInOnePiece = unitsInOnePiece;
    if (barcodeEAN != null) result.barcodeEAN = barcodeEAN;
    return result;
  }

  ArticleRetailPb._();

  factory ArticleRetailPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArticleRetailPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArticleRetailPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aI(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'designation')
    ..aE<ArticleKindPb>(4, _omitFieldNames ? '' : 'kind',
        enumValues: ArticleKindPb.values)
    ..aOB(5, _omitFieldNames ? '' : 'status')
    ..aI(6, _omitFieldNames ? '' : 'articleCode', protoName: 'codeShortcut')
    ..aOS(7, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(8, _omitFieldNames ? '' : 'updateDate', protoName: 'updateDate')
    ..aOS(9, _omitFieldNames ? '' : 'statusUpdateDate',
        protoName: 'statusUpdateDate')
    ..aD(10, _omitFieldNames ? '' : 'price')
    ..aD(11, _omitFieldNames ? '' : 'cost')
    ..aD(12, _omitFieldNames ? '' : 'unitsInOnePiece',
        protoName: 'unitsInOnePiece')
    ..aOS(13, _omitFieldNames ? '' : 'barcodeEAN', protoName: 'barcodeEAN')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleRetailPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleRetailPb copyWith(void Function(ArticleRetailPb) updates) =>
      super.copyWith((message) => updates(message as ArticleRetailPb))
          as ArticleRetailPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticleRetailPb create() => ArticleRetailPb._();
  @$core.override
  ArticleRetailPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArticleRetailPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArticleRetailPb>(create);
  static ArticleRetailPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get calibreId => $_getIZ(0);
  @$pb.TagNumber(1)
  set calibreId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCalibreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalibreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get designation => $_getSZ(2);
  @$pb.TagNumber(3)
  set designation($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesignation() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesignation() => $_clearField(3);

  @$pb.TagNumber(4)
  ArticleKindPb get kind => $_getN(3);
  @$pb.TagNumber(4)
  set kind(ArticleKindPb value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasKind() => $_has(3);
  @$pb.TagNumber(4)
  void clearKind() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get status => $_getBF(4);
  @$pb.TagNumber(5)
  set status($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.int get codeShortcut => $_getIZ(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set codeShortcut($core.int value) => $_setSignedInt32(5, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasCodeShortcut() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearCodeShortcut() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get creationDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set creationDate($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreationDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreationDate() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get updateDate => $_getSZ(7);
  @$pb.TagNumber(8)
  set updateDate($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasUpdateDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdateDate() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get statusUpdateDate => $_getSZ(8);
  @$pb.TagNumber(9)
  set statusUpdateDate($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStatusUpdateDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatusUpdateDate() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get price => $_getN(9);
  @$pb.TagNumber(10)
  set price($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPrice() => $_has(9);
  @$pb.TagNumber(10)
  void clearPrice() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get cost => $_getN(10);
  @$pb.TagNumber(11)
  set cost($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCost() => $_has(10);
  @$pb.TagNumber(11)
  void clearCost() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get unitsInOnePiece => $_getN(11);
  @$pb.TagNumber(12)
  set unitsInOnePiece($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasUnitsInOnePiece() => $_has(11);
  @$pb.TagNumber(12)
  void clearUnitsInOnePiece() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get barcodeEAN => $_getSZ(12);
  @$pb.TagNumber(13)
  set barcodeEAN($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasBarcodeEAN() => $_has(12);
  @$pb.TagNumber(13)
  void clearBarcodeEAN() => $_clearField(13);
}

/// a basket of several articles,  a basket cannot contain other baskets
class ArticleBasketPb extends $pb.GeneratedMessage {
  factory ArticleBasketPb({
    $core.int? calibreId,
    $core.int? id,
    $core.String? designation,
    ArticleKindPb? kind,
    $core.bool? status,
    @$core.Deprecated('This field is deprecated.') $core.int? codeShortcut,
    $core.String? creationDate,
    $core.String? updateDate,
    $core.String? statusUpdateDate,
    $core.Iterable<ProxyArticlePb>? proxies,
    $core.double? discountAmount,
    $core.double? markupAmount,
  }) {
    final result = create();
    if (calibreId != null) result.calibreId = calibreId;
    if (id != null) result.id = id;
    if (designation != null) result.designation = designation;
    if (kind != null) result.kind = kind;
    if (status != null) result.status = status;
    if (codeShortcut != null) result.codeShortcut = codeShortcut;
    if (creationDate != null) result.creationDate = creationDate;
    if (updateDate != null) result.updateDate = updateDate;
    if (statusUpdateDate != null) result.statusUpdateDate = statusUpdateDate;
    if (proxies != null) result.proxies.addAll(proxies);
    if (discountAmount != null) result.discountAmount = discountAmount;
    if (markupAmount != null) result.markupAmount = markupAmount;
    return result;
  }

  ArticleBasketPb._();

  factory ArticleBasketPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArticleBasketPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArticleBasketPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aI(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'designation')
    ..aE<ArticleKindPb>(4, _omitFieldNames ? '' : 'kind',
        enumValues: ArticleKindPb.values)
    ..aOB(5, _omitFieldNames ? '' : 'status')
    ..aI(6, _omitFieldNames ? '' : 'articleCode', protoName: 'codeShortcut')
    ..aOS(7, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(8, _omitFieldNames ? '' : 'updateDate', protoName: 'updateDate')
    ..aOS(9, _omitFieldNames ? '' : 'statusUpdateDate',
        protoName: 'statusUpdateDate')
    ..pPM<ProxyArticlePb>(10, _omitFieldNames ? '' : 'proxies',
        subBuilder: ProxyArticlePb.create)
    ..aD(11, _omitFieldNames ? '' : 'discountAmountSalesOnly',
        protoName: 'discountAmount')
    ..aD(12, _omitFieldNames ? '' : 'markupAmountSalesOnly',
        protoName: 'markupAmount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleBasketPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleBasketPb copyWith(void Function(ArticleBasketPb) updates) =>
      super.copyWith((message) => updates(message as ArticleBasketPb))
          as ArticleBasketPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticleBasketPb create() => ArticleBasketPb._();
  @$core.override
  ArticleBasketPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArticleBasketPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArticleBasketPb>(create);
  static ArticleBasketPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get calibreId => $_getIZ(0);
  @$pb.TagNumber(1)
  set calibreId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCalibreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalibreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get designation => $_getSZ(2);
  @$pb.TagNumber(3)
  set designation($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesignation() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesignation() => $_clearField(3);

  @$pb.TagNumber(4)
  ArticleKindPb get kind => $_getN(3);
  @$pb.TagNumber(4)
  set kind(ArticleKindPb value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasKind() => $_has(3);
  @$pb.TagNumber(4)
  void clearKind() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get status => $_getBF(4);
  @$pb.TagNumber(5)
  set status($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.int get codeShortcut => $_getIZ(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set codeShortcut($core.int value) => $_setSignedInt32(5, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasCodeShortcut() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearCodeShortcut() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get creationDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set creationDate($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreationDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreationDate() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get updateDate => $_getSZ(7);
  @$pb.TagNumber(8)
  set updateDate($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasUpdateDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdateDate() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get statusUpdateDate => $_getSZ(8);
  @$pb.TagNumber(9)
  set statusUpdateDate($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStatusUpdateDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatusUpdateDate() => $_clearField(9);

  @$pb.TagNumber(10)
  $pb.PbList<ProxyArticlePb> get proxies => $_getList(9);

  @$pb.TagNumber(11)
  $core.double get discountAmount => $_getN(10);
  @$pb.TagNumber(11)
  set discountAmount($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(11)
  $core.bool hasDiscountAmount() => $_has(10);
  @$pb.TagNumber(11)
  void clearDiscountAmount() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get markupAmount => $_getN(11);
  @$pb.TagNumber(12)
  set markupAmount($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasMarkupAmount() => $_has(11);
  @$pb.TagNumber(12)
  void clearMarkupAmount() => $_clearField(12);
}

class ArticleBasketOnTicketPb extends $pb.GeneratedMessage {
  factory ArticleBasketOnTicketPb({
    $core.int? calibreId,
    $core.int? id,
    $core.String? designation,
    $core.Iterable<ProxyArticlePb>? proxies,
    $core.double? discountAmount,
    $core.double? markupAmount,
  }) {
    final result = create();
    if (calibreId != null) result.calibreId = calibreId;
    if (id != null) result.id = id;
    if (designation != null) result.designation = designation;
    if (proxies != null) result.proxies.addAll(proxies);
    if (discountAmount != null) result.discountAmount = discountAmount;
    if (markupAmount != null) result.markupAmount = markupAmount;
    return result;
  }

  ArticleBasketOnTicketPb._();

  factory ArticleBasketOnTicketPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArticleBasketOnTicketPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArticleBasketOnTicketPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aI(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'designation')
    ..pPM<ProxyArticlePb>(4, _omitFieldNames ? '' : 'proxies',
        subBuilder: ProxyArticlePb.create)
    ..aD(5, _omitFieldNames ? '' : 'discountAmountSalesOnly',
        protoName: 'discountAmount')
    ..aD(6, _omitFieldNames ? '' : 'markupAmountSalesOnly',
        protoName: 'markupAmount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleBasketOnTicketPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleBasketOnTicketPb copyWith(
          void Function(ArticleBasketOnTicketPb) updates) =>
      super.copyWith((message) => updates(message as ArticleBasketOnTicketPb))
          as ArticleBasketOnTicketPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticleBasketOnTicketPb create() => ArticleBasketOnTicketPb._();
  @$core.override
  ArticleBasketOnTicketPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArticleBasketOnTicketPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArticleBasketOnTicketPb>(create);
  static ArticleBasketOnTicketPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get calibreId => $_getIZ(0);
  @$pb.TagNumber(1)
  set calibreId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCalibreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalibreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get designation => $_getSZ(2);
  @$pb.TagNumber(3)
  set designation($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesignation() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesignation() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<ProxyArticlePb> get proxies => $_getList(3);

  @$pb.TagNumber(5)
  $core.double get discountAmount => $_getN(4);
  @$pb.TagNumber(5)
  set discountAmount($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDiscountAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearDiscountAmount() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get markupAmount => $_getN(5);
  @$pb.TagNumber(6)
  set markupAmount($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMarkupAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearMarkupAmount() => $_clearField(6);
}

/// each article included in the ArticleBasket is referenced using the proxy
class ProxyArticlePb extends $pb.GeneratedMessage {
  factory ProxyArticlePb({
    $core.int? calibreId,
    $core.int? articleId,
    $core.int? id,
    $core.bool? status,
    $core.int? proxyCalibreId,
    $core.int? proxyArticleId,
    $core.double? minimumUnitPerBasket,
    $core.double? articleWeight,
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
    return result;
  }

  ProxyArticlePb._();

  factory ProxyArticlePb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProxyArticlePb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProxyArticlePb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article'),
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
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProxyArticlePb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProxyArticlePb copyWith(void Function(ProxyArticlePb) updates) =>
      super.copyWith((message) => updates(message as ProxyArticlePb))
          as ProxyArticlePb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProxyArticlePb create() => ProxyArticlePb._();
  @$core.override
  ProxyArticlePb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProxyArticlePb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProxyArticlePb>(create);
  static ProxyArticlePb? _defaultInstance;

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
}

/// / article uncountable only has price and cost on ticket when it cas assigned
class ArticleUncountableOnTicketPb extends $pb.GeneratedMessage {
  factory ArticleUncountableOnTicketPb({
    $core.int? calibreId,
    $core.int? id,
    $core.String? designation,
    $core.double? price,
    $core.double? cost,
  }) {
    final result = create();
    if (calibreId != null) result.calibreId = calibreId;
    if (id != null) result.id = id;
    if (designation != null) result.designation = designation;
    if (price != null) result.price = price;
    if (cost != null) result.cost = cost;
    return result;
  }

  ArticleUncountableOnTicketPb._();

  factory ArticleUncountableOnTicketPb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArticleUncountableOnTicketPb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArticleUncountableOnTicketPb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aI(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'designation')
    ..aD(4, _omitFieldNames ? '' : 'price')
    ..aD(5, _omitFieldNames ? '' : 'cost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleUncountableOnTicketPb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleUncountableOnTicketPb copyWith(
          void Function(ArticleUncountableOnTicketPb) updates) =>
      super.copyWith(
              (message) => updates(message as ArticleUncountableOnTicketPb))
          as ArticleUncountableOnTicketPb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticleUncountableOnTicketPb create() =>
      ArticleUncountableOnTicketPb._();
  @$core.override
  ArticleUncountableOnTicketPb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArticleUncountableOnTicketPb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArticleUncountableOnTicketPb>(create);
  static ArticleUncountableOnTicketPb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get calibreId => $_getIZ(0);
  @$pb.TagNumber(1)
  set calibreId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCalibreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalibreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get designation => $_getSZ(2);
  @$pb.TagNumber(3)
  set designation($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesignation() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesignation() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get price => $_getN(3);
  @$pb.TagNumber(4)
  set price($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get cost => $_getN(4);
  @$pb.TagNumber(5)
  set cost($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCost() => $_has(4);
  @$pb.TagNumber(5)
  void clearCost() => $_clearField(5);
}

/// / article uncountable / out of catalog, exemple : electricity bill (-) or grant (+)
class ArticleUncountablePb extends $pb.GeneratedMessage {
  factory ArticleUncountablePb({
    $core.int? calibreId,
    $core.int? id,
    $core.String? designation,
    ArticleKindPb? kind,
    $core.bool? status,
    @$core.Deprecated('This field is deprecated.') $core.int? codeShortcut,
    $core.String? creationDate,
    $core.String? updateDate,
    $core.String? statusUpdateDate,
    $core.double? price,
    $core.double? cost,
    $core.double? unitsInOnePiece,
    $core.String? barcodeEAN,
  }) {
    final result = create();
    if (calibreId != null) result.calibreId = calibreId;
    if (id != null) result.id = id;
    if (designation != null) result.designation = designation;
    if (kind != null) result.kind = kind;
    if (status != null) result.status = status;
    if (codeShortcut != null) result.codeShortcut = codeShortcut;
    if (creationDate != null) result.creationDate = creationDate;
    if (updateDate != null) result.updateDate = updateDate;
    if (statusUpdateDate != null) result.statusUpdateDate = statusUpdateDate;
    if (price != null) result.price = price;
    if (cost != null) result.cost = cost;
    if (unitsInOnePiece != null) result.unitsInOnePiece = unitsInOnePiece;
    if (barcodeEAN != null) result.barcodeEAN = barcodeEAN;
    return result;
  }

  ArticleUncountablePb._();

  factory ArticleUncountablePb.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArticleUncountablePb.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArticleUncountablePb',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'weebi.article'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'calibreId', protoName: 'calibreId')
    ..aI(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'designation')
    ..aE<ArticleKindPb>(4, _omitFieldNames ? '' : 'kind',
        enumValues: ArticleKindPb.values)
    ..aOB(5, _omitFieldNames ? '' : 'status')
    ..aI(6, _omitFieldNames ? '' : 'articleCode', protoName: 'codeShortcut')
    ..aOS(7, _omitFieldNames ? '' : 'creationDate', protoName: 'creationDate')
    ..aOS(8, _omitFieldNames ? '' : 'updateDate', protoName: 'updateDate')
    ..aOS(9, _omitFieldNames ? '' : 'statusUpdateDate',
        protoName: 'statusUpdateDate')
    ..aD(10, _omitFieldNames ? '' : 'price')
    ..aD(11, _omitFieldNames ? '' : 'cost')
    ..aD(12, _omitFieldNames ? '' : 'unitsInOnePiece',
        protoName: 'unitsInOnePiece')
    ..aOS(13, _omitFieldNames ? '' : 'barcodeEAN', protoName: 'barcodeEAN')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleUncountablePb clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticleUncountablePb copyWith(void Function(ArticleUncountablePb) updates) =>
      super.copyWith((message) => updates(message as ArticleUncountablePb))
          as ArticleUncountablePb;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticleUncountablePb create() => ArticleUncountablePb._();
  @$core.override
  ArticleUncountablePb createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArticleUncountablePb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArticleUncountablePb>(create);
  static ArticleUncountablePb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get calibreId => $_getIZ(0);
  @$pb.TagNumber(1)
  set calibreId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCalibreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalibreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get designation => $_getSZ(2);
  @$pb.TagNumber(3)
  set designation($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesignation() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesignation() => $_clearField(3);

  @$pb.TagNumber(4)
  ArticleKindPb get kind => $_getN(3);
  @$pb.TagNumber(4)
  set kind(ArticleKindPb value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasKind() => $_has(3);
  @$pb.TagNumber(4)
  void clearKind() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get status => $_getBF(4);
  @$pb.TagNumber(5)
  set status($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.int get codeShortcut => $_getIZ(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set codeShortcut($core.int value) => $_setSignedInt32(5, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasCodeShortcut() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearCodeShortcut() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get creationDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set creationDate($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreationDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreationDate() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get updateDate => $_getSZ(7);
  @$pb.TagNumber(8)
  set updateDate($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasUpdateDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdateDate() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get statusUpdateDate => $_getSZ(8);
  @$pb.TagNumber(9)
  set statusUpdateDate($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStatusUpdateDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatusUpdateDate() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get price => $_getN(9);
  @$pb.TagNumber(10)
  set price($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPrice() => $_has(9);
  @$pb.TagNumber(10)
  void clearPrice() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get cost => $_getN(10);
  @$pb.TagNumber(11)
  set cost($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCost() => $_has(10);
  @$pb.TagNumber(11)
  void clearCost() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get unitsInOnePiece => $_getN(11);
  @$pb.TagNumber(12)
  set unitsInOnePiece($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasUnitsInOnePiece() => $_has(11);
  @$pb.TagNumber(12)
  void clearUnitsInOnePiece() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get barcodeEAN => $_getSZ(12);
  @$pb.TagNumber(13)
  set barcodeEAN($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasBarcodeEAN() => $_has(12);
  @$pb.TagNumber(13)
  void clearBarcodeEAN() => $_clearField(13);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
