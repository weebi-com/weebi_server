import 'package:fence_service/mongo_pool.dart';
import 'package:test/test.dart';

import 'package:article_service/article_service.dart';
import 'package:fence_service/models_weebi.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/mongo_local_testing.dart';

void main() async {
  // final db = TestHelper.localDb;

  final MongoDbPoolService poolService = MongoDbPoolService(
    const MongoPoolConfiguration(
      /// [maxLifetimeMilliseconds] is the maximum lifetime of a connection in the pool.
      /// Connection pools can dynamically expand when faced with high demand. Unused
      /// connections within a specified period are automatically removed, and the pool
      /// size is reduced to the specified minimum when connections (poolSize) are not reused within
      /// that timeframe.
      maxLifetimeMilliseconds: 180000,

      /// [leakDetectionThreshold] is the threshold for connection leak detection.
      /// If the connection is not released within the specified time, it is
      /// considered as a leak.
      /// It won't work if no value is set. It is recommended to set a value
      leakDetectionThreshold: 10000,
      uriString: TestHelper.local,

      /// [poolSize] is the minimum number of connections in the pool.
      poolSize: 2,
    ),
  );

  await poolService.initialize();

  late ArticleService articleService;
  final cal = CalibreWeebi.dummyRetail.toMapProto();
  final calibreDummy = CalibrePb.create()
    ..mergeFromProto3Json(
      cal,
      ignoreUnknownFields: true,
    );

  final cat = CategoryWeebi.dummy.toMap();
  final categoryDummy = CategoryPb.create()
    ..mergeFromProto3Json(
      cat,
      ignoreUnknownFields: true,
    );

  setUpAll(() async {
    final db = await poolService.acquire();
    articleService = ArticleService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.collection(ArticleService.collectionArticleName).drop();
    await db.createCollection(ArticleService.collectionArticleName);
    await db.createCollection(ArticleService.collectionCategoryName);
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();

    await db.collection(ArticleService.collectionArticleName).drop();
    await db.collection(ArticleService.collectionCategoryName).drop();
    poolService.release(db);
  });

  ///
  /// ARTICLES (CALIBRES OF ARTICLES)
  ///
  test('test createOne article and readAll', () async {
    final request =
        CalibreRequest(chainId: Dummy.chain.chainId, calibre: calibreDummy);
    // ignore: unused_local_variable
    expect(request.calibre.articlesRetail.length, 1);
    final responseCreate = await articleService.createOne(null, request);
    expect(responseCreate.type, StatusResponse_Type.CREATED);

    final response = await articleService.readAll(
        null, ReadAllRequest(chainId: Dummy.chain.chainId));
    expect(response.calibres.length, 1);
    expect(response.calibres.first.title, 'dummy');
    expect(response.calibres.first.articlesRetail.length, 1);
    expect(response.calibres.first.articlesRetail.first.calibreId, 1);
  });
  test('test readAllIds', () async {
    final response = await articleService.readAllIds(
        null, ReadIdsRequest(chainId: Dummy.chain.chainId));
    expect(response.ids.length, 1);
    expect(response.ids.first, 1);
  });

  test('test updateOne article and readOne', () async {
    final lili = CalibreWeebi.dummyRetail.copyWith(title: 'Lili biscuit');
    final calibreLili = CalibrePb.create()
      ..mergeFromProto3Json(
        lili.toMapProto(),
        ignoreUnknownFields: true,
      );

    final request =
        CalibreRequest(chainId: Dummy.chain.chainId, calibre: calibreLili);
    // ignore: unused_local_variable
    final response = await articleService.updateOne(null, request);
    expect(response.type, StatusResponse_Type.UPDATED);
    final responseReadAll = await articleService.readAll(
        null, ReadAllRequest(chainId: Dummy.chain.chainId));
    //print('responseReadAll ${responseReadAll.calibres.length}');
    expect(responseReadAll.calibres.first.title, 'Lili biscuit');

    final responseReadOne = await articleService.readOne(
        null,
        ReadCalibreRequest(
            chainId: Dummy.chain.chainId, title: 'Lili biscuit'));
    expect(responseReadOne != CalibrePb.getDefault(), isTrue);
    expect(responseReadOne.articlesRetail.length, 1);
    expect(responseReadOne.articlesRetail.first.calibreId, 1);
  });
  test('test deleteOne article', () async {
    final request =
        CalibreRequest(chainId: Dummy.chain.chainId, calibre: calibreDummy);
    // ignore: unused_local_variable
    final response = await articleService.deleteOne(null, request);

    final response2 = await articleService.readAll(
        null, ReadAllRequest(chainId: Dummy.chain.chainId));
    expect(response2.calibres.length, 0);
  });

  ///
  /// CATEGORIES
  ///

  test('test createOne category and readAll categories', () async {
    final request =
        CategoryRequest(chainId: Dummy.chain.chainId, category: categoryDummy);
    // ignore: unused_local_variable
    final responseCreate =
        await articleService.createOneCategory(null, request);
    expect(responseCreate.type, StatusResponse_Type.CREATED);

    final response = await articleService.readAllCategories(
        null, ReadCategoriesRequest(chainId: Dummy.chain.chainId));
    expect(response.categories.length, 1);
    expect(response.categories.first.title, 'test category');
    expect(response.categories.first.color, categoryDummy.color);
    expect(response.categories.first.calibresIds.first, 1);
    expect(response.categories.first.calibresIds.length, 1);
  });

  test('test replaceOne category and readOne', () async {
    final lili = CategoryWeebi.dummy
        .copyWith(title: 'Lili category', calibresIds: {2, 3});
    final categoryLili = CategoryPb.create()
      ..mergeFromProto3Json(
        lili.toMap(),
        ignoreUnknownFields: true,
      );

    final request =
        CategoryRequest(chainId: Dummy.chain.chainId, category: categoryLili);
    // ignore: unused_local_variable
    final responseUpdate =
        await articleService.updateOneCategory(null, request);
    expect(responseUpdate.type, StatusResponse_Type.UPDATED);

    final responseReadAll = await articleService.readAllCategories(
        null, ReadCategoriesRequest(chainId: Dummy.chain.chainId));
    //print('responseReadAll ${responseReadAll.categories.length}');
    expect(responseReadAll.categories.length, 1);
    expect(responseReadAll.categories.first.calibresIds.length, 2);
    expect(responseReadAll.categories.first.title, 'Lili category');

    final readOneResponse = await articleService.readOneCategory(
        null,
        FindCategoryRequest(
            chainId: Dummy.chain.chainId, title: 'Lili')); // testing wilcard
    expect(readOneResponse != CategoryPb.getDefault(), isTrue);
    expect(readOneResponse.calibresIds.length, 2);
    expect(readOneResponse.title, 'Lili category');
  });
  test('test deleteOne category', () async {
    final request =
        CategoryRequest(chainId: Dummy.chain.chainId, category: categoryDummy);
    // ignore: unused_local_variable
    final response = await articleService.deleteOneCategory(null, request);

    final response2 = await articleService.readAllCategories(
        null, ReadCategoriesRequest(chainId: Dummy.chain.chainId));
    expect(response2.categories.length, 0);
  });
}
