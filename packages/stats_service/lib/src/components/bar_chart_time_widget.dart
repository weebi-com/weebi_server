import '../charts/bar_chart.dart';
import '../charts/bar_chart_time_granularity.dart';
import '../core/chart.dart';
import '../core/dimensions.dart';

class BarChartTimeWidget<T> extends Chart {
  final BarChart<T> _chart;

  BarChartTimeWidget({
    required List<T> data,
    required DataValueAccessor<T, DateTime> xTime,
    required BarChartTimeGranularity granularity,
    required DataValueAccessor<T, double> yValue,
    required ChartDimensions dimensions,
    String barColor = '#2196F3',
    bool showAxes = true,
    bool showLegend = false,
    String currency = '€',
  })  : _chart = BarChart(
          data: data,
          xTime: xTime,
          timeGranularity: granularity,
          yValue: yValue,
          dimensions: dimensions,
          barColor: barColor,
          showAxes: showAxes,
          showLegend: showLegend,
          currency: currency,
        ),
        super(dimensions);

  @override
  String render() => _chart.render();
}
