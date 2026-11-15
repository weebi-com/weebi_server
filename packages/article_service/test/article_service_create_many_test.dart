import 'dart:io' show InternetAddress, X509Certificate;
import 'package:test/test.dart';
import 'package:article_service/article_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/mongo_local_testing.dart';

/// Minimal [ServiceCall] for isTest paths that ignore the bearer.
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
      TestHelper.poolForDatabase('article_service_create_many_test');
  await poolService.initialize();

  final fakeCall = _FakeCall();
  late ArticleService articleService;

  CalibrePb makeCalibre(int id, String title) {
    return CalibrePb.create()
      ..id = id
      ..title = title
      ..creationDate = '2020-02-02T00:00:00.000'
      ..status = true
      ..stockUnit = CalibrePb_StockUnit.unit
      ..kind = ArticleKindPb.retail;
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
        where.eq('firmId', Dummy.firm.firmId));
    await db.collection(FenceService.firmCollectionName).insertOne({
      'firmId': Dummy.firm.firmId,
      'licenses': <dynamic>[],
    });
    await db.collection(ArticleService.collectionArticleName).drop();
    await db.createCollection(ArticleService.collectionArticleName);
    await db.collection(ArticleService.collectionPhotoName).drop();
    await db.createCollection(ArticleService.collectionPhotoName);
    await db.collection(ArticleService.collectionCategoryName).drop();
    await db.createCollection(ArticleService.collectionCategoryName);
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(ArticleService.collectionArticleName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    poolService.release(db);
  });

  test('createMany inserts new items', () async {
    final calibres = [
      makeCalibre(1, 'Item 1'),
      makeCalibre(2, 'Item 2'),
    ];
    final request = CalibresRequest(
      chainId: Dummy.chain.chainId,
      calibres: calibres,
    );

    final response = await articleService.createMany(null, request);
    expect(response.type, StatusResponse_Type.CREATED);
    expect(response.message, isEmpty);

    final readAll = await articleService.readAll(
      null,
      ReadAllRequest(chainId: Dummy.chain.chainId),
    );
    expect(readAll.calibres.length, 2);
  });

  test('createMany ignores duplicates and returns CREATED', () async {
    // Already has 1 and 2. Try to insert 2 (dup) and 3 (new).
    final calibres = [
      makeCalibre(2, 'Item 2'),
      makeCalibre(3, 'Item 3'),
    ];
    final request = CalibresRequest(
      chainId: Dummy.chain.chainId,
      calibres: calibres,
    );

    final response = await articleService.createMany(null, request);
    expect(response.type, StatusResponse_Type.CREATED);
    expect(response.message, contains('dups ignored: 1/2'));

    final readAll = await articleService.readAll(
      null,
      ReadAllRequest(chainId: Dummy.chain.chainId),
    );
    expect(readAll.calibres.length, 3);
    expect(readAll.calibres.any((c) => c.id == 3), isTrue);
  });

  test('createMany throws alreadyExists if all items are duplicates', () async {
    final calibres = [
      makeCalibre(1, 'Item 1'),
      makeCalibre(2, 'Item 2'),
      makeCalibre(3, 'Item 3'),
    ];
    final request = CalibresRequest(
      chainId: Dummy.chain.chainId,
      calibres: calibres,
    );

    expect(
      () => articleService.createMany(null, request),
      throwsA(isA<GrpcError>().having((e) => e.code, 'code', StatusCode.alreadyExists)),
    );
  });

  group('createManyPhotos', () {
    ArticlePhotoPb makePhoto(int calibreId, int id) {
      return ArticlePhotoPb.create()
        ..calibreId = calibreId
        ..id = id
        ..data = [1, 2, 3]
        ..extension_4 = ArticlePhotoPb_ExtensionPb.jpeg;
    }

    test('inserts new photos', () async {
      final photos = [
        makePhoto(1, 0),
        makePhoto(1, 1),
      ];
      final request = PhotosRequest(
        chainId: Dummy.chain.chainId,
        photos: photos,
      );

      final response = await articleService.createManyPhotos(fakeCall, request);
      expect(response.type, StatusResponse_Type.CREATED);

      final readAll = await articleService.readAllPhotos(
        fakeCall,
        ReadPhotosRequest(chainId: Dummy.chain.chainId),
      );
      expect(readAll.photos.length, 2);
    });

    test('ignores duplicate photos', () async {
      final photos = [
        makePhoto(1, 1), // dup
        makePhoto(2, 0), // new
      ];
      final request = PhotosRequest(
        chainId: Dummy.chain.chainId,
        photos: photos,
      );

      final response = await articleService.createManyPhotos(fakeCall, request);
      expect(response.type, StatusResponse_Type.CREATED);
      expect(response.message, contains('dups ignored: 1/2'));

      final readAll = await articleService.readAllPhotos(
        fakeCall,
        ReadPhotosRequest(chainId: Dummy.chain.chainId),
      );
      expect(readAll.photos.length, 3);
    });

    test('throws alreadyExists if all photos are duplicates', () async {
      final photos = [
        makePhoto(1, 0),
        makePhoto(1, 1),
        makePhoto(2, 0),
      ];
      final request = PhotosRequest(
        chainId: Dummy.chain.chainId,
        photos: photos,
      );

      expect(
        () => articleService.createManyPhotos(fakeCall, request),
        throwsA(isA<GrpcError>().having((e) => e.code, 'code', StatusCode.alreadyExists)),
      );
    });
  });
}
