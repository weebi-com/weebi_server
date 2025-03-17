import 'package:fence_service/models_weebi.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';

void main() {
  test('category pb', () {
    final categoryWeebi = CategoryWeebi.dummy.toMap();
    print(categoryWeebi);

    final categoryPb = CategoryPb.create()
      ..mergeFromProto3Json(
        categoryWeebi,
        ignoreUnknownFields: true,
      );

    expect(
        categoryPb.calibresIds.length, CategoryWeebi.dummy.calibresIds.length);
    expect(categoryPb.calibresIds.first, CategoryWeebi.dummy.calibresIds.first);
    expect(int.tryParse('${categoryPb.color}'), CategoryWeebi.dummy.color);
  });
}
