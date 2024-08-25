//import 'dart:typed_data';
//import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

import 'package:protos_weebi/grpc.dart' show GrpcError;
import 'package:protos_weebi/protos_weebi_io.dart'
    show BoutiqueIndexAndDeviceIndex, Chain, Device;

extension MakeId on DateTime {
  String get objectIdString {
    return millisecondsSinceEpoch.toString();
  }
}

extension DeviceFinder on Chain {
  BoutiqueIndexAndDeviceIndex boutiqueIndexAndDeviceIndex(Device device) {
    final boutiqueIndex = boutiques.indexWhere((btq) =>
        btq.chainId == device.chainId && btq.boutiqueId == device.boutiqueId);
    if (boutiqueIndex == -1) {
      throw GrpcError.notFound('no boutique match found');
    }

    final deviceIndex = boutiques[boutiqueIndex].devices.indexWhere((d) =>
        d.chainId == device.chainId &&
        d.boutiqueId == device.boutiqueId &&
        d.deviceId == device.deviceId);
    if (deviceIndex == -1) {
      throw GrpcError.notFound('no device found');
    }
    return BoutiqueIndexAndDeviceIndex(
        boutiqueIndex: boutiqueIndex, deviceIndex: deviceIndex);
  }
}
