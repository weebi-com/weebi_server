// This is a generated file - do not edit.
//
// Generated from evaluation_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// / Q1 — Ancienneté du commerce au même emplacement.
class ShopTenure extends $pb.ProtobufEnum {
  static const ShopTenure SHOP_TENURE_UNSPECIFIED =
      ShopTenure._(0, _omitEnumNames ? '' : 'SHOP_TENURE_UNSPECIFIED');
  static const ShopTenure UNDER_ONE_YEAR =
      ShopTenure._(1, _omitEnumNames ? '' : 'UNDER_ONE_YEAR');
  static const ShopTenure ONE_TO_THREE_YEARS =
      ShopTenure._(2, _omitEnumNames ? '' : 'ONE_TO_THREE_YEARS');
  static const ShopTenure OVER_THREE_YEARS =
      ShopTenure._(3, _omitEnumNames ? '' : 'OVER_THREE_YEARS');

  static const $core.List<ShopTenure> values = <ShopTenure>[
    SHOP_TENURE_UNSPECIFIED,
    UNDER_ONE_YEAR,
    ONE_TO_THREE_YEARS,
    OVER_THREE_YEARS,
  ];

  static final $core.List<ShopTenure?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ShopTenure? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ShopTenure._(super.value, super.name);
}

/// / Q2 — Confiance grossistes / crédit fournisseur.
class SupplierCredit extends $pb.ProtobufEnum {
  static const SupplierCredit SUPPLIER_CREDIT_UNSPECIFIED =
      SupplierCredit._(0, _omitEnumNames ? '' : 'SUPPLIER_CREDIT_UNSPECIFIED');
  static const SupplierCredit CASH_ONLY =
      SupplierCredit._(1, _omitEnumNames ? '' : 'CASH_ONLY');
  static const SupplierCredit SHORT_TERM =
      SupplierCredit._(2, _omitEnumNames ? '' : 'SHORT_TERM');
  static const SupplierCredit REGULAR_CONSIGNMENT =
      SupplierCredit._(3, _omitEnumNames ? '' : 'REGULAR_CONSIGNMENT');

  static const $core.List<SupplierCredit> values = <SupplierCredit>[
    SUPPLIER_CREDIT_UNSPECIFIED,
    CASH_ONLY,
    SHORT_TERM,
    REGULAR_CONSIGNMENT,
  ];

  static final $core.List<SupplierCredit?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static SupplierCredit? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SupplierCredit._(super.value, super.name);
}

/// / Q3 — Discipline de séparation des caisses.
class CashSeparation extends $pb.ProtobufEnum {
  static const CashSeparation CASH_SEPARATION_UNSPECIFIED =
      CashSeparation._(0, _omitEnumNames ? '' : 'CASH_SEPARATION_UNSPECIFIED');
  static const CashSeparation MIXED_HOUSEHOLD =
      CashSeparation._(1, _omitEnumNames ? '' : 'MIXED_HOUSEHOLD');
  static const CashSeparation FIXED_SALARY_OR_LOGGED =
      CashSeparation._(2, _omitEnumNames ? '' : 'FIXED_SALARY_OR_LOGGED');
  static const CashSeparation FULLY_SEPARATED =
      CashSeparation._(3, _omitEnumNames ? '' : 'FULLY_SEPARATED');

  static const $core.List<CashSeparation> values = <CashSeparation>[
    CASH_SEPARATION_UNSPECIFIED,
    MIXED_HOUSEHOLD,
    FIXED_SALARY_OR_LOGGED,
    FULLY_SEPARATED,
  ];

  static final $core.List<CashSeparation?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static CashSeparation? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CashSeparation._(super.value, super.name);
}

