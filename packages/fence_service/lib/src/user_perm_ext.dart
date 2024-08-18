import 'package:collection/collection.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

extension UserPermissionsExtension on UserPermissions {
  bool isBoutiqueAccessible(String boutiqueId) =>
      (fullAccess.hasFullAccess == false ||
          limitedAccess.boutiqueIds.ids.contains(boutiqueId) == false);
}

extension UserPermExt on String {
  bool isChainAccessible(UserPermissions userPermission) =>
      userPermission.fullAccess.hasFullAccess
          ? true
          : userPermission.limitedAccess.chainIds.ids
              .any((accessiblechainId) => accessiblechainId == this);
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
    if (userPermission.firmId == firmId) {
      if (userPermission.fullAccess.hasFullAccess) {
        return true;
      } else if (userPermission.limitedAccess.chainIds.ids
          .any((accessiblechainId) => accessiblechainId == chainId)) {
        return true;
      }
    }
    return false;
  }
}
