import 'dart:async';

import 'package:protos_weebi/grpc.dart';
import 'package:user_service/src/bearer_ext.dart';
import 'package:user_service/src/jwt.dart';

FutureOr<GrpcError?> authInterceptor(ServiceCall call, ServiceMethod method) {
  if (call.clientMetadata?[':path'] == null) {
    print('authInterceptor clientMetadata?[path] == null');
    return GrpcError.unauthenticated();
  }
  if (call.clientMetadata![':path']!.toLowerCase().contains('authenticate')) {
    return null; // allow all authenticate RPC calls
  }
  if (call.clientMetadata![':path']!
      .toLowerCase()
      .contains('readappminimumversion')) {
    return null; // allow all read app min version RPC calls
  }
  if (call.clientMetadata![':path']!.toLowerCase().contains('paironedevice')) {
    return null; // allow all pair one device RPC calls
  }
  try {
    final jwt2 = call.clientMetadata!['authorization'];
    print('jwt2');
    print(jwt2);
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
    print('authInterceptor $e');
    rethrow;
  }
}
