import 'package:collection/collection.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

/// Fills identity fields on [incoming] from the stored user when the client
/// sent a sparse permissions payload (e.g. access-only update).
///
/// Does **not** resurrect wiped CRUD rights — that is a client concern.
/// Mutates and returns [incoming].
UserPermissions coalesceUserIdentity(
  UserPermissions incoming, {
  required String documentFirmId,
  required UserPermissions existing,
}) {
  if (incoming.firmId.isEmpty) {
    if (documentFirmId.isNotEmpty) {
      incoming.firmId = documentFirmId;
    } else if (existing.firmId.isNotEmpty) {
      incoming.firmId = existing.firmId;
    }
  }
  if (incoming.userId.isEmpty && existing.userId.isNotEmpty) {
    incoming.userId = existing.userId;
  }
  // Proto3 bool false cannot mean "unset"; keep creator flag one-way sticky.
  if (existing.isFirmCreator) {
    incoming.isFirmCreator = true;
  }
  return incoming;
}

extension UserPermissionsExtension on UserPermissions {
  bool isFirmAccessible(String firmId) =>
      firmId.isEmpty || this.firmId != firmId ? false : true;

  bool isFirmAndChainAccessible(String firmId, String chainId) =>
      isFirmAccessible(firmId) ? isChainAccessible(chainId) : false;

  bool isChainAccessible(String chainId) => fullAccess.hasFullAccess == false &&
          limitedAccess.chainIds.ids
              .none((accessiblechainId) => accessiblechainId == chainId)
      ? false
      : true;

  bool isBoutiqueAccessible(String boutiqueId) => fullAccess.hasFullAccess
      ? true
      : limitedAccess.boutiqueIds.ids.contains(boutiqueId);
}

extension UserPermExt2 on ChainIds {
  bool areChainsAccessible(UserPermissions userPermission) {
    if (userPermission.fullAccess.hasFullAccess) {
      return true;
    }
    for (final chainId in ids) {
      if (userPermission.limitedAccess.chainIds.ids
          .none((accessiblechainId) => accessiblechainId == chainId)) {
        return false;
      }
    }
    return true;
  }
}

extension UserPermExt3 on Counterfoil {
  bool isFirmAndChainAccessible(UserPermissions userPermission) {
    if (userPermission.firmId.isNotEmpty) {
      if (userPermission.firmId == firmId) {
        if (userPermission.fullAccess.hasFullAccess) {
          return true;
        } else if (userPermission.limitedAccess.chainIds.ids
            .any((accessiblechainId) => accessiblechainId == chainId)) {
          return true;
        }
      }
    }
    return false;
  }
}
