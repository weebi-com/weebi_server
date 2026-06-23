import 'package:test/test.dart';
import 'package:stats_service/src/core/chart_value_format.dart';

void main() {
  group('formatChartCurrencyAxisTick', () {
    test('formats millions compactly', () {
      expect(formatChartCurrencyAxisTick(2500000, 'CDF'), '2.5M CDF');
      expect(formatChartCurrencyAxisTick(12000000, 'CDF'), '12M CDF');
    });

    test('formats billions compactly', () {
      expect(formatChartCurrencyAxisTick(1500000000, 'CDF'), '1.5B CDF');
    });

    test('formats thousands compactly', () {
      expect(formatChartCurrencyAxisTick(4500, 'CDF'), '4.5k CDF');
    });

    test('keeps small values readable', () {
      expect(formatChartCurrencyAxisTick(250, 'CDF'), '250 CDF');
    });
  });
}

