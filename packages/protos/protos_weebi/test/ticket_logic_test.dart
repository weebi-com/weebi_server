import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

// ─── Build helpers ─────────────────────────────────────────────────────────

TicketPb _sellRetail({
  required double price,
  required double qty,
  double promo = 0.0,
  double discountAmount = 0.0,
  double taxPercent = 0.0,
  double received = 0.0,
}) {
  return TicketPb(
    ticketType: TicketTypePb.sell,
    promo: promo,
    discountAmount: discountAmount,
    received: received,
    taxe: TaxPb(percentage: taxPercent),
    items: [
      ItemCartPb(
        articleRetail: ArticleRetailOnTicketPb(price: price),
        quantity: qty,
      ),
    ],
  );
}

TicketPb _spendRetail({
  required double cost,
  required double qty,
  double promo = 0.0,
  double discountAmount = 0.0,
  double taxPercent = 0.0,
  double received = 0.0,
}) {
  return TicketPb(
    ticketType: TicketTypePb.spend,
    promo: promo,
    discountAmount: discountAmount,
    received: received,
    taxe: TaxPb(percentage: taxPercent),
    items: [
      ItemCartPb(
        articleRetail: ArticleRetailOnTicketPb(cost: cost),
        quantity: qty,
      ),
    ],
  );
}

ProxyArticleWorthPb _proxy({
  double price = 50.0,
  double cost = 40.0,
  double min = 1.0,
}) =>
    ProxyArticleWorthPb(price: price, cost: cost, minimumUnitPerBasket: min);

// ─── Tests ─────────────────────────────────────────────────────────────────

