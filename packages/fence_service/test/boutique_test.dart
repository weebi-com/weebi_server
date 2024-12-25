// Package imports:
import 'package:models_weebi/models.dart' show BoutiqueWeebi;
import 'package:protos_weebi/data_dummy.dart';
import 'package:test/test.dart';
// Project imports:

void main() {
  test('Boutique vs BoutiqueWeebi', () async {
    final dummyboutiquePb = Dummy.boutique;
    final boutiqueWeebi = BoutiqueWeebi.fromMap(
        dummyboutiquePb.toProto3Json() as Map<String, dynamic>);

    expect(dummyboutiquePb.toProto3Json() as Map<String, dynamic>,
        boutiqueWeebi.toMap());
  });
}

// TODO add a simple server boutiqueWeebi test here