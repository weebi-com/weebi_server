// Package imports:
import 'package:models_weebi/models.dart' show BoutiqueWeebi;
import 'package:protos_weebi/data_dummy.dart';
import 'package:test/test.dart';
// Project imports:

// TODO add a simple server boutiqueWeebi test here
// TODO use reflection to do this properly

void main() {
  test('Boutique vs BoutiqueWeebi', () async {
    final dummyboutiquePb = Dummy.boutiqueMongo;
    final boutiqueWeebi = BoutiqueWeebi.fromMap(
        dummyboutiquePb.toProto3Json() as Map<String, dynamic>);

    expect(Dummy.boutiqueMongo.boutique.addressFull.city, boutiqueWeebi.addressFull.city);
    expect(Dummy.boutiqueMongo.boutique.phone, boutiqueWeebi.phone);
    expect(Dummy.boutiqueMongo.boutique.name, boutiqueWeebi.name);
    expect(Dummy.boutiqueMongo.boutique.promo, boutiqueWeebi.promo);
  });
}

