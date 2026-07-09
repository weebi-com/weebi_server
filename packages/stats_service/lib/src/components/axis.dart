import 'package:d4_scale/d4_scale.dart';
import '../core/dimensions.dart';

class Axis {
  final dynamic scale;
  final ChartDimensions dimensions;
  final String orientation; // 'bottom' or 'left'
  final String label;
  final String Function(dynamic)? tickFormat;

  Axis({
    required this.scale,
    required this.dimensions,
    required this.orientation,
    this.label = '',
    this.tickFormat,
  });

  String render() {
    List<dynamic> ticks;
    if (scale is ScaleLinear) {
      ticks = (scale as ScaleLinear).ticks();
    } else if (scale is ScaleBand) {
      ticks = (scale as ScaleBand).domain;
    } else {
      ticks = [];
    }

    final tickElements = ticks.map((tick) {
      final pos = scale.call(tick)!;
      final offset = (scale is ScaleBand) ? (scale as ScaleBand).bandwidth / 2 : 0.0;
      final finalPos = pos + offset;
      final formattedTick = tickFormat != null ? tickFormat!(tick) : tick.toString();

      if (orientation == 'bottom') {
        return '''
<g transform="translate($finalPos, ${dimensions.bottom})">
  <line y2="6" stroke="black" />
  <text y="20" text-anchor="middle" font-size="10">$formattedTick</text>
</g>''';
      } else {
        return '''
<g transform="translate(${dimensions.left}, $finalPos)">
  <line x2="-6" stroke="black" />
  <text x="-10" y="4" text-anchor="end" font-size="10">$formattedTick</text>
</g>''';
      }
    }).join('\n');

    String axisLine;
    if (orientation == 'bottom') {
      axisLine = '<line x1="${dimensions.left}" y1="${dimensions.bottom}" x2="${dimensions.right}" y2="${dimensions.bottom}" stroke="black" />';
    } else {
      axisLine = '<line x1="${dimensions.left}" y1="${dimensions.top}" x2="${dimensions.left}" y2="${dimensions.bottom}" stroke="black" />';
    }

    return '''
<g class="axis axis-$orientation">
  $axisLine
  $tickElements
</g>''';
  }
}
