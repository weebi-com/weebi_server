import 'dart:io';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:charts_service/src/business/chart_time_period.dart';
import 'package:charts_service/src/business/financial_chart_metric.dart';
import 'package:charts_service/src/business/financial_chart_query.dart';
import 'package:charts_service/src/business/mongo_ticket_financial_aggregator.dart';
import 'package:charts_service/src/business/render_financial_bar_chart.dart';
import 'package:charts_service/src/business/ticket_financial_aggregator.dart';
import 'package:charts_service/src/fixtures/demo_tickets.dart';

Future<void> main(List<String> args) async {
  final anchor = DateTime(2024, 6, 15);
  final firmId = Platform.environment['FIRM_ID'] ?? 'demo-firm';
  final boutiqueIds = (Platform.environment['BOUTIQUE_IDS'] ?? 'boutique-a,boutique-b')
      .split(',')
      .map((id) => id.trim())
      .where((id) => id.isNotEmpty)
      .toList();
  final mongoUri = Platform.environment['MONGO_DB_URI'];

  final query = FinancialChartQuery(
    firmId: firmId,
    boutiqueIds: boutiqueIds,
    start: anchor.subtract(const Duration(days: 6)),
    end: anchor,
    timePeriod: ChartTimePeriod.day,
    metric: FinancialChartMetric.cashflowIncome,
  );

  Future<List<FinancialStackedBucketRow>> stackedRowsFor(
    FinancialChartMetric metric,
  ) async {
    final metricQuery = FinancialChartQuery(
      firmId: query.firmId,
      boutiqueIds: query.boutiqueIds,
      start: query.start,
      end: query.end,
      timePeriod: query.timePeriod,
      metric: metric,
    );

    if (mongoUri != null && mongoUri.isNotEmpty) {
      final db = await Db.create(mongoUri);
      await db.open();
      try {
        return await const MongoTicketFinancialAggregator()
            .aggregateStackedByBoutique(db, metricQuery);
      } finally {
        await db.close();
      }
    }

    final documents = demoTicketDocuments(firmId: firmId, anchor: anchor);
    return aggregateTicketDocumentsStackedByBoutique(
      documents: documents,
      query: metricQuery,
    );
  }

  for (final metric in FinancialChartMetric.values) {
    final stacked = await stackedRowsFor(metric);
    final svg = renderFinancialStackedBarChartSvg(
      rows: stacked,
      boutiqueIds: query.boutiqueIds,
      timePeriod: query.timePeriod,
      metric: metric,
    );
    final path = 'financial_${metric.fileSlug}.svg';
    File(path).writeAsStringSync(svg);
    print('Wrote $path (${stacked.length} stacked buckets)');
  }
}
