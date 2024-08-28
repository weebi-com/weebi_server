import 'dart:io';

class AppEnvironment {
  static int get port {
    return int.parse(Platform.environment['PORT']!);
  }

  static String get mongoDbUri {
    String? mongoDbUri = Platform.environment['MONGO_DB_URI'];
    if (mongoDbUri == null) {
      throw Exception('Missing required environment variable: MONGO_DB_URI');
    }
    return mongoDbUri;
  }
}