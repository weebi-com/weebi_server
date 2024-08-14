//
//  Generated code. Do not modify.
//  source: article.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ArticleKindPb extends $pb.ProtobufEnum {
  static const ArticleKindPb unknown = ArticleKindPb._(0, _omitEnumNames ? '' : 'unknown');
  static const ArticleKindPb retail = ArticleKindPb._(1, _omitEnumNames ? '' : 'retail');
  static const ArticleKindPb basket = ArticleKindPb._(2, _omitEnumNames ? '' : 'basket');
  static const ArticleKindPb outOfCatalogue = ArticleKindPb._(3, _omitEnumNames ? '' : 'outOfCatalogue');

  static const $core.List<ArticleKindPb> values = <ArticleKindPb> [
    unknown,
    retail,
    basket,
    outOfCatalogue,
  ];

  static final $core.Map<$core.int, ArticleKindPb> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ArticleKindPb? valueOf($core.int value) => _byValue[value];

  const ArticleKindPb._($core.int v, $core.String n) : super(v, n);
}

class CalibrePb_StockUnit extends $pb.ProtobufEnum {
  static const CalibrePb_StockUnit unknown = CalibrePb_StockUnit._(0, _omitEnumNames ? '' : 'unknown');
  static const CalibrePb_StockUnit centiliter = CalibrePb_StockUnit._(1, _omitEnumNames ? '' : 'centiliter');
  static const CalibrePb_StockUnit centimeter = CalibrePb_StockUnit._(2, _omitEnumNames ? '' : 'centimeter');
  static const CalibrePb_StockUnit gram = CalibrePb_StockUnit._(3, _omitEnumNames ? '' : 'gram');
  static const CalibrePb_StockUnit kilogram = CalibrePb_StockUnit._(4, _omitEnumNames ? '' : 'kilogram');
  static const CalibrePb_StockUnit liter = CalibrePb_StockUnit._(5, _omitEnumNames ? '' : 'liter');
  static const CalibrePb_StockUnit meter = CalibrePb_StockUnit._(6, _omitEnumNames ? '' : 'meter');
  static const CalibrePb_StockUnit unit = CalibrePb_StockUnit._(7, _omitEnumNames ? '' : 'unit');

  static const $core.List<CalibrePb_StockUnit> values = <CalibrePb_StockUnit> [
    unknown,
    centiliter,
    centimeter,
    gram,
    kilogram,
    liter,
    meter,
    unit,
  ];

  static final $core.Map<$core.int, CalibrePb_StockUnit> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CalibrePb_StockUnit? valueOf($core.int value) => _byValue[value];

  const CalibrePb_StockUnit._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
