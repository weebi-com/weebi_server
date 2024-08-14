import 'package:collection/collection.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

extension UserPermExt on String {
  bool isChainAccessible(UserPermissions userPermission) =>
      userPermission.chainsAccessible.ids
          .any((accessiblechainId) => accessiblechainId == this);
}

extension UserPermExt2 on Ids {
  bool areChainsAccessible(UserPermissions userPermission) {
    for (final chainId in ids) {
      if (userPermission.chainsAccessible.ids
          .none((accessiblechainId) => accessiblechainId == chainId)) {
        return false;
      }
    }
    return true;
  }
}

extension UserPermExt3 on Counterfoil {
  bool isFirmAndChainAccessible(UserPermissions userPermission) =>
      userPermission.firmId == firmId &&
      userPermission.chainsAccessible.ids
          .any((accessiblechainId) => accessiblechainId == chainId);

  bool isBoutAccessible(UserPermissions userPermission) =>
      userPermission.firmId == firmId &&
      userPermission.chainsAccessible.ids
          .any((accessiblechainId) => accessiblechainId == chainId);
}

//&&      userPermission.boutiquesAccessible.ids
//      .any((accessibleboutiqueId) => accessibleboutiqueId == boutiqueId)

extension JsonExt on Map<String, dynamic> {
  Map<String, dynamic> addChain(String chainId) {
    final d = {'chainId': chainId};
    return this..addAll(d);
  }
}
