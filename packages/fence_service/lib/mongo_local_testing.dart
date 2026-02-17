/// MongoDB test utilities for weebi services.
///
/// Use this in tests for fence_service, article_service, contact_service,
/// ticket_service, etc. Provides [TestHelper] with:
/// - [TestHelper.poolForDatabase] – isolated DB per test file (recommended for parallel tests)
/// - [TestHelper.defaultPoolService] – shared DB (legacy)
/// - [TestHelper.local], [TestHelper.localDb] – base URI and Db
///
/// Example:
/// ```dart
/// import 'package:fence_service/mongo_local_testing.dart';
///
/// void main() async {
///   final pool = TestHelper.poolForDatabase('my_service_test');
///   await pool.initialize();
///   // ...
/// }
/// ```
library;

export 'src/testing/test_helper.dart';
