class LegendItem {
  final String label;
  final String color;

  LegendItem({required this.label, required this.color});
}

class Legend {
  final List<LegendItem> items;
  final double x;
  final double y;
  final double itemHeight;

  Legend({
    required this.items,
    this.x = 0,
    this.y = 0,
    this.itemHeight = 20.0,
  });

  String render() {
    final renderedItems = items.asMap().entries.map((entry) {
      final i = entry.key;
      final item = entry.value;
      final itemY = y + i * itemHeight;

      return '''
<g transform="translate($x, $itemY)">
  <rect width="12" height="12" fill="${item.color}" />
  <text x="18" y="10" font-family="sans-serif" font-size="12">${item.label}</text>
</g>''';
    }).join('\n');

    return '<g class="legend">$renderedItems</g>';
  }
}
