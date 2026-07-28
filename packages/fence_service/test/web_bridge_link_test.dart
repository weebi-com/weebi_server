import 'package:fence_service/src/web_bridge_link.dart';
import 'package:test/test.dart';

void main() {
  group('validateWebBridgeProduct', () {
    test('accepts premium without year', () {
      final p = validateWebBridgeProduct(productId: 'premium', fiscalYear: 0);
      expect(p.productId, 'premium');
      expect(p.fiscalYear, isNull);
      expect(p.isSyscohada, isFalse);
    });

    test('accepts PREMIUM case-insensitively', () {
      final p = validateWebBridgeProduct(productId: 'Premium', fiscalYear: 2025);
      expect(p.productId, 'premium');
      expect(p.fiscalYear, isNull);
    });

    test('accepts syscohada with valid year', () {
      final p =
          validateWebBridgeProduct(productId: 'syscohada', fiscalYear: 2025);
      expect(p.productId, 'syscohada');
      expect(p.fiscalYear, 2025);
      expect(p.isSyscohada, isTrue);
    });

    test('rejects syscohada without year', () {
      expect(
        () => validateWebBridgeProduct(productId: 'syscohada', fiscalYear: 0),
        throwsA(isA<WebBridgeProductError>()),
      );
    });

    test('rejects unknown product', () {
      expect(
        () => validateWebBridgeProduct(productId: 'entreprise', fiscalYear: 0),
        throwsA(isA<WebBridgeProductError>()),
      );
    });
  });

  group('buildWebBridgeUrl', () {
    test('builds premium URL without year', () {
      final url = buildWebBridgeUrl(
        webappBaseUrl: 'https://portal.weebi.com/',
        token: 'abc123',
        product: const WebBridgeProduct(productId: 'premium'),
      );
      expect(
        url,
        'https://portal.weebi.com/?t=abc123&product=premium#/bridge',
      );
    });

    test('builds syscohada URL with year', () {
      final url = buildWebBridgeUrl(
        webappBaseUrl: 'https://portal.weebi.com',
        token: 'tok',
        product: const WebBridgeProduct(productId: 'syscohada', fiscalYear: 2026),
      );
      expect(
        url,
        'https://portal.weebi.com/?t=tok&product=syscohada&year=2026#/bridge',
      );
    });

    test('rejects empty base url', () {
      expect(
        () => buildWebBridgeUrl(
          webappBaseUrl: '  ',
          token: 't',
          product: const WebBridgeProduct(productId: 'premium'),
        ),
        throwsA(isA<WebBridgeProductError>()),
      );
    });
  });
}
