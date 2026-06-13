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
  return ticket.totalComputed;
}

bool ticketIsActive(Map<String, dynamic> ticketJson) {
  return ticketJson['status'] == true;
}

DateTime? parseTicketBusinessDate(Map<String, dynamic> ticketJson) {
  final raw = ticketJson['date'];
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
