import 'package:fence_service/grpc.dart';
import 'package:fence_service/protos_weebi.dart';

/// Calendar year of [ticketDateIso] (UTC year of the parsed instant).
///
/// Throws [GrpcError.invalidArgument] when empty or unparseable.
int ticketCalendarYear(String ticketDateIso) {
  final raw = ticketDateIso.trim();
  if (raw.isEmpty) {
    throw GrpcError.invalidArgument('ticket.date is required');
  }
  final parsed = DateTime.tryParse(raw);
  if (parsed == null) {
    throw GrpcError.invalidArgument('ticket.date is not a valid ISO date');
  }
  return parsed.toUtc().year;
}

/// Rejects ticket mutations whose business date falls in a closed year.
///
/// When [hasClosedYears] is false, returns immediately (no Mongo / no check).
/// [TicketTypePb.inventoryClosingValue] is allowlisted (created during clôture).
void assertTicketNotInClosedYears({
  required bool hasClosedYears,
  required TicketPb ticket,
  required Set<int> closedYears,
}) {
  if (!hasClosedYears) return;
  if (closedYears.isEmpty) return;

  final year = ticketCalendarYear(ticket.date);
  if (!closedYears.contains(year)) return;

  if (ticket.ticketType == TicketTypePb.inventoryClosingValue) return;

  throw GrpcError.failedPrecondition(
    'Année $year clôturée — ticket non accepté.',
  );
}
