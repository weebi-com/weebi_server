import 'dart:math' show pow;

import 'generated/ticket/ticket.pb.dart';
import 'generated/ticket/ticket_type.pbenum.dart';

// Rounds to four decimal places.
double _round4(double v) => (v * 10000).round() / 10000;

extension RoundNumDecimals on num {
  double get roundFourDecimals {
    num fac = pow(10, 4);
    return (this * fac).round() / fac;
  }
}

extension ItemCartPbLogic on ItemCartPb {
  bool get isUncountable => hasArticleUncountable();
  bool get isBasket => hasArticleBasket();

  // Mirrors AggregateProxies.basketTotalPrice in weebi historic classes:
  //   worth = sum(round(p.price × p.minimumUnitPerBasket) for each proxy)
  //   articlePrice = worth − articleBasket.discountAmount + articleBasket.markupAmount
  double get articlePrice {
    if (hasArticleRetail()) return articleRetail.price;
    if (hasArticleUncountable()) return articleUncountable.price;
    if (hasArticleBasket()) {
      final worth = proxiesWorth.fold(
        0,
        (sum, p) => sum + (p.price * p.minimumUnitPerBasket).round(),
      );
      return (worth - articleBasket.discountAmount + articleBasket.markupAmount)
          .toDouble();
    }
    return 0.0;
  }

  // Mirrors AggregateProxies.basketTotalPrice in weebi historic classes:  //   worth = sum(round(p.cost × p.minimumUnitPerBasket) for each proxy)
  //   no discount or markup on the cost side (purchase)
  double get articleCost {
    if (hasArticleRetail()) return articleRetail.cost;
    if (hasArticleUncountable()) return articleUncountable.cost;
    if (hasArticleBasket()) {
      return proxiesWorth
          .fold(0, (sum, p) => sum + (p.cost * p.minimumUnitPerBasket).round())
          .toDouble();
    }
    return 0.0;
  }

  double get totalPriceComputed => quantity * articlePrice;
  double get totalCostComputed => quantity * articleCost;
}

extension TicketTypePbLogic on TicketTypePb {
  /// sell and sellDeferred compute totals from item prices.
  /// sellCovered uses received (advance repayment — no item price computation).
  bool get isPrice =>
      this == TicketTypePb.sell || this == TicketTypePb.sellDeferred;

  /// spend and spendDeferred compute totals from item costs.
  /// spendCovered and wage use received.
  bool get isCost =>
      this == TicketTypePb.spend || this == TicketTypePb.spendDeferred;

  bool get isFinancial =>
      this == TicketTypePb.sell ||
      this == TicketTypePb.sellDeferred ||
      this == TicketTypePb.sellCovered ||
      this == TicketTypePb.spend ||
      this == TicketTypePb.spendDeferred ||
      this == TicketTypePb.spendCovered ||
      this == TicketTypePb.wage;

  static const stockTypes = [
    TicketTypePb.stockIn,
    TicketTypePb.stockOut,
    TicketTypePb.inventory,
  ];
}

extension TicketPbLogic on TicketPb {
  // ---------------------------------------------------------------------------
  // Private builders — compute sell/spend totals from scratch.
  // ---------------------------------------------------------------------------

  TicketSellTotalsPb _buildSellTotals() {
    final itemsOnly = items.fold(0.0, (s, i) => s + i.totalPriceComputed);
    final promoVal = _round4(itemsOnly * promo / 100);
    final markdownsVal = promoVal + discountAmount;
    final markdownsIncludedTaxExcluded = itemsOnly - markdownsVal;
    final taxesValue = taxe.percentage > 0.0
        ? (markdownsIncludedTaxExcluded * (taxe.percentage / 100)).roundFourDecimals
        : 0.0;
    final markdownsAndTaxIncluded = markdownsIncludedTaxExcluded + taxesValue;
    // change is 0 for sellDeferred
    final change = ticketType == TicketTypePb.sell
        ? received - markdownsAndTaxIncluded
        : 0.0;

    return TicketSellTotalsPb()
      ..itemsOnly = itemsOnly
      ..promoVal = promoVal
      ..markdownsVal = markdownsVal
      ..markdownsIncludedTaxExcluded = markdownsIncludedTaxExcluded
      ..taxesValue = taxesValue
      ..markdownsAndTaxIncluded = markdownsAndTaxIncluded
      ..change = change;
  }

