import 'dart:convert';

import 'package:billing_service/src/referral_pricing.dart';
import 'package:billing_service/src/stripe_checkout.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  group('buildStripeCheckoutSessionFormBody', () {
    test('uses catalog price when no unit amount', () {
      final body = buildStripeCheckoutSessionFormBody(
        priceId: 'price_premium',
        successUrl: 'https://ok',
        cancelUrl: 'https://cancel',
        metadata: {'firmId': 'f1', 'priceId': 'price_premium'},
      );
      expect(body['line_items[0][price]'], 'price_premium');
      expect(body.containsKey('line_items[0][price_data][unit_amount]'), isFalse);
      expect(body['metadata[priceId]'], 'price_premium');
    });

    test('uses price_data unit_amount when discounted', () {
      final catalog = 1400;
      final charge = buyerChargeCents(catalog);
      expect(charge, 1260);

      final body = buildStripeCheckoutSessionFormBody(
        priceId: 'price_premium',
        successUrl: 'https://ok',
        cancelUrl: 'https://cancel',
        metadata: {
          'firmId': 'f1',
          'priceId': 'price_premium',
          'referralCode': 'referrer-1',
        },
        unitAmountCents: charge,
        currency: 'eur',
        stripeProductId: 'prod_premium',
      );

      expect(body.containsKey('line_items[0][price]'), isFalse);
      expect(body['line_items[0][price_data][unit_amount]'], '1260');
      expect(body['line_items[0][price_data][currency]'], 'eur');
      expect(body['line_items[0][price_data][product]'], 'prod_premium');
      expect(body['metadata[referralCode]'], 'referrer-1');
      expect(body['metadata[priceId]'], 'price_premium');
    });
  });

  group('createStripeCheckoutSession MockClient', () {
    test('posts discounted unit_amount and referral metadata', () async {
      late http.Request captured;
      final client = MockClient((request) async {
        captured = request;
        return http.Response(
          jsonEncode({
            'id': 'cs_test_1',
            'url': 'https://checkout.stripe.com/c/pay/cs_test_1',
          }),
          200,
        );
      });

      final url = await createStripeCheckoutSession(
        stripeSecretKey: 'sk_test_x',
        priceId: 'price_premium',
        successUrl: 'https://ok',
        cancelUrl: 'https://cancel',
        metadata: {
          'firmId': 'buyer-firm',
          'priceId': 'price_premium',
          'referralCode': 'referrer-firm',
        },
        unitAmountCents: buyerChargeCents(1400),
        currency: 'eur',
        stripeProductId: 'prod_premium',
        httpClient: client,
      );

      expect(url, contains('checkout.stripe.com'));
      expect(captured.url.host, 'api.stripe.com');
      expect(
        captured.body.contains('unit_amount%5D=1260') ||
            captured.body.contains('unit_amount]=1260'),
        isTrue,
      );
      expect(captured.body, contains('referralCode%5D=referrer-firm'));
      expect(captured.body, contains('priceId%5D=price_premium'));
    });
  });

  group('StripeCheckoutSessionInfo.catalogPriceId', () {
    test('prefers metadata priceId over line item price', () {
      const info = StripeCheckoutSessionInfo(
        id: 'cs_1',
        paymentStatus: 'paid',
        metadata: {'priceId': 'price_premium'},
        priceId: 'price_adhoc_xyz',
      );
      expect(info.catalogPriceId, 'price_premium');
    });

    test('falls back to line item priceId', () {
      const info = StripeCheckoutSessionInfo(
        id: 'cs_1',
        paymentStatus: 'paid',
        metadata: {},
        priceId: 'price_premium',
      );
      expect(info.catalogPriceId, 'price_premium');
    });
  });
}
