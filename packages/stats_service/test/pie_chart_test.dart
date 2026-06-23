import 'package:test/test.dart';
import 'package:stats_service/src/charts/pie_chart.dart';
import 'package:stats_service/src/core/dimensions.dart';

void main() {
  group('PieChart', () {
    test('renders basic SVG structure', () {
      final data = [
        {'label': 'A', 'value': 10},
        {'label': 'B', 'value': 20},
        {'label': 'C', 'value': 30},
      ];

      final dimensions = ChartDimensions(width: 500, height: 500);
      final chart = PieChart(
        data: data,
        value: (d) => (d['value'] as num).toDouble(),
        dimensions: dimensions,
      );

      final svg = chart.render();

      expect(svg, contains('<svg'));
      expect(svg, contains('<path')); // Pie slices should be paths
    });
  });
}

