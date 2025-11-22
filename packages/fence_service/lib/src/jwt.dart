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

  JsonWebToken.parse(String jwt)
      : secretKeyFactory = _defaultJwtSecretKeyFactory {
    _jwt = jwt;
    final parts = jwt.split('.');

    final encodedHeader = parts[0];
    _header = json.decode(utf8.decode(base64Url.decode(encodedHeader)));

    final encodedPayload = parts[1];
    _payload = json.decode(utf8.decode(base64Url.decode(encodedPayload)));
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

  /// Recursively cleans a map to ensure all values are JSON-serializable
  /// Removes null values and converts non-serializable objects
  dynamic _cleanValue(dynamic value) {
    if (value == null) {
      // Skip null values to avoid JSON encoding issues
      return null;
    } else if (value is Map) {
      final cleaned = <String, dynamic>{};
      (value as Map<String, dynamic>).forEach((key, val) {
        final cleanedVal = _cleanValue(val);
        if (cleanedVal != null) {
          cleaned[key] = cleanedVal;
        }
      });
      return cleaned;
    } else if (value is List) {
      return value.map((item) => _cleanValue(item)).whereType<dynamic>().toList();
    } else if (value is String || value is num || value is bool) {
      // Primitive types are safe
      return value;
    } else {
      // For any other type (enums, objects, etc.), convert to string
      // This ensures JSON serialization always works
      return value.toString();
    }
  }

  Map<String, dynamic> _cleanPayload(Map<String, dynamic> payload) {
    final cleaned = <String, dynamic>{};
    payload.forEach((key, value) {
      final cleanedValue = _cleanValue(value);
      if (cleanedValue != null) {
        cleaned[key] = cleanedValue;
      }
    });
    return cleaned;
  }

  String sign() {
    final secretKey = secretKeyFactory();
    
    // Clean payload to ensure JSON serialization works correctly
    final cleanedPayload = _cleanPayload(_payload);
    
    final encodedHeader = base64Url.encode(utf8.encode(json.encode(_header)));
    final encodedPayload = base64Url.encode(utf8.encode(json.encode(cleanedPayload)));

    final signature = Hmac(sha256, utf8.encode(secretKey))
        .convert(utf8.encode('$encodedHeader.$encodedPayload'))
        .bytes;

    final encodedSignature = base64Url.encode(signature);

    _jwt = '$encodedHeader.$encodedPayload.$encodedSignature';
    return _jwt;
  }

  bool verify() {
    try {
      final parts = _jwt.split('.');
      if (parts.length != 3) {
        return false; // Invalid token format
      }

      final encodedHeader = parts[0];
      final encodedPayload = parts[1];
      final encodedSignature = parts[2];

      // 1. Verify Signature:
      final secretKey = secretKeyFactory();
      final expectedSignature = base64Url.encode(
          Hmac(sha256, utf8.encode(secretKey))
              .convert(utf8.encode('$encodedHeader.$encodedPayload'))
              .bytes);

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
      // Handle exceptions (e.g., invalid token format)
      return false;
    }
  }
}
