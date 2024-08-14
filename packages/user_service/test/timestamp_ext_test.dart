import 'package:protos_weebi/src/snippet.dart';
import 'package:test/test.dart';

void main() {
  test('test timestamp extension', () {
    final date = DateTime(2024, 07, 28);
    final timestamp = date.timestampProto;

    print(timestamp);
    print(timestamp.toProto3Json());

    expect(timestamp.seconds, 1722117600);
  });
}
