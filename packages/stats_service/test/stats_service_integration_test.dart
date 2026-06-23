import 'package:test/test.dart';
// ignore: unused_import
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/protos_weebi.dart' as pb;
import 'package:fence_service/mongo_local_testing.dart';
import 'package:stats_service/stats_service.dart';
import 'package:stats_service/src/fixtures/demo_tickets.dart';

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('stats_service_integration_test');

  await poolService.initialize();

  late StatsService statsService;
  final anchor = DateTime(2024, 6, 15);
  final firmId = 'integration-test-firm';

  setUpAll(() async {
    final db = await poolService.acquire();
    
    // Setup firm
    await db.createCollection(FenceService.firmCollectionName);
    await db.collection(FenceService.firmCollectionName).insertOne({
      'firmId': firmId,
      'licenses': <dynamic>[],
    });
    
    // Setup boutiques
    await db.createCollection(FenceService.boutiqueCollectionName);
    await db.collection(FenceService.boutiqueCollectionName).insertMany([
      {'firmId': firmId, 'boutiqueId': 'boutique-a', 'isDeleted': false},
      {'firmId': firmId, 'boutiqueId': 'boutique-b', 'isDeleted': false},
    ]);
    
    // Setup tickets
    await db.createCollection('ticket');
    final tickets = demoTicketDocuments(firmId: firmId, anchor: anchor);
    await db.collection('ticket').insertMany(tickets);
    
    statsService = StatsService(
      poolService,
      isTest: true,
      userPermissionIfTest: pb.UserPermissions()
        ..firmId = firmId
        ..userId = 'test-user'
        ..boolRights = (pb.BoolRights()..canSeeStats = true)
        ..fullAccess = (pb.AccessFull()..hasFullAccess = true),
    );
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(FenceService.firmCollectionName).drop();
    await db.collection(FenceService.boutiqueCollectionName).drop();
    await db.collection('ticket').drop();
    poolService.release(db);
    await poolService.close();
  });

  group('StatsService Integration', () {
    test('getFinancialChart - Cashflow Income (Sell + SellCovered)', () async {
      final request = pb.FinancialChartRequest(
        firmId: firmId,
        boutiqueIds: ['boutique-a'],
        start: pb.Timestamp.fromDateTime(anchor.subtract(const Duration(days: 10))),
        end: pb.Timestamp.fromDateTime(anchor.add(const Duration(days: 1))),
        timePeriod: pb.ChartTimePeriod.DAY,
        metric: pb.FinancialChartMetric.CASHFLOW_INCOME,
      );
      
      final response = await statsService.getFinancialChart(null, request);
      expect(response.svgContent, contains('<svg'));
      expect(response.svgContent, contains('fill="#4CAF50"')); // Green for income
      
      // Ticks should contain some round numbers
      expect(response.svgContent, contains('0 CDF'));
      expect(response.svgContent, contains('100 CDF'));
    });

    test('getFinancialChart - All Spending (Spend + SpendCovered + SpendDeferred)', () async {
      final request = pb.FinancialChartRequest(
        firmId: firmId,
        boutiqueIds: ['boutique-b'],
        start: pb.Timestamp.fromDateTime(anchor.subtract(const Duration(days: 10))),
        end: pb.Timestamp.fromDateTime(anchor.add(const Duration(days: 1))),
        timePeriod: pb.ChartTimePeriod.DAY,
        metric: pb.FinancialChartMetric.ALL_SPENDING,
      );
      
      final response = await statsService.getFinancialChart(null, request);
      expect(response.svgContent, contains('<svg'));
      expect(response.svgContent, contains('fill="#F44336"')); // Red for spending
      
      expect(response.svgContent, contains('0 CDF'));
      expect(response.svgContent, contains('50 CDF'));
    });

    test('getFinancialChart - Stacked by Boutique', () async {
      final request = pb.FinancialChartRequest(
        firmId: firmId,
        boutiqueIds: ['boutique-a', 'boutique-b'],
        start: pb.Timestamp.fromDateTime(anchor.subtract(const Duration(days: 7))),
        end: pb.Timestamp.fromDateTime(anchor),
        timePeriod: pb.ChartTimePeriod.DAY,
        metric: pb.FinancialChartMetric.CASHFLOW_INCOME,
        stackedByBoutique: true,
      );
      
      final response = await statsService.getFinancialChart(null, request);
      expect(response.svgContent, contains('<svg'));
      // Should contain both boutique IDs in legend or data
      expect(response.svgContent, contains('Boutique A'));
      expect(response.svgContent, contains('Boutique B'));
    });
  });
}
