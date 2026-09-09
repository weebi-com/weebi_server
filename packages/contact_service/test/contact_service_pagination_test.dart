import 'package:test/test.dart';

import 'package:contact_service/contact_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/mongo_local_testing.dart';

ContactPb _contact({
  required int id,
  required String firstName,
  required String lastName,
  String mail = '',
  String phone = '',
  bool status = true,
}) {
  final now = '2020-02-0${id}T00:00:00.000';
  return ContactPb.create()
    ..mergeFromProto3Json(
      {
        'id': id,
        'creationDate': now,
        'status': status,
        'firstName': firstName,
        'lastName': lastName,
        'mail': mail,
        'phone': {'countryCode': 33, 'number': phone},
        'overdraft': 0,
        'isClient': true,
      },
      ignoreUnknownFields: true,
    );
}

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('contact_service_pagination_test');
  await poolService.initialize();

  late ContactService contactService;
  final chainId = Dummy.chain.chainId;

  setUpAll(() async {
    final db = await poolService.acquire();
    contactService = ContactService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.createCollection(FenceService.firmCollectionName);
    await db
        .collection(FenceService.firmCollectionName)
        .deleteMany(where.eq('firmId', Dummy.firm.firmId));
    await db.collection(FenceService.firmCollectionName).insertOne({
      'firmId': Dummy.firm.firmId,
      'licenses': <dynamic>[],
    });
    await db.collection(ContactService.collectionName).drop();
    await db.createCollection(ContactService.collectionName);
    poolService.release(db);

    final seeds = [
      _contact(id: 1, firstName: 'John', lastName: 'Doe', mail: 'john@weebi.com'),
      _contact(id: 2, firstName: 'Lili', lastName: 'Gancel', phone: '612345678'),
      _contact(id: 3, firstName: 'Ada', lastName: 'Lovelace', mail: 'ada@weebi.com'),
      _contact(id: 4, firstName: 'Marie', lastName: 'Curie', mail: 'marie@weebi.com'),
      _contact(
        id: 5,
        firstName: 'Archived',
        lastName: 'Person',
        mail: 'gone@weebi.com',
        status: false,
      ),
    ];
    for (final contact in seeds) {
      final response = await contactService.createOne(
        null,
        ContactRequest(chainId: chainId, contact: contact),
      );
      expect(response.type, StatusResponse_Type.CREATED);
    }
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(ContactService.collectionName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    poolService.release(db);
  });

  test('limit 0 returns the full dump without pagination metadata', () async {
    final response = await contactService.readAll(
      null,
      ReadAllContactsRequest(chainId: chainId),
    );
    expect(response.contacts.length, 5);
    expect(response.total, 0);
    expect(response.hasMore, isFalse);
    expect(response.batchSize, 0);
  });

  test('first page returns limit items and hasMore', () async {
    final response = await contactService.readAll(
      null,
      ReadAllContactsRequest(chainId: chainId, offset: 0, limit: 2),
    );
    expect(response.contacts.map((c) => c.id), [1, 2]);
    expect(response.total, 5);
    expect(response.hasMore, isTrue);
    expect(response.batchSize, 2);
  });

  test('last page hasMore is false', () async {
    final response = await contactService.readAll(
      null,
      ReadAllContactsRequest(chainId: chainId, offset: 4, limit: 2),
    );
    expect(response.contacts.map((c) => c.id), [5]);
    expect(response.total, 5);
    expect(response.hasMore, isFalse);
  });

  test('query matches name mail or phone', () async {
    final byName = await contactService.readAll(
      null,
      ReadAllContactsRequest(chainId: chainId, limit: 10, query: 'lili'),
    );
    expect(byName.contacts.single.firstName, 'Lili');
    expect(byName.total, 1);

    final byMail = await contactService.readAll(
      null,
      ReadAllContactsRequest(chainId: chainId, limit: 10, query: 'ada@'),
    );
    expect(byMail.contacts.single.lastName, 'Lovelace');

    final byPhone = await contactService.readAll(
      null,
      ReadAllContactsRequest(chainId: chainId, limit: 10, query: '612345678'),
    );
    expect(byPhone.contacts.single.firstName, 'Lili');
  });

  test('statusFilter 1 is active only, 2 is inactive only', () async {
    final active = await contactService.readAll(
      null,
      ReadAllContactsRequest(chainId: chainId, limit: 10, statusFilter: 1),
    );
    expect(active.total, 4);

    final inactive = await contactService.readAll(
      null,
      ReadAllContactsRequest(chainId: chainId, limit: 10, statusFilter: 2),
    );
    expect(inactive.contacts.single.firstName, 'Archived');
    expect(inactive.total, 1);
  });
}
