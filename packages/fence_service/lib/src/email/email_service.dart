import 'dart:developer';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  late SmtpServer _smtpServer;
  final String _fromEmail;
  final String _fromName;

  EmailService({
    required String smtpHost,
    required int smtpPort,
    required String username,
    required String password,
    required String fromEmail,
    required String fromName,
    bool enableSsl = true,
  }) : _fromEmail = fromEmail,
       _fromName = fromName {
    _smtpServer = SmtpServer(
      smtpHost,
      port: smtpPort,
      username: username,
      password: password,
      ssl: enableSsl,
      allowInsecure: false,
    );
  }

  /// Factory constructor for Mailtrap configuration
  factory EmailService.mailtrap({
    required String username,
    required String password,
    required String fromEmail,
    required String fromName,
  }) {
    return EmailService(
      smtpHost: 'sandbox.smtp.mailtrap.io',
      smtpPort: 2525,
      username: username,
      password: password,
      fromEmail: fromEmail,
      fromName: fromName,
      enableSsl: false,
    );
  }

  /// Factory constructor for production Mailtrap Send configuration
  factory EmailService.mailtrapSend({
    required String apiToken,
    required String fromEmail,
    required String fromName,
  }) {
    return EmailService(
      smtpHost: 'send.api.mailtrap.io',
      smtpPort: 587,
      username: 'api',
      password: apiToken,
      fromEmail: fromEmail,
      fromName: fromName,
      enableSsl: true,
    );
  }

  Future<bool> sendPasswordResetEmail({
    required String toEmail,
    required String userName,
    required String resetToken,
    required String resetUrl,
  }) async {
    try {
      final message = Message()
        ..from = Address(_fromEmail, _fromName)
        ..recipients.add(toEmail)
        ..subject = 'Password Reset Request - Weebi'
        ..html = _buildPasswordResetHtml(userName, resetToken, resetUrl)
        ..text = _buildPasswordResetText(userName, resetToken, resetUrl);

      final sendReport = await send(message, _smtpServer);
      log('Password reset email sent to $toEmail: ${sendReport.toString()}');
      return true;
    } catch (e) {
      log('Failed to send password reset email to $toEmail: $e');
      return false;
    }
  }

  Future<bool> sendWelcomeEmail({
    required String toEmail,
    required String userName,
  }) async {
    try {
      final message = Message()
        ..from = Address(_fromEmail, _fromName)
        ..recipients.add(toEmail)
        ..subject = 'Welcome to Weebi!'
        ..html = _buildWelcomeHtml(userName)
        ..text = _buildWelcomeText(userName);

      final sendReport = await send(message, _smtpServer);
      log('Welcome email sent to $toEmail: ${sendReport.toString()}');
      return true;
    } catch (e) {
      log('Failed to send welcome email to $toEmail: $e');
      return false;
    }
  }

  String _buildPasswordResetHtml(String userName, String resetToken, String resetUrl) {
    return '''
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset - Weebi</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
        .header { background-color: #2c3e50; color: white; padding: 20px; text-align: center; }
        .content { padding: 30px; background-color: #f9f9f9; }
        .button { display: inline-block; padding: 12px 24px; background-color: #3498db; color: white; text-decoration: none; border-radius: 5px; margin: 20px 0; }
        .footer { padding: 20px; text-align: center; font-size: 12px; color: #666; }
        .token { background-color: #ecf0f1; padding: 10px; border-radius: 3px; font-family: monospace; word-break: break-all; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Weebi</h1>
        </div>
        <div class="content">
            <h2>Password Reset Request</h2>
            <p>Hello $userName,</p>
            <p>We received a request to reset your password for your Weebi account. If you didn't make this request, you can safely ignore this email.</p>
            <p>To reset your password, click the button below:</p>
            <a href="$resetUrl" class="button">Reset Password</a>
            <p>Or copy and paste this link into your browser:</p>
            <p class="token">$resetUrl</p>
            <p>Your reset token is:</p>
            <p class="token">$resetToken</p>
            <p><strong>This link will expire in 1 hour for security reasons.</strong></p>
            <p>If you're having trouble with the button above, copy and paste the URL into your web browser.</p>
            <p>Best regards,<br>The Weebi Team</p>
        </div>
        <div class="footer">
            <p>This email was sent to you because a password reset was requested for your Weebi account.</p>
            <p>If you didn't request this, please contact our support team.</p>
        </div>
    </div>
</body>
</html>
    ''';
  }

  String _buildPasswordResetText(String userName, String resetToken, String resetUrl) {
    return '''
Hello $userName,

We received a request to reset your password for your Weebi account. If you didn't make this request, you can safely ignore this email.

To reset your password, visit the following link:
$resetUrl

Your reset token is: $resetToken

This link will expire in 1 hour for security reasons.

If you're having trouble accessing the link, copy and paste it into your web browser.

Best regards,
The Weebi Team

---
This email was sent to you because a password reset was requested for your Weebi account.
If you didn't request this, please contact our support team.
    ''';
  }

  String _buildWelcomeHtml(String userName) {
    return '''
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Weebi!</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
        .header { background-color: #27ae60; color: white; padding: 20px; text-align: center; }
        .content { padding: 30px; background-color: #f9f9f9; }
        .footer { padding: 20px; text-align: center; font-size: 12px; color: #666; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Welcome to Weebi!</h1>
        </div>
        <div class="content">
            <h2>Welcome aboard, $userName!</h2>
            <p>Thank you for joining Weebi. We're excited to have you as part of our community.</p>
            <p>Your account has been successfully created and you can now start using all of Weebi's features.</p>
            <p>If you have any questions or need assistance getting started, don't hesitate to reach out to our support team.</p>
            <p>Best regards,<br>The Weebi Team</p>
        </div>
        <div class="footer">
            <p>Welcome to Weebi - Your business management solution</p>
        </div>
    </div>
</body>
</html>
    ''';
  }

  String _buildWelcomeText(String userName) {
    return '''
Welcome to Weebi!

Hello $userName,

Thank you for joining Weebi. We're excited to have you as part of our community.

Your account has been successfully created and you can now start using all of Weebi's features.

If you have any questions or need assistance getting started, don't hesitate to reach out to our support team.

Best regards,
The Weebi Team

---
Welcome to Weebi - Your business management solution
    ''';
  }
}