import 'package:fence_service/models_weebi.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';

void main() {
  test('calibre pb', () {
    final calibreWeebi = CalibreWeebi.dummyRetail.toMapProto();
    print(calibreWeebi);

    final calibrePb = CalibrePb.create()
      ..mergeFromProto3Json(
        calibreWeebi,
        ignoreUnknownFields: true,
      );

    expect(calibrePb.articlesRetail.length, 1);
  });
}
