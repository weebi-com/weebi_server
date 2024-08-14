//
//  Generated code. Do not modify.
//  source: user.proto
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

@$core.Deprecated('Use userPermissionsDescriptor instead')
const UserPermissions$json = {
  '1': 'UserPermissions',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'firmId', '3': 2, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainsAccessible', '3': 3, '4': 1, '5': 11, '6': '.weebi.user.Ids', '10': 'chainsAccessible'},
    {'1': 'boutiquesAccessible', '3': 4, '4': 1, '5': 11, '6': '.weebi.user.Ids', '10': 'boutiquesAccessible'},
    {'1': 'ticketRights', '3': 5, '4': 1, '5': 11, '6': '.weebi.user.TicketRights', '10': 'ticketRights'},
    {'1': 'contactRights', '3': 6, '4': 1, '5': 11, '6': '.weebi.user.ContactRights', '10': 'contactRights'},
    {'1': 'articleRights', '3': 7, '4': 1, '5': 11, '6': '.weebi.user.ArticleRights', '10': 'articleRights'},
    {'1': 'boutiqueRights', '3': 8, '4': 1, '5': 11, '6': '.weebi.user.BoutiqueRights', '10': 'boutiqueRights'},
    {'1': 'chainRights', '3': 9, '4': 1, '5': 11, '6': '.weebi.user.MallRights', '10': 'mallRights'},
    {'1': 'firmRights', '3': 10, '4': 1, '5': 11, '6': '.weebi.user.FirmRights', '10': 'firmRights'},
    {'1': 'userManagementRights', '3': 11, '4': 1, '5': 11, '6': '.weebi.user.UserManagementRights', '10': 'userManagementRights'},
    {'1': 'boolRights', '3': 12, '4': 1, '5': 11, '6': '.weebi.user.BoolRights', '10': 'boolRights'},
  ],
};

/// Descriptor for `UserPermissions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userPermissionsDescriptor = $convert.base64Decode(
    'Cg9Vc2VyUGVybWlzc2lvbnMSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSFgoGZmlybUlkGAIgAS'
    'gJUgZmaXJtSWQSOwoQY2hhaW5zQWNjZXNzaWJsZRgDIAEoCzIPLndlZWJpLnVzZXIuSWRzUhBj'
    'aGFpbnNBY2Nlc3NpYmxlEkEKE2JvdXRpcXVlc0FjY2Vzc2libGUYBCABKAsyDy53ZWViaS51c2'
    'VyLklkc1ITYm91dGlxdWVzQWNjZXNzaWJsZRI8Cgx0aWNrZXRSaWdodHMYBSABKAsyGC53ZWVi'
    'aS51c2VyLlRpY2tldFJpZ2h0c1IMdGlja2V0UmlnaHRzEj8KDWNvbnRhY3RSaWdodHMYBiABKA'
    'syGS53ZWViaS51c2VyLkNvbnRhY3RSaWdodHNSDWNvbnRhY3RSaWdodHMSPwoNYXJ0aWNsZVJp'
    'Z2h0cxgHIAEoCzIZLndlZWJpLnVzZXIuQXJ0aWNsZVJpZ2h0c1INYXJ0aWNsZVJpZ2h0cxJCCg'
    '5ib3V0aXF1ZVJpZ2h0cxgIIAEoCzIaLndlZWJpLnVzZXIuQm91dGlxdWVSaWdodHNSDmJvdXRp'
    'cXVlUmlnaHRzEjcKC2NoYWluUmlnaHRzGAkgASgLMhYud2VlYmkudXNlci5NYWxsUmlnaHRzUg'
    'ptYWxsUmlnaHRzEjYKCmZpcm1SaWdodHMYCiABKAsyFi53ZWViaS51c2VyLkZpcm1SaWdodHNS'
    'CmZpcm1SaWdodHMSVAoUdXNlck1hbmFnZW1lbnRSaWdodHMYCyABKAsyIC53ZWViaS51c2VyLl'
    'VzZXJNYW5hZ2VtZW50UmlnaHRzUhR1c2VyTWFuYWdlbWVudFJpZ2h0cxI2Cgpib29sUmlnaHRz'
    'GAwgASgLMhYud2VlYmkudXNlci5Cb29sUmlnaHRzUgpib29sUmlnaHRz');

@$core.Deprecated('Use articleRightsDescriptor instead')
const ArticleRights$json = {
  '1': 'ArticleRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.Right', '10': 'articleRights'},
  ],
};

/// Descriptor for `ArticleRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleRightsDescriptor = $convert.base64Decode(
    'Cg1BcnRpY2xlUmlnaHRzEjAKBnJpZ2h0cxgBIAMoDjIRLndlZWJpLnVzZXIuUmlnaHRSDWFydG'
    'ljbGVSaWdodHM=');

