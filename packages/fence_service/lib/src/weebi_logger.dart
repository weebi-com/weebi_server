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

  /// Initialize logging with JSON formatter for Cloud Run
  static void initialize({Level level = Level.INFO}) {
    Logger.root.level = level;
    Logger.root.onRecord.listen((record) {
      _logToCloudRun(record);
    });
  }

  /// Check if running in Google Cloud Run
  static bool get _isCloudRun {
    return Platform.environment.containsKey('K_SERVICE') ||
        Platform.environment.containsKey('K_REVISION');
  }

  /// Log to stdout - JSON format for Cloud Run, readable format for local development
  static void _logToCloudRun(LogRecord record) {
    // Parse structured data from message if it contains JSON
    Map<String, dynamic>? structuredData;
    String message = record.message;
    
    // Check if message contains JSON structure
    if (record.message.startsWith('{') && record.message.contains('"message"')) {
      try {
        structuredData = jsonDecode(record.message) as Map<String, dynamic>;
        message = structuredData['message'] as String? ?? record.message;
        structuredData.remove('message');
      } catch (e) {
        // If parsing fails, treat as regular message
        structuredData = null;
      }
    }

    final logData = <String, dynamic>{
      'severity': _levelToSeverity(record.level),
      'timestamp': record.time.toIso8601String(),
      'logger': record.loggerName,
      'message': message,
      if (record.error != null) 'error': record.error.toString(),
      if (record.stackTrace != null) 'stackTrace': record.stackTrace.toString(),
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
      if (!['severity', 'timestamp', 'logger', 'message', 'userId', 'firmId', 'rpcMethod'].contains(entry.key)) {
        extraData[entry.key] = entry.value;
      }
    }
    if (extraData.isNotEmpty) {
      print('  └─ ${jsonEncode(extraData)}');
    }
    
    // Error and stack trace
    if (record.error != null) {
      print('  └─ Error: ${record.error}');
    }
    if (record.stackTrace != null && severity == 'ERROR') {
      print('  └─ StackTrace:\n${record.stackTrace}');
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

