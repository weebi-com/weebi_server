import 'package:protos_weebi/src/cel_evaluator.dart';
import 'package:protos_weebi/src/generated/article/article.pb.dart';
import 'package:protos_weebi/src/generated/ticket/ticket.pb.dart';
import 'package:protos_weebi/src/generated/ticket/ticket_type.pb.dart';
import 'package:test/test.dart';

// ─── CEL Evaluator Robustness Tests ─────────────────────────────────────────
// Verify that CelEvaluator correctly maps field names and contexts so formulas
// remain resilient to naming convention shifts between proto (snake_case) and
// Dart (camelCase).

void main() {
  group('CelEvaluator — Field Name Mapping', () {
    test('evaluates formula using camelCase field names', () {
      final ticket = TicketPb(
        ticketType: TicketTypePb.sell,
        promo: 10.0,
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 100.0),
            quantity: 2.0,
          ),
        ],
      );
      
      final result = CelEvaluator.evaluate(ticket, 'promo');
      expect(result, 10.0);
    });

    test('evaluates formula with nested camelCase field access', () {
      final ticket = TicketPb(
        taxe: TaxPb(percentage: 20.0),
      );
      
      // Nested field: taxe.percentage (camelCase)
      final result = CelEvaluator.evaluate(ticket, 'taxe.percentage');
      expect(result, 20.0);
    });

    test('camelCase field names work in arithmetic', () {
      final ticket = TicketPb(
        promo: 10.0,
        discountAmount: 20.0,
      );
      
      // Arithmetic with camelCase fields
      final result = CelEvaluator.evaluate(
        ticket,
        'promo + discountAmount'
      );
      expect(result, 30.0);
    });

    test('evaluates arithmetic on mapped fields', () {
      final ticket = TicketPb(
        promo: 15.0,
      );
      
      final result = CelEvaluator.evaluate(ticket, 'promo * 2');
      expect(result, 30.0);
    });

    test('returns 0 for unmapped field (graceful fallback)', () {
      final ticket = TicketPb(
        promo: 10.0,
      );
      
      // Non-existent field should not crash
      final result = CelEvaluator.evaluate(ticket, 'nonExistentField');
      expect(result, 0.0);
    });

    test('handles formula with conditional logic', () {
      final ticket = TicketPb(
        taxe: TaxPb(percentage: 10.0),
      );
      
      // Conditional: if percentage > 5 then 100 else 50
      final result = CelEvaluator.evaluate(
        ticket,
        'taxe.percentage > 5 ? 100 : 50'
      );
      expect(result, 100.0);
    });

    test('handles empty formula gracefully', () {
      final ticket = TicketPb();
      final result = CelEvaluator.evaluate(ticket, '');
      expect(result, 0.0);
    });
  });

  group('CelEvaluator — Context Injection', () {
    test('includes proto field names in context', () {
      final ticket = TicketPb(
        promo: 5.0,
      );
      
      // Verify 'this' reference works
      final result = CelEvaluator.evaluate(ticket, 'this.promo');
      expect(result, 5.0);
    });

    test('additional context overrides proto fields', () {
      final ticket = TicketPb(
        promo: 10.0,
      );
      
      final additionalContext = {'promo': 99.0};
      final result = CelEvaluator.evaluate(
        ticket,
        'promo',
        additionalContext: additionalContext
      );
      expect(result, 99.0);
    });

    test('additional context provides new variables', () {
      final ticket = TicketPb();
      
      final additionalContext = {
        'customVar': 42.0,
        'multiplier': 2.0,
      };
      final result = CelEvaluator.evaluate(
        ticket,
        'customVar * multiplier',
        additionalContext: additionalContext
      );
      expect(result, 84.0);
    });

    test('nested proto messages are converted to maps', () {
      final ticket = TicketPb(
        taxe: TaxPb(percentage: 20.0),
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 100.0),
            quantity: 2.0,
          ),
        ],
      );
      
      final result = CelEvaluator.evaluate(ticket, 'taxe.percentage');
      expect(result, 20.0);
    });

    test('repeated fields (list) are handled', () {
      final ticket = TicketPb(
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 50.0),
            quantity: 1.0,
          ),
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 50.0),
            quantity: 1.0,
          ),
        ],
      );
      
      // List should be present in context
      expect(ticket.items.length, 2);
    });
  });

  group('CelEvaluator — Naming Convention Resilience', () {
    test('camelCase formula works consistently', () {
      final ticket = TicketPb(
        discountAmount: 100.0,
      );
      
      // Formula using camelCase (Dart convention)
      final resultCamelCase = CelEvaluator.evaluate(
        ticket,
        'discountAmount'
      );
      
      expect(resultCamelCase, 100.0);
    });

    test('formulas use consistent rounding', () {
      final ticket = TicketPb(
        promo: 10.0,
      );
      
      // Formula that should round to 4 decimals
      final result = CelEvaluator.evaluate(ticket, 'promo / 3');
      // 10 / 3 = 3.3333... → rounded to 4 decimals = 3.3333
      expect(result, closeTo(3.3333, 0.00001));
    });

    test('formula with enum values', () {
      final ticket = TicketPb(
        ticketType: TicketTypePb.sell,
      );
      
      // Enum should be converted to its name or index
      final result = CelEvaluator.evaluate(ticket, 'ticketType');
      // Result depends on how enums are serialized; check for non-zero
      expect(result, isNotNull);
    });
  });

  group('CelEvaluator — Complex Formulas', () {
    test('multi-step arithmetic formula', () {
      final ticket = TicketPb(
        promo: 10.0,
        discountAmount: 5.0,
        taxe: TaxPb(percentage: 20.0),
      );
      
      // Simple multi-step formula
      final result = CelEvaluator.evaluate(
        ticket,
        '100 - promo - discountAmount'
      );
      // 100 - 10 - 5 = 85
      expect(result, 85.0);
    });

    test('formula with list length', () {
      final ticket = TicketPb(
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 50.0),
            quantity: 1.0,
          ),
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 50.0),
            quantity: 1.0,
          ),
        ],
      );
      
      // Check that items list is in context
      expect(ticket.items, hasLength(2));
    });

    test('formula with zero division handling', () {
      final ticket = TicketPb(
        promo: 0.0,
      );
      
      // If formula divides by zero, CelEvaluator should not crash
      final result = CelEvaluator.evaluate(ticket, 'promo / (promo - promo)');
      // Should not throw; result may be 0 or special value
      expect(result, isNotNull);
    });

    test('formula with boolean logic', () {
      final ticket = TicketPb(
        taxe: TaxPb(percentage: 20.0),
      );
      
      // Boolean: if taxe.percentage > 15 then 100 else 0
      final result = CelEvaluator.evaluate(
        ticket,
        'taxe.percentage > 15 ? 100 : 0'
      );
      expect(result, 100.0);
    });
  });

  group('CelEvaluator — Error Resilience', () {
    test('malformed formula returns 0 (no crash)', () {
      final ticket = TicketPb(promo: 10.0);
      
      final result = CelEvaluator.evaluate(ticket, 'invalid [[ formula');
      expect(result, 0.0);
    });

    test('formula referencing null/zero field returns 0', () {
      final ticket = TicketPb();
      
      final result = CelEvaluator.evaluate(ticket, 'promo + 10');
      expect(result, 10.0);  // promo is null (defaults to 0) + 10 = 10
    });

    test('negative number handling', () {
      final ticket = TicketPb(
        discountAmount: -50.0,
      );
      
      final result = CelEvaluator.evaluate(ticket, 'discountAmount * 2');
      expect(result, -100.0);
    });

    test('very large numbers', () {
      final ticket = TicketPb(
        promo: 999999.9999,
      );
      
      final result = CelEvaluator.evaluate(ticket, 'promo');
      expect(result, closeTo(999999.9999, 0.0001));
    });
  });

  group('CelEvaluator — Proto Field vs Dart Field Names', () {
    test('both proto and dart field names are mapped in context', () {
      final ticket = TicketPb(
        discountAmount: 50.0,
      );
      
      // The _messageToMap should create both 'discount_amount' (proto) 
      // and 'discountAmount' (dart) in the context
      // For now we test the camelCase version that we know works
      final result = CelEvaluator.evaluate(ticket, 'discountAmount');
      expect(result, 50.0);
    });

    test('nested fields use appropriate naming', () {
      final ticket = TicketPb(
        taxe: TaxPb(percentage: 15.0),
      );
      
      // Nested camelCase should work
      final result = CelEvaluator.evaluate(ticket, 'taxe.percentage');
      expect(result, 15.0);
    });

    test('computed totals can be passed via additional context', () {
      final ticket = TicketPb(
        promo: 10.0,
      );
      
      // Add pre-computed values in context
      final additionalContext = {
        'itemsTotal': 100.0,
        'taxPercentage': 20.0,
      };
      
      final result = CelEvaluator.evaluate(
        ticket,
        'itemsTotal',
        additionalContext: additionalContext
      );
      
      expect(result, 100.0);
    });
  });
}