@$core.Deprecated('Use boutiqueRightsDescriptor instead')
const BoutiqueRights$json = {
  '1': 'BoutiqueRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.Right', '10': 'boutiqueRights'},
  ],
};

/// Descriptor for `BoutiqueRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boutiqueRightsDescriptor = $convert.base64Decode(
    'Cg5Cb3V0aXF1ZVJpZ2h0cxIxCgZyaWdodHMYASADKA4yES53ZWViaS51c2VyLlJpZ2h0Ug5ib3'
    'V0aXF1ZVJpZ2h0cw==');

@$core.Deprecated('Use mallRightsDescriptor instead')
const MallRights$json = {
  '1': 'MallRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.Right', '10': 'mallRights'},
  ],
};

/// Descriptor for `MallRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mallRightsDescriptor = $convert.base64Decode(
    'CgpNYWxsUmlnaHRzEi0KBnJpZ2h0cxgBIAMoDjIRLndlZWJpLnVzZXIuUmlnaHRSCm1hbGxSaW'
    'dodHM=');

@$core.Deprecated('Use firmRightsDescriptor instead')
const FirmRights$json = {
  '1': 'FirmRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.Right', '10': 'firmRights'},
  ],
};

/// Descriptor for `FirmRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List firmRightsDescriptor = $convert.base64Decode(
    'CgpGaXJtUmlnaHRzEi0KBnJpZ2h0cxgBIAMoDjIRLndlZWJpLnVzZXIuUmlnaHRSCmZpcm1SaW'
    'dodHM=');

@$core.Deprecated('Use contactRightsDescriptor instead')
const ContactRights$json = {
  '1': 'ContactRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.Right', '10': 'contactRights'},
  ],
};

/// Descriptor for `ContactRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactRightsDescriptor = $convert.base64Decode(
    'Cg1Db250YWN0UmlnaHRzEjAKBnJpZ2h0cxgBIAMoDjIRLndlZWJpLnVzZXIuUmlnaHRSDWNvbn'
    'RhY3RSaWdodHM=');

@$core.Deprecated('Use ticketRightsDescriptor instead')
const TicketRights$json = {
  '1': 'TicketRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.Right', '10': 'ticketRights'},
  ],
};

/// Descriptor for `TicketRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketRightsDescriptor = $convert.base64Decode(
    'CgxUaWNrZXRSaWdodHMSLwoGcmlnaHRzGAEgAygOMhEud2VlYmkudXNlci5SaWdodFIMdGlja2'
    'V0UmlnaHRz');

@$core.Deprecated('Use userManagementRightsDescriptor instead')
const UserManagementRights$json = {
  '1': 'UserManagementRights',
  '2': [
    {'1': 'rights', '3': 1, '4': 3, '5': 14, '6': '.weebi.user.Right', '10': 'userManagementRights'},
  ],
};

/// Descriptor for `UserManagementRights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userManagementRightsDescriptor = $convert.base64Decode(
    'ChRVc2VyTWFuYWdlbWVudFJpZ2h0cxI3CgZyaWdodHMYASADKA4yES53ZWViaS51c2VyLlJpZ2'
    'h0UhR1c2VyTWFuYWdlbWVudFJpZ2h0cw==');

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

