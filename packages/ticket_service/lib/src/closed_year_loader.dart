import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/fence_service.dart' show FenceService;
import 'package:fence_service/protos_weebi.dart';

/// Loads soft-closed calendar years for one boutique from the chain document.
///
/// Returns an empty set when the chain/boutique is missing (fail-open on data
/// holes — [hasClosedYears] JWT flag should already be false in that case).
Future<Set<int>> loadBoutiqueClosedYears(
  Db db, {
  required String firmId,
  required String chainId,
  required String boutiqueId,
}) async {
  if (firmId.isEmpty || chainId.isEmpty || boutiqueId.isEmpty) {
    return const {};
  }

  final snap = await db.collection(FenceService.boutiqueCollectionName).findOne(
        where.eq('firmId', firmId).eq('chainId', chainId),
      );
  if (snap == null) return const {};

  final chain = Chain.create()
    ..mergeFromProto3Json(snap, ignoreUnknownFields: true);

  for (final b in chain.boutiques) {
    if (b.boutiqueId != boutiqueId && b.boutique.boutiqueId != boutiqueId) {
      continue;
    }
    return {
      for (final c in b.boutique.closedYears)
        if (c.year > 0) c.year,
    };
  }
  return const {};
}
