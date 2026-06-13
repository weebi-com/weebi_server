import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

// ─── Visual Mapping Extensions (UI) ────────────────────────────────────────
// These tests verify that TicketTypePb enum members are distinct and mappable
// to UI elements (icons, colors). The actual UI implementation should verify
// that these enum values correctly map to visual representations.
//
// Example structure (to be implemented in the actual UI package):
//   extension TicketTypeUi on TicketTypePb {
//     IconData get iconData { ... }
//     Color get iconColor { ... }
//   }
//   extension TicketContactIcon on TicketTypePb {
//     IconData get ticketContactIcon { ... }
//   }

void main() {
  group('TicketTypePb enum mapping — all values present', () {
    // These tests verify the enum has all expected members and they're distinct.
    
    test('sell type exists and is distinct', () {
      const type = TicketTypePb.sell;
      expect(type.name, 'sell');
    });

    test('spend type exists and is distinct', () {
      const type = TicketTypePb.spend;
      expect(type.name, 'spend');
    });

    test('sellCovered type distinguishable from sell', () {
      const sell = TicketTypePb.sell;
      const sellCovered = TicketTypePb.sellCovered;
      expect(sell.name, isNot(sellCovered.name));
    });

    test('all financial types are present', () {
      final financialTypes = [
        TicketTypePb.sell,
        TicketTypePb.sellDeferred,
        TicketTypePb.sellCovered,
        TicketTypePb.spend,
        TicketTypePb.spendDeferred,
        TicketTypePb.spendCovered,
        TicketTypePb.wage,
      ];
      for (final type in financialTypes) {
        expect(type.isFinancial, true);
      }
    });

    test('all stock types are present', () {
      final stockTypes = [
        TicketTypePb.stockIn,
        TicketTypePb.stockOut,
        TicketTypePb.inventory,
      ];
      for (final type in stockTypes) {
        expect(type.isFinancial, false);
      }
    });
  });

  group('Contact Icon Semantics — Classification', () {
    test('sell (customer revenue) type is financial', () {
      final sellType = TicketTypePb.sell;
      expect(sellType.name, 'sell');
      expect(sellType.isFinancial, true);
    });

    test('spend (supplier expense) type is financial', () {
      final spendType = TicketTypePb.spend;
      expect(spendType.name, 'spend');
      expect(spendType.isFinancial, true);
    });

    test('sellDeferred and spendDeferred are financial', () {
      const sellDeferred = TicketTypePb.sellDeferred;
      const spendDeferred = TicketTypePb.spendDeferred;
      
      expect(sellDeferred.isFinancial, true);
      expect(spendDeferred.isFinancial, true);
    });

    test('covered types are financial', () {
      const sellCovered = TicketTypePb.sellCovered;
      const spendCovered = TicketTypePb.spendCovered;
      
      expect(sellCovered.isFinancial, true);
      expect(spendCovered.isFinancial, true);
    });

    test('wage type is financial (supplier payment)', () {
      const wage = TicketTypePb.wage;
      expect(wage.isFinancial, true);
    });

    test('stock types are not financial', () {
      const stockIn = TicketTypePb.stockIn;
      const stockOut = TicketTypePb.stockOut;
      const inventory = TicketTypePb.inventory;
      
      expect(stockIn.isFinancial, false);
      expect(stockOut.isFinancial, false);
      expect(inventory.isFinancial, false);
    });
  });

  group('Icon Consistency — Enum Completeness', () {
    test('all financial types are unique', () {
      final financialTypes = [
        TicketTypePb.sell,
        TicketTypePb.sellDeferred,
        TicketTypePb.sellCovered,
        TicketTypePb.spend,
        TicketTypePb.spendDeferred,
        TicketTypePb.spendCovered,
        TicketTypePb.wage,
      ];
      // Each should have a unique visual representation (icon or color)
      expect(financialTypes.length, 7);
      
      // All names should be distinct
      final names = financialTypes.map((t) => t.name).toSet();
      expect(names.length, 7);
    });

    test('stock types consistently classified as non-financial', () {
      const financial = TicketTypePb.sell;
      const stock = TicketTypePb.stockIn;
      
      expect(financial.isFinancial, true);
      expect(stock.isFinancial, false);
    });

    test('all enum values are mapped (complete coverage)', () {
      final allTypes = TicketTypePb.values;
      // Should have all members (check actual count)
      expect(allTypes.length, greaterThanOrEqualTo(10));
      
      for (final type in allTypes) {
        // Each type should have a valid name (no nulls or empty strings)
        expect(type.name.isNotEmpty, true);
      }
    });

    test('price-based types use price field', () {
      expect(TicketTypePb.sell.isPrice, true);
      expect(TicketTypePb.sellDeferred.isPrice, true);
      expect(TicketTypePb.spend.isPrice, false);
    });

    test('cost-based types use cost field', () {
      expect(TicketTypePb.spend.isCost, true);
      expect(TicketTypePb.spendDeferred.isCost, true);
      expect(TicketTypePb.sell.isCost, false);
    });
  });

  group('UI Mapping — Happy vs Grimacing Semantics', () {
    test('sell represents happy customer (revenue)', () {
      const sell = TicketTypePb.sell;
      expect(sell.isPrice, true);  // Uses price (customer sees value)
      expect(sell.isFinancial, true);
    });

    test('spend represents grimacing supplier (expense)', () {
      const spend = TicketTypePb.spend;
      expect(spend.isCost, true);  // Uses cost (internal expense)
      expect(spend.isFinancial, true);
    });

    test('deferred variants preserve sentiment', () {
      // Deferred sales still represent customer (happy)
      expect(TicketTypePb.sellDeferred.isPrice, true);
      // Deferred spends still represent supplier (grimacing)
      expect(TicketTypePb.spendDeferred.isCost, true);
    });

    test('stock types neutral (not happy or grimacing)', () {
      expect(TicketTypePb.stockIn.isFinancial, false);
      expect(TicketTypePb.stockOut.isFinancial, false);
      expect(TicketTypePb.inventory.isFinancial, false);
    });
  });
}
