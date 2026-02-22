import 'dart:convert';
import 'dart:io' show Platform;
import 'package:logging/logging.dart';
import 'package:protos_weebi/grpc.dart' show ServiceCall;
import 'package:fence_service/src/bearer_ext.dart';

/// Structured logging utility for Weebi services
/// Provides JSON-formatted logs compatible with Google Cloud Run
class WeebiLogger {
  final Logger _logger;

  WeebiLogger._(this._logger);

  /// Create a logger for a specific service
  factory WeebiLogger.forService(String serviceName) {
    final logger = Logger(serviceName);
    return WeebiLogger._(logger);
  }

  /// Returns a logger that automatically includes userId/firmId from [call]
  /// in every log. Use at the start of an RPC handler to avoid passing call
  /// to each _logger call.
  ///
  /// Example:
  /// ```dart
  /// Future<Firm> readOneFirm(ServiceCall? call, Empty request) async {
  ///   final log = _logger.withContext(call);
  ///   log.info('Reading firm');  // automatically includes userId, firmId
  ///   log.error('Failed', error: e);  // same
  ///   ...
  /// }
  /// ```
  WeebiLoggerWithContext withContext(ServiceCall? call) {
    return WeebiLoggerWithContext(this, call);
  }

  /// Initialize logging with JSON formatter for Cloud Run
  static void initialize({Level level = Level.INFO}) {
    Logger.root.level = level;
    
    Logger.root.onRecord.listen((record) {
      // All logs are sanitized to prevent MongoDB credentials from leaking
      // Useful mongo_dart INFO logs are preserved, just with credentials masked
      _logToCloudRun(record);
    });
  }

  /// Check if running in Google Cloud Run
  static bool get _isCloudRun {
    return Platform.environment.containsKey('K_SERVICE') ||
        Platform.environment.containsKey('K_REVISION');
  }
  
  /// Get the service name (Cloud Run service name or default)
  static String get _serviceName {
    return Platform.environment['K_SERVICE'] ?? 
           Platform.environment['SERVICE_NAME'] ?? 
           'weebi-server';
  }
  
  /// Log to stdout - JSON format for Cloud Run, readable format for local development
  static void _logToCloudRun(LogRecord record) {
    // Parse structured data from message if it contains JSON
    Map<String, dynamic>? structuredData;
    String message = record.message;
    
    // Sanitize MongoDB URIs in the message
    message = _sanitizeMongoUri(message);
    
    // Check if message contains JSON structure
    if (record.message.startsWith('{') && record.message.contains('"message"')) {
      try {
        structuredData = jsonDecode(record.message) as Map<String, dynamic>;
        message = structuredData['message'] as String? ?? record.message;
        message = _sanitizeMongoUri(message);
        structuredData.remove('message');
        // Sanitize all values in structured data
        structuredData = structuredData.map((key, value) {
          if (value is String) {
            return MapEntry(key, _sanitizeMongoUri(value));
          }
          return MapEntry(key, value);
        });
      } catch (e) {
        // If parsing fails, treat as regular message
        structuredData = null;
      }
    }

    // Sanitize error messages and stack traces as well
    String? errorMessage;
    if (record.error != null) {
      errorMessage = _sanitizeMongoUri(record.error.toString());
    }
    
    String? stackTrace;
    if (record.stackTrace != null) {
      stackTrace = _sanitizeMongoUri(record.stackTrace.toString());
    }
    
    final logData = <String, dynamic>{
      'severity': _levelToSeverity(record.level),
      'timestamp': record.time.toIso8601String(),
      'logger': record.loggerName,
      'message': message,
      'service_name': _serviceName,
      if (errorMessage != null) 'error': errorMessage,
      if (stackTrace != null) 'stackTrace': stackTrace,
      if (structuredData != null) ...structuredData,
    };

    if (_isCloudRun) {
      // Cloud Run: JSON format for structured logging
      print(jsonEncode(logData));
    } else {
      // Local development: Human-readable format
      _logReadable(record, logData);
    }
  }

  /// Log in human-readable format for local development
  static void _logReadable(LogRecord record, Map<String, dynamic> logData) {
    final severity = _levelToSeverity(record.level);
    final severityIcon = _getSeverityIcon(severity);
    final time = record.time.toIso8601String();
    final logger = record.loggerName;
    final message = logData['message'] as String;
    
    // Build context string from structured data
    final contextParts = <String>[];
    if (logData.containsKey('userId')) {
      contextParts.add('userId=${logData['userId']}');
    }
    if (logData.containsKey('firmId')) {
      contextParts.add('firmId=${logData['firmId']}');
    }
    if (logData.containsKey('rpcMethod')) {
      contextParts.add('rpc=${logData['rpcMethod']}');
    }
    
    final contextStr = contextParts.isNotEmpty ? ' [${contextParts.join(', ')}]' : '';
    
    // Main log line
    print('$severityIcon $time [$severity] $logger$contextStr: $message');
    
    // Additional structured data (excluding already printed fields)
    final extraData = <String, dynamic>{};
    for (final entry in logData.entries) {
      if (!['severity', 'timestamp', 'logger', 'message', 'service_name', 'userId', 'firmId', 'rpcMethod'].contains(entry.key)) {
        extraData[entry.key] = entry.value;
      }
    }
    if (extraData.isNotEmpty) {
      print('  └─ ${jsonEncode(extraData)}');
    }
  }

  /// Get emoji/icon for severity level
  static String _getSeverityIcon(String severity) {
    switch (severity) {
      case 'ERROR':
        return '🔴';
      case 'WARNING':
        return '🟡';
      case 'INFO':
        return '🔵';
      case 'DEBUG':
        return '⚪';
      default:
        return '⚪';
    }
  }

