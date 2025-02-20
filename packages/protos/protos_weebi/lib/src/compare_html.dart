import 'package:protobuf/protobuf.dart';

class Difference {
  final String fieldName;
  final dynamic localValue;
  final dynamic cloudValue;

  Difference(this.fieldName, this.localValue, this.cloudValue);
}

List<Difference> compareMessages(
    GeneratedMessage message1, GeneratedMessage message2) {
  final differences = <Difference>[];
  final descriptor1 = message1.info_;

  for (var field in descriptor1.byName.values) {
    final fieldName = field.name;
    final fieldValue1 = message1.getField(field.tagNumber);
    final fieldValue2 = message2.getField(field.tagNumber);

    if (fieldValue1 != null && fieldValue2 != null) {
      if (fieldValue1 is GeneratedMessage && fieldValue2 is GeneratedMessage) {
        // Recursively compare nested objects
        final nestedDifferences = compareMessages(fieldValue1, fieldValue2);
        differences.addAll(nestedDifferences);
      } else if (fieldValue1 != fieldValue2) {
        differences.add(Difference(fieldName, fieldValue1, fieldValue2));
      }
    }
  }

  return differences;
}

String generateHtmlFromDifferences(String objectNname,
    List<Pair<GeneratedMessage, GeneratedMessage>> messagePairs) {
  final buffer = StringBuffer();
  buffer.writeln('<!DOCTYPE html>');
  buffer.writeln('<html lang="en">');
  buffer.writeln('<head>');
  buffer.writeln('<meta charset="UTF-8">');
  buffer.writeln(
      '<meta name="viewport" content="width=device-width, initial-scale=1.0">');
  buffer.writeln('<title>Weebi Sync Local vs Cloud</title>');
  buffer.writeln('<style>');
  buffer.writeln(
      'table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }');
  buffer.writeln('th, td { border: 1px solid #ddd; padding: 8px; }');
  buffer.writeln('th { background-color: #f2f2f2; text-align: left; }');
  buffer.writeln(
      'pre { background-color: #f9f9f9; padding: 10px; border: 1px solid #ddd; overflow-x: auto; }');
  buffer.writeln('</style>');
  buffer.writeln('</head>');
  buffer.writeln('<body>');
  buffer.writeln('<h1>Comparaison</h1>');

  for (var i = 0; i < messagePairs.length; i++) {
    final message1 = messagePairs[i].first;
    final message2 = messagePairs[i].second;
    final differences = compareMessages(message1, message2);

    if (differences.isNotEmpty) {
      buffer.writeln('<h2>${objectNname} id: ${message1.getField(1)}</h2>');
      buffer.writeln('<table>');
      buffer.writeln('<tr><th>Champs</th><th>Local</th><th>Cloud</th></tr>');

      for (final difference in differences) {
        print('difference.localValue');
        print(difference.localValue);
        buffer.writeln('<tr>');
        buffer.writeln('<td>${difference.fieldName}</td>');
        buffer.writeln(difference.localValue is PbList
            ? '<td><pre>${difference.localValue.join("\n")}</pre></td>'
            : '<td>${difference.localValue}</td>');
        buffer.writeln(difference.cloudValue is PbList
            ? '<td><pre>${difference.cloudValue.join("\n")}</pre></td>'
            : '<td>${difference.cloudValue}</td>');
        buffer.writeln('</tr>');
      }

      buffer.writeln('</table>');
    }
  }

  buffer.writeln('</body>');
  buffer.writeln('</html>');

  return buffer.toString();
}

class Pair<T1, T2> {
  final T1 first;
  final T2 second;

  Pair(this.first, this.second);
}
