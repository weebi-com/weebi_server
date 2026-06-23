String formatChartCurrencyAxisTick(num value, String currency) {
  final abs = value.abs();
  if (abs >= 1000000000) {
    return '${_trimFixed(value / 1000000000)}B $currency';
  }
  if (abs >= 1000000) {
    return '${_trimFixed(value / 1000000)}M $currency';
  }
  if (abs >= 1000) {
    return '${_trimFixed(value / 1000)}k $currency';
  }
  if (value == value.roundToDouble()) {
    return '${value.toInt()} $currency';
  }
  return '${_trimFixed(value)} $currency';
}

String _trimFixed(num value) {
  final text = value.toStringAsFixed(1);
  if (text.endsWith('.0')) {
    return text.substring(0, text.length - 2);
  }
  return text;
}
