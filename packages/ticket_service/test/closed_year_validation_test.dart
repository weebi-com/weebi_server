import 'package:fence_service/grpc.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';
import 'package:ticket_service/ticket_service.dart';

TicketPb _ticket({
  required String date,
  TicketTypePb type = TicketTypePb.sell,
}) {
  return TicketPb.create()
    ..date = date
    ..ticketType = type
    ..creationDate = date
    ..status = true;
}

void main() {
  group('assertTicketNotInClosedYears', () {
    test('skips when hasClosedYears is false even if years non-empty', () {
      expect(
        () => assertTicketNotInClosedYears(
          hasClosedYears: false,
          ticket: _ticket(date: '2024-06-15T10:00:00.000'),
          closedYears: {2024},
        ),
        returnsNormally,
      );
    });

    test('rejects ticket in closed year when flag true', () {
      try {
        assertTicketNotInClosedYears(
          hasClosedYears: true,
          ticket: _ticket(date: '2024-06-15T10:00:00.000'),
          closedYears: {2024},
        );
        fail('Expected GrpcError.failedPrecondition');
      } on GrpcError catch (e) {
        expect(e.code, StatusCode.failedPrecondition);
        expect(e.message!.toLowerCase(), contains('clôtur'));
      }
    });

    test('allows ticket in open year when flag true', () {
      expect(
        () => assertTicketNotInClosedYears(
          hasClosedYears: true,
          ticket: _ticket(date: '2025-06-15T10:00:00.000'),
          closedYears: {2024},
        ),
        returnsNormally,
      );
    });

    test('allows inventoryClosingValue in closed year', () {
      expect(
        () => assertTicketNotInClosedYears(
          hasClosedYears: true,
          ticket: _ticket(
            date: '2024-12-31T23:59:59.000',
            type: TicketTypePb.inventoryClosingValue,
          ),
          closedYears: {2024},
        ),
        returnsNormally,
      );
    });

    test('rejects empty ticket.date when flag true', () {
      try {
        assertTicketNotInClosedYears(
          hasClosedYears: true,
          ticket: _ticket(date: ''),
          closedYears: {2024},
        );
        fail('Expected GrpcError.invalidArgument');
      } on GrpcError catch (e) {
        expect(e.code, StatusCode.invalidArgument);
      }
    });

    test('rejects unparseable ticket.date when flag true', () {
      try {
        assertTicketNotInClosedYears(
          hasClosedYears: true,
          ticket: _ticket(date: 'not-a-date'),
          closedYears: {2024},
        );
        fail('Expected GrpcError.invalidArgument');
      } on GrpcError catch (e) {
        expect(e.code, StatusCode.invalidArgument);
      }
    });

    test('extracts calendar year from ISO date (UTC)', () {
      expect(
        () => assertTicketNotInClosedYears(
          hasClosedYears: true,
          ticket: _ticket(date: '2024-12-31T23:00:00.000Z'),
          closedYears: {2024},
        ),
        throwsA(isA<GrpcError>()),
      );
      expect(
        () => assertTicketNotInClosedYears(
          hasClosedYears: true,
          ticket: _ticket(date: '2025-01-01T00:00:00.000Z'),
          closedYears: {2024},
        ),
        returnsNormally,
      );
    });
  });

  group('ticketCalendarYear', () {
    test('parses year from ISO string', () {
      expect(ticketCalendarYear('2024-06-15T10:00:00.000'), 2024);
    });
  });
}
