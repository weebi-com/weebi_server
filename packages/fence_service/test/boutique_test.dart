// Package imports:
import 'package:models_weebi/models.dart' show BoutiqueWeebi;
import 'package:protos_weebi/data_dummy.dart';
import 'package:test/test.dart';
// Project imports:

// TODO add a simple server boutiqueWeebi test here

void main() {
  test('BoutiquePb vs BoutiqueWeebi', () async {
    final boutiqueWeebi = BoutiqueWeebi.fromMap(
        Dummy.boutiqueMongo.boutique.toProto3Json() as Map<String, dynamic>);

    print('dummyboutiquePb');
    print(Dummy.boutiqueMongo.toProto3Json());
    print('boutiqueWeebi');
    print(boutiqueWeebi.toMap());

    expect(Dummy.boutiqueMongo.boutique.boutiqueId, boutiqueWeebi.id.toString());
    expect(Dummy.boutiqueMongo.boutique.boutiqueId, boutiqueWeebi.boutiqueId);
    expect(Dummy.boutiqueMongo.boutique.phone.countryCode, boutiqueWeebi.phone.countryCode);
    expect(Dummy.boutiqueMongo.boutique.phone.number, boutiqueWeebi.phone.number);
    expect(Dummy.boutiqueMongo.boutique.addressFull.street, boutiqueWeebi.addressFull.street);
    expect(Dummy.boutiqueMongo.boutique.addressFull.city, boutiqueWeebi.addressFull.city);
    expect(Dummy.boutiqueMongo.boutique.addressFull.code, boutiqueWeebi.addressFull.code);
    expect(Dummy.boutiqueMongo.boutique.addressFull.country.code2Letters, boutiqueWeebi.addressFull.country.code2Letters);
    expect(Dummy.boutiqueMongo.boutique.promo, boutiqueWeebi.promo);
    expect(DateTime.tryParse(Dummy.boutiqueMongo.boutique.promoStart), boutiqueWeebi.promoStart?.toIso8601String());
    expect(DateTime.tryParse(Dummy.boutiqueMongo.boutique.promoEnd), boutiqueWeebi.promoEnd?.toIso8601String());
  });
}

