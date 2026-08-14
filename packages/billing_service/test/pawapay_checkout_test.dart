import 'dart:convert';

import 'package:billing_service/billing_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  group('pawapayXofAmountForProduct', () {
    test('maps premium and syscohada to marketing FCFA amounts', () {
      expect(pawapayXofAmountForProduct('premium'), 9900);
      expect(pawapayXofAmountForProduct('syscohada'), 1900);
    });

    test('rejects unknown products', () {
      expect(() => pawapayXofAmountForProduct('entreprise'), throwsArgumentError);
    });
  });

  group('flattenPawapayMetadata', () {
    test('flattens array form', () {
      final meta = flattenPawapayMetadata([
        {'firmId': 'f1'},
        {'productId': 'premium', 'isPII': false},
        {'purchaserEmail': 'a@b.com', 'isPII': true},
      ]);
      expect(meta['firmId'], 'f1');
      expect(meta['productId'], 'premium');
      expect(meta['purchaserEmail'], 'a@b.com');
      expect(meta.containsKey('isPII'), isFalse);
    });

    test('flattens map form', () {
      final meta = flattenPawapayMetadata({
        'firmId': 'f2',
        'productId': 'syscohada',
      });
      expect(meta['firmId'], 'f2');
      expect(meta['productId'], 'syscohada');
    });
  });

  group('generateUuidV4', () {
    test('shape matches UUIDv4', () {
      final id = generateUuidV4();
      expect(
        id,
        matches(RegExp(
          r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
        )),
      );
    });
  });

  group('PawapayHttpCheckoutClient', () {
    test('initiateCheckout posts JSON and parses ACCEPTED', () async {
      late http.Request captured;
      final client = PawapayHttpCheckoutClient(
        apiBaseUrl: 'https://api.sandbox.pawapay.io',
        apiToken: 'tok_test',
        httpClient: MockClient((request) async {
          captured = request;
          return http.Response(
            jsonEncode({
              'checkoutId': 'afb57b93-7849-49aa-babb-4c3ccbfe3d79',
              'status': 'ACCEPTED',
              'redirectUrl': 'https://pay.example/c/1',
            }),
            200,
          );
        }),
      );

      final created = await client.initiateCheckout(
        checkoutId: 'afb57b93-7849-49aa-babb-4c3ccbfe3d79',
        returnUrl: 'https://app.weebi.com/#/billing?success=true',
        amounts: [
          buildPawapayAmountForCountry(
            productId: 'premium',
            countryAlpha2Or3: 'SN',
          ),
        ],
        countries: ['SEN'],
        metadata: buildPawapayMetadata({'firmId': 'firm-1', 'productId': 'premium'}),
      );

      expect(created.redirectUrl, 'https://pay.example/c/1');
      expect(captured.method, 'POST');
      expect(captured.url.path, '/v2/checkouts');
      expect(captured.headers['Authorization'], 'Bearer tok_test');
      final body = jsonDecode(captured.body) as Map<String, dynamic>;
      expect(body['checkoutId'], 'afb57b93-7849-49aa-babb-4c3ccbfe3d79');
      expect(body['countries'], ['SEN']);
      expect(body['amounts'], [
        {'country': 'SEN', 'currency': 'XOF', 'amount': '9900'},
      ]);
    });

    test('fetchCheckout parses COMPLETED status + metadata', () async {
      final client = PawapayHttpCheckoutClient(
        apiBaseUrl: 'https://api.sandbox.pawapay.io/',
        apiToken: 'tok_test',
        httpClient: MockClient((request) async {
          expect(request.method, 'GET');
          expect(request.url.path, '/v2/checkouts/chk-1');
          return http.Response(
            jsonEncode({
              'checkoutId': 'chk-1',
              'status': 'COMPLETED',
              'metadata': [
                {'firmId': 'firm-abc'},
                {'productId': 'premium'},
              ],
            }),
            200,
          );
        }),
      );

      final info = await client.fetchCheckout('chk-1');
      expect(info.isCompleted, isTrue);
      expect(info.metadata['firmId'], 'firm-abc');
      expect(info.metadata['productId'], 'premium');
    });

    test('initiateCheckout REJECTED becomes PawapayCheckoutException', () async {
      final client = PawapayHttpCheckoutClient(
        apiBaseUrl: 'https://api.sandbox.pawapay.io',
        apiToken: 'tok_test',
        httpClient: MockClient((request) async {
          return http.Response(
            jsonEncode({
              'status': 'REJECTED',
              'failureReason': {
                'failureCode': 'INVALID_PARAMETER',
                'failureMessage': 'bad',
              },
            }),
            200,
          );
        }),
      );

      expect(
        () => client.initiateCheckout(
          checkoutId: generateUuidV4(),
          returnUrl: 'https://x',
          amounts: [
            buildPawapayAmountForCountry(
              productId: 'premium',
              countryAlpha2Or3: 'SN',
            ),
          ],
          countries: ['SEN'],
          metadata: const [],
        ),
        throwsA(isA<PawapayCheckoutException>()),
      );
    });
  });

  group('iso2 / single country helpers', () {
    test('maps OHADA alpha-2 to alpha-3 and XOF/XAF', () {
      expect(iso2ToIso3('sn'), 'SEN');
      expect(iso2ToIso3('CI'), 'CIV');
      expect(iso2ToIso3('cm'), 'CMR');
      expect(currencyForCountryAlpha3('SEN'), 'XOF');
      expect(currencyForCountryAlpha3('CMR'), 'XAF');
    });

    test('buildPawapayAmountForCountry is single country', () {
      final a = buildPawapayAmountForCountry(
        productId: 'syscohada',
        countryAlpha2Or3: 'SN',
      );
      expect(a.country, 'SEN');
      expect(a.currency, 'XOF');
      expect(a.amount, '1900');
    });

    test('rejects non-FCFA African countries for v1 pricing', () {
      expect(
        () => buildPawapayAmountForCountry(
          productId: 'premium',
          countryAlpha2Or3: 'KE',
        ),
        throwsArgumentError,
      );
    });

    test('resolveOrgCountryAlpha2 firm → chain → boutique', () {
      expect(
        resolveOrgCountryAlpha2(
          firmDoc: {
            'country': {'code2Letters': 'sn'},
          },
          chainDocs: const [],
        ),
        'SN',
      );
      expect(
        resolveOrgCountryAlpha2(
          firmDoc: {},
          chainDocs: [
            {
              'chainId': 'c1',
              'country': {'code2Letters': 'ci'},
            },
          ],
        ),
        'CI',
      );
      expect(
        resolveOrgCountryAlpha2(
          firmDoc: {},
          chainDocs: [
            {
              'chainId': 'c1',
              'boutiques': [
                {
                  'boutiqueId': 'b1',
                  'boutique': {
                    'addressFull': {
                      'country': {'code2Letters': 'ml'},
                    },
                  },
                },
              ],
            },
          ],
        ),
        'ML',
      );
      expect(
        resolveOrgCountryAlpha2(
          firmDoc: {},
          chainDocs: [
            {
              'chainId': 'other',
              'boutiques': [
                {
                  'boutiqueId': 'bx',
                  'boutique': {
                    'addressFull': {
                      'country': {'code2Letters': 'bf'},
                    },
                  },
                },
              ],
            },
            {
              'chainId': 'pref',
              'boutiques': [
                {
                  'boutiqueId': 'wanted',
                  'boutique': {
                    'addressFull': {
                      'country': {'code2Letters': 'sn'},
                    },
                  },
                },
              ],
            },
          ],
          preferredChainIds: ['pref'],
          preferredBoutiqueIds: ['wanted'],
        ),
        'SN',
      );
    });
  });

  group('appendCheckoutIdToReturnUrl', () {
    test('appends inside hash query', () {
      expect(
        appendCheckoutIdToReturnUrl(
          'https://app.weebi.com/#/billing?success=true&provider=pawapay',
          'abc-123',
        ),
        'https://app.weebi.com/#/billing?success=true&provider=pawapay&checkout_id=abc-123',
      );
    });
  });

  group('mergeAccountingYearPurchase pawapay', () {
    test('is idempotent on pawapayCheckoutId', () {
      final existing = [
        buildAccountingYearPurchase(
          year: 2025,
          pawapayCheckoutId: 'pp-1',
          paymentProvider: 'PAYMENT_PROVIDER_PAWAPAY',
          paidAtUTC: DateTime.utc(2025, 1, 1),
          amountCents: 290,
          currency: 'eur',
        ),
      ];
      final again = buildAccountingYearPurchase(
        year: 2026,
        pawapayCheckoutId: 'pp-1',
        paymentProvider: 'PAYMENT_PROVIDER_PAWAPAY',
        paidAtUTC: DateTime.utc(2025, 2, 1),
        amountCents: 290,
        currency: 'eur',
      );
      final result = mergeAccountingYearPurchase(
        existing: existing,
        purchase: again,
      );
      expect(result.alreadyFulfilled, isTrue);
      expect(result.purchases, hasLength(1));
    });
  });
}
