import 'dart:math' as math;
import 'package:d4_shape/d4_shape.dart';
import '../core/chart.dart';
import '../core/dimensions.dart';
import '../components/legend.dart';

typedef ValueAccessor<T> = double Function(T data);
typedef LabelAccessor<T> = String Function(T data);

class PieChart<T> extends Chart {
  final List<T> data;
  final ValueAccessor<T> value;
  final LabelAccessor<T>? label;
  final List<String> colors;
  final bool showLegend;

  PieChart({
    required this.data,
    required this.value,
    this.label,
    required ChartDimensions dimensions,
    this.colors = const ['#2196F3', '#4CAF50', '#FFC107', '#F44336', '#9C27B0'],
    this.showLegend = false,
  }) : super(dimensions);

  @override
  String render() {
    final radius = math.min(dimensions.innerWidth, dimensions.innerHeight) / 2;
    final centerX = dimensions.width / 2;
    final centerY = dimensions.height / 2;

    final total = data.map(value).fold(0.0, (sum, v) => sum + v);

    final pie = Pie<T>((d, _, __) => value(d));
    final arcsData = pie(data);

    final arcGenerator = Arc(
      innerRadius: (_, [args]) => 0.0,
      outerRadius: (_, [args]) => radius,
      startAngle: (_, [args]) => (args![0] as dynamic)['startAngle'],
      endAngle: (_, [args]) => (args![0] as dynamic)['endAngle'],
      padAngle: (_, [args]) => (args![0] as dynamic)['padAngle'] ?? 0.0,
    );

    final slices = arcsData.asMap().entries.map((entry) {
      final i = entry.key;
      final arcData = entry.value;
      String pathData = arcGenerator([arcData]) ?? '';
      
      // SVG flags (large-arc-flag and sweep-flag) must be 0 or 1, not 0.0 or 1.0.
      pathData = pathData.replaceAll('.0,', ',').replaceAll('.0 ', ' ').replaceAll('.0Z', 'Z');

      final color = colors[i % colors.length];
      final slicePath = '<path d="$pathData" fill="$color" />';

      // Calculate percentage and label position
      final val = value(data[i]);
      final percentage = (val / total * 100).round();
      
      // Calculate label position nearer to the edge (75% of radius)
      final startAngle = ((arcData as dynamic)['startAngle'] as num).toDouble();
      final endAngle = ((arcData as dynamic)['endAngle'] as num).toDouble();
      final midAngle = (startAngle + endAngle) / 2 - math.pi / 2;
      final labelRadius = radius * 0.75;
      final labelX = labelRadius * math.cos(midAngle);
      final labelY = labelRadius * math.sin(midAngle);

      // Only show label if slice is large enough (> 5%)
      String labelText = '';
      if (percentage > 5) {
        labelText = '<text x="$labelX" y="$labelY" fill="#333" font-family="sans-serif" font-size="14" font-weight="bold" text-anchor="middle" alignment-baseline="middle">$percentage%</text>';
      }

      return '$slicePath\n$labelText';
    }).join('\n');

    String legend = '';
    if (showLegend && label != null) {
      final legendItems = data.asMap().entries.map((entry) {
        final i = entry.key;
        final d = entry.value;
        return LegendItem(label: label!(d), color: colors[i % colors.length]);
      }).toList();

      final legendComp = Legend(
        items: legendItems,
        x: radius + 20, // Position legend to the right of the pie
        y: -radius,     // Start at the top level of the pie
      );
      legend = legendComp.render();
    }

    return '''
<svg width="${dimensions.width}" height="${dimensions.height}" viewBox="0 0 ${dimensions.width} ${dimensions.height}" xmlns="http://www.w3.org/2000/svg">
  <g transform="translate($centerX, $centerY)">
    $slices
    $legend
  </g>
</svg>''';
  }
}
