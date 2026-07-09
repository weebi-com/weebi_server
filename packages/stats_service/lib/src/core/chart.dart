import 'dimensions.dart';

abstract class Chart {
  final ChartDimensions dimensions;

  Chart(this.dimensions);

  String render();
}
