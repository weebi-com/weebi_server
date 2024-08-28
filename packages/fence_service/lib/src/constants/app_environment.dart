import 'dart:io';

class AppEnvironment {
  static String get jwtSecretKey {
    String? jwtSecretKey = Platform.environment['JWT_SECRET_KEY'];
    if (jwtSecretKey == null) {
      throw Exception('Missing required environment variable: JWT_SECRET_KEY');
    }
    return jwtSecretKey;
  }
}
