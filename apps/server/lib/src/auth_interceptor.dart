import 'dart:async';

import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';

FutureOr<GrpcError?> authInterceptor(ServiceCall call, ServiceMethod method) {
  if (call.clientMetadata?[':path'] == null) {
    print('authInterceptor clientMetadata?[path] == null');
    return GrpcError.unauthenticated();
  }
  if (call.clientMetadata![':path']!.toLowerCase().contains('authenticate')) {
    return null; // allow all authenticate RPC calls
  }
  if (call.clientMetadata![':path']!.toLowerCase().contains('signup')) {
    return null; // allow all signup RPC calls
  }
  if (call.clientMetadata![':path']!
      .toLowerCase()
      .contains('readappminimumversion')) {
    return null; // allow all read app min version RPC calls
  }
  if (call.clientMetadata![':path']!
      .toLowerCase()
      .contains('healthcheck')) {
    return null; // allow all read app min version RPC calls
  }
  // below stupid idea -> security risk
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
      print('jwt.sub.isEmpty');
    }
    return null; // authenticated by signed JWT
  } on GrpcError catch (e) {
    print('authInterceptor error $e');
    rethrow;
  }
}
