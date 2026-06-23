import 'package:d4_time/d4_time.dart';
import 'package:d4_time_format/d4_time_format.dart';

enum BarChartTimeGranularity { day, week, month, threeMonths, year }

DateTime floorBarChartPeriod(
  DateTime date,
  BarChartTimeGranularity granularity,
) {
  switch (granularity) {
    case BarChartTimeGranularity.day:
      return timeDay.floor(date);
    case BarChartTimeGranularity.week:
      return timeMonday.floor(date);
    case BarChartTimeGranularity.month:
      return timeMonth.floor(date);
    case BarChartTimeGranularity.threeMonths:
      final monthStart = timeMonth.floor(date);
      final quarterStartMonth = ((monthStart.month - 1) ~/ 3) * 3 + 1;
      return monthStart.copyWith(month: quarterStartMonth);
    case BarChartTimeGranularity.year:
      return timeYear.floor(date);
  }
}

String formatBarChartPeriod(
  DateTime period,
  BarChartTimeGranularity granularity,
) {
  switch (granularity) {
    case BarChartTimeGranularity.day:
      return timeFormat('%d/%m/%Y')(period);
    case BarChartTimeGranularity.week:
      return timeFormat('%d %b')(period);
    case BarChartTimeGranularity.month:
      return timeFormat('%b %Y')(period);
    case BarChartTimeGranularity.threeMonths:
      final quarter = ((period.month - 1) ~/ 3) + 1;
      return 'Q$quarter ${period.year}';
    case BarChartTimeGranularity.year:
      return timeFormat('%Y')(period);
  }
}
