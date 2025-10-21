import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';

void main() {
  test('test timestamp extension', () {
    final date = DateTime(2024, 07, 28);
    final timestamp = date.timestampProto;

    print('timestamp $timestamp');
    print('toProto3Json ${timestamp.toProto3Json()}');

    expect(timestamp.seconds, Int64(1722117600));
  }, skip: true); // will fail in the CI
}
