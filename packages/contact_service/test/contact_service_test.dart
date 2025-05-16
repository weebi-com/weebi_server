import 'package:fence_service/mongo_pool.dart';
import 'package:test/test.dart';

import 'package:contact_service/contact_service.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:fence_service/models_weebi.dart';
import 'package:fence_service/mongo_local_testing.dart';

void main() async {
  final MongoDbPoolService poolService = TestHelper.defaultPoolService;
  await poolService.initialize();

  final chainId = Dummy.chain.chainId;
  late ContactService contactService;

  final contactDummy = ContactPb.create()
    ..mergeFromProto3Json(
      ContactWeebi.dummy.toMap(),
      ignoreUnknownFields: true,
    );

  setUpAll(() async {
    final db = await poolService.acquire();
    contactService = ContactService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.collection(ContactService.collectionName).drop();
    await db.createCollection(ContactService.collectionName);
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(ContactService.collectionName).drop();
    poolService.release(db);
  });

  test('test insertOne', () async {
    final contactRequest = ContactRequest(
      contact: contactDummy,
      chainId: chainId,
    );
    final response = await contactService.createOne(null, contactRequest);
    expect(response.type, StatusResponse_Type.CREATED);
  });
  test('test readAll', () async {
    final response = await contactService.readAll(
        null, ReadAllContactsRequest(chainId: chainId));
    expect(response.contacts.length, 1);
  });
  test('test readAllIds', () async {
    final response = await contactService.readAllIds(
        null, ReadContactsIdsRequest(chainId: chainId));
    expect(response.ids.length, 1);
    expect(response.ids.first, 1);
  });

  test('test readOne', () async {
    final response = await contactService.readOne(
      null,
      ReadContactRequest(
        contactChainId: chainId,
        contactId: 1,
      ),
    );
    expect(response.firstName, 'John');
    expect(int.tryParse('${response.overdraft}'), 0);
  });

  test('test upsertOne ', () async {
    final lili =
        ContactWeebi.dummy.copyWith(firstName: 'Lili', lastName: 'Gancel');
    print('lili ${lili.firstName}');

    final contactLili = ContactPb.create()
      ..mergeFromProto3Json(
        lili.toMap(),
        ignoreUnknownFields: true,
      );
    final contactRequest = ContactRequest(
      chainId: chainId,
      contact: contactLili,
    );
    // ignore: unused_local_variable
    final response = await contactService.updateOne(null, contactRequest);
    expect(response.type, StatusResponse_Type.UPDATED);

    final response2 = await contactService.readAll(
        null, ReadAllContactsRequest(chainId: chainId));
    print('response2.contacts ${response2.contacts.length}');
    expect(response2.contacts.first.firstName, 'Lili');
  });

  test('test deleteOne ', () async {
    final contactRequest = ContactRequest(
      chainId: chainId,
      contact: contactDummy,
    );
    // ignore: unused_local_variable
    final response = await contactService.deleteOne(null, contactRequest);

    final response2 = await contactService.readAll(
        null, ReadAllContactsRequest(chainId: chainId));
    expect(response2.contacts.length, 0);
  });
}
