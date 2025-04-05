import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';

void main() {
  test('test name', () {
    final t = DateTime.now().timestampProto;
    print(t.toDateTime());
    print(t.toDateTime().toIso8601String());
  });
}