@$core.Deprecated('Use idsDescriptor instead')
const Ids$json = {
  '1': 'Ids',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `Ids`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List idsDescriptor = $convert.base64Decode(
    'CgNJZHMSEAoDaWRzGAEgAygJUgNpZHM=');

@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = {
  '1': 'UserInfo',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'mail', '3': 2, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'firstname', '3': 3, '4': 1, '5': 9, '10': 'firstname'},
    {'1': 'lastname', '3': 4, '4': 1, '5': 9, '10': 'lastname'},
    {'1': 'permissions', '3': 5, '4': 1, '5': 11, '6': '.weebi.user.UserPermissions', '10': 'permissions'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode(
    'CghVc2VySW5mbxIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBISCgRtYWlsGAIgASgJUgRtYWlsEh'
    'wKCWZpcnN0bmFtZRgDIAEoCVIJZmlyc3RuYW1lEhoKCGxhc3RuYW1lGAQgASgJUghsYXN0bmFt'
    'ZRI9CgtwZXJtaXNzaW9ucxgFIAEoCzIbLndlZWJpLnVzZXIuVXNlclBlcm1pc3Npb25zUgtwZX'
    'JtaXNzaW9ucw==');

@$core.Deprecated('Use userPrivateDescriptor instead')
const UserPrivate$json = {
  '1': 'UserPrivate',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'mail', '3': 2, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'passwordEncrypted', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {'1': 'firmId', '3': 4, '4': 1, '5': 9, '10': 'firmId'},
    {'1': 'chainIds', '3': 5, '4': 1, '5': 11, '6': '.weebi.user.Ids', '10': 'chainIds'},
    {'1': 'boutiqueIds', '3': 6, '4': 1, '5': 11, '6': '.weebi.user.Ids', '10': 'boutiqueIds'},
    {'1': 'articleRights', '3': 7, '4': 1, '5': 11, '6': '.weebi.user.ArticleRights', '10': 'articleRights'},
    {'1': 'boutiqueRights', '3': 8, '4': 1, '5': 11, '6': '.weebi.user.BoutiqueRights', '10': 'boutiqueRights'},
    {'1': 'firmRights', '3': 9, '4': 1, '5': 11, '6': '.weebi.user.FirmRights', '10': 'firmRights'},
    {'1': 'chainRights', '3': 10, '4': 1, '5': 11, '6': '.weebi.user.MallRights', '10': 'mallRights'},
    {'1': 'contactRights', '3': 11, '4': 1, '5': 11, '6': '.weebi.user.ContactRights', '10': 'contactRights'},
    {'1': 'ticketRights', '3': 12, '4': 1, '5': 11, '6': '.weebi.user.TicketRights', '10': 'ticketRights'},
    {'1': 'userManagementRights', '3': 13, '4': 1, '5': 11, '6': '.weebi.user.UserManagementRights', '10': 'userManagementRights'},
    {'1': 'boolRights', '3': 14, '4': 1, '5': 11, '6': '.weebi.user.BoolRights', '10': 'boolRights'},
    {'1': 'lastUpdatedByuserId', '3': 15, '4': 1, '5': 9, '10': 'lastUpdatedByuserId'},
    {'1': 'lastUpdateTimestampUTC', '3': 16, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastUpdateTimestampUTC'},
    {'1': 'firstname', '3': 17, '4': 1, '5': 9, '10': 'firstname'},
    {'1': 'lastname', '3': 18, '4': 1, '5': 9, '10': 'lastname'},
  ],
};

/// Descriptor for `UserPrivate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userPrivateDescriptor = $convert.base64Decode(
    'CgtVc2VyUHJpdmF0ZRIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBISCgRtYWlsGAIgASgJUgRtYW'
    'lsEiMKEXBhc3N3b3JkRW5jcnlwdGVkGAMgASgJUghwYXNzd29yZBIWCgZmaXJtSWQYBCABKAlS'
    'BmZpcm1JZBIrCghjaGFpbklkcxgFIAEoCzIPLndlZWJpLnVzZXIuSWRzUghjaGFpbklkcxIxCg'
    'tib3V0aXF1ZUlkcxgGIAEoCzIPLndlZWJpLnVzZXIuSWRzUgtib3V0aXF1ZUlkcxI/Cg1hcnRp'
    'Y2xlUmlnaHRzGAcgASgLMhkud2VlYmkudXNlci5BcnRpY2xlUmlnaHRzUg1hcnRpY2xlUmlnaH'
    'RzEkIKDmJvdXRpcXVlUmlnaHRzGAggASgLMhoud2VlYmkudXNlci5Cb3V0aXF1ZVJpZ2h0c1IO'
    'Ym91dGlxdWVSaWdodHMSNgoKZmlybVJpZ2h0cxgJIAEoCzIWLndlZWJpLnVzZXIuRmlybVJpZ2'
    'h0c1IKZmlybVJpZ2h0cxI3CgtjaGFpblJpZ2h0cxgKIAEoCzIWLndlZWJpLnVzZXIuTWFsbFJp'
    'Z2h0c1IKbWFsbFJpZ2h0cxI/Cg1jb250YWN0UmlnaHRzGAsgASgLMhkud2VlYmkudXNlci5Db2'
    '50YWN0UmlnaHRzUg1jb250YWN0UmlnaHRzEjwKDHRpY2tldFJpZ2h0cxgMIAEoCzIYLndlZWJp'
    'LnVzZXIuVGlja2V0UmlnaHRzUgx0aWNrZXRSaWdodHMSVAoUdXNlck1hbmFnZW1lbnRSaWdodH'
    'MYDSABKAsyIC53ZWViaS51c2VyLlVzZXJNYW5hZ2VtZW50UmlnaHRzUhR1c2VyTWFuYWdlbWVu'
    'dFJpZ2h0cxI2Cgpib29sUmlnaHRzGA4gASgLMhYud2VlYmkudXNlci5Cb29sUmlnaHRzUgpib2'
    '9sUmlnaHRzEjAKE2xhc3RVcGRhdGVkQnl1c2VySWQYDyABKAlSE2xhc3RVcGRhdGVkQnl1c2Vy'
    'SWQSUgoWbGFzdFVwZGF0ZVRpbWVzdGFtcFVUQxgQIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW'
    '1lc3RhbXBSFmxhc3RVcGRhdGVUaW1lc3RhbXBVVEMSHAoJZmlyc3RuYW1lGBEgASgJUglmaXJz'
    'dG5hbWUSGgoIbGFzdG5hbWUYEiABKAlSCGxhc3RuYW1l');

