import 'package:fence_service/grpc.dart';
import 'package:fence_service/protos_weebi.dart';

/// Validates the optional FX snapshot persisted on a ticket.
///
/// Snapshot semantics:
/// - `snapshotSecondaryCurrency` is the ISO 4217 secondary code (e.g. USD)
/// - `snapshotLocalPerSecondary` is the number of **local** currency units
///   for **one** unit of the secondary currency (e.g. 2800 means 1 USD = 2800 local).
void assertValidFxSnapshot(TicketPb t) {
  final hasC = t.currency.isNotEmpty;
  final hasR = t.snapshotSecondaryCurrency.isNotEmpty &&  t.snapshotLocalPerSecondary > 0
      ;

  if (hasC != hasR) {
    throw GrpcError.invalidArgument(
      'snapshotSecondaryCurrency and snapshotLocalPerSecondary must both be set or both omitted',
    );
  }

  if (hasR) {
    final rate = t.snapshotLocalPerSecondary;
    if (rate <= 0 || rate > 1e9 || rate.isNaN || rate.isInfinite) {
      throw GrpcError.invalidArgument(
        'snapshotLocalPerSecondary must be a positive finite value',
      );
    }
    if (!RegExp(r'^[A-Za-z]{3}$').hasMatch(t.snapshotSecondaryCurrency)) {
      throw GrpcError.invalidArgument(
        'snapshotSecondaryCurrency must be a 3-letter ISO 4217 code',
      );
    }
  }
}

