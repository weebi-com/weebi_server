import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';
import 'package:fence_service/models_weebi.dart' show CalibreWeebi;

void main() {
  test("CalibreWeebi vs CalibrePb", () {
    final calibreWeebi = CalibreWeebi.dummyRetail;
    final calibrePb = CalibrePb.create()
      ..mergeFromProto3Json(calibreWeebi.toMap(isProto: true), ignoreUnknownFields: true);
    expect(calibrePb, calibreWeebi);
  });
  test("CalibrePb vs CalibreWeebi", () {
// TODO create one in Dummy
    //  expect(calibreWeebi, calibrePb);
  });
}
