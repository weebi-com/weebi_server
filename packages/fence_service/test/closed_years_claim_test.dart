import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:protos_weebi/data_dummy.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

void main() async {
  group('firmHasClosedYears', () {
    test('false when no closed years', () {
      expect(firmHasClosedYears([Dummy.chain]), isFalse);
    });

    test('true when boutique has closed year', () {
      final chain = Chain.create()
        ..mergeFromProto3Json(
          Dummy.chain.toProto3Json()!,
          ignoreUnknownFields: true,
        );
      chain.boutiques.first.boutique.closedYears
          .add(ClosedYearPb(year: 2024));
      expect(firmHasClosedYears([chain]), isTrue);
    });
  });

  group('JWT hasClosedYears + boutique persist', () {
    final MongoDbPoolService poolService =
        TestHelper.poolForDatabase('closed_years_claim_test');
    late FenceService fenceService;

    setUpAll(() async {
      await poolService.initialize();
      fenceService = FenceService(poolService, isMock: true);

      final db = await poolService.acquire();
      await db.createCollection(FenceService.userCollectionName);
      await db.createCollection(FenceService.boutiqueCollectionName);
      await db.createCollection(FenceService.firmCollectionName);

      await db.collection(FenceService.userCollectionName).insertOne(
            Dummy.userPrivate.toProto3Json() as Map<String, dynamic>,
          );
      await db.collection(FenceService.firmCollectionName).insertOne({
        'firmId': Dummy.firm.firmId,
        'licenses': <dynamic>[],
      });
      poolService.release(db);
    });

    tearDownAll(() async {
      final db = await poolService.acquire();
      await db.collection(FenceService.userCollectionName).drop();
      await db.collection(FenceService.boutiqueCollectionName).drop();
      await db.collection(FenceService.firmCollectionName).drop();
      poolService.release(db);
    });

    Future<void> seedChain({required bool withClosedYear}) async {
      final db = await poolService.acquire();
      await db.collection(FenceService.boutiqueCollectionName).drop();
      await db.createCollection(FenceService.boutiqueCollectionName);
      final chain = Chain.create()
        ..mergeFromProto3Json(
          Dummy.chain.toProto3Json()!,
          ignoreUnknownFields: true,
        );
      if (withClosedYear) {
        chain.boutiques.first.boutique.closedYears
            .add(ClosedYearPb(year: 2024, resultat: 1, treasuryTotal: 2));
      }
      await db.collection(FenceService.boutiqueCollectionName).insertOne(
            chain.toProto3Json() as Map<String, dynamic>,
          );
      poolService.release(db);
    }

    test('login JWT hasClosedYears false when no closed years', () async {
      await seedChain(withClosedYear: false);
      final tokens = await fenceService.authenticateWithCredentials(
        null,
        Credentials(mail: Dummy.userPrivate.mail, password: '1234'),
      );
      expect(tokens.accessToken.userPermissions.hasClosedYears, isFalse);
    });

    test('login JWT hasClosedYears true when boutique closed years exist',
        () async {
      await seedChain(withClosedYear: true);
      final tokens = await fenceService.authenticateWithCredentials(
        null,
        Credentials(mail: Dummy.userPrivate.mail, password: '1234'),
      );
      expect(tokens.accessToken.userPermissions.hasClosedYears, isTrue);
    });

    test('refresh JWT picks up hasClosedYears', () async {
      await seedChain(withClosedYear: true);
      final tokens = await fenceService.authenticateWithCredentials(
        null,
        Credentials(mail: Dummy.userPrivate.mail, password: '1234'),
      );
      final refreshed = await fenceService.authenticateWithRefreshToken(
        null,
        RefreshToken(refreshToken: tokens.refreshToken),
      );
      expect(refreshed.accessToken.userPermissions.hasClosedYears, isTrue);
    });

    test('updateOneBoutique persists closedYears', () async {
      await seedChain(withClosedYear: false);
      fenceService.userPermissionIfTest = Dummy.adminPermission;

      final boutique = BoutiquePb.create()
        ..mergeFromProto3Json(
          Dummy.chain.boutiques.first.boutique.toProto3Json()!,
          ignoreUnknownFields: true,
        );
      boutique.closedYears
        ..clear()
        ..add(ClosedYearPb(year: 2023, resultat: 10, treasuryTotal: 20));

      final res = await fenceService.updateOneBoutique(
        null,
        BoutiqueRequest(
          chainId: Dummy.chain.chainId,
          boutique: boutique,
        ),
      );
      expect(res.type, StatusResponse_Type.UPDATED);

      final db = await poolService.acquire();
      final snap = await db
          .collection(FenceService.boutiqueCollectionName)
          .findOne({'chainId': Dummy.chain.chainId});
      poolService.release(db);
      final chain = Chain.create()
        ..mergeFromProto3Json(snap!, ignoreUnknownFields: true);
      expect(chain.boutiques.first.boutique.closedYears, isNotEmpty);
      expect(chain.boutiques.first.boutique.closedYears.first.year, 2023);
      expect(chain.boutiques.first.boutique.closedYears.first.resultat, 10);
    });
  });
}
