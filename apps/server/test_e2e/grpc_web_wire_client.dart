import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

/// Raw HTTP + gRPC-Web response captured on the wire (before browser/JS hiding).
class GrpcWebWireResponse<T> {
  GrpcWebWireResponse({
    required this.httpStatus,
    required this.headers,
    required this.setCookies,
    required this.grpcStatus,
    required this.grpcMessage,
    required this.trailers,
    required this.rawBody,
    this.message,
  });

  final int httpStatus;
  final Map<String, String> headers;
  final List<String> setCookies;
  final int grpcStatus;
  final String grpcMessage;
  final Map<String, String> trailers;
  final Uint8List rawBody;
  final T? message;

  bool get isOk => httpStatus == 200 && grpcStatus == 0;
}

/// Minimal `application/grpc-web+proto` wire client over `dart:io` [HttpClient].
///
/// Unlike browser XHR, this exposes raw `Set-Cookie` headers, CORS preflight
/// headers, and exact binary protobuf bytes returned by Envoy.
class GrpcWebWireClient {
  GrpcWebWireClient(String baseUrl)
      : _baseUri = Uri.parse(
          baseUrl.endsWith('/')
              ? baseUrl.substring(0, baseUrl.length - 1)
              : baseUrl,
        ),
        _http = HttpClient()..connectionTimeout = const Duration(seconds: 15);

  final Uri _baseUri;
  final HttpClient _http;

  void close() {
    _http.close(force: true);
  }

  /// Sends a browser-style CORS `OPTIONS` preflight request to Envoy.
  Future<({int statusCode, Map<String, String> headers})> optionsPreflight(
    String rpcPath, {
    String origin = 'http://localhost:50858',
    String requestHeaders = 'content-type,x-grpc-web,x-user-agent,x-session-id',
  }) async {
    final uri = _baseUri.replace(path: rpcPath);
    final req = await _http.openUrl('OPTIONS', uri);
    req.headers
      ..set('origin', origin)
      ..set('access-control-request-method', 'POST')
      ..set('access-control-request-headers', requestHeaders);
    final res = await req.close();
    await res.drain<void>();
    return (statusCode: res.statusCode, headers: _flattenHeaders(res.headers));
  }

  /// Invokes a unary RPC over `application/grpc-web+proto` through Envoy.
  Future<GrpcWebWireResponse<R>> unary<R>(
    String rpcPath,
    List<int> requestBytes,
    R Function(List<int> bytes) decode, {
    Map<String, String> metadata = const {},
    String origin = 'http://localhost:50858',
  }) async {
    final uri = _baseUri.replace(path: rpcPath);
    final httpReq = await _http.postUrl(uri);
    httpReq.headers
      ..set(HttpHeaders.contentTypeHeader, 'application/grpc-web+proto')
      ..set('x-grpc-web', '1')
      ..set('origin', origin);

    metadata.forEach((key, value) {
      httpReq.headers.set(key, value);
    });

    final frame = BytesBuilder(copy: false)
      ..addByte(0x00) // uncompressed data frame
      ..add(_uint32BigEndian(requestBytes.length))
      ..add(requestBytes);
    httpReq.add(frame.takeBytes());

    final httpRes = await httpReq.close();
    final bodyChunks = await httpRes.fold<BytesBuilder>(
      BytesBuilder(copy: false),
      (builder, chunk) => builder..add(chunk),
    );
    final rawBody = bodyChunks.takeBytes();
    final flatHeaders = _flattenHeaders(httpRes.headers);
    final setCookies = List<String>.unmodifiable(
      httpRes.headers[HttpHeaders.setCookieHeader] ?? const <String>[],
    );

    final parsed = _parseGrpcWebFrames(rawBody, flatHeaders);
    R? decoded;
    if (parsed.dataFrame != null) {
      decoded = decode(parsed.dataFrame!);
    } else if (httpRes.statusCode == 200 && parsed.grpcStatus == 0) {
      // Empty protobuf message (e.g. Empty()) encodes to a 0-length data frame.
      decoded = decode(const <int>[]);
    }

    return GrpcWebWireResponse<R>(
      httpStatus: httpRes.statusCode,
      headers: flatHeaders,
      setCookies: setCookies,
      grpcStatus: parsed.grpcStatus,
      grpcMessage: parsed.grpcMessage,
      trailers: parsed.trailers,
      rawBody: rawBody,
      message: decoded,
    );
  }

  static Uint8List _uint32BigEndian(int length) {
    final bd = ByteData(4)..setUint32(0, length, Endian.big);
    return bd.buffer.asUint8List();
  }

  static Map<String, String> _flattenHeaders(HttpHeaders headers) {
    final out = <String, String>{};
    headers.forEach((name, values) {
      out[name.toLowerCase()] = values.join(', ');
    });
    return out;
  }

  static ({
    Uint8List? dataFrame,
    Map<String, String> trailers,
    int grpcStatus,
    String grpcMessage,
  }) _parseGrpcWebFrames(
    Uint8List body,
    Map<String, String> responseHeaders,
  ) {
    Uint8List? dataFrame;
    final trailers = <String, String>{};
    var offset = 0;

    while (offset + 5 <= body.length) {
      final flag = body[offset];
      final length = ByteData.sublistView(body, offset + 1, offset + 5)
          .getUint32(0, Endian.big);
      offset += 5;
      if (offset + length > body.length) {
        break;
      }
      final slice = Uint8List.sublistView(body, offset, offset + length);
      offset += length;

      if ((flag & 0x80) != 0) {
        // Trailer frame: HTTP/1.1 header lines separated by \r\n
        final text = utf8.decode(slice, allowMalformed: true);
        for (final line in text.split('\r\n')) {
          final idx = line.indexOf(':');
          if (idx > 0) {
            final k = line.substring(0, idx).trim().toLowerCase();
            final v = line.substring(idx + 1).trim();
            trailers[k] = v;
          }
        }
      } else if (flag == 0x00) {
        dataFrame = slice;
      }
    }

    final statusRaw =
        trailers['grpc-status'] ?? responseHeaders['grpc-status'] ?? '0';
    final msgRaw =
        trailers['grpc-message'] ?? responseHeaders['grpc-message'] ?? '';

    return (
      dataFrame: dataFrame,
      trailers: trailers,
      grpcStatus: int.tryParse(statusRaw) ?? -1,
      grpcMessage: Uri.decodeFull(msgRaw),
    );
  }
}
