//
//  Generated code. Do not modify.
//  source: user_permission.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userPermissionsDescriptor instead')
const UserPermissions$json = {
  '1': 'UserPermissions',
  '2': [
    {'1': 'userOid', '3': 1, '4': 1, '5': 9, '10': 'userOid'},
    {'1': 'firmOid', '3': 2, '4': 1, '5': 9, '10': 'firmOid'},
    {'1': 'chainsAccessible', '3': 3, '4': 1, '5': 11, '6': '.weebi.user.Oids', '10': 'chainsAccessible'},
    {'1': 'boutiquesAccessible', '3': 4, '4': 1, '5': 11, '6': '.weebi.user.Oids', '10': 'boutiquesAccessible'},
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
    'Cg9Vc2VyUGVybWlzc2lvbnMSGAoHdXNlck9pZBgBIAEoCVIHdXNlck9pZBIYCgdmaXJtT2lkGA'
    'IgASgJUgdmaXJtT2lkEjwKEGNoYWluc0FjY2Vzc2libGUYAyABKAsyEC53ZWViaS51c2VyLk9p'
    'ZHNSEGNoYWluc0FjY2Vzc2libGUSQgoTYm91dGlxdWVzQWNjZXNzaWJsZRgEIAEoCzIQLndlZW'
    'JpLnVzZXIuT2lkc1ITYm91dGlxdWVzQWNjZXNzaWJsZRI8Cgx0aWNrZXRSaWdodHMYBSABKAsy'
    'GC53ZWViaS51c2VyLlRpY2tldFJpZ2h0c1IMdGlja2V0UmlnaHRzEj8KDWNvbnRhY3RSaWdodH'
    'MYBiABKAsyGS53ZWViaS51c2VyLkNvbnRhY3RSaWdodHNSDWNvbnRhY3RSaWdodHMSPwoNYXJ0'
    'aWNsZVJpZ2h0cxgHIAEoCzIZLndlZWJpLnVzZXIuQXJ0aWNsZVJpZ2h0c1INYXJ0aWNsZVJpZ2'
    'h0cxJCCg5ib3V0aXF1ZVJpZ2h0cxgIIAEoCzIaLndlZWJpLnVzZXIuQm91dGlxdWVSaWdodHNS'
    'DmJvdXRpcXVlUmlnaHRzEjcKC2NoYWluUmlnaHRzGAkgASgLMhYud2VlYmkudXNlci5NYWxsUm'
    'lnaHRzUgptYWxsUmlnaHRzEjYKCmZpcm1SaWdodHMYCiABKAsyFi53ZWViaS51c2VyLkZpcm1S'
    'aWdodHNSCmZpcm1SaWdodHMSVAoUdXNlck1hbmFnZW1lbnRSaWdodHMYCyABKAsyIC53ZWViaS'
    '51c2VyLlVzZXJNYW5hZ2VtZW50UmlnaHRzUhR1c2VyTWFuYWdlbWVudFJpZ2h0cxI2Cgpib29s'
    'UmlnaHRzGAwgASgLMhYud2VlYmkudXNlci5Cb29sUmlnaHRzUgpib29sUmlnaHRz');

