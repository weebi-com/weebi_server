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
  if (pathLower.contains('readappminimumversion') || methodLower.contains('readappminimumversion')) {
    return true;
  }
  if (pathLower.contains('healthcheck') || methodLower.contains('healthcheck')) {
    return true;
  }
  return false;
}

FutureOr<GrpcError?> authInterceptor(ServiceCall call, ServiceMethod method) {
  final path = call.clientMetadata?[':path'] ?? call.clientMetadata?['path'];
  if (_isPublicRpc(path, method.name)) {
    return null; // allow public RPC calls (no auth required)
  }
  final authLogger = WeebiLogger.forService('AuthInterceptor');
  if (path == null || path.isEmpty) {
    authLogger.warning('Auth: path null/empty', extra: {'rpcMethod': method.name});
  }
  // ! below stupid idea -> security risk
  //if (call.clientMetadata![':path']!.toLowerCase().contains('createdevice')) {
  //  return null; // allow all createPendingDevice RPC calls
  //}
  try {
    // final jwt2 = call.clientMetadata!['authorization'];
    // print('jwt2');
    // print(jwt2);
    // * front app will also use an interceptor to add the token
    // * the method can only add metadata, parse in the bearer getter below
    // * then removing the potential Bearer + trailing space that could be added
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
    rethrow;
  }
}
