import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:fence_service/mongo_dart.dart';

class PasswordResetService {
  final DbCollection _resetTokensCollection;
  final Random _random = Random.secure();
  
  static const String resetTokensCollectionName = 'password_reset_tokens';
  static const int tokenExpiryHours = 1;
  static const int tokenLength = 32;

  PasswordResetService(Db db) 
      : _resetTokensCollection = db.collection(resetTokensCollectionName);

  /// Generate a secure reset token for the given email
  Future<String> generateResetToken(String email) async {
    // Generate a random token
    final bytes = List<int>.generate(tokenLength, (i) => _random.nextInt(256));
    final token = base64Url.encode(bytes);
    
    // Hash the token for storage (we'll store the hash, not the plain token)
    final hashedToken = _hashToken(token);
    
    final expiryTime = DateTime.now().add(Duration(hours: tokenExpiryHours));
    
    // Remove any existing tokens for this email
    await _resetTokensCollection.deleteMany({'email': email});
    
    // Store the new token
    await _resetTokensCollection.insertOne({
      'email': email,
      'token_hash': hashedToken,
      'expires_at': expiryTime,
      'created_at': DateTime.now(),
      'used': false,
    });
    
    log('Generated reset token for email: $email (expires at: $expiryTime)');
    return token;
  }

  /// Verify a reset token and return the associated email if valid
  Future<String?> verifyResetToken(String token) async {
    final hashedToken = _hashToken(token);
    
    final tokenDoc = await _resetTokensCollection.findOne({
      'token_hash': hashedToken,
      'used': false,
      'expires_at': {'\$gt': DateTime.now()}
    });
    
    if (tokenDoc == null) {
      log('Invalid or expired reset token');
      return null;
    }
    
    return tokenDoc['email'] as String?;
  }

  /// Mark a reset token as used
  Future<bool> markTokenAsUsed(String token) async {
    final hashedToken = _hashToken(token);
    
    final result = await _resetTokensCollection.updateOne(
      {
        'token_hash': hashedToken,
        'used': false,
      },
      {
        '\$set': {'used': true, 'used_at': DateTime.now()}
      },
    );
    
    return result.modifiedCount > 0;
  }

  /// Clean up expired tokens (should be called periodically)
  Future<int> cleanupExpiredTokens() async {
    final result = await _resetTokensCollection.deleteMany({
      'expires_at': {'\$lt': DateTime.now()}
    });
    
    log('Cleaned up ${result.deletedCount} expired reset tokens');
    return result.deletedCount ?? 0;
  }

  /// Check if an email has a recent reset request (to prevent spam)
  Future<bool> hasRecentResetRequest(String email, {int cooldownMinutes = 5}) async {
    final cooldownTime = DateTime.now().subtract(Duration(minutes: cooldownMinutes));
    
    final recentToken = await _resetTokensCollection.findOne({
      'email': email,
      'created_at': {'\$gt': cooldownTime}
    });
    
    return recentToken != null;
  }

  String _hashToken(String token) {
    final bytes = utf8.encode(token);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}