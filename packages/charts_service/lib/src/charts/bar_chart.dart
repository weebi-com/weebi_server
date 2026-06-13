import 'package:d4_scale/d4_scale.dart';
import 'package:d4_interpolate/d4_interpolate.dart';
import '../core/chart.dart';
import '../core/chart_value_format.dart';
import '../core/dimensions.dart';
import '../components/axis.dart';
import '../components/legend.dart';
import 'bar_chart_time_granularity.dart';

typedef DataValueAccessor<T, V> = V Function(T data);

class BarChart<T> extends Chart {
  final List<T> data;
  final DataValueAccessor<T, String>? xValue;
  final DataValueAccessor<T, DateTime>? xTime;
  final BarChartTimeGranularity? timeGranularity;
  final DataValueAccessor<T, double> yValue;
  final String barColor;
  final bool showAxes;
  final bool showLegend;
  final String currency;
  final String Function(num)? yTickFormat;

  BarChart({
    required this.data,
    this.xValue,
    this.xTime,
    this.timeGranularity,
    required this.yValue,
    required ChartDimensions dimensions,
    this.barColor = '#2196F3',
    this.showAxes = true,
    this.showLegend = false,
    this.currency = '€',
    this.yTickFormat,
  })  : assert(
          (xValue != null) ^ (xTime != null),
          'Provide either xValue or xTime, but not both.',
        ),
        assert(
          xTime == null || timeGranularity != null,
          'timeGranularity is required when xTime is provided.',
        ),
        super(dimensions);

  @override
  String render() {
    final yMax = data.map(yValue).fold(0.0, (max, v) => v > max ? v : max);

    final yScale = ScaleLinear(
      domain: [0, yMax],
      range: [dimensions.bottom, dimensions.top],
      interpolate: interpolateNumber,
    );

    late final dynamic xScale;
    late final String Function(dynamic) xTickFormat;
    late final double Function(T) barX;

    if (xTime != null) {
      final granularity = timeGranularity!;
      final periods = data
          .map((datum) => floorBarChartPeriod(xTime!(datum), granularity))
          .toSet()
          .toList()
        ..sort((a, b) => a.compareTo(b));

      xScale = ScaleBand<DateTime>(
        domain: periods,
        range: [dimensions.left, dimensions.right],
      )..padding = 0.1;

      xTickFormat = (tick) => formatBarChartPeriod(tick as DateTime, granularity);
      barX = (datum) {
        final period = floorBarChartPeriod(xTime!(datum), granularity);
        return xScale(period)! + xScale.bandwidth / 2;
      };
    } else {
      final xDomain = data.map(xValue!).toList();

      xScale = ScaleBand<String>(
        domain: xDomain,
        range: [dimensions.left, dimensions.right],
      )..padding = 0.1;

      xTickFormat = (tick) => tick.toString();
      barX = (datum) {
        final x = xScale(xValue!(datum))!;
        return x + xScale.bandwidth / 2;
      };
    }

    final bars = data.map((datum) {
      final centerX = barX(datum);
      final y = yScale(yValue(datum))!;
      final width = xScale.bandwidth;
      final height = dimensions.bottom - y;
      final x = centerX - width / 2;

      return '<rect x="$x" y="$y" width="$width" height="$height" fill="$barColor" />';
    }).join('\n');

    String axes = '';
    if (showAxes) {
      final xAxis = Axis(
        scale: xScale,
        dimensions: dimensions,
        orientation: 'bottom',
        tickFormat: xTickFormat,
      );
      final yAxis = Axis(
        scale: yScale,
        dimensions: dimensions,
        orientation: 'left',
        tickFormat: (v) {
          final value = v as num;
          if (yTickFormat != null) {
            return yTickFormat!(value);
          }
          return formatChartCurrencyAxisTick(value, currency);
        },
      );
      axes = '${xAxis.render()}\n${yAxis.render()}';
    }

    String legend = '';
    if (showLegend) {
      final legendComp = Legend(
        items: [LegendItem(label: 'Value', color: barColor)],
        x: dimensions.right + 10,
        y: dimensions.top,
      );
      legend = legendComp.render();
    }

    return '''
<svg width="${dimensions.width}" height="${dimensions.height}" viewBox="0 0 ${dimensions.width} ${dimensions.height}" xmlns="http://www.w3.org/2000/svg">
  $bars
  $axes
  $legend
</svg>''';
  }
}
