# Email Service Setup for Password Reset

This document explains how to set up and use the email service in the fence_service package for password reset functionality.

## Overview

The email service provides transactional email capabilities including:
- Password reset emails with secure tokens
- Welcome emails for new users
- Support for multiple email providers (Mailtrap, custom SMTP)

## Quick Setup

### 1. Install Dependencies

The required dependencies are already included in `pubspec.yaml`:
- `mailer: ^6.1.0` - For sending emails via SMTP
- `crypto: ^3.0.3` - For secure token hashing

### 2. Environment Variables

Set up the following environment variables based on your setup:

#### For Development (Mailtrap Sandbox)
```bash
MAILTRAP_USERNAME=your_mailtrap_username
MAILTRAP_PASSWORD=your_mailtrap_password
ENVIRONMENT=development
```

#### For Production (Mailtrap Send API)
```bash
MAILTRAP_API_TOKEN=your_api_token
FROM_EMAIL=noreply@yourdomain.com
FROM_NAME=Your App Name
ENVIRONMENT=production
```

### 3. Mailtrap Setup

#### Development (Testing)
1. Sign up at [Mailtrap.io](https://mailtrap.io)
2. Go to **Email Testing > Inboxes > [Your Inbox]**
3. Select **SMTP Settings** and choose **Dart mailer**
4. Copy the username and password to your environment variables

#### Production (Real Emails)
1. Go to **Email API > API Tokens** in Mailtrap
2. Create a new token with **Email Sending** scope
3. Set up your domain in **Email API > Sending Domains**
4. Verify your domain following Mailtrap's instructions

## Code Integration

### Initialize FenceService with Email

```dart
import 'package:fence_service/fence_service.dart';

// Create email service
final emailService = EmailConfig.createForDevelopment(); // or createForProduction()

// Initialize FenceService with email service
final fenceService = FenceService(db, emailService: emailService);

// Alternative: Configure after initialization
final fenceService = FenceService(db);
fenceService.configureEmailService(emailService);
```

### Using the Password Reset RPCs

The service provides two RPC methods:

#### 1. Request Password Reset
```protobuf
rpc requestPasswordReset(PasswordResetRequest) returns (google.retail.common.StatusResponse);
```

**Example client call:**
```dart
final request = PasswordResetRequest()..mail = 'user@example.com';
final response = await fenceService.requestPasswordReset(null, request);
```

#### 2. Confirm Password Reset
```protobuf
rpc confirmPasswordReset(PasswordResetConfirmRequest) returns (google.retail.common.StatusResponse);
```

**Example client call:**
```dart
final request = PasswordResetConfirmRequest()
  ..mail = 'user@example.com'
  ..resetToken = 'token_from_email'
  ..newPassword = 'newSecurePassword123';
final response = await fenceService.confirmPasswordReset(null, request);
```

## Security Features

### Token Security
- Reset tokens are 32-byte random values, base64url encoded
- Tokens are hashed before storage (SHA-256)
- Only token hashes are stored in the database
- Tokens expire after 1 hour

### Rate Limiting
- Cooldown period of 5 minutes between reset requests per email
- Prevents spam and abuse

### Email Validation
- Validates email existence before sending reset emails
- Returns success even for non-existent emails (security by obscurity)

## Database Collections

The service creates a new MongoDB collection:

### `password_reset_tokens`
```json
{
  "email": "user@example.com",
  "token_hash": "sha256_hash_of_token",
  "expires_at": "2024-01-01T12:00:00Z",
  "created_at": "2024-01-01T11:00:00Z",
  "used": false,
  "used_at": "2024-01-01T11:30:00Z" // only when used = true
}
```

## Email Templates

The service includes HTML and plain text email templates:

### Password Reset Email
- Professional HTML layout with inline CSS
- Clear call-to-action button
- Security notice about expiration
- Fallback plain text version

### Welcome Email
- Welcome message for new users
- Professional branding
- Support contact information

## Error Handling

### Common Errors
- `INVALID_ARGUMENT`: Missing required fields (email, token, password)
- `FAILED_PRECONDITION`: Email service not configured
- `RESOURCE_EXHAUSTED`: Too many recent reset requests
- `NOT_FOUND`: User not found during password reset confirmation
- `INTERNAL`: Email sending failed or database errors

### Logging
- All email operations are logged with appropriate detail levels
- Failed email sends are logged as errors
- Successful operations are logged for audit trails

## Frontend Integration

### Password Reset Flow
1. User requests password reset via your frontend
2. Frontend calls `requestPasswordReset` RPC
3. User receives email with reset link
4. User clicks link → frontend shows reset form
5. Frontend calls `confirmPasswordReset` RPC with token and new password

### Reset URL Format
```
https://yourapp.com/reset-password?token=RESET_TOKEN&email=user@example.com
```

## Maintenance

### Cleanup Expired Tokens
```dart
final resetService = PasswordResetService(db);
final deletedCount = await resetService.cleanupExpiredTokens();
```

Schedule this to run periodically (e.g., daily) to clean up expired tokens.

## Testing

### Development Testing
Use Mailtrap sandbox to test email delivery without sending real emails:

1. Configure with sandbox credentials
2. Send test reset emails
3. Check emails in Mailtrap inbox
4. Verify token and URL generation

### Unit Testing
```dart
test('password reset token generation', () async {
  final resetService = PasswordResetService(testDb);
  final token = await resetService.generateResetToken('test@example.com');
  expect(token, isNotEmpty);
  expect(token.length, greaterThan(20));
});
```

## Production Checklist

- [ ] Mailtrap domain verified and DNS configured
- [ ] API token with correct permissions
- [ ] Environment variables set correctly
- [ ] Frontend reset URL matches email template
- [ ] Token cleanup scheduled
- [ ] Error monitoring in place
- [ ] Email delivery monitoring configured

## Alternative Email Providers

To use a different email provider, create a custom email service:

```dart
final emailService = EmailConfig.createCustom(
  smtpHost: 'smtp.gmail.com',
  smtpPort: 587,
  username: 'your-email@gmail.com',
  password: 'your-app-password',
  fromEmail: 'noreply@yourdomain.com',
  fromName: 'Your App',
  enableSsl: true,
);
```

Popular providers:
- **Gmail**: smtp.gmail.com:587 (use app passwords)
- **SendGrid**: smtp.sendgrid.net:587
- **Mailgun**: smtp.mailgun.org:587
- **Amazon SES**: email-smtp.region.amazonaws.com:587