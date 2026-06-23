import 'package:test/test.dart';
import 'package:stats_service/src/charts/bar_chart.dart';
import 'package:stats_service/src/charts/bar_chart_time_granularity.dart';
import 'package:stats_service/src/core/dimensions.dart';

void main() {
  group('BarChart', () {
    test('renders basic SVG structure', () {
      final data = [
        {'label': 'A', 'value': 10},
        {'label': 'B', 'value': 20},
        {'label': 'C', 'value': 30},
      ];

      final dimensions = ChartDimensions(width: 500, height: 300);
      final chart = BarChart(
        data: data,
        xValue: (d) => d['label'] as String,
        yValue: (d) => (d['value'] as num).toDouble(),
        dimensions: dimensions,
        currency: '€',
      );

      final svg = chart.render();

      expect(svg, contains('<svg'));
      expect(svg, contains('width="500'));
      expect(svg, contains('height="300'));
      expect(svg, contains('<rect'));
      expect(svg, contains('€'));
    });

    test('renders compact currency labels for large values', () {
      final data = [
        {'date': DateTime(2026, 5, 1), 'value': 2500000},
        {'date': DateTime(2026, 5, 2), 'value': 5000000},
      ];

      final dimensions = ChartDimensions(width: 500, height: 300);
      final chart = BarChart(
        data: data,
        xTime: (d) => d['date'] as DateTime,
        timeGranularity: BarChartTimeGranularity.day,
        yValue: (d) => (d['value'] as num).toDouble(),
        dimensions: dimensions,
        currency: 'CDF',
      );

      final svg = chart.render();

      expect(svg, contains('2.5M CDF'));
      expect(svg, contains('5M CDF'));
    });

    test('renders time-based x axis labels', () {
      final data = [
        {'date': DateTime(2026, 5, 1), 'value': 10},
        {'date': DateTime(2026, 5, 2), 'value': 20},
        {'date': DateTime(2026, 5, 3), 'value': 30},
      ];

      final dimensions = ChartDimensions(width: 500, height: 300);
      final chart = BarChart(
        data: data,
        xTime: (d) => d['date'] as DateTime,
        timeGranularity: BarChartTimeGranularity.day,
        yValue: (d) => (d['value'] as num).toDouble(),
        dimensions: dimensions,
        currency: '€',
      );

      final svg = chart.render();

      expect(svg, contains('01/05/2026'));
      expect(svg, contains('02/05/2026'));
      expect(svg, contains('03/05/2026'));
    });
  });
}

