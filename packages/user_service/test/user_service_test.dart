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
  String userOid = '';

  setUpAll(() async {
    await db.open();
    final isConnected = await connection.connect();
    expect(isConnected, true);
    boutiqueService = BoutiqueService(
      db,
      isTest: true,
      userPermissionIfTest: UserDummy.adminPermission,
    );
    userService = UserService(
      db,
      boutiqueService,
      isTest: true,
      userPermissionIfTest: UserDummy.adminPermission,
    );
    await db.createCollection(userService.collection.collectionName);
    await db.createCollection(boutiqueService.collection.collectionName);
    final responseUser = await userService.createOne(null, UserDummy.userNoId);
    final response =
        await boutiqueService.createOneFirm(null, FirmDummy.firmNoId);

    expect(response.type, StatusResponse_Type.CREATED);
    final firmOid = response.id;
    UserDummy.adminPermission.firmOid = firmOid;
    UserDummy.adminPermission.userOid = responseUser.id;
    userOid = responseUser.id;

    userService..userPermissionIfTest = UserDummy.adminPermission;
  });

  tearDownAll(() async {
    await db.collection(userService.collection.collectionName).drop();
    await connection.close();
  });

  test('test replaceOne', () async {
    final userLili = UserInfo()
      ..firstname = 'lili'
      ..lastname = 'biscuit'
      ..userOid = userOid;
    final response = await userService.updateOne(null, userLili);

    expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await userService.readOne(null, UserOid(oid: userOid));
    expect(response2.firstname, 'lili');
    expect(response2.lastname, 'biscuit');
  });
}
