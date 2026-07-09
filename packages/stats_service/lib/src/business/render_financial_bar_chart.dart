import '../charts/bar_chart.dart';
import '../charts/stacked_bar_chart.dart';
import '../core/dimensions.dart';
import 'chart_time_period.dart';
import 'financial_chart_metric.dart';
import 'financial_chart_query.dart';

/// Distinct fills for income stacks (boutique 1, 2, …).
const incomeStackFillColors = [
  '#1565C0',
  '#2E7D32',
  '#F9A825',
  '#6A1B9A',
];

/// Distinct warm fills for spending stacks (boutique 1, 2, …).
const spendingStackFillColors = [
  '#C62828',
  '#EF6C00',
  '#6D4C41',
  '#AD1457',
];

String incomeStackColorForBoutique(
  String boutiqueId,
  List<String> boutiqueIdsOrder,
) {
  final index = boutiqueIdsOrder.indexOf(boutiqueId);
  final safeIndex = index >= 0 ? index : 0;
  return incomeStackFillColors[safeIndex % incomeStackFillColors.length];
}

String spendingStackColorForBoutique(
  String boutiqueId,
  List<String> boutiqueIdsOrder,
) {
  final index = boutiqueIdsOrder.indexOf(boutiqueId);
  final safeIndex = index >= 0 ? index : 0;
  return spendingStackFillColors[safeIndex % spendingStackFillColors.length];
}

String defaultBoutiqueLegendLabel(String boutiqueId) {
  if (boutiqueId.startsWith('boutique-')) {
    final suffix = boutiqueId.substring('boutique-'.length);
    if (suffix.isEmpty) {
      return boutiqueId;
    }
    return 'Boutique ${suffix.toUpperCase()}';
  }
  return boutiqueId;
}

String renderFinancialBarChartSvg({
  required List<FinancialBucketRow> rows,
  required ChartTimePeriod timePeriod,
  required FinancialChartMetric metric,
  ChartDimensions? dimensions,
  String currency = 'CDF',
}) {
  final chartDimensions = dimensions ??
      ChartDimensions(
        width: 600,
        height: 400,
        marginLeft: 72,
        marginBottom: 60,
        marginRight: 120,
      );

  final chart = BarChart<FinancialBucketRow>(
    data: rows,
    xTime: (row) => row.period,
    timeGranularity: timePeriod.barChartGranularity,
    yValue: (row) => row.value,
    dimensions: chartDimensions,
    showLegend: true,
    currency: currency,
    barColor: metric.barColor,
  );

  return chart.render();
}

/// Stacked time-series bars with one segment per [boutiqueIds] entry.
/// Uses a cool palette for income metrics and a warm palette for spending.
String renderFinancialStackedBarChartSvg({
  required List<FinancialStackedBucketRow> rows,
  required List<String> boutiqueIds,
  required ChartTimePeriod timePeriod,
  required FinancialChartMetric metric,
  ChartDimensions? dimensions,
  String currency = 'CDF',
  String Function(String boutiqueId)? boutiqueLegendLabel,
}) {
  final chartDimensions = dimensions ??
      ChartDimensions(
        width: 600,
        height: 400,
        marginLeft: 72,
        marginBottom: 60,
        marginRight: 120,
      );

  final label =
      boutiqueLegendLabel ?? defaultBoutiqueLegendLabel;

  final stackColor = metric.isIncome
      ? incomeStackColorForBoutique
      : spendingStackColorForBoutique;

  final chart = StackedBarChart<FinancialStackedBucketRow>(
    data: rows,
    xTime: (row) => row.period,
    timeGranularity: timePeriod.barChartGranularity,
    stackKeys: boutiqueIds,
    stackValue: (row, id) => row.valuesByBoutiqueId[id] ?? 0,
    stackLabel: label,
    stackColor: (id) => stackColor(id, boutiqueIds),
    dimensions: chartDimensions,
    showLegend: true,
    currency: currency,
  );

  return chart.render();
}
