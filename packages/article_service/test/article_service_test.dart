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

  final calibreDummy = CalibrePb.create()
    ..mergeFromProto3Json(
      CalibreWeebi.dummyRetail.toMap(),
      ignoreUnknownFields: true,
    );

  setUpAll(() async {
    await db.open();
    articleService = ArticleService(
      db,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.collection(articleService.collection.collectionName).drop();
    await db.createCollection(articleService.collection.collectionName);
  });

  tearDownAll(() async {
    await db.collection(articleService.collection.collectionName).drop();
    await connection.close();
  });

  test('test insertOne ', () async {
    final request =
        ArticleRequest(chainId: Dummy.chain.chainId, calibre: calibreDummy);
    // ignore: unused_local_variable
    final response = await articleService.createOne(null, request);
    expect(response.type, StatusResponse_Type.CREATED);
  });
  test('test readAll', () async {
    final response = await articleService.readAll(
        null, ReadAllRequest(chainId: Dummy.chain.chainId));
    expect(response.calibres.length, 1);
  });
  test('test replaceOne ', () async {
    final lili = CalibreWeebi.dummyRetail.copyWith(title: 'Lili biscuit');
    print('lili.title');
    print(lili.title);

    final calibreLili = CalibrePb.create()
      ..mergeFromProto3Json(
        lili.toMap(),
        ignoreUnknownFields: true,
      );

    final request =
        ArticleRequest(chainId: Dummy.chain.chainId, calibre: calibreLili);
    // ignore: unused_local_variable
    final response = await articleService.updateOne(null, request);
    expect(response.type, StatusResponse_Type.UPDATED);
    final response2 = await articleService.readAll(
        null, ReadAllRequest(chainId: Dummy.chain.chainId));
    print('response2 ${response2.calibres.length}');
    expect(response2.calibres.first.title, 'Lili biscuit');
  });

  test('test deleteOne ', () async {
    final request =
        ArticleRequest(chainId: Dummy.chain.chainId, calibre: calibreDummy);
    // ignore: unused_local_variable
    final response = await articleService.deleteOne(null, request);

    final response2 = await articleService.readAll(
        null, ReadAllRequest(chainId: Dummy.chain.chainId));
    expect(response2.calibres.length, 0);
  });
}
