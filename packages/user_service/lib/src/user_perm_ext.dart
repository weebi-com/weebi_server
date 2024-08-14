import 'package:collection/collection.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

extension UserPermExt on String {
  bool isChainAccessible(UserPermissions userPermission) =>
      userPermission.chainsAccessible.oids
          .any((accessiblechainOid) => accessiblechainOid == this);
}

extension UserPermExt2 on Oids {
  bool areChainsAccessible(UserPermissions userPermission) {
    for (final chainOid in oids) {
      if (userPermission.chainsAccessible.oids
          .none((accessiblechainOid) => accessiblechainOid == chainOid)) {
        return false;
      }
    }
    return true;
  }
}

extension UserPermExt3 on Counterfoil {
  bool isFirmAndChainAccessible(UserPermissions userPermission) =>
      userPermission.firmOid == firmOid &&
      userPermission.chainsAccessible.oids
          .any((accessiblechainOid) => accessiblechainOid == chainOid);

  bool isBoutAccessible(UserPermissions userPermission) =>
      userPermission.firmOid == firmOid &&
      userPermission.chainsAccessible.oids
          .any((accessiblechainOid) => accessiblechainOid == chainOid);
}

//&&      userPermission.boutiquesAccessible.oids
//      .any((accessibleBoutiqueOid) => accessibleBoutiqueOid == boutiqueOid)

extension JsonExt on Map<String, dynamic> {
  Map<String, dynamic> addChain(String chainOid) {
    final d = {'chainOid': chainOid};
    return this..addAll(d);
  }
}
