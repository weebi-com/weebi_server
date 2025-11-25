import 'dart:convert';

import 'package:fence_service/src/constants/app_environment.dart';
import 'package:protos_weebi/encrypter.dart';
// import 'package:protos_weebi/protos_weebi_io.dart' show UserPermissions;

String _defaultJwtSecretKeyFactory() {
  final secretKey = AppEnvironment.jwtSecretKey;
  return secretKey;
}

class JsonWebToken {
  final String Function() secretKeyFactory;

  String _jwt = '';
  Map<String, dynamic> _header = {"alg": "HS256", "typ": "JWT"};
  Map<String, dynamic> _payload = {};

  JsonWebToken({this.secretKeyFactory = _defaultJwtSecretKeyFactory});

  JsonWebToken.parse(String jwt, {String Function()? secretKeyFactory})
      : secretKeyFactory = secretKeyFactory ?? _defaultJwtSecretKeyFactory {
    _jwt = jwt.trim(); // Remove any leading/trailing whitespace
    
    // Validate token structure
    final parts = _jwt.split('.');
    if (parts.length != 3) {
      throw FormatException(
        'Invalid JWT format: expected 3 parts separated by dots, got ${parts.length}',
        _jwt,
      );
    }

    // Validate each part is non-empty
    if (parts[0].isEmpty || parts[1].isEmpty || parts[2].isEmpty) {
      throw FormatException(
        'Invalid JWT format: one or more parts are empty',
        _jwt,
      );
    }

    // Validate base64url characters before normalization
    _validateBase64Url(parts[0], 'header');
    _validateBase64Url(parts[1], 'payload');
    _validateBase64Url(parts[2], 'signature');

    try {
      // Normalize base64URL by adding padding before decoding (JWT spec compliance)
      final encodedHeader = _normalizeBase64Url(parts[0]);
      _header = json.decode(utf8.decode(base64Url.decode(encodedHeader)));

      final encodedPayload = _normalizeBase64Url(parts[1]);
      _payload = json.decode(utf8.decode(base64Url.decode(encodedPayload)));
    } on FormatException catch (e) {
      // Provide more context about which part failed
      throw FormatException(
        'Failed to decode JWT: ${e.message}. Token length: ${_jwt.length}, '
        'Header length: ${parts[0].length}, Payload length: ${parts[1].length}, '
        'Signature length: ${parts[2].length}',
        _jwt,
        e.offset,
      );
    }
  }

  /// Validates that a string contains only valid base64url characters
  /// Base64url alphabet: A-Z, a-z, 0-9, -, _ (and = for padding, though we remove it)
  void _validateBase64Url(String encoded, String partName) {
    if (encoded.isEmpty) {
      throw FormatException('JWT $partName is empty', encoded);
    }

    // Check for valid base64url characters (A-Z, a-z, 0-9, -, _)
    // Note: We don't allow = here since padding should be removed in JWT tokens
    final base64UrlPattern = RegExp(r'^[A-Za-z0-9_-]+$');
    if (!base64UrlPattern.hasMatch(encoded)) {
      throw FormatException(
        'JWT $partName contains invalid base64url characters. '
        'Only A-Z, a-z, 0-9, -, and _ are allowed.',
        encoded,
      );
    }
  }

  /// Normalizes base64URL by adding padding if needed (required for decoding)
  /// JWT spec: padding is omitted during encoding but may be present/needed for decoding
  /// This function trims whitespace and validates before adding padding
  String _normalizeBase64Url(String encoded) {
    // Trim whitespace and newlines that might interfere with length calculation
    final trimmed = encoded.trim();
    
    if (trimmed.isEmpty) {
      throw FormatException('Cannot normalize empty base64url string', encoded);
    }

    // Calculate padding needed (base64 requires length to be multiple of 4)
    final remainder = trimmed.length % 4;
    if (remainder == 0) {
      return trimmed; // Already correct length, no padding needed
    }
    
    // Add padding: 1 char needs 3 padding, 2 chars need 2 padding, 3 chars need 1 padding
    final paddingNeeded = 4 - remainder;
    return trimmed + '=' * paddingNeeded;
  }

  /// Removes padding from base64URL (JWT spec compliance)
  /// JWT spec: padding must be omitted in the final token
  String _removePadding(String encoded) {
    return encoded.replaceAll('=', '');
  }

  String get sub => _payload['sub'];
  String get iat => _payload['iat'];
  int? get exp => _payload['exp'] as int?;

  Map<String, dynamic> get payload => _payload;

  // UserPermissions get userPermissions => UserPermissions.create()
  //   ..mergeFromProto3Json(_payload, ignoreUnknownFields: true);

