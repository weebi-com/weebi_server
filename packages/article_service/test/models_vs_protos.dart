//import 'package:protos_weebi/data_dummy.dart';
import 'package:protos_weebi/src/generated/article/article.pb.dart';
import 'package:test/test.dart';
import 'package:fence_service/models_weebi.dart' show CalibreWeebi;

void main() {
  test("CalibreWeebi vs CalibrePb", () {
    final calibreWeebi = CalibreWeebi.dummyRetail;
    final calibrePb = CalibrePb.create()
      ..mergeFromProto3Json(calibreWeebi.toMap(), ignoreUnknownFields: true);
    expect(calibrePb, calibreWeebi);
  });
  test("CalibrePb vs CalibreWeebi", () {
// TODO create one in Dummy
    //  expect(calibreWeebi, calibrePb);
  });
}
