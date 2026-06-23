import 'package:protos_weebi/protos_weebi_io.dart' hide FinancialChartMetric, ChartTimePeriod;

import 'financial_chart_metric.dart';

TicketPb parseTicketPb(Map<String, dynamic> ticketJson) {
  final ticket = TicketPb();
  ticket.mergeFromProto3Json(ticketJson, ignoreUnknownFields: true);
  return ticket;
}

double ticketAmountForMetric(
  Map<String, dynamic> ticketJson,
  FinancialChartMetric metric,
) {
  final ticket = parseTicketPb(ticketJson);
  final ticketType = ticket.ticketType.name;
  if (!metric.includesTicketType(ticketType)) {
    return 0;
  }
  final amount = ticket.totalComputed;
  if (amount == 0) {
    // Fallback for cases where totalComputed might be 0 due to parsing issues
    // but received is present in the map
    final received = ticketJson['received'];
    if (received is num) {
      return received.toDouble();
    }
  }
  return amount;
}

bool ticketIsActive(Map<String, dynamic> ticketJson) {
  // If status is missing, we assume it's true (active)
  // Only explicitly false means cancelled.
  return ticketJson['status'] != false;
}

DateTime? parseTicketBusinessDate(Map<String, dynamic> ticketJson) {
  final raw = ticketJson['date'];
  if (raw == null) {
    return null;
  }
  if (raw is DateTime) {
    return raw;
  }
  if (raw is! String || raw.isEmpty) {
    return null;
  }
  return DateTime.tryParse(raw);
}

bool ticketDateInRange(
  Map<String, dynamic> ticketJson,
  DateTime start,
  DateTime end,
) {
  final date = parseTicketBusinessDate(ticketJson);
  if (date == null) {
    return false;
  }
  final notBeforeStart =
      date.isAfter(start) || date.isAtSameMomentAs(start);
  final notAfterEnd = date.isBefore(end) || date.isAtSameMomentAs(end);
  return notBeforeStart && notAfterEnd;
}
