//
//  Generated code. Do not modify.
//  source: user_permissions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use rightDescriptor instead')
const Right$json = {
  '1': 'Right',
  '2': [
    {'1': 'unknown', '2': 0},
    {'1': 'create', '2': 1},
    {'1': 'read', '2': 2},
    {'1': 'update', '2': 3},
    {'1': 'delete', '2': 4},
  ],
};

/// Descriptor for `Right`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List rightDescriptor = $convert.base64Decode(
    'CgVSaWdodBILCgd1bmtub3duEAASCgoGY3JlYXRlEAESCAoEcmVhZBACEgoKBnVwZGF0ZRADEg'
    'oKBmRlbGV0ZRAE');

@$core.Deprecated('Use chainsAndBoutiquesAccessDescriptor instead')
const ChainsAndBoutiquesAccess$json = {
  '1': 'ChainsAndBoutiquesAccess',
  '2': [
    {'1': 'standardAccess', '3': 1, '4': 1, '5': 11, '6': '.weebi.user.permissions.ChainsAndBoutiquesAccess.StandardAccess', '9': 0, '10': 'standardAccess'},
    {'1': 'fullAccess', '3': 2, '4': 1, '5': 11, '6': '.weebi.user.permissions.ChainsAndBoutiquesAccess.FullAccess', '9': 0, '10': 'fullAccess'},
  ],
  '3': [ChainsAndBoutiquesAccess_StandardAccess$json, ChainsAndBoutiquesAccess_FullAccess$json],
  '8': [
    {'1': 'access'},
  ],
};

@$core.Deprecated('Use chainsAndBoutiquesAccessDescriptor instead')
const ChainsAndBoutiquesAccess_StandardAccess$json = {
  '1': 'StandardAccess',
  '2': [
    {'1': 'chainIds', '3': 1, '4': 1, '5': 11, '6': '.weebi.user.permissions.ChainIds', '10': 'boutiqueIds'},
    {'1': 'boutiqueIds', '3': 2, '4': 1, '5': 11, '6': '.weebi.user.permissions.BoutiqueIds', '10': 'boutiqueIds'},
  ],
};

@$core.Deprecated('Use chainsAndBoutiquesAccessDescriptor instead')
const ChainsAndBoutiquesAccess_FullAccess$json = {
  '1': 'FullAccess',
  '2': [
    {'1': 'hasFullAccess', '3': 1, '4': 1, '5': 8, '10': 'hasFullAccess'},
  ],
};

/// Descriptor for `ChainsAndBoutiquesAccess`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainsAndBoutiquesAccessDescriptor = $convert.base64Decode(
    'ChhDaGFpbnNBbmRCb3V0aXF1ZXNBY2Nlc3MSaQoOc3RhbmRhcmRBY2Nlc3MYASABKAsyPy53ZW'
    'ViaS51c2VyLnBlcm1pc3Npb25zLkNoYWluc0FuZEJvdXRpcXVlc0FjY2Vzcy5TdGFuZGFyZEFj'
    'Y2Vzc0gAUg5zdGFuZGFyZEFjY2VzcxJdCgpmdWxsQWNjZXNzGAIgASgLMjsud2VlYmkudXNlci'
    '5wZXJtaXNzaW9ucy5DaGFpbnNBbmRCb3V0aXF1ZXNBY2Nlc3MuRnVsbEFjY2Vzc0gAUgpmdWxs'
    'QWNjZXNzGpgBCg5TdGFuZGFyZEFjY2VzcxI/CghjaGFpbklkcxgBIAEoCzIgLndlZWJpLnVzZX'
    'IucGVybWlzc2lvbnMuQ2hhaW5JZHNSC2JvdXRpcXVlSWRzEkUKC2JvdXRpcXVlSWRzGAIgASgL'
    'MiMud2VlYmkudXNlci5wZXJtaXNzaW9ucy5Cb3V0aXF1ZUlkc1ILYm91dGlxdWVJZHMaMgoKRn'
    'VsbEFjY2VzcxIkCg1oYXNGdWxsQWNjZXNzGAEgASgIUg1oYXNGdWxsQWNjZXNzQggKBmFjY2Vz'
    'cw==');

