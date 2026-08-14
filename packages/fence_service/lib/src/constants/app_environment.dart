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

  // Stripe configuration
  static String? get stripeSecretKey =>
      Platform.environment['STRIPE_SECRET_KEY'];

  // PawaPay Merchant API (billing_service create/fetch checkout)
  static String? get pawapayApiToken =>
      Platform.environment['PAWAPAY_API_TOKEN'];

  static String? get pawapayApiBaseUrl {
    final v = Platform.environment['PAWAPAY_API_BASE_URL']?.trim();
    if (v != null && v.isNotEmpty) return v;
    return null;
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

  /// Public webapp origin used to build App->Web magic-link URLs.
  /// Example: https://portal.weebi.com
  static String get webappBaseUrl {
    final url = Platform.environment['WEBAPP_BASE_URL']?.trim();
    if (url != null && url.isNotEmpty) {
      return url;
    }
    if (_isTestOrCI) {
      return 'https://portal.weebi.test';
    }
    throw Exception(
      'Missing required environment variable: WEBAPP_BASE_URL\n'
      'This is required to build createWebBridgeLink URLs for the web portal',
    );
  }

  // Envoy BFF configuration
  static String get envoyApiKey {
    final apiKey = Platform.environment['ENVOY_API_KEY'];
    if (apiKey != null && apiKey.isNotEmpty) {
      return apiKey;
    }
    if (_isTestOrCI) {
      return 'test-envoy-api-key';
    }
    throw Exception(
      'Missing required environment variable: ENVOY_API_KEY\n'
      'This is required for Envoy to authenticate with FenceService.getSessionInternal\n'
      'Set this in your Cloud Run / deployment environment'
    );
  }

  /// Turso / libSQL HTTP URL for BoutiqueScore evaluations (e.g. libsql://… or https://…).
  /// Null when unset — the gRPC server still boots; SubmitEvaluation then returns unavailable.
  static String? get tursoDatabaseUrl {
    final url = Platform.environment['TURSO_DATABASE_URL']?.trim();
    if (url == null || url.isEmpty) return null;
    return url;
  }

  /// Turso auth token (Bearer) for SQL-over-HTTP pipeline.
  static String? get tursoAuthToken {
    final token = Platform.environment['TURSO_AUTH_TOKEN']?.trim();
    if (token == null || token.isEmpty) return null;
    return token;
  }

  /// false by default
  /// When `true` ticket/article/contact RPCs require that user is either 
  /// firm creator 
  /// an active license seat
  /// (see [assertUserHasOperationalLicense]).
  ///
  /// For unit tests, [debugLicenseCheckEnforcedOverride] takes precedence when non-null.
  static bool? debugLicenseCheckEnforcedOverride;

  static bool get isLicenseCheckEnforced {
    if (debugLicenseCheckEnforcedOverride != null) {
      return debugLicenseCheckEnforcedOverride!;
    }
    final v =
        Platform.environment['LICENSE_CHECK_ENFORCED']?.trim().toLowerCase();
    if (v == null || v.isEmpty) {
      return false;
    } else {
      return v == 'true' || v == '1' || v == 'yes' || v == 'on';
    }
  }

  /// ISO 4217 default when firm/chain/boutique omit currency (override via FIRMS_DEFAULT_CURRENCY).
  static String get platformDefaultCurrency {
    final v = Platform.environment['FIRMS_DEFAULT_CURRENCY']?.trim();
    if (v != null && v.length == 3) {
      return v.toUpperCase();
    }
    return 'EUR';
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
