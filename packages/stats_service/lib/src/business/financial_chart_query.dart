import 'financial_chart_metric.dart';
import 'chart_time_period.dart';

class FinancialChartQuery {
  final String firmId;
  final List<String> boutiqueIds;
  final DateTime start;
  final DateTime end;
  final ChartTimePeriod timePeriod;
  final FinancialChartMetric metric;

  const FinancialChartQuery({
    required this.firmId,
    required this.boutiqueIds,
    required this.start,
    required this.end,
    required this.timePeriod,
    required this.metric,
  });
}

class FinancialBucketRow {
  final DateTime period;
  final double value;

  const FinancialBucketRow({
    required this.period,
    required this.value,
  });
}

/// One time bucket with income (or spend) split per boutique id.
class FinancialStackedBucketRow {
  final DateTime period;
  final Map<String, double> valuesByBoutiqueId;

  const FinancialStackedBucketRow({
    required this.period,
    required this.valuesByBoutiqueId,
  });

  double totalFor(Iterable<String> boutiqueIds) {
    var sum = 0.0;
    for (final id in boutiqueIds) {
      sum += valuesByBoutiqueId[id] ?? 0;
    }
    return sum;
  }
}