@$core.Deprecated('Use chainIdsDescriptor instead')
const ChainIds$json = {
  '1': 'ChainIds',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `ChainIds`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainIdsDescriptor = $convert.base64Decode(
    'CghDaGFpbklkcxIQCgNpZHMYASADKAlSA2lkcw==');

@$core.Deprecated('Use boutiqueIdsDescriptor instead')
const BoutiqueIds$json = {
  '1': 'BoutiqueIds',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `BoutiqueIds`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boutiqueIdsDescriptor = $convert.base64Decode(
    'CgtCb3V0aXF1ZUlkcxIQCgNpZHMYASADKAlSA2lkcw==');

@$core.Deprecated('Use userPermissionsDescriptor instead')
const UserPermissions$json = {
  '1': 'UserPermissions',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'firmId', '3': 2, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'hasAllChainsAccess', '3': 3, '4': 1, '5': 8, '10': 'hasAllChainsAccess'},
    {'1': 'chainIds', '3': 4, '4': 1, '5': 11, '6': '.weebi.user.permissions.ChainIds', '10': 'chainIds'},
    {'1': 'boutiqueIds', '3': 5, '4': 1, '5': 11, '6': '.weebi.user.permissions.BoutiqueIds', '10': 'boutiqueIds'},
    {'1': 'ticketRights', '3': 6, '4': 1, '5': 11, '6': '.weebi.user.permissions.TicketRights', '10': 'ticketRights'},
    {'1': 'contactRights', '3': 7, '4': 1, '5': 11, '6': '.weebi.user.permissions.ContactRights', '10': 'contactRights'},
    {'1': 'articleRights', '3': 8, '4': 1, '5': 11, '6': '.weebi.user.permissions.ArticleRights', '10': 'articleRights'},
    {'1': 'boutiqueRights', '3': 9, '4': 1, '5': 11, '6': '.weebi.user.permissions.BoutiqueRights', '10': 'boutiqueRights'},
    {'1': 'chainRights', '3': 10, '4': 1, '5': 11, '6': '.weebi.user.permissions.MallRights', '10': 'mallRights'},
    {'1': 'firmRights', '3': 11, '4': 1, '5': 11, '6': '.weebi.user.permissions.FirmRights', '10': 'firmRights'},
    {'1': 'userManagementRights', '3': 12, '4': 1, '5': 11, '6': '.weebi.user.permissions.UserManagementRights', '10': 'userManagementRights'},
    {'1': 'billingRights', '3': 13, '4': 1, '5': 11, '6': '.weebi.user.permissions.BillingRights', '10': 'billingRights'},
    {'1': 'boolRights', '3': 14, '4': 1, '5': 11, '6': '.weebi.user.permissions.BoolRights', '10': 'boolRights'},
  ],
  '9': [
    {'1': 15, '2': 99},
  ],
};

/// Descriptor for `UserPermissions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userPermissionsDescriptor = $convert.base64Decode(
    'Cg9Vc2VyUGVybWlzc2lvbnMSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSFgoGZmlybUlkGAIgAS'
    'gJUgZmaXJtSWQSLgoSaGFzQWxsQ2hhaW5zQWNjZXNzGAMgASgIUhJoYXNBbGxDaGFpbnNBY2Nl'
    'c3MSPAoIY2hhaW5JZHMYBCABKAsyIC53ZWViaS51c2VyLnBlcm1pc3Npb25zLkNoYWluSWRzUg'
    'hjaGFpbklkcxJFCgtib3V0aXF1ZUlkcxgFIAEoCzIjLndlZWJpLnVzZXIucGVybWlzc2lvbnMu'
    'Qm91dGlxdWVJZHNSC2JvdXRpcXVlSWRzEkgKDHRpY2tldFJpZ2h0cxgGIAEoCzIkLndlZWJpLn'
    'VzZXIucGVybWlzc2lvbnMuVGlja2V0UmlnaHRzUgx0aWNrZXRSaWdodHMSSwoNY29udGFjdFJp'
    'Z2h0cxgHIAEoCzIlLndlZWJpLnVzZXIucGVybWlzc2lvbnMuQ29udGFjdFJpZ2h0c1INY29udG'
    'FjdFJpZ2h0cxJLCg1hcnRpY2xlUmlnaHRzGAggASgLMiUud2VlYmkudXNlci5wZXJtaXNzaW9u'
    'cy5BcnRpY2xlUmlnaHRzUg1hcnRpY2xlUmlnaHRzEk4KDmJvdXRpcXVlUmlnaHRzGAkgASgLMi'
    'Yud2VlYmkudXNlci5wZXJtaXNzaW9ucy5Cb3V0aXF1ZVJpZ2h0c1IOYm91dGlxdWVSaWdodHMS'
    'QwoLY2hhaW5SaWdodHMYCiABKAsyIi53ZWViaS51c2VyLnBlcm1pc3Npb25zLk1hbGxSaWdodH'
    'NSCm1hbGxSaWdodHMSQgoKZmlybVJpZ2h0cxgLIAEoCzIiLndlZWJpLnVzZXIucGVybWlzc2lv'
    'bnMuRmlybVJpZ2h0c1IKZmlybVJpZ2h0cxJgChR1c2VyTWFuYWdlbWVudFJpZ2h0cxgMIAEoCz'
    'IsLndlZWJpLnVzZXIucGVybWlzc2lvbnMuVXNlck1hbmFnZW1lbnRSaWdodHNSFHVzZXJNYW5h'
    'Z2VtZW50UmlnaHRzEksKDWJpbGxpbmdSaWdodHMYDSABKAsyJS53ZWViaS51c2VyLnBlcm1pc3'
    'Npb25zLkJpbGxpbmdSaWdodHNSDWJpbGxpbmdSaWdodHMSQgoKYm9vbFJpZ2h0cxgOIAEoCzIi'
    'LndlZWJpLnVzZXIucGVybWlzc2lvbnMuQm9vbFJpZ2h0c1IKYm9vbFJpZ2h0c0oECA8QYw==');

