import 'package:protos_weebi/protos_weebi_io.dart';

/// True when any boutique in [chains] has at least one soft-closed calendar year.
bool firmHasClosedYears(Iterable<Chain> chains) {
  for (final chain in chains) {
    for (final b in chain.boutiques) {
      if (b.boutique.closedYears.any((c) => c.year > 0)) return true;
    }
  }
  return false;
}
