import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:protos_weebi/data_dummy.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

import 'service_call_impl.dart';

const _webSessionsCollection = 'web_sessions';

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('web_session_test');
  await poolService.initialize();
  late FenceService fenceService;

  setUpAll(() async {
    fenceService = FenceService(poolService);

    final db = await poolService.acquire();
    await db.createCollection(FenceService.userCollectionName);
    await db.createCollection(FenceService.boutiqueCollectionName);
    await db.createCollection(FenceService.firmCollectionName);
    await db.createCollection(_webSessionsCollection);

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
    await db.collection(_webSessionsCollection).drop();
    await db.collection(FenceService.userCollectionName).drop();
    poolService.release(db);
  });

  test('logout deletes session: create session → logout with x-session-id → assert deleted',
      () async {
    // 1. Authenticate as web app to create a session
    final tokens = await fenceService.authenticateWithCredentials(
      null,
      Credentials(
        mail: Dummy.userPublic.mail,
        password: '1234',
        isWebApp: true,
      ),
    );
    expect(tokens.sessionId.isNotEmpty, isTrue, reason: 'sessionId should be returned for web auth');

    final sessionId = tokens.sessionId;

    // 2. Verify session exists in MongoDB
    final db = await poolService.acquire();
    final sessionBefore = await db
        .collection(_webSessionsCollection)
        .findOne(where.eq('_id', sessionId));
    poolService.release(db);
    expect(sessionBefore, isNotNull, reason: 'Session should exist before logout');

    // 3. Call logout with x-session-id in metadata (no JWT needed)
    await fenceService.logout(
      ServiceCallTest('', sessionId: sessionId),
      Empty(),
    );

    // 4. Verify session is deleted from MongoDB
    final db2 = await poolService.acquire();
    final sessionAfter = await db2
        .collection(_webSessionsCollection)
        .findOne(where.eq('_id', sessionId));
    poolService.release(db2);
    expect(sessionAfter, isNull, reason: 'Session should be deleted after logout');
  });

  test('getJwtFromSession returns JWT for valid session with DateTime expiresAt',
      () async {
    final db = await poolService.acquire();
    const sessionId = 'test-session-datetime';
    final expiresAt = DateTime.now().add(const Duration(hours: 1));
    await db.collection(_webSessionsCollection).insertOne({
      '_id': sessionId,
      'jwt': 'test-jwt-token',
      'refreshToken': 'refresh',
      'userId': 'user1',
      'createdAt': DateTime.now().toIso8601String(),
      'expiresAt': expiresAt, // BSON Date
      'lastAccessed': DateTime.now().toIso8601String(),
    });
    poolService.release(db);

    final jwt = await fenceService.getJwtFromSession(sessionId);
    expect(jwt, equals('test-jwt-token'));

    // Cleanup
    final db2 = await poolService.acquire();
    await db2.collection(_webSessionsCollection).deleteOne(where.eq('_id', sessionId));
    poolService.release(db2);
  });

  test('getJwtFromSession returns JWT for valid session with string expiresAt',
      () async {
    final db = await poolService.acquire();
    const sessionId = 'test-session-string';
    final expiresAt = DateTime.now().add(const Duration(hours: 1));
    await db.collection(_webSessionsCollection).insertOne({
      '_id': sessionId,
      'jwt': 'test-jwt-string-format',
      'refreshToken': 'refresh',
      'userId': 'user1',
      'createdAt': DateTime.now().toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(), // ISO string (legacy)
      'lastAccessed': DateTime.now().toIso8601String(),
    });
    poolService.release(db);

    final jwt = await fenceService.getJwtFromSession(sessionId);
    expect(jwt, equals('test-jwt-string-format'));

    // Cleanup
    final db2 = await poolService.acquire();
    await db2.collection(_webSessionsCollection).deleteOne(where.eq('_id', sessionId));
    poolService.release(db2);
  });

  test('getJwtFromSession returns null for expired session (DateTime expiresAt)',
      () async {
    final db = await poolService.acquire();
    const sessionId = 'test-session-expired-datetime';
    final expiresAt = DateTime.now().subtract(const Duration(hours: 1));
    await db.collection(_webSessionsCollection).insertOne({
      '_id': sessionId,
      'jwt': 'expired-jwt',
      'refreshToken': 'refresh',
      'userId': 'user1',
      'createdAt': DateTime.now().toIso8601String(),
      'expiresAt': expiresAt, // BSON Date in the past
      'lastAccessed': DateTime.now().toIso8601String(),
    });
    poolService.release(db);

    final jwt = await fenceService.getJwtFromSession(sessionId);
    expect(jwt, isNull);

    // Session should be cleaned up (deleted) when expired
    final db2 = await poolService.acquire();
    final sessionAfter = await db2
        .collection(_webSessionsCollection)
        .findOne(where.eq('_id', sessionId));
    poolService.release(db2);
    expect(sessionAfter, isNull);
  });

  test('getJwtFromSession returns null for expired session (string expiresAt)',
      () async {
    final db = await poolService.acquire();
    const sessionId = 'test-session-expired-string';
    final expiresAt = DateTime.now().subtract(const Duration(hours: 1));
    await db.collection(_webSessionsCollection).insertOne({
      '_id': sessionId,
      'jwt': 'expired-jwt-string',
      'refreshToken': 'refresh',
      'userId': 'user1',
      'createdAt': DateTime.now().toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(), // ISO string in the past
      'lastAccessed': DateTime.now().toIso8601String(),
    });
    poolService.release(db);

    final jwt = await fenceService.getJwtFromSession(sessionId);
    expect(jwt, isNull);

    // Session should be cleaned up when expired
    final db2 = await poolService.acquire();
    final sessionAfter = await db2
        .collection(_webSessionsCollection)
        .findOne(where.eq('_id', sessionId));
    poolService.release(db2);
    expect(sessionAfter, isNull);
  });

  test('cleanupExpiredSessions deletes sessions with BSON Date expiresAt',
      () async {
    final db = await poolService.acquire();
    const sessionId1 = 'cleanup-session-1';
    const sessionId2 = 'cleanup-session-2';
    final expiresAt = DateTime.now().subtract(const Duration(hours: 1));

    await db.collection(_webSessionsCollection).insertOne({
      '_id': sessionId1,
      'jwt': 'jwt1',
      'refreshToken': 'r1',
      'userId': 'u1',
      'createdAt': DateTime.now().toIso8601String(),
      'expiresAt': expiresAt, // BSON Date
      'lastAccessed': DateTime.now().toIso8601String(),
    });
    await db.collection(_webSessionsCollection).insertOne({
      '_id': sessionId2,
      'jwt': 'jwt2',
      'refreshToken': 'r2',
      'userId': 'u2',
      'createdAt': DateTime.now().toIso8601String(),
      'expiresAt': expiresAt, // BSON Date
      'lastAccessed': DateTime.now().toIso8601String(),
    });
    poolService.release(db);

    final deletedCount = await fenceService.cleanupExpiredSessions();
    expect(deletedCount, equals(2));

    final db2 = await poolService.acquire();
    final session1After = await db2
        .collection(_webSessionsCollection)
        .findOne(where.eq('_id', sessionId1));
    final session2After = await db2
        .collection(_webSessionsCollection)
        .findOne(where.eq('_id', sessionId2));
    poolService.release(db2);
    expect(session1After, isNull);
    expect(session2After, isNull);
  });

  test('session creation stores expiresAt as BSON Date (not string)',
      () async {
    final tokens = await fenceService.authenticateWithCredentials(
      null,
      Credentials(
        mail: Dummy.userPublic.mail,
        password: '1234',
        isWebApp: true,
      ),
    );
    expect(tokens.sessionId.isNotEmpty, isTrue);

    final db = await poolService.acquire();
    final session = await db
        .collection(_webSessionsCollection)
        .findOne(where.eq('_id', tokens.sessionId));
    poolService.release(db);

    expect(session, isNotNull);
    final expiresAt = session!['expiresAt'];
    expect(
      expiresAt is DateTime,
      isTrue,
      reason: 'expiresAt should be stored as BSON Date (DateTime), not string. '
          'Got ${expiresAt.runtimeType}',
    );

    // Cleanup
    await fenceService.logout(
      ServiceCallTest('', sessionId: tokens.sessionId),
      Empty(),
    );
  });
}
