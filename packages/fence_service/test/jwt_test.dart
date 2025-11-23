import 'package:test/test.dart';
import 'package:fence_service/src/jwt.dart';

void main() {
  // Use a fixed secret key for testing
  const testSecretKey = 'test_secret_key_for_jwt_unit_tests';

  group('JWT Encoding/Decoding', () {
    test('should generate token without padding (JWT spec compliance)', () {
      final jwt = JsonWebToken(secretKeyFactory: () => testSecretKey);
      jwt.createPayload(
        'test_user_123',
        payload: {
          'userId': 'test_user_123',
          'firmId': 'test_firm_456',
          'customClaim': 'test_value',
        },
        expireIn: const Duration(hours: 1),
      );

      final token = jwt.sign();

      // Verify token structure (3 parts separated by dots)
      final parts = token.split('.');
      expect(parts.length, equals(3), reason: 'JWT should have 3 parts');

      // Verify no padding in any part
      expect(parts[0].contains('='), isFalse,
          reason: 'Header should not contain padding');
      expect(parts[1].contains('='), isFalse,
          reason: 'Payload should not contain padding');
      expect(parts[2].contains('='), isFalse,
          reason: 'Signature should not contain padding');

      // Verify token can be parsed back
      final parsedJwt = JsonWebToken.parse(token, secretKeyFactory: () => testSecretKey);
      expect(parsedJwt.sub, equals('test_user_123'));
      expect(parsedJwt.payload['userId'], equals('test_user_123'));
      expect(parsedJwt.payload['firmId'], equals('test_firm_456'));
      expect(parsedJwt.payload['customClaim'], equals('test_value'));
      expect(parsedJwt.payload['iat'], isNotNull);
      expect(parsedJwt.payload['exp'], isNotNull);
    });

    test('should verify token signature correctly', () {
      final jwt = JsonWebToken(secretKeyFactory: () => testSecretKey);
      jwt.createPayload(
        'test_user_123',
        payload: {'test': 'value'},
        expireIn: const Duration(hours: 1),
      );

      final token = jwt.sign();

      // Verify the token
      expect(jwt.verify(), isTrue, reason: 'Token should be valid');

      // Parse and verify again
      final parsedJwt = JsonWebToken.parse(token, secretKeyFactory: () => testSecretKey);
      expect(parsedJwt.verify(), isTrue,
          reason: 'Parsed token should be valid');
    });

    test('should handle tokens with various payload sizes (padding edge cases)',
        () {
      // Test with small payload (might not need padding)
      final jwt1 = JsonWebToken(secretKeyFactory: () => testSecretKey);
      jwt1.createPayload('user1', payload: {'a': 'b'});
      final token1 = jwt1.sign();
      expect(token1.split('.')[1].contains('='), isFalse);
      final parsed1 = JsonWebToken.parse(token1, secretKeyFactory: () => testSecretKey);
      expect(parsed1.sub, equals('user1'));

      // Test with medium payload (might need 1 padding char)
      final jwt2 = JsonWebToken(secretKeyFactory: () => testSecretKey);
      jwt2.createPayload('user2', payload: {
        'userId': 'user2',
        'firmId': 'firm2',
        'permissions': {'read': true, 'write': false},
      });
      final token2 = jwt2.sign();
      expect(token2.split('.')[1].contains('='), isFalse);
      final parsed2 = JsonWebToken.parse(token2, secretKeyFactory: () => testSecretKey);
      expect(parsed2.sub, equals('user2'));

      // Test with large payload (might need 2 padding chars)
      final jwt3 = JsonWebToken(secretKeyFactory: () => testSecretKey);
      jwt3.createPayload('user3', payload: {
        'userId': 'user3',
        'firmId': 'firm3',
        'chainIds': {
          'ids': ['chain1', 'chain2', 'chain3']
        },
        'boutiqueIds': {
          'ids': ['boutique1', 'boutique2']
        },
        'articleRights': {
          'rights': [1, 2, 3, 4]
        },
        'boutiqueRights': {
          'rights': [1, 2]
        },
        'chainRights': {
          'rights': [1, 2, 3]
        },
        'firmRights': {
          'rights': [1, 2, 3, 4]
        },
        'contactRights': {
          'rights': [1, 2]
        },
        'ticketRights': {
          'rights': [1, 2, 3]
        },
        'userManagementRights': {
          'rights': [1, 2],
          'canUpdateUserPassword': true
        },
        'billingRights': {
          'rights': [1, 2]
        },
        'boolRights': {
          'canSeeStats': true,
          'canExportData': false,
          'canGiveDiscount': true,
          'canSetPromo': false,
        },
      });
      final token3 = jwt3.sign();
      expect(token3.split('.')[1].contains('='), isFalse);
      final parsed3 = JsonWebToken.parse(token3, secretKeyFactory: () => testSecretKey);
      expect(parsed3.sub, equals('user3'));
    });

    test('should round-trip encode/decode correctly', () {
      final originalPayload = {
        'userId': 'roundtrip_user',
        'firmId': 'roundtrip_firm',
        'nested': {
          'key1': 'value1',
          'key2': 42,
          'key3': true,
        },
        'array': [1, 2, 3, 'four'],
      };

      final jwt = JsonWebToken(secretKeyFactory: () => testSecretKey);
      jwt.createPayload('roundtrip_user', payload: originalPayload);
      final token = jwt.sign();

      // Parse back
      final parsedJwt = JsonWebToken.parse(token, secretKeyFactory: () => testSecretKey);

      // Verify all fields are preserved
      expect(parsedJwt.payload['userId'], equals(originalPayload['userId']));
      expect(parsedJwt.payload['firmId'], equals(originalPayload['firmId']));
      expect(parsedJwt.payload['nested'], equals(originalPayload['nested']));
      expect(parsedJwt.payload['array'], equals(originalPayload['array']));
    });

    test('should handle expiration correctly', () async {
      final jwt = JsonWebToken(secretKeyFactory: () => testSecretKey);
      jwt.createPayload(
        'exp_test_user',
        expireIn: const Duration(seconds: 1),
      );
      jwt.sign();

      // Token should be valid immediately
      expect(jwt.verify(), isTrue);

      // Wait for expiration
      await Future.delayed(const Duration(seconds: 2));
      expect(jwt.verify(), isFalse, reason: 'Token should be expired');
    });
  });
}