/// / Q4 — Suivi et maîtrise du crédit client.
class CustomerCreditTracking extends $pb.ProtobufEnum {
  static const CustomerCreditTracking CUSTOMER_CREDIT_TRACKING_UNSPECIFIED =
      CustomerCreditTracking._(
          0, _omitEnumNames ? '' : 'CUSTOMER_CREDIT_TRACKING_UNSPECIFIED');
  static const CustomerCreditTracking MEMORY_ONLY =
      CustomerCreditTracking._(1, _omitEnumNames ? '' : 'MEMORY_ONLY');
  static const CustomerCreditTracking PAPER_NOTEBOOK =
      CustomerCreditTracking._(2, _omitEnumNames ? '' : 'PAPER_NOTEBOOK');
  static const CustomerCreditTracking DEDICATED_OR_APP =
      CustomerCreditTracking._(3, _omitEnumNames ? '' : 'DEDICATED_OR_APP');

  static const $core.List<CustomerCreditTracking> values =
      <CustomerCreditTracking>[
    CUSTOMER_CREDIT_TRACKING_UNSPECIFIED,
    MEMORY_ONLY,
    PAPER_NOTEBOOK,
    DEDICATED_OR_APP,
  ];

  static final $core.List<CustomerCreditTracking?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static CustomerCreditTracking? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CustomerCreditTracking._(super.value, super.name);
}

/// / Q5 — Dynamique de réapprovisionnement.
class RestockFrequency extends $pb.ProtobufEnum {
  static const RestockFrequency RESTOCK_FREQUENCY_UNSPECIFIED =
      RestockFrequency._(
          0, _omitEnumNames ? '' : 'RESTOCK_FREQUENCY_UNSPECIFIED');
  static const RestockFrequency LESS_THAN_WEEKLY =
      RestockFrequency._(1, _omitEnumNames ? '' : 'LESS_THAN_WEEKLY');
  static const RestockFrequency ONE_TO_TWO_PER_WEEK =
      RestockFrequency._(2, _omitEnumNames ? '' : 'ONE_TO_TWO_PER_WEEK');
  static const RestockFrequency MORE_THAN_TWICE_WEEKLY =
      RestockFrequency._(3, _omitEnumNames ? '' : 'MORE_THAN_TWICE_WEEKLY');

  static const $core.List<RestockFrequency> values = <RestockFrequency>[
    RESTOCK_FREQUENCY_UNSPECIFIED,
    LESS_THAN_WEEKLY,
    ONE_TO_TWO_PER_WEEK,
    MORE_THAN_TWICE_WEEKLY,
  ];

  static final $core.List<RestockFrequency?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static RestockFrequency? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RestockFrequency._(super.value, super.name);
}

/// / OHADA-oriented legal form (acronyms on the wire; UI shows full labels).
class LegalForm extends $pb.ProtobufEnum {
  static const LegalForm LEGAL_FORM_UNSPECIFIED =
      LegalForm._(0, _omitEnumNames ? '' : 'LEGAL_FORM_UNSPECIFIED');
  static const LegalForm EI = LegalForm._(1, _omitEnumNames ? '' : 'EI');
  static const LegalForm ENTREPRENANT =
      LegalForm._(2, _omitEnumNames ? '' : 'ENTREPRENANT');
  static const LegalForm SARL = LegalForm._(3, _omitEnumNames ? '' : 'SARL');
  static const LegalForm SA = LegalForm._(4, _omitEnumNames ? '' : 'SA');
  static const LegalForm SAS = LegalForm._(5, _omitEnumNames ? '' : 'SAS');
  static const LegalForm GIE = LegalForm._(6, _omitEnumNames ? '' : 'GIE');
  static const LegalForm OTHER = LegalForm._(7, _omitEnumNames ? '' : 'OTHER');

  static const $core.List<LegalForm> values = <LegalForm>[
    LEGAL_FORM_UNSPECIFIED,
    EI,
    ENTREPRENANT,
    SARL,
    SA,
    SAS,
    GIE,
    OTHER,
  ];

  static final $core.List<LegalForm?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static LegalForm? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LegalForm._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
