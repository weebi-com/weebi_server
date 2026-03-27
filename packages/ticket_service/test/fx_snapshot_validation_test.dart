import 'package:fence_service/grpc.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';
import 'package:ticket_service/ticket_service.dart';

void main() {
  group('assertValidFxSnapshot', () {
    test('accepts consistent snapshot (secondary + rate)', () {
      final t = TicketPb.create()
        ..snapshotSecondaryCurrency = 'USD'
        ..snapshotLocalPerSecondary = 2800;

      expect(() => assertValidFxSnapshot(t), returnsNormally);
    });

    test('rejects missing local per secondary when secondary set', () {
      final t = TicketPb.create()..snapshotSecondaryCurrency = 'USD';

      try {
        assertValidFxSnapshot(t);
        fail('Expected GrpcError.invalidArgument');
      } on GrpcError catch (e) {
        expect(e.code, 3); // INVALID_ARGUMENT
      }
    });

    test('rejects non-positive rate', () {
      final t = TicketPb.create()
        ..snapshotSecondaryCurrency = 'USD'
        ..snapshotLocalPerSecondary = 0;

      try {
        assertValidFxSnapshot(t);
        fail('Expected GrpcError.invalidArgument');
      } on GrpcError catch (e) {
        expect(e.code, 3); // INVALID_ARGUMENT
      }
    });

    test('rejects invalid secondary code length', () {
      final t = TicketPb.create()
        ..snapshotSecondaryCurrency = 'USDE'
        ..snapshotLocalPerSecondary = 2800;

      try {
        assertValidFxSnapshot(t);
        fail('Expected GrpcError.invalidArgument');
      } on GrpcError catch (e) {
        expect(e.code, 3); // INVALID_ARGUMENT
      }
    });
  });
}

