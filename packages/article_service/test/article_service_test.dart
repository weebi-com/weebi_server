// import 'dart:io';
import 'package:article_service/article_service.dart';
import 'package:test/test.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'package:models_weebi/models.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

import 'package:fence_service/user_testing.dart';

void main() async {
  final db = TestHelper.localDb;

  final connection = Connection(ConnectionManager(db));

  late ArticleService articleService;

  final calibreDummy = CalibrePb.create()
    ..mergeFromProto3Json(
      Calibre.dummyRetail.toMap(),
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
    final lili = Calibre.dummyRetail.copyWith(title: 'Lili biscuit');
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
    final response = await articleService.replaceOne(null, request);
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
