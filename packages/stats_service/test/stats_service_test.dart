import 'package:test/test.dart';
// ignore: unused_import
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/fence_service.dart';
import 'package:grpc/grpc.dart';
import 'package:fence_service/protos_weebi.dart' as pb;
import 'package:fence_service/mongo_local_testing.dart';
import 'package:stats_service/stats_service.dart';

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('stats_service_test');

  await poolService.initialize();

  // ignore: unused_local_variable
  late StatsService statsService;

  setUpAll(() async {
    final db = await poolService.acquire();
    await db.createCollection(FenceService.firmCollectionName);
    await db.collection(FenceService.firmCollectionName).insertOne({
      'firmId': pb.Dummy.firm.firmId,
      'licenses': <dynamic>[],
    });
    
    // Create ticket collection for aggregation
    await db.createCollection('ticket');
    
    statsService = StatsService(
      poolService,
      isTest: true,
      userPermissionIfTest: pb.Dummy.adminPermission,
    );
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(FenceService.firmCollectionName).drop();
    await db.collection('ticket').drop();
    poolService.release(db);
    await poolService.close();
  });

  group('StatsService - Permissions', () {
    test('should throw permissionDenied if canSeeStats is false', () async {
      final userPerms = pb.UserPermissions()
        ..firmId = pb.Dummy.firm.firmId
        ..boolRights = (pb.BoolRights()..canSeeStats = false);
      
      final service = StatsService(poolService, isTest: true, userPermissionIfTest: userPerms);
      
      final request = pb.FinancialChartRequest(
        firmId: pb.Dummy.firm.firmId,
      );
      
      expect(
        () => service.getFinancialChart(null, request),
        throwsA(isA<GrpcError>().having((e) => e.code, 'code', StatusCode.permissionDenied)),
      );
    });

    test('should throw permissionDenied if firmId mismatch', () async {
      final userPerms = pb.UserPermissions()
        ..firmId = pb.Dummy.firm.firmId
        ..boolRights = (pb.BoolRights()..canSeeStats = true);
      
      final service = StatsService(poolService, isTest: true, userPermissionIfTest: userPerms);
      
      final request = pb.FinancialChartRequest(
        firmId: 'wrong-firm-id',
      );
      
      expect(
        () => service.getFinancialChart(null, request),
        throwsA(isA<GrpcError>().having((e) => e.code, 'code', StatusCode.permissionDenied)),
      );
    });
  });

  group('StatsService - Success cases', () {
    test('should return SVG content for valid request', () async {
      final userPerms = pb.UserPermissions()
        ..firmId = pb.Dummy.firm.firmId
        ..userId = 'test-user'
        ..boolRights = (pb.BoolRights()..canSeeStats = true)
        ..fullAccess = (pb.AccessFull()..hasFullAccess = true);
      
      final service = StatsService(poolService, isTest: true, userPermissionIfTest: userPerms);
      
      final request = pb.FinancialChartRequest(
        firmId: pb.Dummy.firm.firmId,
        boutiqueIds: ['b1'],
        start: pb.Timestamp.fromDateTime(DateTime(2024, 1, 1)),
        end: pb.Timestamp.fromDateTime(DateTime(2024, 1, 31)),
        timePeriod: pb.ChartTimePeriod.DAY,
        metric: pb.FinancialChartMetric.CASHFLOW_INCOME,
      );
      
      final response = await service.getFinancialChart(null, request);
      expect(response.svgContent, contains('<svg'));
    });
  });
}
