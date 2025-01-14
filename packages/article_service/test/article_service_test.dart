import 'package:fence_service/mongo_dart.dart';
import 'package:test/test.dart';

import 'package:article_service/article_service.dart';
import 'package:fence_service/models_weebi.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/mongo_local_testing.dart';

// TODO : same categorie CRUD tests please

void main() async {
  final db = TestHelper.localDb;

  final connection = Connection(ConnectionManager(db));

  late ArticleService articleService;
  final cal = CalibreWeebi.dummyRetail.toMapProto();
  final calibreDummy = CalibrePb.create()
    ..mergeFromProto3Json(
      cal,
      ignoreUnknownFields: true,
    );

  setUpAll(() async {
    await db.open();
    articleService = ArticleService(
      db,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.collection(articleService.collectionArticle.collectionName).drop();
    await db.createCollection(articleService.collectionArticle.collectionName);
  });

  tearDownAll(() async {
    await db.collection(articleService.collectionArticle.collectionName).drop();
    await connection.close();
  });

  test('test insertOne ', () async {
    final request =
        CalibreRequest(chainId: Dummy.chain.chainId, calibre: calibreDummy);
    // ignore: unused_local_variable
    expect(request.calibre.articlesRetail.length, 1);
    final response = await articleService.createOne(null, request);

    expect(response.type, StatusResponse_Type.CREATED);
  });

  test('test readAll', () async {
    final response = await articleService.readAll(
        null, ReadAllRequest(chainId: Dummy.chain.chainId));
    expect(response.calibres.length, 1);
    expect(response.calibres.first.title, 'dummy');
    expect(response.calibres.first.articlesRetail.length, 1);
    expect(response.calibres.first.articlesRetail.first.calibreId, 1);
  });

  test('test replaceOne ', () async {
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
    final response2 = await articleService.readAll(
        null, ReadAllRequest(chainId: Dummy.chain.chainId));
    print('response2 ${response2.calibres.length}');
    expect(response2.calibres.first.title, 'Lili biscuit');
  });

  test('readOne', () async {
    final calibreResponse = await articleService.readOne(
        null,
        FindCalibreRequest(
            chainId: Dummy.chain.chainId, title: 'Lili biscuit'));
    expect(calibreResponse != CalibrePb.getDefault(), isTrue);
    expect(calibreResponse.articlesRetail.length, 1);
    expect(calibreResponse.articlesRetail.first.calibreId, 1);
  });
  test('test deleteOne ', () async {
    final request =
        CalibreRequest(chainId: Dummy.chain.chainId, calibre: calibreDummy);
    // ignore: unused_local_variable
    final response = await articleService.deleteOne(null, request);

    final response2 = await articleService.readAll(
        null, ReadAllRequest(chainId: Dummy.chain.chainId));
    expect(response2.calibres.length, 0);
  });
}