@$core.Deprecated('Use articleRightsDescriptor instead')
const ArticleRights$json = {
  '1': 'ArticleRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.permissions.Right', '10': 'articleRights'},
  ],
};

/// Descriptor for `ArticleRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleRightsDescriptor = $convert.base64Decode(
    'Cg1BcnRpY2xlUmlnaHRzEjwKBnJpZ2h0cxgBIAMoDjIdLndlZWJpLnVzZXIucGVybWlzc2lvbn'
    'MuUmlnaHRSDWFydGljbGVSaWdodHM=');

@$core.Deprecated('Use boutiqueRightsDescriptor instead')
const BoutiqueRights$json = {
  '1': 'BoutiqueRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.permissions.Right', '10': 'boutiqueRights'},
  ],
};

/// Descriptor for `BoutiqueRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boutiqueRightsDescriptor = $convert.base64Decode(
    'Cg5Cb3V0aXF1ZVJpZ2h0cxI9CgZyaWdodHMYASADKA4yHS53ZWViaS51c2VyLnBlcm1pc3Npb2'
    '5zLlJpZ2h0Ug5ib3V0aXF1ZVJpZ2h0cw==');

@$core.Deprecated('Use mallRightsDescriptor instead')
const MallRights$json = {
  '1': 'MallRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.permissions.Right', '10': 'mallRights'},
  ],
};

/// Descriptor for `MallRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mallRightsDescriptor = $convert.base64Decode(
    'CgpNYWxsUmlnaHRzEjkKBnJpZ2h0cxgBIAMoDjIdLndlZWJpLnVzZXIucGVybWlzc2lvbnMuUm'
    'lnaHRSCm1hbGxSaWdodHM=');

@$core.Deprecated('Use firmRightsDescriptor instead')
const FirmRights$json = {
  '1': 'FirmRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.permissions.Right', '10': 'firmRights'},
  ],
};

/// Descriptor for `FirmRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List firmRightsDescriptor = $convert.base64Decode(
    'CgpGaXJtUmlnaHRzEjkKBnJpZ2h0cxgBIAMoDjIdLndlZWJpLnVzZXIucGVybWlzc2lvbnMuUm'
    'lnaHRSCmZpcm1SaWdodHM=');

@$core.Deprecated('Use contactRightsDescriptor instead')
const ContactRights$json = {
  '1': 'ContactRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.permissions.Right', '10': 'contactRights'},
  ],
};

/// Descriptor for `ContactRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactRightsDescriptor = $convert.base64Decode(
    'Cg1Db250YWN0UmlnaHRzEjwKBnJpZ2h0cxgBIAMoDjIdLndlZWJpLnVzZXIucGVybWlzc2lvbn'
    'MuUmlnaHRSDWNvbnRhY3RSaWdodHM=');

