import 'package:fence_service/mongo_pool.dart';
import 'package:protos_weebi/data_dummy.dart';
import 'package:protos_weebi/grpc.dart';
import 'package:test/test.dart';
// import 'package:mongo_dart/mongo_dart.dart';

import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';

import 'service_call_impl.dart';

// ? consider doing more stupid mongo cruds

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('firm_chain_boutiques_test');
  await poolService.initialize();

  String firmId = '';
  late Chain chain;
  late FenceService fenceService;
  late ServiceCall _call;

  setUpAll(() async {
    fenceService = FenceService(
      poolService,
      isMock: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    _call = ServiceCallTest('');

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
    // Exercises readAllChains and readAllBoutiques (filterActiveChains/filterActiveBoutiques)
    final chainsResponse = await fenceService.readAllChains(null, Empty());
    expect(chainsResponse.chains.first.boutiques.first.boutique.name,
        'Lili boutique test');
    final boutiquesResponse =
        await fenceService.readAllBoutiques(null, Empty());
    expect(boutiquesResponse.boutiques, isNotEmpty);
    final liliBoutiques = boutiquesResponse.boutiques
        .where((b) => b.name == 'Lili boutique test')
        .toList();
    expect(liliBoutiques.length, 1);
    expect(liliBoutiques.first.name, 'Lili boutique test');
  });

  group('boutique soft deletion', () {
    test('deleteOneBoutique soft-deletes: boutique excluded from readAllBoutiques',
        () async {
      final boutique = chain.boutiques.first;
      final response = await fenceService.deleteOneBoutique(
          _call,
          BoutiqueRequest(
              chainId: boutique.chainId, boutique: boutique.boutique));
      expect(response.type, StatusResponse_Type.DELETED);

      // readAllBoutiques filters out soft-deleted
      final boutiquesResponse =
          await fenceService.readAllBoutiques(null, Empty());
      final deletedBoutiques = boutiquesResponse.boutiques
          .where((b) => b.boutiqueId == boutique.boutiqueId)
          .toList();
      expect(deletedBoutiques, isEmpty);
    });

    test('readOneBoutique throws notFound for soft-deleted boutique', () async {
      final boutique = chain.boutiques.first;
      try {
        await fenceService.readOneBoutique(
            _call,
            BoutiqueRequest(
                chainId: boutique.chainId, boutique: boutique.boutique));
        fail('Expected GrpcError.notFound');
      } on GrpcError catch (e) {
        expect(e.message, contains('has been deleted'));
      }
    });

    test('deleteOneBoutique on already-deleted throws failedPrecondition',
        () async {
      final boutique = chain.boutiques.first;
      try {
        await fenceService.deleteOneBoutique(
            _call,
            BoutiqueRequest(
                chainId: boutique.chainId, boutique: boutique.boutique));
        fail('Expected GrpcError.failedPrecondition');
      } on GrpcError catch (e) {
        expect(e.message, contains('already deleted'));
      }
    });

    test('restoreOneBoutique brings boutique back', () async {
      final boutique = chain.boutiques.first;
      final response = await fenceService.restoreOneBoutique(
          _call,
          BoutiqueRequest(
              chainId: boutique.chainId, boutique: boutique.boutique));
      expect(response.type, StatusResponse_Type.UPDATED);

      // readAllBoutiques now includes it
      final boutiquesResponse =
          await fenceService.readAllBoutiques(null, Empty());
      final restoredBoutiques = boutiquesResponse.boutiques
          .where((b) => b.boutiqueId == boutique.boutiqueId)
          .toList();
      expect(restoredBoutiques.length, 1);

      // readOneBoutique works
      final readResponse = await fenceService.readOneBoutique(
          _call,
          BoutiqueRequest(
              chainId: boutique.chainId, boutique: boutique.boutique));
      expect(readResponse.boutique.boutiqueId, boutique.boutiqueId);
    });
  });

  group('chain deletion edge cases', () {
    test('deleteOneChain fails when chain has active boutiques', () async {
      try {
        await fenceService.deleteOneChain(
            _call, ChainRequest(chainId: chain.chainId));
        fail('Expected GrpcError.failedPrecondition');
      } on GrpcError catch (e) {
        expect(e.message, contains('has active boutiques'));
      }
    });

    test('deleteOneChain succeeds when all boutiques are soft-deleted',
        () async {
      // Soft-delete the only boutique
      final boutique = chain.boutiques.first;
      await fenceService.deleteOneBoutique(
          _call,
          BoutiqueRequest(
              chainId: boutique.chainId, boutique: boutique.boutique));

      final response =
          await fenceService.deleteOneChain(_call, ChainRequest(chainId: chain.chainId));
      expect(response.type, StatusResponse_Type.DELETED);

      // Chain is gone from readAllChains
      final chainsResponse = await fenceService.readAllChains(null, Empty());
      expect(
          chainsResponse.chains.where((c) => c.chainId == chain.chainId),
          isEmpty);
    });

    test('deleteOneChain with chainId==firmId throws invalidArgument', () async {
      // First chain (chainId == firmId) cannot be deleted regardless of DB state
      try {
        await fenceService.deleteOneChain(
            _call, ChainRequest(chainId: firmId));
        fail('Expected GrpcError.invalidArgument');
      } on GrpcError catch (e) {
        expect(e.message, contains('first chain should not be deleted'));
      }
    });
  });
}
