import '../charts/bar_chart_time_granularity.dart';

enum ChartTimePeriod {
  day,
  week,
  month,
}

extension ChartTimePeriodMapping on ChartTimePeriod {
  BarChartTimeGranularity get barChartGranularity {
    switch (this) {
      case ChartTimePeriod.day:
        return BarChartTimeGranularity.day;
      case ChartTimePeriod.week:
        return BarChartTimeGranularity.week;
      case ChartTimePeriod.month:
        return BarChartTimeGranularity.month;
    }
  }

  String get mongoDateTruncUnit {
    switch (this) {
      case ChartTimePeriod.day:
        return 'day';
      case ChartTimePeriod.week:
        return 'week';
      case ChartTimePeriod.month:
        return 'month';
    }
  }
}
