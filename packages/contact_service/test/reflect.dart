import 'package:fence_service/models_weebi.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';

// use this to test that pb objects match weebi ones
void iterateFields(ContactPb message) {
  final descriptor = message.info_;
  for (var field in descriptor.byName.values) {
    final fieldName = field.name;
    final fieldValue = message.getField(field.tagNumber);

    if (field.isRepeated) {
      for (var value in fieldValue) {
        // Handle repeated fields
        print('Field: $fieldName, Value: $value');
      }
    } else {
      // Handle singular fields
      print('Field: $fieldName, Value: $fieldValue');
    }
  }
}

void main() {
  test('reflect', () {
    final contactDummy = ContactPb.create()
      ..mergeFromProto3Json(
        ContactWeebi.dummy.toMap(),
        ignoreUnknownFields: true,
      );

    iterateFields(contactDummy);
  });
}
