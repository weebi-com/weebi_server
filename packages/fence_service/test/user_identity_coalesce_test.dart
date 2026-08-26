import 'package:fence_service/src/user_perm_ext.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

void main() {
  group('coalesceUserIdentity', () {
    test('fills empty incoming firmId from documentFirmId', () {
      final incoming = UserPermissions.create()
        ..userId = 'u1'
        ..articleRights = ArticleRights(rights: [Right.read]);
      final existing = UserPermissions.create()
        ..userId = 'u1'
        ..firmId = 'firmA'
        ..articleRights = ArticleRights(rights: [Right.create, Right.read]);

      final result = coalesceUserIdentity(
        incoming,
        documentFirmId: 'firmA',
        existing: existing,
      );

      expect(result.firmId, 'firmA');
      expect(result.userId, 'u1');
      // Identity only — does not resurrect wiped rights
      expect(result.articleRights.rights, [Right.read]);
    });

    test('fills empty incoming firmId from existing when documentFirmId empty',
        () {
      final incoming = UserPermissions.create()..userId = 'u1';
      final existing = UserPermissions.create()
        ..userId = 'u1'
        ..firmId = 'firmB';

      final result = coalesceUserIdentity(
        incoming,
        documentFirmId: '',
        existing: existing,
      );

      expect(result.firmId, 'firmB');
    });

    test('does not overwrite non-empty incoming firmId', () {
      final incoming = UserPermissions.create()
        ..userId = 'u1'
        ..firmId = 'firmIncoming';
      final existing = UserPermissions.create()
        ..userId = 'u1'
        ..firmId = 'firmExisting';

      final result = coalesceUserIdentity(
        incoming,
        documentFirmId: 'firmDoc',
        existing: existing,
      );

      expect(result.firmId, 'firmIncoming');
    });

    test('fills empty incoming userId from existing', () {
      final incoming = UserPermissions.create()..firmId = 'firmA';
      final existing = UserPermissions.create()
        ..userId = 'uExisting'
        ..firmId = 'firmA';

      final result = coalesceUserIdentity(
        incoming,
        documentFirmId: 'firmA',
        existing: existing,
      );

      expect(result.userId, 'uExisting');
    });

    test('keeps isFirmCreator sticky true from existing', () {
      final incoming = UserPermissions.create()
        ..userId = 'boss'
        ..firmId = 'firmA'
        ..isFirmCreator = false;
      final existing = UserPermissions.create()
        ..userId = 'boss'
        ..firmId = 'firmA'
        ..isFirmCreator = true;

      final result = coalesceUserIdentity(
        incoming,
        documentFirmId: 'firmA',
        existing: existing,
      );

      expect(result.isFirmCreator, isTrue);
    });

    test('does not set isFirmCreator when existing is false', () {
      final incoming = UserPermissions.create()
        ..userId = 'u1'
        ..firmId = 'firmA';
      final existing = UserPermissions.create()
        ..userId = 'u1'
        ..firmId = 'firmA'
        ..isFirmCreator = false;

      final result = coalesceUserIdentity(
        incoming,
        documentFirmId: 'firmA',
        existing: existing,
      );

      expect(result.isFirmCreator, isFalse);
    });
  });
}
