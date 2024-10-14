import 'package:protos_weebi/data_dummy.dart';
import 'package:test/test.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';

// ? consider doing more stupid mongo cruds

void main() async {
  final db = TestHelper.localDb;

  final connection = Connection(ConnectionManager(db));

  String firmId = '';
  late Chain chain;
  late FenceService fenceService;

  setUpAll(() async {
    await db.open();
    fenceService = FenceService(
      db,
      isMock: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.collection(fenceService.boutiqueCollection.collectionName).drop();
    await db.collection(fenceService.userCollection.collectionName).drop();
    await db.createCollection(fenceService.boutiqueCollection.collectionName);
    await db.createCollection(fenceService.firmCollection.collectionName);
    // firm cannot be created with admin permission so i do it manually below
    await db
        .collection(fenceService.firmCollection.collectionName)
        .insertOne(Dummy.firm.toProto3Json() as Map<String, dynamic>);
  });

  tearDownAll(() async {
    await db.collection(fenceService.boutiqueCollection.collectionName).drop();
    await db.collection(fenceService.userCollection.collectionName).drop();
    await db.collection(fenceService.firmCollection.collectionName).drop();
    await connection.close();
  });

  test('test readOneFirm', () async {
    final response = await fenceService.readOneFirm(null, Empty());
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
  });
  test('create oneChain', () async {
    final chainDummy = Dummy.chain;
    chainDummy..firmId = firmId;
    final status = await fenceService.createOneChain(null, chainDummy);
    expect(status.type, StatusResponse_Type.CREATED);
    expect(status.id.isNotEmpty, isTrue);
  });

  test('test updateOneChain', () async {
    final responseReadChains = await fenceService.readAllChains(null, Empty());
    final liliChain = responseReadChains.chains.first..name = 'Lili chain';
    final response = await fenceService.updateOneChain(null, liliChain);
    expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await fenceService.readAllChains(null, Empty());
    expect(response2.chains.first.name, 'Lili chain');
    chain = response2.chains.first;
  });

  test('test upsertOneBoutique', () async {
    final boutiqueLili = chain.boutiques.first..name = 'Lili boutique test';
    final response = await fenceService.updateOneBoutique(null, boutiqueLili);
    expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await fenceService.readAllChains(null, Empty());
    expect(response2.chains.first.boutiques.first.name, 'Lili boutique test');
  });
}
