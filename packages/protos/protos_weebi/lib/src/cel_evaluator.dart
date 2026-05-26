import 'package:cel/cel.dart';
import 'package:protobuf/protobuf.dart';

class CelEvaluator {
  static final Environment _env = Environment.standard();

  static double _round4(double v) => (v * 10000).round() / 10000;

  static double evaluate(GeneratedMessage message, String formula, {Map<String, dynamic>? additionalContext}) {
    if (formula.isEmpty) return 0.0;

    try {
      final ast = _env.compile(formula);
      final program = _env.makeProgram(ast);
      
      final context = _messageToMap(message);
      if (additionalContext != null) {
        context.addAll(additionalContext);
      }
      // Provide 'this' as the context itself for 'this.field' access
      context['this'] = context;
      
      final result = program.evaluate(context);
      if (result is num) return _round4(result.toDouble());
      return 0.0;
    } catch (e) {
      return 0.0;
    }
  }

  static Map<String, dynamic> _messageToMap(GeneratedMessage message) {
    final map = <String, dynamic>{};
    for (final field in message.info_.fieldInfo.values) {
      final value = message.getField(field.tagNumber);
      map[field.protoName] = _valueToCel(value);
      if (field.protoName != field.name) {
        map[field.name] = _valueToCel(value);
      }
    }
    return map;
  }

  static dynamic _valueToCel(dynamic value) {
    if (value is GeneratedMessage) {
      return _messageToMap(value);
    } else if (value is List) {
      return value.map((e) => _valueToCel(e)).toList();
    } else if (value is ProtobufEnum) {
      return value.name;
    }
    return value;
  }
}
