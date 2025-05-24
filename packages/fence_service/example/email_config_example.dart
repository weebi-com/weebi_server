import 'dart:io';
import 'package:fence_service/fence_service.dart';

/// Example configuration for setting up email service with Mailtrap
/// 
/// This file demonstrates how to configure the email service for different environments:
/// - Development: Using Mailtrap sandbox for testing
/// - Production: Using Mailtrap Send API for real emails
class EmailConfig {
  
  /// Create email service for development using Mailtrap sandbox
  /// 
  /// To get your credentials:
  /// 1. Sign up at https://mailtrap.io
  /// 2. Go to Email Testing > Inboxes > Your inbox
  /// 3. Select "SMTP Settings" and choose "Dart mailer"
  /// 4. Copy the username and password
  static EmailService createForDevelopment() {
    final username = Platform.environment['MAILTRAP_USERNAME'];
    final password = Platform.environment['MAILTRAP_PASSWORD'];
    
    if (username == null || password == null) {
      throw Exception(
        'MAILTRAP_USERNAME and MAILTRAP_PASSWORD environment variables must be set.\n'
        'Get these from your Mailtrap inbox SMTP settings.'
      );
    }
    
    return EmailService.mailtrap(
      username: username,
      password: password,
      fromEmail: 'noreply@weebi.dev',
      fromName: 'Weebi Development',
    );
  }
  
  /// Create email service for production using Mailtrap Send API
  /// 
  /// To get your API token:
  /// 1. Go to Mailtrap > Email API > API Tokens
  /// 2. Create a new token with "Email Sending" scope
  /// 3. Set up your domain in Email API > Sending Domains
  static EmailService createForProduction() {
    final apiToken = Platform.environment['MAILTRAP_API_TOKEN'];
    final fromEmail = Platform.environment['FROM_EMAIL'] ?? 'noreply@yourdomain.com';
    final fromName = Platform.environment['FROM_NAME'] ?? 'Weebi';
    
    if (apiToken == null) {
      throw Exception(
        'MAILTRAP_API_TOKEN environment variable must be set.\n'
        'Get this from your Mailtrap Email API settings.'
      );
    }
    
    return EmailService.mailtrapSend(
      apiToken: apiToken,
      fromEmail: fromEmail,
      fromName: fromName,
    );
  }
  
  /// Create email service for custom SMTP provider
  static EmailService createCustom({
    required String smtpHost,
    required int smtpPort,
    required String username,
    required String password,
    required String fromEmail,
    required String fromName,
    bool enableSsl = true,
  }) {
    return EmailService(
      smtpHost: smtpHost,
      smtpPort: smtpPort,
      username: username,
      password: password,
      fromEmail: fromEmail,
      fromName: fromName,
      enableSsl: enableSsl,
    );
  }
}

/// Example of how to initialize the FenceService with email functionality
void main() async {
  // Example database connection (replace with your actual db setup)
  // final db = await Db.create('mongodb://localhost:27017/weebi');
  
  // Create email service based on environment
  final isDevelopment = Platform.environment['ENVIRONMENT'] != 'production';
  final emailService = isDevelopment 
      ? EmailConfig.createForDevelopment()
      : EmailConfig.createForProduction();
  
  // Initialize FenceService with email service
  // final fenceService = FenceService(db, emailService: emailService);
  
  // Alternative: Configure email service after initialization
  // final fenceService = FenceService(db);
  // fenceService.configureEmailService(emailService);
  
  print('Email service configured for ${isDevelopment ? 'development' : 'production'}');
  
  // Example: Test sending a welcome email
  // await emailService.sendWelcomeEmail(
  //   toEmail: 'test@example.com',
  //   userName: 'John Doe',
  // );
  
  // Example: Test password reset flow
  // final resetService = PasswordResetService(db);
  // final token = await resetService.generateResetToken('user@example.com');
  // await emailService.sendPasswordResetEmail(
  //   toEmail: 'user@example.com',
  //   userName: 'John Doe',
  //   resetToken: token,
  //   resetUrl: 'https://yourapp.com/reset-password?token=$token',
  // );
}

/// Environment variables needed:
/// 
/// For development (Mailtrap sandbox):
/// - MAILTRAP_USERNAME: Your Mailtrap inbox username
/// - MAILTRAP_PASSWORD: Your Mailtrap inbox password
/// 
/// For production (Mailtrap Send API):
/// - MAILTRAP_API_TOKEN: Your Mailtrap Send API token
/// - FROM_EMAIL: Your verified sender email (optional, defaults to noreply@yourdomain.com)
/// - FROM_NAME: Your sender name (optional, defaults to Weebi)
/// 
/// General:
/// - ENVIRONMENT: Set to 'production' for production environment