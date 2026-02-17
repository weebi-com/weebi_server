import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/logging.dart';
/// Extract userId and firmId from bearer when available (authenticated RPCs).
/// Returns null for public RPCs or when parsing fails.
Map<String, dynamic>? _extractUserContext(ServiceCall call) {
  try {
    final bearerRaw = call.clientMetadata?['authorization']
        ?.toString()
        .replaceFirst(RegExp(r'^Bearer\s+', caseSensitive: false), '')
        .trim();
    if (bearerRaw == null || bearerRaw.isEmpty) return null;
    final perms = bearerRaw.userPermissions;
    return {
      'userId': perms.userId,
      'firmId': perms.firmId,
    };
  } catch (_) {
    return null;
  }
}

/// Logs every gRPC request with rpcMethod, userId, firmId (when authenticated).
/// Must run AFTER authInterceptor so bearer is validated for protected RPCs.
Future<GrpcError?> loggingInterceptor(
  ServiceCall call,
  ServiceMethod method,
) async {
  final clientMetadata = call.clientMetadata ?? {};
  // gRPC over HTTP/2: :path = /package.Service/Method, :authority = host
  final path = clientMetadata[':path'] ?? method.name;
  final authority = clientMetadata[':authority'];

  final context = _extractUserContext(call);
  final logger = WeebiLogger.forService('LoggingInterceptor');
  logger.info(
    path,
    extra: {
      'rpcMethod': method.name,
      if (authority != null) 'authority': authority,
      if (context != null) ...context,
    },
  );

  return null;
}
