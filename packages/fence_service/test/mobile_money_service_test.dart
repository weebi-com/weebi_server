import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/mobile_money_service.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('mobile_money_service_test');
  await poolService.initialize();

  late MobileMoneyService service;

  setUpAll(() async {
    final db = await poolService.acquire();
    service = MobileMoneyService(poolService);
    await db.collection(MobileMoneyService.collectionName).drop();
    await db.createCollection(MobileMoneyService.collectionName);
    await db.collection(MobileMoneyService.collectionName).insertMany([
      {
        'code': '5521',
        'name': 'Orange Money',
        'countryCodes': ['SN', 'CI'],
        'logo': '',
        'logoExtension': 'unknown',
        'active': true,
      },
      {
        'code': '5522',
        'name': 'MTN Money',
        'countryCodes': <String>[],
        'logo': '',
        'logoExtension': 'unknown',
        'active': true,
      },
      {
        'code': '5529',
        'name': 'Moov Money BF',
        'countryCodes': ['BF'],
        'logo': '',
        'logoExtension': 'unknown',
        'active': true,
      },
      {
        'code': '5528',
        'name': 'Inactive SN',
        'countryCodes': ['SN'],
        'logo': '',
        'logoExtension': 'unknown',
        'active': false,
      },
      {
        // Legacy singular field still accepted by the service.
        'code': '5527',
        'name': 'Legacy Wave SN',
        'countryCode': 'SN',
        'logo': '',
        'logoExtension': 'unknown',
        'active': true,
      },
    ]);
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(MobileMoneyService.collectionName).drop();
    poolService.release(db);
  });

  test('listOperators(SN) returns multi-country + global + legacy, omits BF/inactive',
      () async {
    final response = await service.listOperators(
      null,
      ListMobileMoneyOperatorsRequest(countryCode: 'SN'),
    );
    final codes = response.operators.map((o) => o.code).toSet();
    expect(codes, containsAll(['5521', '5522', '5527']));
    expect(codes.contains('5529'), isFalse);
    expect(codes.contains('5528'), isFalse);
    expect(response.operators.every((o) => o.active), isTrue);
    final orange = response.operators.firstWhere((o) => o.code == '5521');
    expect(orange.countryCodes, ['SN', 'CI']);
  });

  test('listOperators(CI) includes Orange from countryCodes list', () async {
    final response = await service.listOperators(
      null,
      ListMobileMoneyOperatorsRequest(countryCode: 'CI'),
    );
    final codes = response.operators.map((o) => o.code).toSet();
    expect(codes, containsAll(['5521', '5522']));
    expect(codes.contains('5527'), isFalse);
  });

  test('listOperators with unknown country returns only global active',
      () async {
    final response = await service.listOperators(
      null,
      ListMobileMoneyOperatorsRequest(countryCode: 'ZZ'),
    );
    expect(response.operators.map((o) => o.code), ['5522']);
    expect(response.operators.single.countryCodes, isEmpty);
  });

  test('listOperators with empty country returns only global active', () async {
    final response = await service.listOperators(
      null,
      ListMobileMoneyOperatorsRequest(countryCode: ''),
    );
    expect(response.operators.map((o) => o.code), ['5522']);
  });
}
