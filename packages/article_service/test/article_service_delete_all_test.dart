import 'dart:io' show InternetAddress, X509Certificate;

import 'package:article_service/article_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';

class _FakeCall implements ServiceCall {
  @override
  X509Certificate? get clientCertificate => null;
  @override
  Map<String, String>? get clientMetadata => const {};
  @override
  DateTime? get deadline => null;
  @override
  Map<String, String>? get headers => null;
  @override
  bool get isCanceled => false;
  @override
  bool get isTimedOut => false;
  @override
  InternetAddress? get remoteAddress => null;
  @override
  Map<String, String>? get trailers => null;
  @override
  void sendHeaders() {}
  @override
  void sendTrailers({int? status, String? message}) {}
}

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('article_service_delete_all_test');
  await poolService.initialize();

  late ArticleService articleService;

  CalibrePb calibre(int id, {String title = 'dummy'}) {
    return CalibrePb.create()
      ..mergeFromProto3Json(
        {
          'id': id,
          'creationDate': '2020-02-02T00:00:00.00$id',
          'status': true,
          'title': title,
          'stockUnit': 'unit',
          'kind': 'retail',
          'articlesRetail': [
            {
              'calibreId': id,
              'id': 1,
              'designation': title,
              'kind': 'retail',
              'status': true,
              'creationDate': '2020-02-02T00:00:00.000',
              'updateDate': '2020-02-02T00:00:00.000',
              'price': 100.0,
              'cost': 80.0,
              'unitsInOnePiece': 1.0,
            }
          ]
        },
        ignoreUnknownFields: true,
      );
  }

  CategoryPb category(String title) {
    return CategoryPb.create()
      ..mergeFromProto3Json(
        {
          'title': title,
          'creationDate': '2020-02-02T00:00:00.000',
          'calibresIds': [1],
          'color': 4294198070
        },
        ignoreUnknownFields: true,
      );
  }

  setUpAll(() async {
    final db = await poolService.acquire();
    articleService = ArticleService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.createCollection(FenceService.firmCollectionName);
    await db.collection(FenceService.firmCollectionName).deleteMany(
          where.eq('firmId', Dummy.firm.firmId),
        );
    await db.collection(FenceService.firmCollectionName).insertOne({
      'firmId': Dummy.firm.firmId,
      'licenses': <dynamic>[],
    });
    await db.collection(ArticleService.collectionArticleName).drop();
    await db.createCollection(ArticleService.collectionArticleName);
    await db.createCollection(ArticleService.collectionCategoryName);
    await db.createCollection(ArticleService.collectionPhotoName);
    poolService.release(db);
  });

  setUp(() async {
    final db = await poolService.acquire();
    await db.collection(ArticleService.collectionArticleName).deleteMany({});
    await db.collection(ArticleService.collectionCategoryName).deleteMany({});
    await db.collection(ArticleService.collectionPhotoName).deleteMany({});
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(ArticleService.collectionArticleName).drop();
    await db.collection(ArticleService.collectionCategoryName).drop();
    await db.collection(ArticleService.collectionPhotoName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    poolService.release(db);
  });

  test('deleteAll wipes calibres on the chain and leaves another chain',
      () async {
    await articleService.createOne(
      null,
      CalibreRequest(chainId: Dummy.chain.chainId, calibre: calibre(1)),
    );
    await articleService.createOne(
      null,
      CalibreRequest(chainId: Dummy.chain.chainId, calibre: calibre(2)),
    );
    await articleService.createOne(
      null,
      CalibreRequest(chainId: 'other-chain', calibre: calibre(3)),
    );

    final wiped = await articleService.deleteAll(
      null,
      DeleteAllRequest(chainId: Dummy.chain.chainId),
    );
    expect(wiped.type, StatusResponse_Type.DELETED);
    expect(wiped.message, contains('deleted=2'));

    final remainingHome = await articleService.readAll(
      null,
      ReadAllRequest(chainId: Dummy.chain.chainId),
    );
    expect(remainingHome.calibres, isEmpty);

    final remainingOther = await articleService.readAll(
      null,
      ReadAllRequest(chainId: 'other-chain'),
    );
    expect(remainingOther.calibres.length, 1);
    expect(remainingOther.calibres.first.id, 3);
  });

  test('deleteAll is idempotent when empty', () async {
    final wiped = await articleService.deleteAll(
      null,
      DeleteAllRequest(chainId: Dummy.chain.chainId),
    );
    expect(wiped.type, StatusResponse_Type.DELETED);
    expect(wiped.message, contains('deleted=0'));
  });

  test('deleteAll rejects empty chainId', () async {
    try {
      await articleService.deleteAll(null, DeleteAllRequest());
      fail('Expected invalidArgument');
    } on GrpcError catch (e) {
      expect(e.code, StatusCode.invalidArgument);
    }
  });

  test('deleteAll rejects missing delete right', () async {
    final noDelete = UserPermissions.create()
      ..mergeFromProto3Json(
        Dummy.adminPermission.toProto3Json()!,
        ignoreUnknownFields: true,
      )
      ..articleRights = ArticleRights(rights: [Right.read]);
    final svc = ArticleService(
      poolService,
      isTest: true,
      userPermissionIfTest: noDelete,
    );
    try {
      await svc.deleteAll(
        null,
        DeleteAllRequest(chainId: Dummy.chain.chainId),
      );
      fail('Expected permissionDenied');
    } on GrpcError catch (e) {
      expect(e.code, StatusCode.permissionDenied);
    }
  });

  test('deleteAllCategories wipes the chain only', () async {
    await articleService.createOneCategory(
      null,
      CategoryRequest(
        chainId: Dummy.chain.chainId,
        category: category('home'),
      ),
    );
    await articleService.createOneCategory(
      null,
      CategoryRequest(
        chainId: 'other-chain',
        category: category('other'),
      ),
    );
    final wiped = await articleService.deleteAllCategories(
      null,
      DeleteAllRequest(chainId: Dummy.chain.chainId),
    );
    expect(wiped.type, StatusResponse_Type.DELETED);
    expect(
      (await articleService.readAllCategories(
        null,
        ReadCategoriesRequest(chainId: Dummy.chain.chainId),
      ))
          .categories,
      isEmpty,
    );
    expect(
      (await articleService.readAllCategories(
        null,
        ReadCategoriesRequest(chainId: 'other-chain'),
      ))
          .categories
          .length,
      1,
    );
  });

  test('deleteAllPhotos wipes the chain only', () async {
    await articleService.createOnePhoto(
      _FakeCall(),
      PhotoRequest(
        chainId: Dummy.chain.chainId,
        photo: ArticlePhotoPb(calibreId: 1, id: 1),
      ),
    );
    await articleService.createOnePhoto(
      _FakeCall(),
      PhotoRequest(
        chainId: 'other-chain',
        photo: ArticlePhotoPb(calibreId: 2, id: 1),
      ),
    );
    final wiped = await articleService.deleteAllPhotos(
      null,
      DeleteAllRequest(chainId: Dummy.chain.chainId),
    );
    expect(wiped.type, StatusResponse_Type.DELETED);

    final home = await articleService.readAllPhotos(
      _FakeCall(),
      ReadPhotosRequest(chainId: Dummy.chain.chainId, limit: 100),
    );
    expect(home.photos, isEmpty);

    final other = await articleService.readAllPhotos(
      _FakeCall(),
      ReadPhotosRequest(chainId: 'other-chain', limit: 100),
    );
    expect(other.photos.length, 1);
  });
}
