import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

void main() {
  group('BusinessClassifications', () {
    test('all has at least 35 entries', () {
      expect(BusinessClassifications.all.length, greaterThanOrEqualTo(35));
    });

    test('(isicCode, subCode) pairs are unique', () {
      final keys = BusinessClassifications.all
          .map((e) => BusinessClassifications.compositeKey(e.isicCode, e.subCode))
          .toList();
      expect(keys.toSet().length, keys.length);
    });

    test('isicCode is non-empty numeric string (leading zeros allowed)', () {
      final numeric = RegExp(r'^\d+$');
      for (final row in BusinessClassifications.all) {
        expect(row.isicCode, isNotEmpty, reason: row.labelFr);
        expect(numeric.hasMatch(row.isicCode), isTrue,
            reason: 'bad isic "${row.isicCode}" for ${row.labelFr}');
      }
    });

    test('subCode is empty or ASCII snake_case', () {
      final slug = RegExp(r'^[a-z][a-z0-9_]*$');
      for (final row in BusinessClassifications.all) {
        if (row.subCode.isEmpty) continue;
        expect(slug.hasMatch(row.subCode), isTrue,
            reason: 'bad sub "${row.subCode}" for ${row.labelFr}');
      }
    });

    test('shared ISIC rows always have a non-empty subCode', () {
      final byIsic = <String, List<BusinessClassification>>{};
      for (final row in BusinessClassifications.all) {
        byIsic.putIfAbsent(row.isicCode, () => []).add(row);
      }
      for (final entry in byIsic.entries) {
        if (entry.value.length < 2) continue;
        for (final row in entry.value) {
          expect(row.subCode, isNotEmpty,
              reason: 'ISIC ${entry.key} needs sub_code for ${row.labelFr}');
        }
      }
    });

    test('smtRegime is never unknown', () {
      for (final row in BusinessClassifications.all) {
        expect(row.smtRegime, isNot(CommerceTypePb.unknown),
            reason: '${row.isicCode}/${row.subCode}');
      }
    });

    test('required display fields are filled', () {
      for (final row in BusinessClassifications.all) {
        final id = '${row.isicCode}/${row.subCode}';
        expect(row.emoji, isNotEmpty, reason: id);
        expect(row.labelFr, isNotEmpty, reason: id);
        expect(row.isicLabelFr, isNotEmpty, reason: id);
        expect(row.isicLabelEn, isNotEmpty, reason: id);
        expect(row.isicLabelEs, isNotEmpty, reason: id);
      }
    });

    test('byIsicAndSub returns known rows', () {
      final bakery = BusinessClassifications.byIsicAndSub('1071');
      expect(bakery, isNotNull);
      expect(bakery!.smtRegime, CommerceTypePb.artisanat);
      expect(bakery.subCode, isEmpty);

      final hair = BusinessClassifications.byIsicAndSub('9602', 'coiffure');
      expect(hair, isNotNull);
      expect(hair!.labelFr, 'Salon de coiffure');

      expect(BusinessClassifications.byIsicAndSub('9602'), isNull);
      expect(BusinessClassifications.byIsicAndSub(''), isNull);
    });

    test('byIsic returns all refinements for a shared ISIC', () {
      final beauty = BusinessClassifications.byIsic('9602');
      expect(beauty.length, 2);
      expect(beauty.map((e) => e.subCode).toSet(), {'coiffure', 'beaute'});
    });

    test('spot-check SMT regimes A/B/C', () {
      expect(
        BusinessClassifications.byIsicAndSub('4752')!.smtRegime,
        CommerceTypePb.negoce,
      );
      expect(
        BusinessClassifications.byIsicAndSub('5630')!.smtRegime,
        CommerceTypePb.services,
      );
      expect(
        BusinessClassifications.byIsicAndSub('1622')!.smtRegime,
        CommerceTypePb.artisanat,
      );
    });

    test('leading-zero ISIC codes stay strings', () {
      expect(BusinessClassifications.byIsicAndSub('014'), isNotNull);
      expect(BusinessClassifications.byIsicAndSub('0322'), isNotNull);
      expect(BusinessClassifications.byIsicAndSub('14'), isNull);
      expect(BusinessClassifications.byIsicAndSub('322'), isNull);
    });
  });
}
