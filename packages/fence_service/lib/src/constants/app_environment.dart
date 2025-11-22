import 'dart:io';

/// Centralized environment configuration for weebi server
class AppEnvironment {
  // Server configuration
  static int get port {
    return int.parse(Platform.environment['PORT'] ?? '8080');
  }

  static int get httpPort {
    return int.parse(Platform.environment['HTTP_PORT'] ?? '8081');
  }

  static String get mongoDbUri {
    String? mongoDbUri = Platform.environment['MONGO_DB_URI'];
    if (mongoDbUri == null) {
      throw Exception('Missing required environment variable: MONGO_DB_URI');
    }
    return mongoDbUri;
  }

  // Security configuration
  static String get jwtSecretKey {
    final jwtSecretKey = Platform.environment['JWT_SECRET_KEY'];

    if (jwtSecretKey != null && jwtSecretKey.isNotEmpty) {
      return jwtSecretKey;
    }

    // Allow test key only in non-production environments
    if (_isTestOrCI) {
      return 'test-secret-key-for-ci';
    }

    throw Exception('Missing required environment variable: JWT_SECRET_KEY\n'
        'This is required in production. For testing, set CI=true or ENVIRONMENT=test');
  }

  // weebi_express service configuration
  static String? get weebiExpressBaseUrl {
    return Platform.environment['WEEBI_EXPRESS_BASE_URL'];
  }

  static String get weebiExpressJwtSecretKey {
    // Use WEEBI_EXPRESS_JWT_SECRET_KEY if set, otherwise fall back to JWT_SECRET_KEY
    final expressSecret = Platform.environment['WEEBI_EXPRESS_JWT_SECRET_KEY'];
    if (expressSecret != null && expressSecret.isNotEmpty) {
      return expressSecret;
    }
    return jwtSecretKey;
  }

  // Environment detection
  static bool get _isTestOrCI {
    // Check for CI environments
    if ((Platform.environment['CI'] ?? '') == 'true') return true;
    if ((Platform.environment['GITHUB_ACTIONS'] ?? '') == 'true') return true;

    // Check for explicit test environment
    final env = (Platform.environment['ENVIRONMENT'] ?? '');
    if (env == 'test' || env == 'ci') return true;

    // Check if running under dart test
    if (Platform.environment.containsKey('_DART_TEST_RUNNER')) return true;
    if ((Platform.environment['SESSIONNAME'] ?? '') == 'Console') return true;

    return false;
  }
}
