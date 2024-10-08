import 'package:collection/collection.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

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
      : limitedAccess.boutiqueIds.ids.contains(boutiqueId) == false;
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
