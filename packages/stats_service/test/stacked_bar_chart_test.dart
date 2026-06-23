import 'package:test/test.dart';
import 'package:stats_service/src/business/chart_time_period.dart';
import 'package:stats_service/src/business/financial_chart_metric.dart';
import 'package:stats_service/src/business/financial_chart_query.dart';
import 'package:stats_service/src/business/render_financial_bar_chart.dart';
import 'package:stats_service/src/charts/bar_chart_time_granularity.dart';
import 'package:stats_service/src/charts/stacked_bar_chart.dart';
import 'package:stats_service/src/core/dimensions.dart';

void main() {
  group('StackedBarChart', () {
    test('stacks series bottom to top with distinct colors', () {
      final data = [
        {'day': DateTime(2026, 5, 1), 'a': 30.0, 'b': 70.0},
        {'day': DateTime(2026, 5, 2), 'a': 50.0, 'b': 25.0},
      ];

      final chart = StackedBarChart<Map<String, Object?>>(
        data: data,
        xTime: (d) => d['day'] as DateTime,
        timeGranularity: BarChartTimeGranularity.day,
        stackKeys: const ['a', 'b'],
        stackValue: (d, key) => d[key] as double,
        stackLabel: (key) => key == 'a' ? 'Boutique A' : 'Boutique B',
        stackColor: (key) => key == 'a' ? '#111111' : '#EEEEEE',
        dimensions: ChartDimensions(width: 500, height: 300),
        currency: '€',
      );

      final svg = chart.render();

      expect(svg, contains('<svg'));
      expect(svg, contains('fill="#111111"'));
      expect(svg, contains('fill="#EEEEEE"'));
      expect(svg, contains('Boutique A'));
      expect(svg, contains('Boutique B'));
      final rectOpens = RegExp('<rect').allMatches(svg).length;
      expect(rectOpens, greaterThanOrEqualTo(4));
    });
  });

  group('renderFinancialStackedBarChartSvg', () {
    test('uses cool palette and legend labels for income', () {
      final rows = [
        FinancialStackedBucketRow(
          period: DateTime(2026, 5, 1),
          valuesByBoutiqueId: {
            'boutique-a': 100,
            'boutique-b': 250,
          },
        ),
      ];

      final svg = renderFinancialStackedBarChartSvg(
        rows: rows,
        boutiqueIds: const ['boutique-a', 'boutique-b'],
        timePeriod: ChartTimePeriod.day,
        metric: FinancialChartMetric.cashflowIncome,
        currency: 'CDF',
      );

      expect(svg, contains('fill="#1565C0"'));
      expect(svg, contains('fill="#2E7D32"'));
      expect(svg, contains('Boutique A'));
      expect(svg, contains('Boutique B'));
    });

    test('uses warm palette for spending', () {
      final rows = [
        FinancialStackedBucketRow(
          period: DateTime(2026, 5, 1),
          valuesByBoutiqueId: {
            'boutique-a': 80,
            'boutique-b': 120,
          },
        ),
      ];

      final svg = renderFinancialStackedBarChartSvg(
        rows: rows,
        boutiqueIds: const ['boutique-a', 'boutique-b'],
        timePeriod: ChartTimePeriod.day,
        metric: FinancialChartMetric.cashflowSpending,
        currency: 'CDF',
      );

      expect(svg, contains('fill="#C62828"'));
      expect(svg, contains('fill="#EF6C00"'));
      expect(svg, contains('Boutique A'));
      expect(svg, contains('Boutique B'));
    });
  });
}

