import 'package:test/test.dart';
import 'package:stats_service/src/charts/bar_chart_time_granularity.dart';
import 'package:stats_service/src/components/bar_chart_time_widget.dart';
import 'package:stats_service/src/core/dimensions.dart';

void main() {
  group('BarChartTimeGranularity', () {
    test('formats three-month and year periods', () {
      final quarterPeriod = floorBarChartPeriod(
        DateTime(2026, 5, 14),
        BarChartTimeGranularity.threeMonths,
      );
      final yearPeriod = floorBarChartPeriod(
        DateTime(2026, 5, 14),
        BarChartTimeGranularity.year,
      );

      expect(
        formatBarChartPeriod(quarterPeriod, BarChartTimeGranularity.threeMonths),
        'Q2 2026',
      );
      expect(
        formatBarChartPeriod(yearPeriod, BarChartTimeGranularity.year),
        '2026',
      );
    });
  });

  group('BarChartTimeWidget', () {
    test('renders quarter and year labels on the x axis', () {
      final quarterData = [
        {'date': DateTime(2026, 1, 15), 'value': 100},
        {'date': DateTime(2026, 4, 10), 'value': 200},
        {'date': DateTime(2026, 8, 20), 'value': 300},
      ];
      final yearData = [
        {'date': DateTime(2024, 6, 1), 'value': 1000},
        {'date': DateTime(2025, 3, 1), 'value': 1200},
        {'date': DateTime(2026, 9, 1), 'value': 1400},
      ];

      final dimensions = ChartDimensions(width: 500, height: 300);

      final quarterChart = BarChartTimeWidget(
        data: quarterData,
        xTime: (d) => d['date'] as DateTime,
        granularity: BarChartTimeGranularity.threeMonths,
        yValue: (d) => (d['value'] as num).toDouble(),
        dimensions: dimensions,
        currency: '€',
      );

      final yearChart = BarChartTimeWidget(
        data: yearData,
        xTime: (d) => d['date'] as DateTime,
        granularity: BarChartTimeGranularity.year,
        yValue: (d) => (d['value'] as num).toDouble(),
        dimensions: dimensions,
        currency: '€',
      );

      final quarterSvg = quarterChart.render();
      final yearSvg = yearChart.render();

      expect(quarterSvg, contains('Q1 2026'));
      expect(quarterSvg, contains('Q2 2026'));
      expect(quarterSvg, contains('Q3 2026'));
      expect(yearSvg, contains('2024'));
      expect(yearSvg, contains('2025'));
      expect(yearSvg, contains('2026'));
    });
  });
}

