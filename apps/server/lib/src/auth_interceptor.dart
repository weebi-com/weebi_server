import 'dart:async';

import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/logging.dart';

/// Returns true if the call should bypass auth (public RPCs).
bool _isPublicRpc(String? path, String methodName) {
  final pathLower = path?.toLowerCase() ?? '';
  final methodLower = methodName.toLowerCase();

  if (pathLower.contains('authenticate') || methodLower.contains('authenticate')) {
    return true;
  }
  if (pathLower.contains('signup') || methodLower.contains('signup')) {
    return true;
  }
  if (pathLower.contains('requestpasswordreset') || methodLower.contains('requestpasswordreset') ||
      pathLower.contains('confirmpasswordreset') || methodLower.contains('confirmpasswordreset')) {
    return true;
  }
  if (pathLower.contains('exchangewebbridgetoken') ||
      methodLower.contains('exchangewebbridgetoken')) {
    return true;
  }
  if (pathLower.contains('readappminimumversion') || methodLower.contains('readappminimumversion')) {
    return true;
  }
  if (pathLower.contains('healthcheck') || methodLower.contains('healthcheck')) {
    return true;
  }
  // BoutiqueScore lead capture — unauthenticated public funnel (spam controls later).
  if (pathLower.contains('submitevaluation') || methodLower.contains('submitevaluation')) {
    return true;
  }
  return false;
}

FutureOr<GrpcError?> authInterceptor(ServiceCall call, ServiceMethod method) {
  final path = call.clientMetadata?[':path'] ?? call.clientMetadata?['path'];

  // Internal Envoy → backend RPC authenticated with x-api-key
  final pathLower = path?.toLowerCase() ?? '';
  final methodLower = method.name.toLowerCase();
  if (pathLower.contains('getsessioninternal') ||
      methodLower.contains('getsessioninternal')) {
    final apiKey = call.clientMetadata?['x-api-key'];
    if (apiKey == AppEnvironment.envoyApiKey) {
      return null;
    }
    return GrpcError.permissionDenied(
      'Invalid or missing API key for ${method.name}',
    );
  }

  // Public RPCs (signup, healthCheck, SubmitEvaluation, …)
  if (_isPublicRpc(path, method.name)) {
    return null;
  }

  final authLogger = WeebiLogger.forService('AuthInterceptor');
  if (path == null || path.isEmpty) {
    authLogger.warning('Auth: path null/empty', extra: {'rpcMethod': method.name});
  }

  try {
    final bearerRaw = call.bearer.replaceAll('Bearer ', '');
    final jwt = JsonWebToken.parse(bearerRaw);
    if (jwt.verify() == false) {
      return GrpcError.unauthenticated(
          'jwt.verify() == false, wrong/expired token ?');
    }
    if (jwt.sub.isEmpty) {
      authLogger.warning('Auth: JWT sub empty', extra: {'rpcMethod': method.name});
    }
    return null; // authenticated by signed JWT
  } on GrpcError catch (e) {
    authLogger.warning(
      'Auth failed: ${e.message ?? "unknown"}',
      extra: {
        'rpcMethod': method.name,
        'path': path ?? '',
        'grpcCode': e.code.toString(),
      },
    );
    return e;
  }
}
