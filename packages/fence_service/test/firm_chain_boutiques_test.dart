import 'package:fence_service/mongo_pool.dart';
import 'package:protos_weebi/data_dummy.dart';
import 'package:test/test.dart';
// import 'package:mongo_dart/mongo_dart.dart';

import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';

// ? consider doing more stupid mongo cruds

void main() async {
  final MongoDbPoolService poolService = TestHelper.defaultPoolService;
  await poolService.initialize();

  String firmId = '';
  late Chain chain;
  late FenceService fenceService;

  setUpAll(() async {
    fenceService = FenceService(
      poolService,
      isMock: true,
      userPermissionIfTest: Dummy.adminPermission,
    );

    final db = await poolService.acquire();

    await db.collection(FenceService.boutiqueCollectionName).drop();
    await db.collection(FenceService.userCollectionName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    
    await db.createCollection(FenceService.boutiqueCollectionName);
    await db.createCollection(FenceService.firmCollectionName);
    await db.createCollection(FenceService.userCollectionName);
    // firm cannot be created with admin permission so i do it manually below
    final dd = await db
        .collection(FenceService.firmCollectionName)
        .insertOne(Dummy.firm.toProto3Json() as Map<String, dynamic>);
    print(dd.id);
    print(dd.document);
    final read = await db
        .collection(FenceService.firmCollectionName)
        .findOne(where.eq('firmId', Dummy.firm.firmId));
    print(read?.entries.first);
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(FenceService.boutiqueCollectionName).drop();
    await db.collection(FenceService.userCollectionName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    poolService.release(db);
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
    chainDummy.firmId = firmId;
    final status = await fenceService.createOneChain(null, chainDummy);
    expect(status.type, StatusResponse_Type.CREATED);
    expect(status.id.isNotEmpty, isTrue);
  });

  test('test updateOneChain', () async {
    final responseReadChains = await fenceService.readAllChains(null, Empty());
    final response = await fenceService.updateOneChain(
        null,
        ChainRequest(
            chainId: responseReadChains.chains.first.chainId,
            name: 'Lili chain'));
    expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await fenceService.readAllChains(null, Empty());
    expect(response2.chains.first.name, 'Lili chain');
    chain = response2.chains.first;
  });

  test('test upsertOneBoutique', () async {
    final boutiqueLili = chain.boutiques.first
      ..boutiqueId = chain.chainId
      ..boutique.boutiqueId = chain.chainId
      ..boutique.name = 'Lili boutique test';
    final response = await fenceService.updateOneBoutique(
        null,
        BoutiqueRequest(
            chainId: boutiqueLili.chainId, boutique: boutiqueLili.boutique));
    expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await fenceService.readAllChains(null, Empty());
    expect(response2.chains.first.boutiques.first.boutique.name,
        'Lili boutique test');
  });
}
