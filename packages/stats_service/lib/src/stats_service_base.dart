import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/fence_service.dart';
import 'package:grpc/grpc.dart';
import 'package:fence_service/logging.dart';
import 'package:protos_weebi/protos_weebi_io.dart' as pb;
import 'package:charts_service/charts_service.dart' as charts;

class StatsService extends pb.StatsServiceBase {
  final MongoDbPoolService _poolService;
  final WeebiLogger _logger = WeebiLogger.forService('stats_service');

  final bool isTest;
  final pb.UserPermissions? userPermissionIfTest;

  StatsService(
    this._poolService, {
    this.isTest = false,
    this.userPermissionIfTest,
  });

  @override
  Future<pb.FinancialChartResponse> getFinancialChart(
      ServiceCall? call, pb.FinancialChartRequest request) async {
    final log = _logger.withContext(call);
    log.logRpcEntry('getFinancialChart', requestData: {
      'firmId': request.firmId,
      'boutiqueIds': request.boutiqueIds,
      'metric': request.metric.name,
      'timePeriod': request.timePeriod.name,
    });

    final userPermission = isTest
        ? userPermissionIfTest ?? pb.UserPermissions()
        : call.bearer.userPermissions;

    if (!userPermission.boolRights.canSeeStats) {
      throw GrpcError.permissionDenied('user cannot see stats');
    }

    if (userPermission.firmId != request.firmId) {
      throw GrpcError.permissionDenied(
          'user cannot access data from another firm (user: ${userPermission.firmId}, request: ${request.firmId})');
    }

    // Filter boutique IDs based on user permissions
    final accessibleBoutiqueIds = request.boutiqueIds
        .where((id) => userPermission.isBoutiqueAccessible(id))
        .toList();

    if (accessibleBoutiqueIds.isEmpty && request.boutiqueIds.isNotEmpty) {
      throw GrpcError.permissionDenied('user cannot access any of the requested boutiques');
    }

    return databaseMiddleware<pb.FinancialChartResponse>(_poolService, (db) async {
      await assertUserHasOperationalLicenseWithDb(
        db,
        userPermissions: userPermission,
        authorizationHeader: isTest ? '' : (call?.bearer ?? ''),
      );

      final query = charts.FinancialChartQuery(
        firmId: request.firmId,
        boutiqueIds: accessibleBoutiqueIds,
        start: request.start.toDateTime(),
        end: request.end.toDateTime(),
        timePeriod: _mapTimePeriod(request.timePeriod),
        metric: _mapMetric(request.metric),
      );

      final aggregator = charts.MongoTicketFinancialAggregator();
      String svgContent;

      if (request.stackedByBoutique) {
        final rows = await aggregator.aggregateStackedByBoutique(db, query);
        svgContent = charts.renderFinancialStackedBarChartSvg(
          rows: rows,
          boutiqueIds: accessibleBoutiqueIds,
          timePeriod: query.timePeriod,
          metric: query.metric,
        );
      } else {
        final rows = await aggregator.aggregate(db, query);
        svgContent = charts.renderFinancialBarChartSvg(
          rows: rows,
          timePeriod: query.timePeriod,
          metric: query.metric,
        );
      }

      return pb.FinancialChartResponse(svgContent: svgContent);
    });
  }

  charts.ChartTimePeriod _mapTimePeriod(pb.ChartTimePeriod proto) {
    switch (proto) {
      case pb.ChartTimePeriod.DAY:
        return charts.ChartTimePeriod.day;
      case pb.ChartTimePeriod.WEEK:
        return charts.ChartTimePeriod.week;
      case pb.ChartTimePeriod.MONTH:
        return charts.ChartTimePeriod.month;
      default:
        return charts.ChartTimePeriod.day;
    }
  }

  charts.FinancialChartMetric _mapMetric(pb.FinancialChartMetric proto) {
    switch (proto) {
      case pb.FinancialChartMetric.CASHFLOW_INCOME:
        return charts.FinancialChartMetric.cashflowIncome;
      case pb.FinancialChartMetric.CASHFLOW_SPENDING:
        return charts.FinancialChartMetric.cashflowSpending;
      case pb.FinancialChartMetric.ALL_INCOME:
        return charts.FinancialChartMetric.allIncome;
      case pb.FinancialChartMetric.ALL_SPENDING:
        return charts.FinancialChartMetric.allSpending;
      default:
        return charts.FinancialChartMetric.cashflowIncome;
    }
  }
}