  TicketSpendTotalsPb _buildSpendTotals() {
    final itemsOnly = items.fold(0.0, (s, i) => s + i.totalCostComputed);
    final promoVal = _round4(itemsOnly * promo / 100);
    final markdownsVal = promoVal + discountAmount;
    final markdownsIncludedTaxExcluded = itemsOnly - markdownsVal;
    final taxesValue = taxe.percentage > 0.0
        ? (markdownsIncludedTaxExcluded * (taxe.percentage / 100)).roundFourDecimals
        : 0.0;
    final markdownsAndTaxIncluded = markdownsIncludedTaxExcluded + taxesValue;
    // change is 0 for spendDeferred
    final change = ticketType == TicketTypePb.spend
        ? received - markdownsAndTaxIncluded
        : 0.0;

    return TicketSpendTotalsPb()
      ..itemsOnly = itemsOnly
      ..promoVal = promoVal
      ..markdownsVal = markdownsVal
      ..markdownsIncludedTaxExcluded = markdownsIncludedTaxExcluded
      ..taxesValue = taxesValue
      ..markdownsAndTaxIncluded = markdownsAndTaxIncluded
      ..change = change;
  }

  // ---------------------------------------------------------------------------
  // Effective totals — prefer server-pre-computed values, fall back to local build.
  // The oneof totals { sell_totals, spend_totals, cover_totals } in TicketPb
  // is set by the server; for locally-created or un-synced tickets it is unset.
  // ---------------------------------------------------------------------------

  TicketSellTotalsPb get _effectiveSellTotals =>
      hasSellTotals() ? sellTotals : _buildSellTotals();

  TicketSpendTotalsPb get _effectiveSpendTotals =>
      hasSpendTotals() ? spendTotals : _buildSpendTotals();

  // ---------------------------------------------------------------------------
  // Public convenience getters — webapp-facing API.
  // ---------------------------------------------------------------------------

  double get totalComputed {
    if (ticketType.isPrice) return _effectiveSellTotals.markdownsAndTaxIncluded;
    if (ticketType.isCost) return _effectiveSpendTotals.markdownsAndTaxIncluded;
    // cover types without a pre-computed cover_totals
    if (ticketType == TicketTypePb.sellCovered ||
        ticketType == TicketTypePb.spendCovered ||
        ticketType == TicketTypePb.wage) return received;
    return 0.0;
  }

  double get changeComputed {
    if (ticketType.isPrice) return _effectiveSellTotals.change;
    if (ticketType.isCost) return _effectiveSpendTotals.change;
    return 0.0;
  }

  double get itemsTotalComputed {
    if (ticketType.isPrice) return _effectiveSellTotals.itemsOnly;
    if (ticketType.isCost) return _effectiveSpendTotals.itemsOnly;
    return 0.0;
  }

  /// Cost-family raw items total — useful for display even on a sell ticket.
  double get itemsTotalCostComputed =>
      items.fold(0.0, (s, i) => s + i.totalCostComputed);

  double get totalTaxExcludedComputed {
    if (ticketType.isPrice) return _effectiveSellTotals.markdownsIncludedTaxExcluded;
    if (ticketType.isCost) return _effectiveSpendTotals.markdownsIncludedTaxExcluded;
    if (ticketType == TicketTypePb.sellCovered ||
        ticketType == TicketTypePb.spendCovered ||
        ticketType == TicketTypePb.wage) return received;
    return 0.0;
  }

  double get totalTaxesComputed {
    if (ticketType.isPrice) return _effectiveSellTotals.taxesValue;
    if (ticketType.isCost) return _effectiveSpendTotals.taxesValue;
    return 0.0;
  }

  double get totalTtcComputed => totalComputed;
}
