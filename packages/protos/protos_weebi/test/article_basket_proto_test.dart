import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

void main() {
  group('ArticleBasketPb.doNotSellProxiesSeparately', () {
    test('defaults to false so basket proxies can be sold separately', () {
      final basket = ArticleBasketPb(
        calibreId: 4,
        id: 1,
        designation: 'Panier Duo',
      );
      expect(basket.doNotSellProxiesSeparately, isFalse);
    });

    test('round-trips true through binary buffer and CalibreMongo proto3 JSON',
        () {
      final basket = ArticleBasketPb(
        calibreId: 4,
        id: 1,
        designation: 'Panier Exclusif',
        status: true,
        doNotSellProxiesSeparately: true,
        proxies: [
          ProxyArticlePb(
            calibreId: 4,
            articleId: 1,
            id: 1,
            status: true,
            proxyCalibreId: 1,
            proxyArticleId: 1,
            minimumUnitPerBasket: 1.0,
            articleWeight: 1.0,
          ),
        ],
      );

      final fromBuffer = ArticleBasketPb.fromBuffer(basket.writeToBuffer());
      expect(fromBuffer.doNotSellProxiesSeparately, isTrue);

      // Simulate ArticleService MongoDB storage via CalibreMongo.toProto3Json()
      final calibreMongo = CalibreMongo(
        calibreId: 4,
        firmId: 'firm_1',
        chainId: 'chain_1',
        calibre: CalibrePb(
          id: 4,
          title: 'Panier Exclusif',
          kind: ArticleKindPb.basket,
          status: true,
          articlesBasket: [basket],
        ),
      );
      final mongoDoc = calibreMongo.toProto3Json() as Map<String, dynamic>;
      final restored = CalibreMongo.create()..mergeFromProto3Json(mongoDoc);

      expect(
        restored.calibre.articlesBasket.single.doNotSellProxiesSeparately,
        isTrue,
      );
    });

    test('legacy MongoDB document without field defaults to false', () {
      final legacyDoc = <String, dynamic>{
        'calibreId': 4,
        'firmId': 'firm_1',
        'chainId': 'chain_1',
        'calibre': <String, dynamic>{
          'id': 4,
          'title': 'Legacy Panier',
          'kind': 'basket',
          'status': true,
          'articlesBasket': [
            <String, dynamic>{
              'calibreId': 4,
              'id': 1,
              'designation': 'Legacy Panier',
              'status': true,
            },
          ],
        },
      };

      final restored = CalibreMongo.create()..mergeFromProto3Json(legacyDoc);
      expect(
        restored.calibre.articlesBasket.single.doNotSellProxiesSeparately,
        isFalse,
      );
    });
  });
}