void main() {
  // ─── Cover types ──────────────────────────────────────────────────────────

  group('Cover types — total equals received', () {
    test('sellCovered: total = received', () {
      final t = TicketPb(
        ticketType: TicketTypePb.sellCovered,
        received: 500.0,
      );
      expect(t.totalComputed, 500.0);
    });

    test('spendCovered: total = received', () {
      final t = TicketPb(
        ticketType: TicketTypePb.spendCovered,
        received: 300.0,
      );
      expect(t.totalComputed, 300.0);
    });

    test('wage: total = received', () {
      final t = TicketPb(
        ticketType: TicketTypePb.wage,
        received: 150.0,
      );
      expect(t.totalComputed, 150.0);
    });
  });

  // ─── Stock types ──────────────────────────────────────────────────────────

  group('Stock types — total is always 0', () {
    for (final type in [
      TicketTypePb.stockIn,
      TicketTypePb.stockOut,
      TicketTypePb.inventory,
    ]) {
      test('$type: total = 0', () {
        final t = TicketPb(ticketType: type);
        expect(t.totalComputed, 0.0);
        expect(t.itemsTotalComputed, 0.0);
      });
    }
  });

  // ─── Sell / retail ────────────────────────────────────────────────────────

  group('Sell — retail article', () {
    test('2 × price 100 → items_only 200, total 200', () {
      final t = _sellRetail(price: 100, qty: 2);
      expect(t.itemsTotalComputed, 200.0);
      expect(t.totalTaxExcludedComputed, 200.0);
      expect(t.totalTaxesComputed, 0.0);
      expect(t.totalComputed, 200.0);
    });

    test('promo 10% → promo_val 20, tax_excl 180, total 180', () {
      final t = _sellRetail(price: 100, qty: 2, promo: 10.0);
      expect(t.itemsTotalComputed, 200.0);
      expect(t.totalTaxExcludedComputed, 180.0);
      expect(t.totalTaxesComputed, 0.0);
      expect(t.totalComputed, 180.0);
    });

    test('promo 10% + tax 10% → tax_excl 180, taxes 18, total 198', () {
      // Chain: items_only=200 → promo_val=20 → tax_excl=180 → taxes=18 → total=198
      // Tax is additive on the tax-excluded base, so total > tax-excl total.
      final t = _sellRetail(price: 100, qty: 2, promo: 10.0, taxPercent: 10.0);
      expect(t.itemsTotalComputed, 200.0);
      expect(t.totalTaxExcludedComputed, 180.0);
      expect(t.totalTaxesComputed, 18.0);
      expect(t.totalComputed, 198.0);
    });

    test('flat discount 20 → markdowns_val 20, total 180', () {
      final t = _sellRetail(price: 100, qty: 2, discountAmount: 20.0);
      expect(t.totalTaxExcludedComputed, 180.0);
      expect(t.totalComputed, 180.0);
    });

    test('promo 10% + flat discount 10 → markdowns_val 30, total 170', () {
      // promo_val=round4(200×0.10)=20; markdowns_val=20+10=30; tax_excl=170
      final t = _sellRetail(
          price: 100, qty: 2, promo: 10.0, discountAmount: 10.0);
      expect(t.totalTaxExcludedComputed, 170.0);
      expect(t.totalComputed, 170.0);
    });

    test('change = received − total', () {
      final t = _sellRetail(price: 100, qty: 2, received: 250.0);
      expect(t.totalComputed, 200.0);
      expect(t.changeComputed, 50.0);
    });

    test('sellDeferred: same totals as sell, change forced to 0', () {
      final t = TicketPb(
        ticketType: TicketTypePb.sellDeferred,
        received: 999.0,
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 100.0),
            quantity: 2.0,
          ),
        ],
      );
      expect(t.totalComputed, 200.0);
      expect(t.changeComputed, 0.0);
    });

    test('sell uses price, not cost', () {
      final t = TicketPb(
        ticketType: TicketTypePb.sell,
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 200.0, cost: 100.0),
            quantity: 2.0,
          ),
        ],
      );
      expect(t.itemsTotalComputed, 400.0);  // 2 × price(200)
    });
  });

  // ─── Spend / retail ───────────────────────────────────────────────────────

  group('Spend — retail article', () {
    test('2 × cost 100 → items_only 200, total 200', () {
      final t = _spendRetail(cost: 100, qty: 2);
      expect(t.itemsTotalComputed, 200.0);
      expect(t.totalComputed, 200.0);
    });

    test('promo 10% → tax_excl 180, total 180', () {
      final t = _spendRetail(cost: 100, qty: 2, promo: 10.0);
      expect(t.totalTaxExcludedComputed, 180.0);
      expect(t.totalComputed, 180.0);
    });

    test('promo 10% + tax 10% → tax_excl 180, taxes 18, total 198', () {
      final t = _spendRetail(cost: 100, qty: 2, promo: 10.0, taxPercent: 10.0);
      expect(t.totalTaxExcludedComputed, 180.0);
      expect(t.totalTaxesComputed, 18.0);
      expect(t.totalComputed, 198.0);
    });

    test('spend uses cost, not price', () {
      final t = TicketPb(
        ticketType: TicketTypePb.spend,
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 200.0, cost: 100.0),
            quantity: 2.0,
          ),
        ],
      );
      expect(t.itemsTotalComputed, 200.0);  // 2 × cost(100)
    });

    test('spendDeferred: change forced to 0', () {
      final t = TicketPb(
        ticketType: TicketTypePb.spendDeferred,
        received: 999.0,
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(cost: 100.0),
            quantity: 2.0,
          ),
        ],
      );
      expect(t.totalComputed, 200.0);
      expect(t.changeComputed, 0.0);
    });
  });

  // ─── ItemCartPbLogic — uncountable ────────────────────────────────────────

  group('ItemCartPbLogic — uncountable article', () {
    test('articlePrice/Cost come from uncountable fields', () {
      final item = ItemCartPb(
        articleUncountable:
            ArticleUncountableOnTicketPb(price: 750.0, cost: 600.0),
        quantity: 1.0,
      );
      expect(item.articlePrice, 750.0);
      expect(item.articleCost, 600.0);
      expect(item.totalPriceComputed, 750.0);
      expect(item.totalCostComputed, 600.0);
    });

    test('uncountable on sell ticket → items_only = price', () {
      final t = TicketPb(
        ticketType: TicketTypePb.sell,
        items: [
          ItemCartPb(
            articleUncountable:
                ArticleUncountableOnTicketPb(price: 500.0, cost: 400.0),
            quantity: 1.0,
          ),
        ],
      );
      expect(t.itemsTotalComputed, 500.0);
      expect(t.totalComputed, 500.0);
    });

    test('uncountable on spend ticket → items_only = cost', () {
      final t = TicketPb(
        ticketType: TicketTypePb.spend,
        items: [
          ItemCartPb(
            articleUncountable:
                ArticleUncountableOnTicketPb(price: 500.0, cost: 400.0),
            quantity: 1.0,
          ),
        ],
      );
      expect(t.itemsTotalComputed, 400.0);
    });
  });

  // ─── ItemCartPbLogic — basket article ────────────────────────────────────

  group('ItemCartPbLogic — basket article', () {
    test('articlePrice = sum(round(p.price × p.minUPB))', () {
      final item = ItemCartPb(
        articleBasket:
            ArticleBasketOnTicketPb(discountAmount: 0.0, markupAmount: 0.0),
        proxiesWorth: [_proxy(price: 50), _proxy(price: 50)],
        quantity: 2.0,
      );
      // round(50×1) + round(50×1) = 50 + 50 = 100; totalPrice = 2 × 100
      expect(item.articlePrice, 100.0);
      expect(item.totalPriceComputed, 200.0);
    });

    test('discountAmount reduces articlePrice', () {
      final item = ItemCartPb(
        articleBasket:
            ArticleBasketOnTicketPb(discountAmount: 10.0, markupAmount: 0.0),
        proxiesWorth: [_proxy(price: 50), _proxy(price: 50)],
        quantity: 1.0,
      );
      expect(item.articlePrice, 90.0);  // 100 - 10
      expect(item.totalPriceComputed, 90.0);
    });

    test('markupAmount increases articlePrice', () {
      final item = ItemCartPb(
        articleBasket:
            ArticleBasketOnTicketPb(discountAmount: 0.0, markupAmount: 5.0),
        proxiesWorth: [_proxy(price: 50), _proxy(price: 50)],
        quantity: 1.0,
      );
      expect(item.articlePrice, 105.0);  // 100 + 5
    });

    test('articleCost is unaffected by discount/markup', () {
      final item = ItemCartPb(
        articleBasket:
            ArticleBasketOnTicketPb(discountAmount: 10.0, markupAmount: 5.0),
        proxiesWorth: [_proxy(cost: 40), _proxy(cost: 40)],
        quantity: 1.0,
      );
      // cost side: round(40×1)+round(40×1) = 80; discount/markup ignored
      expect(item.articleCost, 80.0);
      expect(item.totalCostComputed, 80.0);
    });

    test('minimumUnitPerBasket 0.5 → round(price × 0.5)', () {
      final item = ItemCartPb(
        articleBasket:
            ArticleBasketOnTicketPb(discountAmount: 0.0, markupAmount: 0.0),
        proxiesWorth: [_proxy(price: 100.0, min: 0.5)],
        quantity: 1.0,
      );
      // round(100 × 0.5) = round(50.0) = 50
      expect(item.articlePrice, 50.0);
    });

    test('basket on sell ticket → items_only = qty × basketPrice', () {
      final t = TicketPb(
        ticketType: TicketTypePb.sell,
        items: [
          ItemCartPb(
            articleBasket: ArticleBasketOnTicketPb(
                discountAmount: 0.0, markupAmount: 0.0),
            proxiesWorth: [_proxy(price: 100.0, cost: 80.0)],
            quantity: 3.0,
          ),
        ],
      );
      expect(t.itemsTotalComputed, 300.0);  // 3 × price(100)
      expect(t.totalComputed, 300.0);
    });

    test('basket on spend ticket → items_only = qty × basketCost', () {
      final t = TicketPb(
        ticketType: TicketTypePb.spend,
        items: [
          ItemCartPb(
            articleBasket: ArticleBasketOnTicketPb(
                discountAmount: 0.0, markupAmount: 0.0),
            proxiesWorth: [_proxy(price: 100.0, cost: 80.0)],
            quantity: 3.0,
          ),
        ],
      );
      expect(t.itemsTotalComputed, 240.0);  // 3 × cost(80)
    });

    test('basket with discount on sell ticket propagates through totals', () {
      // basketPrice = 100 - 10 = 90; qty=2 → items_only=180
      final t = TicketPb(
        ticketType: TicketTypePb.sell,
        items: [
          ItemCartPb(
            articleBasket: ArticleBasketOnTicketPb(
                discountAmount: 10.0, markupAmount: 0.0),
            proxiesWorth: [_proxy(price: 50), _proxy(price: 50)],
            quantity: 2.0,
          ),
        ],
      );
      expect(t.itemsTotalComputed, 180.0);
      expect(t.totalComputed, 180.0);
    });
  });

  // ─── Edge cases ────────────────────────────────────────────────────────────

  group('Edge cases', () {
    test('empty item list → all totals are 0', () {
      final t = TicketPb(
        ticketType: TicketTypePb.sell,
        items: [],
      );
      expect(t.itemsTotalComputed, 0.0);
      expect(t.totalTaxExcludedComputed, 0.0);
      expect(t.totalTaxesComputed, 0.0);
      expect(t.totalComputed, 0.0);
    });

    test('0% tax → taxes always 0 regardless of tax_excl total', () {
      final t = _sellRetail(price: 100, qty: 2, promo: 0.0, taxPercent: 0.0);
      expect(t.totalTaxesComputed, 0.0);
      expect(t.totalComputed, t.totalTaxExcludedComputed);
    });

    test('0% promo → no markdown applied', () {
      final t = _sellRetail(price: 100, qty: 2, promo: 0.0);
      expect(t.itemsTotalComputed, 200.0);
      expect(t.totalTaxExcludedComputed, 200.0);
      expect(t.totalComputed, 200.0);
    });

    test('negative quantity (return) → negative totals', () {
      final t = TicketPb(
        ticketType: TicketTypePb.sell,
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 100.0),
            quantity: -2.0,
          ),
        ],
      );
      expect(t.itemsTotalComputed, -200.0);
      expect(t.totalComputed, -200.0);
    });

    test('very small quantities (fractional) → precision maintained', () {
      final t = TicketPb(
        ticketType: TicketTypePb.sell,
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 100.0),
            quantity: 0.1,
          ),
        ],
      );
      expect(t.itemsTotalComputed, 10.0);
    });

    test('multiple items mixed types → correct aggregation', () {
      final t = TicketPb(
        ticketType: TicketTypePb.sell,
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 100.0),
            quantity: 2.0,
          ),
          ItemCartPb(
            articleUncountable: ArticleUncountableOnTicketPb(price: 50.0),
            quantity: 1.0,
          ),
          ItemCartPb(
            articleBasket: ArticleBasketOnTicketPb(
                discountAmount: 0.0, markupAmount: 0.0),
            proxiesWorth: [_proxy(price: 25.0)],
            quantity: 1.0,
          ),
        ],
      );
      expect(t.itemsTotalComputed, 275.0);  // 200 + 50 + 25 (1×25×1)
      expect(t.totalComputed, 275.0);
    });

    test('large promo percentage with tax → chain correctly applied', () {
      final t = _sellRetail(price: 1000, qty: 1, promo: 50.0, taxPercent: 10.0);
      expect(t.itemsTotalComputed, 1000.0);
      expect(t.totalTaxExcludedComputed, 500.0);
      expect(t.totalTaxesComputed, 50.0);
      expect(t.totalComputed, 550.0);
    });

    test('promo > 100% edge case → negative base (if allowed)', () {
      final t = _sellRetail(price: 100, qty: 2, promo: 150.0);
      // promo_val = round(200 × 1.5) = 300; tax_excl = 200 - 300 = -100
      expect(t.totalTaxExcludedComputed, -100.0);
    });

    test('ticket with 0 received and sell type → change = 0 - total', () {
      final t = _sellRetail(price: 100, qty: 2, received: 0.0);
      expect(t.totalComputed, 200.0);
      expect(t.changeComputed, -200.0);
    });
  });

  // ─── Floating-point precision ──────────────────────────────────────────────

  group('Floating-point precision & rounding', () {
    test('promo rounding to 4 decimals', () {
      // 333.33 × 10% = 33.333; round(33.333 * 10000) / 10000 = 33.333
      final t = TicketPb(
        ticketType: TicketTypePb.sell,
        promo: 10.0,
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 333.33),
            quantity: 1.0,
          ),
        ],
      );
      expect(t.totalTaxExcludedComputed, closeTo(299.997, 0.001));
    });

    test('tax computation respects round4', () {
      // items = 333.33; tax_excl = 333.33; tax = 333.33 × 33.33% = 111.097889
      final t = TicketPb(
        ticketType: TicketTypePb.sell,
        taxe: TaxPb(percentage: 33.33),
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 333.33),
            quantity: 1.0,
          ),
        ],
      );
      // Rounded to 4 decimals: 111.0979 (banker's rounding may differ slightly)
      expect(t.totalTaxesComputed, closeTo(111.0989, 0.0010));
    });

    test('basket price with fractional minimumUnitPerBasket', () {
      final item = ItemCartPb(
        articleBasket: ArticleBasketOnTicketPb(
            discountAmount: 0.0, markupAmount: 0.0),
        proxiesWorth: [_proxy(price: 333.33, min: 0.33)],
        quantity: 1.0,
      );
      // round(333.33 × 0.33) = round(110.0989) = 110
      expect(item.articlePrice, 110.0);
    });
  });

  // ─── TicketTypePbLogic helpers ────────────────────────────────────────────

  group('TicketTypePbLogic properties', () {
    test('isPrice returns true for sell and sellDeferred', () {
      expect(TicketTypePb.sell.isPrice, true);
      expect(TicketTypePb.sellDeferred.isPrice, true);
      expect(TicketTypePb.spend.isPrice, false);
      expect(TicketTypePb.sellCovered.isPrice, false);
    });

    test('isCost returns true for spend and spendDeferred', () {
      expect(TicketTypePb.spend.isCost, true);
      expect(TicketTypePb.spendDeferred.isCost, true);
      expect(TicketTypePb.sell.isCost, false);
      expect(TicketTypePb.spendCovered.isCost, false);
    });

    test('isFinancial returns true for all transaction types', () {
      expect(TicketTypePb.sell.isFinancial, true);
      expect(TicketTypePb.spend.isFinancial, true);
      expect(TicketTypePb.sellCovered.isFinancial, true);
      expect(TicketTypePb.spendCovered.isFinancial, true);
      expect(TicketTypePb.wage.isFinancial, true);
      expect(TicketTypePb.sellDeferred.isFinancial, true);
      expect(TicketTypePb.spendDeferred.isFinancial, true);
    });

    test('isFinancial returns false for stock types', () {
      expect(TicketTypePb.stockIn.isFinancial, false);
      expect(TicketTypePb.stockOut.isFinancial, false);
      expect(TicketTypePb.inventory.isFinancial, false);
    });

    test('stockTypes constant contains all three stock types', () {
      expect(TicketTypePbLogic.stockTypes, contains(TicketTypePb.stockIn));
      expect(TicketTypePbLogic.stockTypes, contains(TicketTypePb.stockOut));
      expect(TicketTypePbLogic.stockTypes, contains(TicketTypePb.inventory));
      expect(TicketTypePbLogic.stockTypes.length, 3);
    });
  });
}
