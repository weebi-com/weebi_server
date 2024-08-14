// import 'dart:io';
import 'package:boutique_service/boutique_service.dart';
import 'package:user_service/user_service.dart';
import 'package:user_service/user_testing.dart';

import 'package:test/test.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

void main() async {
  final db = TestHelper.localDb;

  final connection = Connection(ConnectionManager(db));
  late UserService userService;
  late BoutiqueService boutiqueService;
  String userId = '';

  setUpAll(() async {
    await db.open();
    final isConnected = await connection.connect();
    expect(isConnected, true);
    boutiqueService = BoutiqueService(
      db,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    userService = UserService(
      db,
      boutiqueService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.createCollection(userService.collection.collectionName);
    await db.createCollection(boutiqueService.collection.collectionName);
    final responseUser = await userService.createOne(
        null,
        CreateOneRequest(
          userInfo: Dummy.userInfoNoId,
          password: '1234',
        ));
    final response = await boutiqueService.createOneFirm(null, Dummy.firmNoId);

    expect(response.type, StatusResponse_Type.CREATED);
    final firmId = response.id;
    Dummy.adminPermission.firmId = firmId;
    Dummy.adminPermission.userId = responseUser.id;
    userId = responseUser.id;

    userService..userPermissionIfTest = Dummy.adminPermission;
  });

  tearDownAll(() async {
    await db.collection(userService.collection.collectionName).drop();
    await connection.close();
  });

  test('test replaceOne', () async {
    final permissions = UserPermissions.create()..userId = userId;
    final userLili = UserInfo()
      ..firstname = 'lili'
      ..lastname = 'biscuit'
      ..permissions = permissions;
    final response = await userService.updateOne(null, userLili);

    expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await userService.readOne(null, UserId(userId: userId));
    expect(response2.firstname, 'lili');
    expect(response2.lastname, 'biscuit');
  });
}
