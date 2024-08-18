// import 'dart:io';

import 'dart:math';

import 'package:fence_service/fence_service.dart';
import 'package:fence_service/user_testing.dart';

import 'package:test/test.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

void main() async {
  final db = TestHelper.localDb;
  final connection = Connection(ConnectionManager(db));
  late FenceService fenceService;
  String userId = '';

  setUpAll(() async {
    await db.open();
    final isConnected = await connection.connect();
    expect(isConnected, true);
    fenceService = FenceService(db, isMock: false); // we do not mock signup
    await db.createCollection(fenceService.userCollection.collectionName);
    await db.createCollection(fenceService.boutiqueCollection.collectionName);
  });

  tearDownAll(() async {
    await db.collection(fenceService.userCollection.collectionName).drop();
    await db.collection(fenceService.boutiqueCollection.collectionName).drop();
    await connection.close();
  });

  test('test replaceOne user', () async {
    final permissions = UserPermissions.create()..userId = userId;
    final userLili = UserPublic()
      ..firstname = 'lili'
      ..lastname = 'biscuit'
      ..permissions = permissions;
    final response = await fenceService.updateOneUser(null, userLili);

    expect(response.type, StatusResponse_Type.UPDATED);
    final response2 =
        await fenceService.readOneUser(null, UserId(userId: userId));
    expect(response2.firstname, 'lili');
    expect(response2.lastname, 'biscuit');
  });
}
