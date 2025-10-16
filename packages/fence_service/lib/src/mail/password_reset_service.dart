import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:fence_service/mongo_pool.dart';

class PasswordResetService {
  final MongoDbPoolService _poolService;
  final Random _random = Random.secure();
  
  static const String resetTokensCollectionName = 'password_reset_tokens';
  static const int tokenExpiryHours = 1;
  static const int tokenLength = 32;

  PasswordResetService(this._poolService);

  /// Generate a secure reset token for the given mail
  Future<String> generateResetToken(String mail) async {
    return databaseMiddleware<String>(_poolService, (db) async {
      final resetTokensCollection = db.collection(resetTokensCollectionName);
      
      // Generate a random token
      final bytes = List<int>.generate(tokenLength, (i) => _random.nextInt(256));
      final token = base64Url.encode(bytes);
      
      // Hash the token for storage (we'll store the hash, not the plain token)
      final hashedToken = _hashToken(token);
      
      final expiryTime = DateTime.now().add(Duration(hours: tokenExpiryHours));
      
      // Remove any existing tokens for this mail
      await resetTokensCollection.deleteMany({'mail': mail});
      
      // Store the new token
      await resetTokensCollection.insertOne({
        'mail': mail,
        'token_hash': hashedToken,
        'expires_at': expiryTime,
        'created_at': DateTime.now(),
        'used': false,
      });
      
      dev.log('Generated reset token for mail: $mail (expires at: $expiryTime)');
      return token;
    });
  }

  /// Verify a reset token and return the associated mail if valid
  Future<String?> verifyResetToken(String token) async {
    return databaseMiddleware<String?>(_poolService, (db) async {
      final resetTokensCollection = db.collection(resetTokensCollectionName);
      final hashedToken = _hashToken(token);
      
      final tokenDoc = await resetTokensCollection.findOne({
        'token_hash': hashedToken,
        'used': false,
        'expires_at': {'\$gt': DateTime.now()}
      });
      
      if (tokenDoc == null) {
        dev.log('Invalid or expired reset token');
        return null;
      }
      
      return tokenDoc['mail'] as String?;
    });
  }

  /// Mark a reset token as used
  Future<bool> markTokenAsUsed(String token) async {
    return databaseMiddleware<bool>(_poolService, (db) async {
      final resetTokensCollection = db.collection(resetTokensCollectionName);
      final hashedToken = _hashToken(token);
      
      final result = await resetTokensCollection.updateOne(
        {
          'token_hash': hashedToken,
          'used': false,
        },
        {
          '\$set': {'used': true, 'used_at': DateTime.now()}
        },
      );
      
      return result.nModified > 0;
    });
  }

  /// Clean up expired tokens (should be called periodically)
  Future<int> cleanupExpiredTokens() async {
    return databaseMiddleware<int>(_poolService, (db) async {
      final resetTokensCollection = db.collection(resetTokensCollectionName);
      
      final result = await resetTokensCollection.deleteMany({
        'expires_at': {'\$lt': DateTime.now()}
      });
      
      dev.log('Cleaned up ${result.nRemoved} expired reset tokens');
      return result.nRemoved;
    });
  }

  /// Check if a mail has a recent reset request (to prevent spam)
  Future<bool> hasRecentResetRequest(String mail, {int cooldownMinutes = 5}) async {
    return databaseMiddleware<bool>(_poolService, (db) async {
      final resetTokensCollection = db.collection(resetTokensCollectionName);
      final cooldownTime = DateTime.now().subtract(Duration(minutes: cooldownMinutes));
      
      final recentToken = await resetTokensCollection.findOne({
        'mail': mail,
        'created_at': {'\$gt': cooldownTime}
      });
      
      return recentToken != null;
    });
  }

  String _hashToken(String token) {
    final bytes = utf8.encode(token);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}