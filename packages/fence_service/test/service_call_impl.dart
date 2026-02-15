import 'dart:io' show InternetAddress, X509Certificate;

import 'package:fence_service/grpc.dart' show ServiceCall;

class ServiceCallTest implements ServiceCall {
  final String jwt;
  final String path;
  final String? sessionId;

  ServiceCallTest(this.jwt, {this.path = '', this.sessionId});

  @override
  // TOConsider: implement clientCertificate
  X509Certificate? get clientCertificate => throw UnimplementedError();

  @override
  // TOConsider: implement clientMetadata
  Map<String, String>? get clientMetadata {
    final meta = <String, String>{'authorization': jwt, 'path': path};
    if (sessionId != null && sessionId!.isNotEmpty) {
      meta['x-session-id'] = sessionId!;
    }
    return meta;
  }

  @override
  // TOConsider: implement deadline
  DateTime? get deadline => throw UnimplementedError();

  @override
  // TOConsider: implement headers
  Map<String, String>? get headers => throw UnimplementedError();

  @override
  // TOConsider: implement isCanceled
  bool get isCanceled => throw UnimplementedError();

  @override
  // TOConsider: implement isTimedOut
  bool get isTimedOut => throw UnimplementedError();

  @override
  // TOConsider: implement remoteAddress
  InternetAddress? get remoteAddress => throw UnimplementedError();

  @override
  void sendHeaders() {
    // TOConsider: implement sendHeaders
  }

  @override
  void sendTrailers({int? status, String? message}) {
    // TOConsider: implement sendTrailers
  }

  @override
  // TOConsider: implement trailers
  Map<String, String>? get trailers => throw UnimplementedError();
}
