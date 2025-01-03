import 'package:fence_service/src/jwt.dart';
import 'package:protos_weebi/grpc.dart' show ServiceCall, GrpcError;
import 'package:protos_weebi/protos_weebi_io.dart' show UserPermissions;

extension BearerExt on String {
  UserPermissions get userPermissions {
    if (isEmpty) {
      return UserPermissions.create();
    } else {
      try {
        final d = JsonWebToken.parse(this).payload;
        return UserPermissions.create()
          ..mergeFromProto3Json(d, ignoreUnknownFields: true);
      } on FormatException catch (e) {
        print('BearerExt userPermissions $e');
        rethrow;
      } catch (e) {
        rethrow;
      }
    }
  }
}

extension ServiceCallExt on ServiceCall? {
  String get bearer {
    if (this == null ||
        this!.clientMetadata == null ||
        this!.clientMetadata!['authorization'] == null ||
        this!.clientMetadata!['authorization']!.isEmpty) {
      throw GrpcError.unauthenticated();
    } else {
      return this!.clientMetadata!['authorization']!;
    }
  }
}
