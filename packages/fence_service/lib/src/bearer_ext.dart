import 'package:fence_service/src/jwt.dart';
import 'package:protos_weebi/grpc.dart' show ServiceCall, GrpcError;
import 'package:protos_weebi/protos_weebi_io.dart' show UserPermissions;

extension BearerExt on String {
  UserPermissions get userPermission {
    if (isEmpty) {
      return UserPermissions.create();
    } else {
      return UserPermissions.create()
        ..mergeFromProto3Json(JsonWebToken.parse(this).payload,
            ignoreUnknownFields: true);
    }
  }
}

extension ServiceCallExt on ServiceCall? {
  String get bearer {
    if (this == null ||
        this!.clientMetadata == null ||
        this!.clientMetadata!['authorization'] == null) {
      throw GrpcError.unauthenticated();
    } else {
      return this!.clientMetadata!['authorization']!;
    }
  }
}