  void createPayload(
    String userId, {
    Map<String, dynamic>? payload,
    Duration expireIn = const Duration(hours: 1),
  }) {
    _payload = {
      'sub': userId,
      'iat': DateTime.now().millisecondsSinceEpoch ~/ 1000,
      'exp': DateTime.now().add(expireIn).millisecondsSinceEpoch ~/ 1000,
      ...?payload,
    };
  }

  String sign() {
    final secretKey = secretKeyFactory();
    
    // Diagnostic: Check payload before JSON encoding
    try {
      final jsonString = json.encode(_payload);
      // print('[JWT DEBUG] JSON encoding successful, length: ${jsonString.length}');
      // print('[JWT DEBUG] JSON preview: ${jsonString.length > 200 ? jsonString.substring(0, 200) + "..." : jsonString}');
      
      final utf8Bytes = utf8.encode(jsonString);
      // print('[JWT DEBUG] UTF-8 encoding successful, bytes: ${utf8Bytes.length}');
      
      // Encode with base64Url and remove padding (JWT spec compliance)
      final encodedHeader = _removePadding(base64Url.encode(utf8.encode(json.encode(_header))));
      // print('[JWT DEBUG] Header encoded, length: ${encodedHeader.length}');
      
      final encodedPayload = _removePadding(base64Url.encode(utf8Bytes));
      // print('[JWT DEBUG] Payload encoded, length: ${encodedPayload.length}');
      // print('[JWT DEBUG] Payload preview: ${encodedPayload.length > 100 ? encodedPayload.substring(0, 50) + "..." + encodedPayload.substring(encodedPayload.length - 50) : encodedPayload}');

      final signature = Hmac(sha256, utf8.encode(secretKey))
          .convert(utf8.encode('$encodedHeader.$encodedPayload'))
          .bytes;

      final encodedSignature = _removePadding(base64Url.encode(signature));
      // print('[JWT DEBUG] Signature encoded, length: ${encodedSignature.length}');

      _jwt = '$encodedHeader.$encodedPayload.$encodedSignature';
      // print('[JWT DEBUG] Final token length: ${_jwt.length}');
      // print('[JWT DEBUG] Token parts count: ${_jwt.split(".").length}');
      
      return _jwt;
    } catch (e) {
      // print('[JWT ERROR] Failed during sign(): $e');
      // print('[JWT ERROR] Stack trace: $stackTrace');
      // print('[JWT ERROR] Payload keys: ${_payload.keys.toList()}');
      // print('[JWT ERROR] Payload types: ${_payload.map((k, v) => MapEntry(k, v.runtimeType.toString()))}');
      rethrow;
    }
  }

  bool verify() {
    try {
      final jwt = _jwt.trim(); // Remove any leading/trailing whitespace
      final parts = jwt.split('.');
      if (parts.length != 3) {
        return false; // Invalid token format
      }

      // Validate parts are non-empty
      if (parts[0].isEmpty || parts[1].isEmpty || parts[2].isEmpty) {
        return false; // Empty parts
      }

      // Normalize base64URL by adding padding before decoding
      // Note: We use the original parts (without padding) for signature verification
      // but need normalized versions for decoding the payload
      final encodedPayload = _normalizeBase64Url(parts[1]);
      final encodedSignature = parts[2].trim(); // Signature shouldn't have padding

      // 1. Verify Signature:
      final secretKey = secretKeyFactory();
      // Remove padding from header/payload for signature verification (as stored in token)
      // Use original parts, not normalized ones, since padding was removed during encoding
      final headerNoPadding = parts[0].trim();
      final payloadNoPadding = parts[1].trim();
      final expectedSignature = _removePadding(base64Url.encode(
          Hmac(sha256, utf8.encode(secretKey))
              .convert(utf8.encode('$headerNoPadding.$payloadNoPadding'))
              .bytes));

      if (expectedSignature != encodedSignature) {
        return false; // Invalid signature
      }

      // 2. Check Expiration:
      final payload =
          json.decode(utf8.decode(base64Url.decode(encodedPayload)));
      final expirationTimestamp =
          payload['exp'] as int?; // Get expiration timestamp

      if (expirationTimestamp == null) {
        return false; // Missing expiration claim
      }

      final expirationDate =
          DateTime.fromMillisecondsSinceEpoch(expirationTimestamp * 1000);
      return expirationDate.isAfter(DateTime.now()); // True if still valid
    } catch (e) {
      // Handle exceptions (e.g., invalid token format, decoding errors)
      return false;
    }
  }
}
