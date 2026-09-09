import 'package:test/test.dart';

import 'package:article_service/article_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/mongo_local_testing.dart';

CalibrePb _retailCalibre({
  required int id,
  required String title,
  required String designation,
  required String barcode,
  bool status = true,
}) {
  final now = '2020-02-0${id}T00:00:00.000';
  return CalibrePb.create()
    ..mergeFromProto3Json(
      {
        'id': id,
        'creationDate': now,
        'status': status,
        'title': title,
        'stockUnit': 'unit',
        'kind': 'retail',
        'articlesRetail': [
          {
            'calibreId': id,
            'id': 1,
            'designation': designation,
            'kind': 'retail',
            'status': status,
            'creationDate': now,
            'updateDate': now,
            'statusUpdateDate': now,
            'price': 100.0,
            'cost': 80.0,
            'unitsInOnePiece': 1.0,
            'barcodeEAN': barcode,
          }
        ]
      },
      ignoreUnknownFields: true,
    );
}

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('article_service_pagination_test');
  await poolService.initialize();

  late ArticleService articleService;
  final chainId = Dummy.chain.chainId;

  setUpAll(() async {
    final db = await poolService.acquire();
    articleService = ArticleService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.createCollection(FenceService.firmCollectionName);
    await db
        .collection(FenceService.firmCollectionName)
        .deleteMany(where.eq('firmId', Dummy.firm.firmId));
    await db.collection(FenceService.firmCollectionName).insertOne({
      'firmId': Dummy.firm.firmId,
      'licenses': <dynamic>[],
    });
    await db.collection(ArticleService.collectionArticleName).drop();
    await db.createCollection(ArticleService.collectionArticleName);
    poolService.release(db);

    final seeds = [
      _retailCalibre(id: 1, title: 'Cola', designation: 'Cola 33cl', barcode: '111'),
      _retailCalibre(id: 2, title: 'Chips', designation: 'Chips 50g', barcode: '222'),
      _retailCalibre(id: 3, title: 'Soap', designation: 'Soap bar', barcode: '333'),
      _retailCalibre(id: 4, title: 'Milk', designation: 'Milk 1L', barcode: '444'),
      _retailCalibre(
        id: 5,
        title: 'Bread',
        designation: 'Bread loaf',
        barcode: '555',
        status: false,
      ),
    ];
    for (final calibre in seeds) {
      final response = await articleService.createOne(
        null,
        CalibreRequest(chainId: chainId, calibre: calibre),
      );
      expect(response.type, StatusResponse_Type.CREATED);
    }
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(ArticleService.collectionArticleName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    poolService.release(db);
  });

  test('limit 0 returns the full dump without pagination metadata', () async {
    final response = await articleService.readAll(
      null,
      ReadAllRequest(chainId: chainId),
    );
    expect(response.calibres.length, 5);
    expect(response.total, 0);
    expect(response.hasMore, isFalse);
    expect(response.batchSize, 0);
  });

  test('first page returns limit items and hasMore', () async {
    final response = await articleService.readAll(
      null,
      ReadAllRequest(chainId: chainId, offset: 0, limit: 2),
    );
    expect(response.calibres.length, 2);
    expect(response.total, 5);
    expect(response.offset, 0);
    expect(response.batchSize, 2);
    expect(response.hasMore, isTrue);
    expect(response.calibres.map((c) => c.id), [1, 2]);
  });

  test('second page continues from offset', () async {
    final response = await articleService.readAll(
      null,
      ReadAllRequest(chainId: chainId, offset: 2, limit: 2),
    );
    expect(response.calibres.map((c) => c.id), [3, 4]);
    expect(response.total, 5);
    expect(response.offset, 2);
    expect(response.hasMore, isTrue);
  });

  test('last page hasMore is false', () async {
    final response = await articleService.readAll(
      null,
      ReadAllRequest(chainId: chainId, offset: 4, limit: 2),
    );
    expect(response.calibres.map((c) => c.id), [5]);
    expect(response.total, 5);
    expect(response.hasMore, isFalse);
    expect(response.batchSize, 1);
  });

  test('query matches title designation or barcode', () async {
    final byTitle = await articleService.readAll(
      null,
      ReadAllRequest(chainId: chainId, limit: 10, query: 'cola'),
    );
    expect(byTitle.calibres.map((c) => c.title), ['Cola']);
    expect(byTitle.total, 1);

    final byBarcode = await articleService.readAll(
      null,
      ReadAllRequest(chainId: chainId, limit: 10, query: '333'),
    );
    expect(byBarcode.calibres.map((c) => c.title), ['Soap']);
  });

  test('statusFilter 1 is active only, 2 is inactive only', () async {
    final active = await articleService.readAll(
      null,
      ReadAllRequest(chainId: chainId, limit: 10, statusFilter: 1),
    );
    expect(active.total, 4);
    expect(active.calibres.every((c) => c.status), isTrue);

    final inactive = await articleService.readAll(
      null,
      ReadAllRequest(chainId: chainId, limit: 10, statusFilter: 2),
    );
    expect(inactive.total, 1);
    expect(inactive.calibres.single.title, 'Bread');
  });
}
