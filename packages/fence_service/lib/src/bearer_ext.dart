import 'package:fence_service/src/entitlement_helpers.dart';
import 'package:fence_service/src/jwt.dart';
import 'package:protos_weebi/grpc.dart' show ServiceCall, GrpcError;
import 'package:protos_weebi/protos_weebi_io.dart' show UserPermissions;

// token already verified in auth interceptor
extension BearerExt on String {
  UserPermissions get userPermissions {
    if (isEmpty) {
      return UserPermissions.create();
    } else {
      try {
        final payload =
            JsonWebToken.parse(JsonWebToken.rawToken(this)).payload;
        final permissions = UserPermissions.create()
          ..mergeFromProto3Json(payload, ignoreUnknownFields: true);
        // Proto3 JSON merge can drop is_firm_creator / nested claims.
        if (jwtPayloadSaysFirmCreator(payload)) {
          permissions.isFirmCreator = true;
        }
        return permissions;
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
