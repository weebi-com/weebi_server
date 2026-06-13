class ChartDimensions {
  final double width;
  final double height;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  final double marginLeft;

  const ChartDimensions({
    required this.width,
    required this.height,
    this.marginTop = 40.0,
    this.marginRight = 40.0,
    this.marginBottom = 40.0,
    this.marginLeft = 40.0,
  });

  double get innerWidth => width - marginLeft - marginRight;
  double get innerHeight => height - marginTop - marginBottom;

  double get left => marginLeft;
  double get right => width - marginRight;
  double get top => marginTop;
  double get bottom => height - marginBottom;

  @override
  String toString() {
    return 'ChartDimensions(width: $width, height: $height, margins: [$marginTop, $marginRight, $marginBottom, $marginLeft])';
  }
}
