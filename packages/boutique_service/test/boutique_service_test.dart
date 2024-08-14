import 'package:boutique_service/boutique_service.dart';
import 'package:test/test.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:user_service/user_service.dart';
import 'package:user_service/user_testing.dart';

void main() async {
  final db = TestHelper.localDb;

  final connection = Connection(ConnectionManager(db));

  String firmId = '';
  String chainId = '';
  String boutiqueId = '';

  late BoutiqueService boutiqueService;

  setUpAll(() async {
    await db.open();
    boutiqueService = BoutiqueService(
      db,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
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
    final response = await boutiqueService.createOneFirm(null, Dummy.firmNoId);
    expect(response.type, StatusResponse_Type.CREATED);
    final userPermissionsUpdated = Dummy.adminPermission;
    userPermissionsUpdated.firmId = response.id;
    boutiqueService..userPermissionIfTest = userPermissionsUpdated;
  });
  test('test readOneFirm', () async {
    final response = await boutiqueService.readOneFirm(null, Empty());
    expect(response.chains, Dummy.firmNoId.chains);
    expect(response.isMailVerified, Dummy.firmNoId.isMailVerified);
    expect(response.lastUpdatedByuserId, Dummy.firmNoId.lastUpdatedByuserId);
    expect(response.name, Dummy.firmNoId.name);
    expect(response.status, Dummy.firmNoId.status);
    expect(response.statusUpdateTimestampUTC,
        Dummy.firmNoId.statusUpdateTimestampUTC);
    expect(response.subscriptionPlan, Dummy.firmNoId.subscriptionPlan);
    expect(
        response.lastUpdateTimestampUTC, Dummy.firmNoId.lastUpdateTimestampUTC);
    firmId = response.firmId;
    chainId = response.chains.first.chainId;
    boutiqueId = response.chains.first.boutiques.first.boutiqueId;
  });
  test('test upsertOneChain', () async {
    var userService = UserService(
      db,
      boutiqueService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission
        ..firmId = firmId
        ..chainsAccessible = Ids(ids: [chainId]),
    );

    final dd = Dummy.userInfoNoId;
    dd.permissions.firmId = firmId;
    final responseUser = await userService.createOne(
        null, CreateOneRequest(password: '1234', userInfo: dd));
    Dummy.adminPermission.firmId = firmId;
    Dummy.adminPermission.chainsAccessible = Ids(ids: [chainId]);
    Dummy.adminPermission.userId = responseUser.id;
    //userService..userPermissionIfTest = UserDummy.adminPermission;
    boutiqueService..userPermissionIfTest = Dummy.adminPermission;

    final liliChain = Dummy.chainNoId;
    print('chainId $chainId');
    liliChain
      ..name = 'Lili chain'
      ..firmId = firmId
      ..chainId = chainId;

    final response = await boutiqueService.updateOneChain(null, liliChain);
    expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await boutiqueService.readOneFirm(null, Empty());
    expect(response2.chains.first.name, 'Lili chain');
  });

  test('test upsertOneBoutique', () async {
    final boutiqueLili = Dummy.boutiqueNoId
      ..name = 'Lili boutique'
      ..firmId = firmId
      ..chainId = chainId
      ..boutiqueId = boutiqueId;

    final response =
        await boutiqueService.updateOneBoutique(null, boutiqueLili);
    expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await boutiqueService.readOneFirm(null, Empty());
    expect(response2.chains.first.boutiques.first.name, 'Lili boutique');
  });
}
