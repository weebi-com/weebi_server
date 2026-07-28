import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/src/web_bridge_link.dart';
import 'package:protos_weebi/data_dummy.dart';
import 'package:protos_weebi/grpc.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

import 'service_call_impl.dart';

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('web_bridge_link_rpc_test');
  await poolService.initialize();
  late FenceService fenceService;

  setUpAll(() async {
    // Default used when building bridge URLs in tests.
    // ignore: do_not_use_environment -- test harness sets process env
  });

  setUpAll(() async {
    fenceService = FenceService(poolService);

    final db = await poolService.acquire();
    await db.createCollection(FenceService.userCollectionName);
    await db.createCollection(FenceService.boutiqueCollectionName);
    await db.createCollection(FenceService.firmCollectionName);
    await db.createCollection('web_sessions');
    await db.createCollection(kWebBridgeTokensCollection);

    await db
        .collection(FenceService.userCollectionName)
        .insertOne((Dummy.userPrivate.toProto3Json() as Map<String, dynamic>));
    await db
        .collection(FenceService.boutiqueCollectionName)
        .insertOne((Dummy.chain.toProto3Json() as Map<String, dynamic>));
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(FenceService.boutiqueCollectionName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    await db.collection('web_sessions').drop();
    await db.collection(kWebBridgeTokensCollection).drop();
    await db.collection(FenceService.userCollectionName).drop();
    poolService.release(db);
  });

  Future<String> mobileAccessToken() async {
    final tokens = await fenceService.authenticateWithCredentials(
      null,
      Credentials(
        mail: Dummy.userPublic.mail,
        password: '1234',
        isWebApp: false,
      ),
    );
    expect(tokens.accessToken, isNotEmpty);
    return tokens.accessToken;
  }

  test('createWebBridgeLink premium returns URL without year', () async {
    final jwt = await mobileAccessToken();
    final resp = await fenceService.createWebBridgeLink(
      ServiceCallTest(jwt),
      CreateWebBridgeLinkRequest(productId: 'premium'),
    );
    expect(resp.token, isNotEmpty);
    expect(resp.url, contains('#/bridge'));
    expect(resp.url, contains('product=premium'));
    expect(resp.url, contains('t=${resp.token}'));
    expect(resp.url, isNot(contains('year=')));
    // Query before hash so OS/browser launch does not drop the token.
    expect(resp.url.indexOf('?'), lessThan(resp.url.indexOf('#/bridge')));
    expect(resp.expiresAtUnix, greaterThan(0));
  });

  test('createWebBridgeLink syscohada includes year', () async {
    final jwt = await mobileAccessToken();
    final resp = await fenceService.createWebBridgeLink(
      ServiceCallTest(jwt),
      CreateWebBridgeLinkRequest(productId: 'syscohada', fiscalYear: 2025),
    );
    expect(resp.url, contains('product=syscohada'));
    expect(resp.url, contains('year=2025'));
  });

  test('createWebBridgeLink syscohada without year is invalidArgument', () async {
    final jwt = await mobileAccessToken();
    expect(
      () => fenceService.createWebBridgeLink(
        ServiceCallTest(jwt),
        CreateWebBridgeLinkRequest(productId: 'syscohada'),
      ),
      throwsA(isA<GrpcError>().having(
        (e) => e.code,
        'code',
        StatusCode.invalidArgument,
      )),
    );
  });

  test('createWebBridgeLink unknown product is invalidArgument', () async {
    final jwt = await mobileAccessToken();
    expect(
      () => fenceService.createWebBridgeLink(
        ServiceCallTest(jwt),
        CreateWebBridgeLinkRequest(productId: 'entreprise'),
      ),
      throwsA(isA<GrpcError>().having(
        (e) => e.code,
        'code',
        StatusCode.invalidArgument,
      )),
    );
  });

  test('createWebBridgeLink without billing create is permissionDenied',
      () async {
    fenceService.userPermissionIfTest = Dummy.salesPersonPermission;
    fenceService.isMock = true;
    addTearDown(() {
      fenceService.isMock = false;
      fenceService.userPermissionIfTest = null;
    });

    expect(
      () => fenceService.createWebBridgeLink(
        ServiceCallTest(''),
        CreateWebBridgeLinkRequest(productId: 'premium'),
      ),
      throwsA(isA<GrpcError>().having(
        (e) => e.code,
        'code',
        StatusCode.permissionDenied,
      )),
    );
  });

  test('exchangeWebBridgeToken creates web session and is one-time', () async {
    final jwt = await mobileAccessToken();
    final created = await fenceService.createWebBridgeLink(
      ServiceCallTest(jwt),
      CreateWebBridgeLinkRequest(productId: 'premium'),
    );

    final exchanged = await fenceService.exchangeWebBridgeToken(
      null,
      ExchangeWebBridgeTokenRequest(token: created.token),
    );
    expect(exchanged.sessionId, isNotEmpty);
    expect(exchanged.accessToken, isEmpty);

    final db = await poolService.acquire();
    final session = await db
        .collection('web_sessions')
        .findOne(where.eq('_id', exchanged.sessionId));
    poolService.release(db);
    expect(session, isNotNull);

    expect(
      () => fenceService.exchangeWebBridgeToken(
        null,
        ExchangeWebBridgeTokenRequest(token: created.token),
      ),
      throwsA(isA<GrpcError>()),
    );
  });

  test('exchangeWebBridgeToken unknown token fails', () async {
    expect(
      () => fenceService.exchangeWebBridgeToken(
        null,
        ExchangeWebBridgeTokenRequest(token: 'does-not-exist'),
      ),
      throwsA(isA<GrpcError>()),
    );
  });
}
