import 'dart:io';
import 'package:fence_service/fence_service.dart';

/// Configuration for setting up mail service with Mailtrap
///
/// This class demonstrates how to configure the mail service for different environments:
/// - Development: Using Mailtrap sandbox for testing
/// - Production: Using Mailtrap Send API for real emails
class EmailConfig {
  /// Create mail service for development using Mailtrap sandbox
  ///
  /// To get your credentials:
  /// 1. Sign up at https://mailtrap.io
  /// 2. Go to Email Testing > Inboxes > Your inbox
  /// 3. Select "SMTP Settings" and choose "Dart mailer"
  /// 4. Copy the username and password
  static MailService createForDevelopment() {
    final username = Platform.environment['MAILTRAP_DEV_USERNAME'];
    final password = Platform.environment['MAILTRAP_DEV_PASSWORD'];

    if (username == null || password == null) {
      throw Exception(
          'MAILTRAP_DEV_USERNAME and MAILTRAP_DEV_PASSWORD environment variables must be set.\n'
          'Get these from your Mailtrap inbox SMTP settings.');
    }

    return MailService.mailtrap(
      username: username,
      password: password,
      fromEmail: 'noreply@weebi.dev',
      fromName: 'Weebi Development',
    );
  }

  /// Create mail service for production using Mailtrap Send API
  ///
  /// To get your API token:
  /// 1. Go to Mailtrap > Email API > API Tokens
  /// 2. Create a new token with "Email Sending" scope
  /// 3. Set up your domain in Email API > Sending Domains
  static MailService createForProduction() {
    final apiToken = Platform.environment['MAILTRAP_API_TOKEN'];
    final fromEmail = Platform.environment['FROM_EMAIL'] ?? 'hello@weebi.com';
    final fromName = Platform.environment['FROM_NAME'] ?? 'Weebi';

    if (apiToken == null) {
      throw Exception('MAILTRAP_API_TOKEN environment variable must be set.\n'
          'Get this from your Mailtrap Email API settings.');
    }

    return MailService.mailtrapSend(
      apiToken: apiToken,
      fromEmail: fromEmail,
      fromName: fromName,
    );
  }

  /// Create mail service for custom SMTP provider
  static MailService createCustom({
    required String smtpHost,
    required int smtpPort,
    required String username,
    required String password,
    required String fromEmail,
    required String fromName,
    bool enableSsl = true,
  }) {
    return MailService(
      smtpHost: smtpHost,
      smtpPort: smtpPort,
      username: username,
      password: password,
      fromEmail: fromEmail,
      fromName: fromName,
      enableSsl: enableSsl,
    );
  }

  /// Create mail service with auto-detection based on available credentials
  ///
  /// This method will try to create a production service first,
  /// then fall back to development if production credentials are not available.
  static MailService create() {
    // Try production first
    if (Platform.environment['MAILTRAP_API_TOKEN'] != null &&
        Platform.environment['MAILTRAP_DEV_USERNAME'] == null) {
      return createForProduction();
    }

    // Fall back to development
    if (Platform.environment['MAILTRAP_DEV_USERNAME'] != null) {
      return createForDevelopment();
    }

    throw Exception('No mail credentials found. Please set either:\n'
        '- MAILTRAP_API_TOKEN (for production)\n'
        '- MAILTRAP_DEV_USERNAME and MAILTRAP_DEV_PASSWORD (for development)');
  }
}
