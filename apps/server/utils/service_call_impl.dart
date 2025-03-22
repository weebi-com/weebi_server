import 'dart:io' show InternetAddress, X509Certificate;
import 'package:grpc/service_api.dart';

class ServiceCallTest implements ServiceCall {
  final String jwt;
  final String path;
  ServiceCallTest(this.jwt, {this.path = ''});
  @override
  // TODO: implement clientCertificate
  X509Certificate? get clientCertificate => throw UnimplementedError();

  @override
  // TODO: implement clientMetadata
  Map<String, String>? get clientMetadata =>
      <String, String>{'authorization': jwt, 'path': path};

  @override
  // TODO: implement deadline
  DateTime? get deadline => throw UnimplementedError();

  @override
  // TODO: implement headers
  Map<String, String>? get headers => throw UnimplementedError();

  @override
  // TODO: implement isCanceled
  bool get isCanceled => throw UnimplementedError();

  @override
  // TODO: implement isTimedOut
  bool get isTimedOut => throw UnimplementedError();

  @override
  // TODO: implement remoteAddress
  InternetAddress? get remoteAddress => throw UnimplementedError();

  @override
  void sendHeaders() {
    // TODO: implement sendHeaders
  }

  @override
  void sendTrailers({int? status, String? message}) {
    // TODO: implement sendTrailers
  }

  @override
  // TODO: implement trailers
  Map<String, String>? get trailers => throw UnimplementedError();
}
