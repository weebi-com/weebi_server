import 'package:d4_interpolate/d4_interpolate.dart';
import 'package:d4_scale/d4_scale.dart';

import '../components/axis.dart';
import '../components/legend.dart';
import '../core/chart.dart';
import '../core/chart_value_format.dart';
import '../core/dimensions.dart';
import 'bar_chart.dart';
import 'bar_chart_time_granularity.dart';

class StackedBarChart<T> extends Chart {
  final List<T> data;
  final DataValueAccessor<T, String>? xValue;
  final DataValueAccessor<T, DateTime>? xTime;
  final BarChartTimeGranularity? timeGranularity;
  final List<String> stackKeys;
  final double Function(T datum, String key) stackValue;
  final String Function(String key) stackLabel;
  final String Function(String key) stackColor;
  final bool showAxes;
  final bool showLegend;
  final String currency;
  final String Function(num)? yTickFormat;

  StackedBarChart({
    required this.data,
    this.xValue,
    this.xTime,
    this.timeGranularity,
    required this.stackKeys,
    required this.stackValue,
    required this.stackLabel,
    required this.stackColor,
    required ChartDimensions dimensions,
    this.showAxes = true,
    this.showLegend = true,
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

  double _totalForDatum(T datum) {
    var sum = 0.0;
    for (final key in stackKeys) {
      sum += stackValue(datum, key);
    }
    return sum;
  }

  @override
  String render() {
    final yMax = data.fold<double>(
      0.0,
      (max, datum) {
        final t = _totalForDatum(datum);
        return t > max ? t : max;
      },
    );

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

      xTickFormat =
          (tick) => formatBarChartPeriod(tick as DateTime, granularity);
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

    final rectangles = <String>[];
    for (final datum in data) {
      final centerX = barX(datum);
      final width = xScale.bandwidth;
      final xLeft = centerX - width / 2;
      var cumulative = 0.0;
      for (final key in stackKeys) {
        final segment = stackValue(datum, key);
        if (segment <= 0) {
          continue;
        }
        final yTop = yScale(cumulative + segment)!;
        final yBottom = yScale(cumulative)!;
        final height = yBottom - yTop;
        final fill = stackColor(key);
        rectangles.add(
          '<rect x="$xLeft" y="$yTop" width="$width" height="$height" fill="$fill" />',
        );
        cumulative += segment;
      }
    }

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
      final items = stackKeys
          .map(
            (key) => LegendItem(
              label: stackLabel(key),
              color: stackColor(key),
            ),
          )
          .toList();
      final legendComp = Legend(
        items: items,
        x: dimensions.right + 10,
        y: dimensions.top,
        itemHeight: 22,
      );
      legend = legendComp.render();
    }

    return '''
<svg width="${dimensions.width}" height="${dimensions.height}" viewBox="0 0 ${dimensions.width} ${dimensions.height}" xmlns="http://www.w3.org/2000/svg">
  ${rectangles.join('\n  ')}
  $axes
  $legend
</svg>''';
  }
}