  /// Sanitize MongoDB URIs by masking credentials
  /// Example: mongodb://user:pass@host -> mongodb://***:***@host
  static String _sanitizeMongoUri(String text) {
    // Pattern: mongodb://username:password@host or mongodb+srv://username:password@host
    return text.replaceAllMapped(
      RegExp(r'mongodb(\+srv)?://([^:]+):([^@]+)@'),
      (match) => '${match.group(1) != null ? 'mongodb+srv' : 'mongodb'}://***:***@',
    );
  }

  /// Convert Dart log level to Cloud Logging severity
  static String _levelToSeverity(Level level) {
    if (level >= Level.SEVERE) return 'ERROR';
    if (level >= Level.WARNING) return 'WARNING';
    if (level >= Level.INFO) return 'INFO';
    if (level >= Level.FINE) return 'DEBUG';
    return 'DEBUG';
  }

  /// Extract user context from ServiceCall
  Map<String, dynamic>? _extractContext(ServiceCall? call) {
    if (call == null) return null;
    
    try {
      final userPermissions = call.bearer.userPermissions;
      return {
        'userId': userPermissions.userId,
        'firmId': userPermissions.firmId,
      };
    } catch (e) {
      // If bearer is not available (e.g., unauthenticated requests), return null
      return null;
    }
  }

  /// Build message with structured data
  String _buildMessage(String message, Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return message;
    
    final structured = <String, dynamic>{
      'message': message,
      ...data,
    };
    return jsonEncode(structured);
  }

  /// Log at INFO level with context
  void info(String message, {ServiceCall? call, Map<String, dynamic>? extra}) {
    final context = _extractContext(call);
    final logData = <String, dynamic>{
      if (context != null) ...context,
      if (extra != null) ...extra,
    };
    _logger.info(_buildMessage(message, logData.isEmpty ? null : logData));
  }

  /// Log at WARNING level with context
  void warning(String message, {ServiceCall? call, Map<String, dynamic>? extra}) {
    final context = _extractContext(call);
    final logData = <String, dynamic>{
      if (context != null) ...context,
      if (extra != null) ...extra,
    };
    _logger.warning(_buildMessage(message, logData.isEmpty ? null : logData));
  }

  /// Log at SEVERE level (error) with context
  void error(String message, {
    ServiceCall? call,
    Object? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? extra,
  }) {
    final context = _extractContext(call);
    final logData = <String, dynamic>{
      if (context != null) ...context,
      if (extra != null) ...extra,
    };
    
    final messageWithData = _buildMessage(message, logData.isEmpty ? null : logData);
    _logger.severe(messageWithData, error, stackTrace);
  }

  /// Log at FINE level (debug) with context
  void debug(String message, {ServiceCall? call, Map<String, dynamic>? extra}) {
    final context = _extractContext(call);
    final logData = <String, dynamic>{
      if (context != null) ...context,
      if (extra != null) ...extra,
    };
    _logger.fine(_buildMessage(message, logData.isEmpty ? null : logData));
  }

  /// Log RPC entry point
  void logRpcEntry(String methodName, ServiceCall? call, {Map<String, dynamic>? requestData}) {
    final context = _extractContext(call);
    final logData = <String, dynamic>{
      'rpcMethod': methodName,
      if (context != null) ...context,
      if (requestData != null) ...requestData,
    };
    _logger.info(_buildMessage('RPC entry: $methodName', logData));
  }

  /// Log RPC exit (success)
  void logRpcExit(String methodName, ServiceCall? call, {Map<String, dynamic>? resultData}) {
    final context = _extractContext(call);
    final logData = <String, dynamic>{
      'rpcMethod': methodName,
      if (context != null) ...context,
      if (resultData != null) ...resultData,
    };
    _logger.info(_buildMessage('RPC exit: $methodName', logData));
  }

  /// Log RPC error
  void logRpcError(
    String methodName,
    ServiceCall? call,
    Object error, {
    StackTrace? stackTrace,
    Map<String, dynamic>? extra,
  }) {
    final context = _extractContext(call);
    final logData = <String, dynamic>{
      'rpcMethod': methodName,
      if (context != null) ...context,
      if (extra != null) ...extra,
    };
    final messageWithData = _buildMessage('RPC error: $methodName', logData.isEmpty ? null : logData);
    _logger.severe(messageWithData, error, stackTrace);
  }
}

/// Logger with context bound to a specific ServiceCall.
/// All logs automatically include userId/firmId. Use [WeebiLogger.withContext].
class WeebiLoggerWithContext {
  final WeebiLogger _logger;
  final ServiceCall? _call;

  WeebiLoggerWithContext(this._logger, this._call);

  void info(String message, {Map<String, dynamic>? extra}) =>
      _logger.info(message, call: _call, extra: extra);

  void warning(String message, {Map<String, dynamic>? extra}) =>
      _logger.warning(message, call: _call, extra: extra);

  void error(String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? extra,
  }) =>
      _logger.error(message, call: _call, error: error, stackTrace: stackTrace, extra: extra);

  void debug(String message, {Map<String, dynamic>? extra}) =>
      _logger.debug(message, call: _call, extra: extra);

  void logRpcEntry(String methodName, {Map<String, dynamic>? requestData}) =>
      _logger.logRpcEntry(methodName, _call, requestData: requestData);

  void logRpcExit(String methodName, {Map<String, dynamic>? resultData}) =>
      _logger.logRpcExit(methodName, _call, resultData: resultData);

  void logRpcError(
    String methodName,
    Object error, {
    StackTrace? stackTrace,
    Map<String, dynamic>? extra,
  }) =>
      _logger.logRpcError(methodName, _call, error,
          stackTrace: stackTrace, extra: extra);
}

