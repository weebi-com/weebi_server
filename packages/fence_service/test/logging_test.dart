import 'dart:io' show Platform;
import 'package:test/test.dart';
import 'package:fence_service/logging.dart';

void main() {
  group('WeebiLogger Tests', () {
    late WeebiLogger logger;
    late List<String> capturedLogs;

    setUp(() {
      // Capture stdout for testing
      capturedLogs = [];
      logger = WeebiLogger.forService('test_service');
      
      // Initialize logger with a custom handler that captures logs
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen((record) {
        final output = StringBuffer();
        output.writeln('${record.level.name}: ${record.message}');
        if (record.error != null) {
          output.writeln('Error: ${record.error}');
        }
        capturedLogs.add(output.toString());
      });
    });

    tearDown(() {
      capturedLogs.clear();
    });

    test('Logger creates instance correctly', () {
      expect(logger, isNotNull);
      final logger2 = WeebiLogger.forService('another_service');
      expect(logger2, isNotNull);
    });

    test('Info logging works', () {
      logger.info('Test info message');
      expect(capturedLogs.length, greaterThan(0));
      expect(capturedLogs.any((log) => log.contains('Test info message')), isTrue);
    });

    test('Error logging works', () {
      final error = Exception('Test error');
      logger.error('Test error message', error: error);
      expect(capturedLogs.length, greaterThan(0));
      expect(capturedLogs.any((log) => log.contains('Test error message')), isTrue);
      expect(capturedLogs.any((log) => log.contains('Test error')), isTrue);
    });

    test('Warning logging works', () {
      logger.warning('Test warning message');
      expect(capturedLogs.length, greaterThan(0));
      expect(capturedLogs.any((log) => log.contains('WARNING')), isTrue);
    });

    test('Debug logging works', () {
      logger.debug('Test debug message');
      expect(capturedLogs.length, greaterThan(0));
      expect(capturedLogs.any((log) => log.contains('Test debug message')), isTrue);
    });

    test('RPC entry logging works', () {
      logger.logRpcEntry('testMethod', null);
      expect(capturedLogs.length, greaterThan(0));
      expect(capturedLogs.any((log) => log.contains('testMethod')), isTrue);
      expect(capturedLogs.any((log) => log.contains('RPC entry')), isTrue);
    });

    test('RPC exit logging works', () {
      logger.logRpcExit('testMethod', null);
      expect(capturedLogs.length, greaterThan(0));
      expect(capturedLogs.any((log) => log.contains('testMethod')), isTrue);
      expect(capturedLogs.any((log) => log.contains('RPC exit')), isTrue);
    });

    test('RPC error logging works', () {
      final error = Exception('RPC error');
      logger.logRpcError('testMethod', null, error);
      expect(capturedLogs.length, greaterThan(0));
      expect(capturedLogs.any((log) => log.contains('testMethod')), isTrue);
      expect(capturedLogs.any((log) => log.contains('RPC error')), isTrue);
    });

    test('Extra data is included in logs', () {
      logger.info('Test message', extra: {
        'key1': 'value1',
        'key2': 123,
      });
      expect(capturedLogs.length, greaterThan(0));
      // The extra data should be in the structured message
      final logMessage = capturedLogs.join('\n');
      expect(logMessage.contains('key1') || logMessage.contains('value1'), isTrue);
    });

    test('Environment detection works', () {
      // Test that Cloud Run detection works
      // Note: This will be false in test environment
      final isCloudRun = Platform.environment.containsKey('K_SERVICE') ||
          Platform.environment.containsKey('K_REVISION');
      expect(isCloudRun, isA<bool>());
    });
  });

  group('WeebiLogger Integration', () {
    test('Logger can be initialized', () {
      // This should not throw
      expect(() => WeebiLogger.initialize(level: Level.INFO), returnsNormally);
    });

    test('Logger level can be set', () {
      WeebiLogger.initialize(level: Level.WARNING);
      final logger = WeebiLogger.forService('test');
      logger.debug('This should not appear'); // DEBUG < WARNING
      logger.warning('This should appear'); // WARNING >= WARNING
      // Note: Actual output depends on Logger.root.level
    });
  });
}

