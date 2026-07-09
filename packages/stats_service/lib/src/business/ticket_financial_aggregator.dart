import 'financial_chart_query.dart';
import 'ticket_amount.dart';
import 'chart_time_period.dart';
import '../charts/bar_chart_time_granularity.dart';

DateTime floorChartPeriod(DateTime date, ChartTimePeriod period) {
  return floorBarChartPeriod(date, period.barChartGranularity);
}

List<FinancialBucketRow> aggregateTicketDocuments({
  required Iterable<Map<String, dynamic>> documents,
  required FinancialChartQuery query,
}) {
  final buckets = <DateTime, double>{};
  // print('aggregating ${documents.length} documents for metric ${query.metric}');

  for (final document in documents) {
    if (document['isDeleted'] == true) {
      continue;
    }
    final boutiqueId = document['boutiqueId'];
    if (boutiqueId is! String || !query.boutiqueIds.contains(boutiqueId)) {
      continue;
    }
    final firmId = document['firmId'];
    if (firmId is String && firmId != query.firmId) {
      continue;
    }

    final ticket = document['ticket'];
    if (ticket is! Map<String, dynamic>) {
      continue;
    }
    if (!ticketIsActive(ticket)) {
      continue;
    }
    if (!ticketDateInRange(ticket, query.start, query.end)) {
      continue;
    }

    final amount = ticketAmountForMetric(ticket, query.metric);
    if (amount == 0) {
      continue;
    }

    final date = parseTicketBusinessDate(ticket);
    if (date == null) {
      continue;
    }
    final period = floorChartPeriod(date, query.timePeriod);
    buckets[period] = (buckets[period] ?? 0) + amount;
  }
  // print('aggregated into ${buckets.length} buckets');

  final rows = buckets.entries
      .map(
        (entry) => FinancialBucketRow(
          period: entry.key,
          value: entry.value,
        ),
      )
      .toList()
    ..sort((a, b) => a.period.compareTo(b.period));

  return rows;
}

List<FinancialStackedBucketRow> aggregateTicketDocumentsStackedByBoutique({
  required Iterable<Map<String, dynamic>> documents,
  required FinancialChartQuery query,
}) {
  final buckets = <DateTime, Map<String, double>>{};
  // print('aggregating stacked ${documents.length} documents for metric ${query.metric}');

  for (final document in documents) {
    if (document['isDeleted'] == true) {
      continue;
    }
    final boutiqueId = document['boutiqueId'];
    if (boutiqueId is! String || !query.boutiqueIds.contains(boutiqueId)) {
      continue;
    }
    final firmId = document['firmId'];
    if (firmId is String && firmId != query.firmId) {
      continue;
    }

    final ticket = document['ticket'];
    if (ticket is! Map<String, dynamic>) {
      continue;
    }
    if (!ticketIsActive(ticket)) {
      continue;
    }
    if (!ticketDateInRange(ticket, query.start, query.end)) {
      continue;
    }

    final amount = ticketAmountForMetric(ticket, query.metric);
    if (amount == 0) {
      continue;
    }

    final date = parseTicketBusinessDate(ticket);
    if (date == null) {
      continue;
    }
    final period = floorChartPeriod(date, query.timePeriod);
    final byBoutique = buckets.putIfAbsent(period, () => <String, double>{});
    byBoutique[boutiqueId] = (byBoutique[boutiqueId] ?? 0) + amount;
  }
  // print('aggregated stacked into ${buckets.length} buckets');

  final sortedPeriods = buckets.keys.toList()..sort((a, b) => a.compareTo(b));
  return [
    for (final period in sortedPeriods)
      FinancialStackedBucketRow(
        period: period,
        valuesByBoutiqueId: {
          for (final id in query.boutiqueIds)
            id: buckets[period]![id] ?? 0,
        },
      ),
  ];
}
