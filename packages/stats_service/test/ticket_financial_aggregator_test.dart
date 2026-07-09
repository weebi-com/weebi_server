import 'package:protos_weebi/protos_weebi_io.dart' hide FinancialChartMetric, ChartTimePeriod;
import 'package:test/test.dart';
import 'package:stats_service/src/business/chart_time_period.dart';
import 'package:stats_service/src/business/financial_chart_metric.dart';
import 'package:stats_service/src/business/financial_chart_query.dart';
import 'package:stats_service/src/business/render_financial_bar_chart.dart';
import 'package:stats_service/src/business/ticket_amount.dart';
import 'package:stats_service/src/business/ticket_financial_aggregator.dart';
import 'package:stats_service/src/charts/bar_chart_time_granularity.dart';
import 'package:stats_service/src/fixtures/demo_tickets.dart';

void main() {
  final anchor = DateTime(2024, 6, 15);
  final documents = demoTicketDocuments(firmId: 'demo-firm', anchor: anchor);

  FinancialChartQuery queryFor({
    required FinancialChartMetric metric,
    required ChartTimePeriod timePeriod,
    DateTime? start,
    DateTime? end,
    List<String> boutiqueIds = const ['boutique-a', 'boutique-b'],
  }) {
    return FinancialChartQuery(
      firmId: 'demo-firm',
      boutiqueIds: boutiqueIds,
      start: start ?? anchor.subtract(const Duration(days: 6)),
      end: end ?? anchor,
      timePeriod: timePeriod,
      metric: metric,
    );
  }

  group('FinancialChartMetric', () {
    test('cashflow income includes sell and sellCovered only', () {
      final metric = FinancialChartMetric.cashflowIncome;
      expect(metric.ticketTypeNames, ['sell', 'sellCovered']);
      expect(metric.includesTicketType('sellDeferred'), isFalse);
    });

    test('all income includes deferred sells', () {
      final metric = FinancialChartMetric.allIncome;
      expect(metric.includesTicketType('sellDeferred'), isTrue);
    });

    test('income metrics render green and spending metrics render red', () {
      expect(FinancialChartMetric.cashflowIncome.barColor, '#4CAF50');
      expect(FinancialChartMetric.allIncome.barColor, '#4CAF50');
      expect(FinancialChartMetric.cashflowSpending.barColor, '#F44336');
      expect(FinancialChartMetric.allSpending.barColor, '#F44336');
    });
  });

  group('aggregateTicketDocuments', () {
    test('cashflow income sums sell and sellCovered per day', () {
      final rows = aggregateTicketDocuments(
        documents: documents,
        query: queryFor(
          metric: FinancialChartMetric.cashflowIncome,
          timePeriod: ChartTimePeriod.day,
        ),
      );

      final total = rows.fold<double>(0, (sum, row) => sum + row.value);
      final expected = documents.fold<double>(0, (sum, document) {
        final ticket = document['ticket'] as Map<String, dynamic>;
        return sum +
            ticketAmountForMetric(ticket, FinancialChartMetric.cashflowIncome);
      });

      expect(total, closeTo(expected, 0.001));
      expect(rows, isNotEmpty);
    });

    test('stacked cashflow income totals match combined buckets per period', () {
      final q = queryFor(
        metric: FinancialChartMetric.cashflowIncome,
        timePeriod: ChartTimePeriod.day,
      );
      final flat = aggregateTicketDocuments(documents: documents, query: q);
      final stacked =
          aggregateTicketDocumentsStackedByBoutique(documents: documents, query: q);

      expect(stacked, isNotEmpty);
      final stackedByPeriod = {
        for (final row in stacked) row.period: row,
      };
      for (final row in flat) {
        final s = stackedByPeriod[row.period]!;
        expect(s.totalFor(q.boutiqueIds), closeTo(row.value, 0.001));
      }
    });

    test('stacked cashflow spending totals match combined buckets per period', () {
      final q = queryFor(
        metric: FinancialChartMetric.cashflowSpending,
        timePeriod: ChartTimePeriod.day,
      );
      final flat = aggregateTicketDocuments(documents: documents, query: q);
      final stacked =
          aggregateTicketDocumentsStackedByBoutique(documents: documents, query: q);

      expect(stacked, isNotEmpty);
      final stackedByPeriod = {
        for (final row in stacked) row.period: row,
      };
      for (final row in flat) {
        final s = stackedByPeriod[row.period]!;
        expect(s.totalFor(q.boutiqueIds), closeTo(row.value, 0.001));
      }
    });

    test('all income includes sellDeferred amounts', () {
      final cashflow = aggregateTicketDocuments(
        documents: documents,
        query: queryFor(
          metric: FinancialChartMetric.cashflowIncome,
          timePeriod: ChartTimePeriod.day,
        ),
      );
      final allIncome = aggregateTicketDocuments(
        documents: documents,
        query: queryFor(
          metric: FinancialChartMetric.allIncome,
          timePeriod: ChartTimePeriod.day,
        ),
      );

      final cashflowTotal =
          cashflow.fold<double>(0, (sum, row) => sum + row.value);
      final allIncomeTotal =
          allIncome.fold<double>(0, (sum, row) => sum + row.value);

      expect(allIncomeTotal, greaterThan(cashflowTotal));
    });

    test('cashflow spending ignores deferred spend', () {
      final cashflowSpend = aggregateTicketDocuments(
        documents: documents,
        query: queryFor(
          metric: FinancialChartMetric.cashflowSpending,
          timePeriod: ChartTimePeriod.day,
        ),
      );
      final allSpend = aggregateTicketDocuments(
        documents: documents,
        query: queryFor(
          metric: FinancialChartMetric.allSpending,
          timePeriod: ChartTimePeriod.day,
        ),
      );

      final cashflowTotal =
          cashflowSpend.fold<double>(0, (sum, row) => sum + row.value);
      final allSpendTotal =
          allSpend.fold<double>(0, (sum, row) => sum + row.value);

      expect(allSpendTotal, greaterThan(cashflowTotal));
    });

    test('filters inactive and out-of-range tickets', () {
      final outOfRange = Map<String, dynamic>.from(documents.first);
      final ticket = Map<String, dynamic>.from(outOfRange['ticket'] as Map);
      ticket['date'] = anchor.add(const Duration(days: 30)).toIso8601String();
      outOfRange['ticket'] = ticket;

      final rows = aggregateTicketDocuments(
        documents: [...documents, outOfRange],
        query: queryFor(
          metric: FinancialChartMetric.allIncome,
          timePeriod: ChartTimePeriod.day,
        ),
      );
      final baseline = aggregateTicketDocuments(
        documents: documents,
        query: queryFor(
          metric: FinancialChartMetric.allIncome,
          timePeriod: ChartTimePeriod.day,
        ),
      );

      expect(
        rows.fold<double>(0, (sum, row) => sum + row.value),
        closeTo(
          baseline.fold<double>(0, (sum, row) => sum + row.value),
          0.001,
        ),
      );
    });
  });

  group('ChartTimePeriod', () {
    final rangeStart = DateTime(2024, 6, 1);
    final rangeEnd = DateTime(2024, 6, 30, 23, 59, 59);

    test('day buckets keep each business day separate', () {
      final periodDocuments = [
        _mongoDocument(
          firmId: 'demo-firm',
          boutiqueId: 'boutique-a',
          id: 1,
          date: DateTime(2024, 6, 3),
          amount: 100,
        ),
        _mongoDocument(
          firmId: 'demo-firm',
          boutiqueId: 'boutique-a',
          id: 2,
          date: DateTime(2024, 6, 4),
          amount: 200,
        ),
      ];

      final rows = aggregateTicketDocuments(
        documents: periodDocuments,
        query: queryFor(
          metric: FinancialChartMetric.cashflowIncome,
          timePeriod: ChartTimePeriod.day,
          start: rangeStart,
          end: rangeEnd,
        ),
      );

      expect(rows, hasLength(2));
      expect(rows.map((row) => row.value).toList(), unorderedEquals([100, 200]));
    });

    test('week buckets combine tickets from the same week', () {
      final periodDocuments = [
        _mongoDocument(
          firmId: 'demo-firm',
          boutiqueId: 'boutique-a',
          id: 3,
          date: DateTime(2024, 6, 3),
          amount: 100,
        ),
        _mongoDocument(
          firmId: 'demo-firm',
          boutiqueId: 'boutique-a',
          id: 4,
          date: DateTime(2024, 6, 5),
          amount: 200,
        ),
        _mongoDocument(
          firmId: 'demo-firm',
          boutiqueId: 'boutique-a',
          id: 5,
          date: DateTime(2024, 6, 12),
          amount: 300,
        ),
      ];

      final rows = aggregateTicketDocuments(
        documents: periodDocuments,
        query: queryFor(
          metric: FinancialChartMetric.cashflowIncome,
          timePeriod: ChartTimePeriod.week,
          start: rangeStart,
          end: rangeEnd,
        ),
      );

      expect(rows, hasLength(2));
      expect(rows[0].period, floorBarChartPeriod(DateTime(2024, 6, 3), BarChartTimeGranularity.week));
      expect(rows[0].value, closeTo(300, 0.001));
      expect(rows[1].value, closeTo(300, 0.001));
    });

    test('month buckets combine tickets from the same calendar month', () {
      final periodDocuments = [
        _mongoDocument(
          firmId: 'demo-firm',
          boutiqueId: 'boutique-a',
          id: 6,
          date: DateTime(2024, 6, 3),
          amount: 100,
        ),
        _mongoDocument(
          firmId: 'demo-firm',
          boutiqueId: 'boutique-a',
          id: 7,
          date: DateTime(2024, 6, 20),
          amount: 250,
        ),
        _mongoDocument(
          firmId: 'demo-firm',
          boutiqueId: 'boutique-a',
          id: 8,
          date: DateTime(2024, 5, 28),
          amount: 400,
        ),
      ];

      final rows = aggregateTicketDocuments(
        documents: periodDocuments,
        query: queryFor(
          metric: FinancialChartMetric.cashflowIncome,
          timePeriod: ChartTimePeriod.month,
          start: DateTime(2024, 5, 1),
          end: rangeEnd,
        ),
      );

      expect(rows, hasLength(2));
      expect(rows[1].period, floorBarChartPeriod(DateTime(2024, 6, 3), BarChartTimeGranularity.month));
      expect(rows[1].value, closeTo(350, 0.001));
    });
  });

  group('large ticket amounts', () {
    final rangeEnd = DateTime(2024, 6, 30, 23, 59, 59);

    test('preserves million-scale totals when aggregating', () {
      final largeDocuments = [
        _mongoDocument(
          firmId: 'demo-firm',
          boutiqueId: 'boutique-a',
          id: 9,
          date: DateTime(2024, 6, 10),
          amount: 2500000,
        ),
        _mongoDocument(
          firmId: 'demo-firm',
          boutiqueId: 'boutique-a',
          id: 10,
          date: DateTime(2024, 6, 11),
          amount: 1750000,
        ),
      ];

      final rows = aggregateTicketDocuments(
        documents: largeDocuments,
        query: queryFor(
          metric: FinancialChartMetric.cashflowIncome,
          timePeriod: ChartTimePeriod.day,
          start: DateTime(2024, 6, 1),
          end: rangeEnd,
        ),
      );

      expect(rows, hasLength(2));
      expect(rows[0].value, closeTo(2500000, 0.001));
      expect(rows[1].value, closeTo(1750000, 0.001));
      expect(
        rows.fold<double>(0, (sum, row) => sum + row.value),
        closeTo(4250000, 0.001),
      );
    });

    test('renders compact axis labels for million-scale financial charts', () {
      final rows = [
        FinancialBucketRow(
          period: DateTime(2024, 6, 10),
          value: 2500000,
        ),
        FinancialBucketRow(
          period: DateTime(2024, 6, 11),
          value: 1750000,
        ),
      ];

      final svg = renderFinancialBarChartSvg(
        rows: rows,
        timePeriod: ChartTimePeriod.day,
        metric: FinancialChartMetric.cashflowIncome,
        currency: 'CDF',
      );

      expect(svg, contains('M CDF'));
      expect(svg, contains('fill="#4CAF50"'));
    });
  });
}

Map<String, dynamic> _mongoDocument({
  required String firmId,
  required String boutiqueId,
  required int id,
  required DateTime date,
  required double amount,
}) {
  final dateIso = date.toIso8601String();
  final ticket = TicketPb(
    ticketType: TicketTypePb.sellCovered,
    received: amount,
    status: true,
    date: dateIso,
    creationDate: dateIso,
    statusUpdateDate: dateIso,
  );

  final ticketMongo = TicketMongo.create()
    ..firmId = firmId
    ..boutiqueId = boutiqueId
    ..nonUniqueId = id
    ..creationDate = dateIso
    ..isDeleted = false
    ..ticket = ticket;

  return ticketMongo.toProto3Json() as Map<String, dynamic>;
}

