import 'package:boutique_service/boutique_service.dart';
import 'package:test/test.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:user_service/user_service.dart';
import 'package:user_service/user_testing.dart';

void main() async {
  final db = TestHelper.localDb;

  final connection = Connection(ConnectionManager(db));

  String firmOid = '';
  String chainOid = '';

  late BoutiqueService boutiqueService;

  setUpAll(() async {
    await db.open();
    boutiqueService = BoutiqueService(
      db,
      isTest: true,
      userPermissionIfTest: UserPrivateDummy.adminPermission,
    );
    await db.collection(boutiqueService.collection.collectionName).drop();
    await db.createCollection(boutiqueService.collection.collectionName);
  });

  tearDownAll(() async {
    await db.collection(boutiqueService.collection.collectionName).drop();
    await connection.close();
  });

  test('test createOneFirm ', () async {
    // ignore: unused_local_variable
    final response =
        await boutiqueService.createOneFirm(null, FirmDummy.firmNoId);
    expect(response.type, StatusResponse_Type.CREATED);
    final userPermissionsUpdated = UserPrivateDummy.adminPermission;
    userPermissionsUpdated.firmOid = response.message;
    boutiqueService..userPermissionIfTest = userPermissionsUpdated;
  });
  test('test readOneFirm', () async {
    final response = await boutiqueService.readOneFirm(null, Empty());
    expect(response.chains, FirmDummy.firmNoId.chains);
    expect(response.isMailVerified, FirmDummy.firmNoId.isMailVerified);
    expect(
        response.lastUpdatedByUserOid, FirmDummy.firmNoId.lastUpdatedByUserOid);
    expect(response.name, FirmDummy.firmNoId.name);
    expect(response.status, FirmDummy.firmNoId.status);
    expect(response.statusUpdateTimestampUTC,
        FirmDummy.firmNoId.statusUpdateTimestampUTC);
    expect(response.subscriptionPlan, FirmDummy.firmNoId.subscriptionPlan);
    expect(response.lastUpdateTimestampUTC,
        FirmDummy.firmNoId.lastUpdateTimestampUTC);
    firmOid = response.id.oid;
    chainOid = response.chains.first.id.oid;
  });
  test('test upsertOneChain', () async {
    var userService = UserService(
      db,
      boutiqueService,
      isTest: true,
      userPermissionIfTest: UserPrivateDummy.adminPermission,
    );
    final responseUser =
        await userService.createOne(null, UserPrivateDummy.userNoId);
    UserPrivateDummy.adminPermission.firmOid = firmOid;
    UserPrivateDummy.adminPermission.chainsAccessible = Oids(oids: [chainOid]);
    UserPrivateDummy.adminPermission.userOid = responseUser.id;
    //userService..userPermissionIfTest = UserDummy.adminPermission;
    boutiqueService..userPermissionIfTest = UserPrivateDummy.adminPermission;

    final liliChain = ChainDummy.chainNoId;
    liliChain
      ..name = 'Lili chain'
      ..firmOid = firmOid
      ..id = ObjectIdProto(oid: chainOid);

    final response = await boutiqueService.updateOneChain(null, liliChain);
    expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await boutiqueService.readOneFirm(null, Empty());
    expect(response2.chains.first.name, 'Lili chain');
  });

  test('test upsertOneBoutique', () async {
    final boutiqueLili = BoutiqueDummy.boutique;
    boutiqueLili.name = 'Lili boutique';

    final response =
        await boutiqueService.updateOneBoutique(null, boutiqueLili);
    expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await boutiqueService.readOneFirm(null, Empty());
    expect(response2.chains.first.boutiques.first.name, 'Lili boutique');
  });
}
