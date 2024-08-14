// import 'dart:io';
import 'package:test/test.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'package:models_weebi/models.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

import 'package:contact_service/contact_service.dart';
import 'package:user_service/user_testing.dart';

void main() async {
  final db = TestHelper.localDb;
  final connection = Connection(ConnectionManager(db));
  final firmId = Dummy.firm.firmId;
  final chainId = Dummy.chain.chainId;
  late ContactService contactService;

  final contactDummy = ContactPb.create()
    ..mergeFromProto3Json(
      ContactWeebi.dummy.toMap(),
      ignoreUnknownFields: true,
    );

  setUpAll(() async {
    await db.open();
    contactService = ContactService(
      db,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.collection(contactService.collection.collectionName).drop();
    await db.createCollection(contactService.collection.collectionName);
  });

  tearDownAll(() async {
    await db.collection(contactService.collection.collectionName).drop();
    await connection.close();
  });

  test('test insertOne', () async {
    final contactRequest = ContactRequest(
        contact: contactDummy,
        chainId: chainId,
        contactuserId: Dummy.userInfo.permissions.userId);
    final response = await contactService.createOne(null, contactRequest);
    expect(response.type, StatusResponse_Type.CREATED);
  });
  test('test readAll', () async {
    final response = await contactService.readAll(
        null, ReadAllContactsRequest(firmId: firmId, chainId: chainId));
    expect(response.contacts.length, 1);
  });

  test('test readOne', () async {
    final response = await contactService.readOne(
      null,
      FindContactRequest(
        contactchainId: chainId,
        contactuserId: Dummy.userInfo.permissions.userId,
        contactNonUniqueId: 1,
      ),
    );
    expect(response.firstName, 'John');
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
      contactuserId: Dummy.userInfo.userId,
    );
    // ignore: unused_local_variable
    final response = await contactService.replaceOne(null, contactRequest);
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
      contactuserId: Dummy.userInfo.userId,
    );
    // ignore: unused_local_variable
    final response = await contactService.deleteOne(null, contactRequest);

    final response2 = await contactService.readAll(
        null, ReadAllContactsRequest(chainId: chainId));
    expect(response2.contacts.length, 0);
  });
}