@$core.Deprecated('Use ticketRightsDescriptor instead')
const TicketRights$json = {
  '1': 'TicketRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.permissions.Right', '10': 'ticketRights'},
  ],
};

/// Descriptor for `TicketRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketRightsDescriptor = $convert.base64Decode(
    'CgxUaWNrZXRSaWdodHMSOwoGcmlnaHRzGAEgAygOMh0ud2VlYmkudXNlci5wZXJtaXNzaW9ucy'
    '5SaWdodFIMdGlja2V0UmlnaHRz');

@$core.Deprecated('Use userManagementRightsDescriptor instead')
const UserManagementRights$json = {
  '1': 'UserManagementRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.permissions.Right', '10': 'userManagementRights'},
  ],
};

/// Descriptor for `UserManagementRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userManagementRightsDescriptor = $convert.base64Decode(
    'ChRVc2VyTWFuYWdlbWVudFJpZ2h0cxJDCgZyaWdodHMYASADKA4yHS53ZWViaS51c2VyLnBlcm'
    '1pc3Npb25zLlJpZ2h0UhR1c2VyTWFuYWdlbWVudFJpZ2h0cw==');

@$core.Deprecated('Use billingRightsDescriptor instead')
const BillingRights$json = {
  '1': 'BillingRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.permissions.Right', '10': 'billingRights'},
  ],
};

/// Descriptor for `BillingRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List billingRightsDescriptor = $convert.base64Decode(
    'Cg1CaWxsaW5nUmlnaHRzEjwKBnJpZ2h0cxgBIAMoDjIdLndlZWJpLnVzZXIucGVybWlzc2lvbn'
    'MuUmlnaHRSDWJpbGxpbmdSaWdodHM=');

@$core.Deprecated('Use boolRightsDescriptor instead')
const BoolRights$json = {
  '1': 'BoolRights',
  '2': [
    {'1': 'canSeeStats', '3': 1, '4': 1, '5': 8, '10': 'canSeeStats'},
    {'1': 'canExportData', '3': 2, '4': 1, '5': 8, '10': 'canExportData'},
    {'1': 'canGiveDiscount', '3': 3, '4': 1, '5': 8, '10': 'canGiveDiscount'},
    {'1': 'canSetPromo', '3': 4, '4': 1, '5': 8, '10': 'canSetPromo'},
    {'1': 'canStockMovement', '3': 5, '4': 1, '5': 8, '10': 'canStockMovement'},
    {'1': 'canStockInventory', '3': 6, '4': 1, '5': 8, '10': 'canStockInventory'},
    {'1': 'canQuickSpend', '3': 7, '4': 1, '5': 8, '10': 'canQuickSpend'},
    {'1': 'canPurchase', '3': 8, '4': 1, '5': 8, '10': 'canPurchase'},
    {'1': 'canImportTickets', '3': 9, '4': 1, '5': 8, '10': 'canImportTickets'},
  ],
};

/// Descriptor for `BoolRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boolRightsDescriptor = $convert.base64Decode(
    'CgpCb29sUmlnaHRzEiAKC2NhblNlZVN0YXRzGAEgASgIUgtjYW5TZWVTdGF0cxIkCg1jYW5FeH'
    'BvcnREYXRhGAIgASgIUg1jYW5FeHBvcnREYXRhEigKD2NhbkdpdmVEaXNjb3VudBgDIAEoCFIP'
    'Y2FuR2l2ZURpc2NvdW50EiAKC2NhblNldFByb21vGAQgASgIUgtjYW5TZXRQcm9tbxIqChBjYW'
    '5TdG9ja01vdmVtZW50GAUgASgIUhBjYW5TdG9ja01vdmVtZW50EiwKEWNhblN0b2NrSW52ZW50'
    'b3J5GAYgASgIUhFjYW5TdG9ja0ludmVudG9yeRIkCg1jYW5RdWlja1NwZW5kGAcgASgIUg1jYW'
    '5RdWlja1NwZW5kEiAKC2NhblB1cmNoYXNlGAggASgIUgtjYW5QdXJjaGFzZRIqChBjYW5JbXBv'
    'cnRUaWNrZXRzGAkgASgIUhBjYW5JbXBvcnRUaWNrZXRz');

