enum FinancialChartMetric {
  cashflowIncome,
  cashflowSpending,
  allIncome,
  allSpending,
}

extension FinancialChartMetricTypes on FinancialChartMetric {
  List<String> get ticketTypeNames {
    switch (this) {
      case FinancialChartMetric.cashflowIncome:
        return const ['sell', 'sellCovered'];
      case FinancialChartMetric.cashflowSpending:
        return const ['spend', 'spendCovered'];
      case FinancialChartMetric.allIncome:
        return const ['sell', 'sellCovered', 'sellDeferred'];
      case FinancialChartMetric.allSpending:
        return const ['spend', 'spendCovered', 'spendDeferred'];
    }
  }

  bool includesTicketType(String ticketType) =>
      ticketTypeNames.contains(ticketType);

  String get fileSlug {
    switch (this) {
      case FinancialChartMetric.cashflowIncome:
        return 'cashflow_income';
      case FinancialChartMetric.cashflowSpending:
        return 'cashflow_spending';
      case FinancialChartMetric.allIncome:
        return 'all_income';
      case FinancialChartMetric.allSpending:
        return 'all_spending';
    }
  }

  String get chartTitle {
    switch (this) {
      case FinancialChartMetric.cashflowIncome:
        return 'Cashflow income';
      case FinancialChartMetric.cashflowSpending:
        return 'Cashflow spending';
      case FinancialChartMetric.allIncome:
        return 'All income';
      case FinancialChartMetric.allSpending:
        return 'All spending';
    }
  }

  bool get isIncome {
    switch (this) {
      case FinancialChartMetric.cashflowIncome:
      case FinancialChartMetric.allIncome:
        return true;
      case FinancialChartMetric.cashflowSpending:
      case FinancialChartMetric.allSpending:
        return false;
    }
  }

  String get barColor => isIncome ? '#4CAF50' : '#F44336';
}
