import 'package:fence_service/fence_service.dart';

/// Example demonstrating how to use the EmailConfig class
/// 
/// This file shows how to configure the mail service for different environments:
/// - Development: Using Mailtrap sandbox for testing
/// - Production: Using Mailtrap Send API for real emails

/// Example of how to initialize the FenceService with mail functionality
void main() async {
  // Example database connection (replace with your actual db setup)
  // final db = await Db.create('mongodb://localhost:27017/weebi');

  // Auto-detect environment based on available credentials
  final emailService = EmailConfig.create();

  // Alternative: Explicit environment selection
  // final hasDevCreds = Platform.environment['MAILTRAP_DEV_USERNAME'] != null;
  // final hasProdCreds = Platform.environment['MAILTRAP_API_TOKEN'] != null;
  // final emailService = hasProdCreds && !hasDevCreds
  //     ? EmailConfig.createForProduction()
  //     : EmailConfig.createForDevelopment();

  // Initialize FenceService with mail service
  // final fenceService = FenceService(db, emailService: emailService);

  // Alternative: Configure mail service after initialization
  // final fenceService = FenceService(db);
  // fenceService.configureEmailService(emailService);

  print('Mail service configured: ${emailService.runtimeType}');

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
/// - MAILTRAP_DEV_USERNAME: Your Mailtrap inbox username
/// - MAILTRAP_DEV_PASSWORD: Your Mailtrap inbox password
/// 
/// For production (Mailtrap Send API):
/// - MAILTRAP_API_TOKEN: Your Mailtrap Send API token
/// - FROM_EMAIL: Your verified sender email (optional, defaults to hello@weebi.com)
/// - FROM_NAME: Your sender name (optional, defaults to Weebi)