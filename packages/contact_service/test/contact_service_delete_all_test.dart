import 'package:contact_service/contact_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_dart.dart' hide Timestamp;
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';

void main() async {
  final MongoDbPoolService poolService =
      TestHelper.poolForDatabase('contact_service_delete_all_test');
  await poolService.initialize();

  late ContactService contactService;
  final chainId = Dummy.chain.chainId;

  ContactPb contact(int id, String firstName) {
    return ContactPb.create()
      ..mergeFromProto3Json(
        {
          'id': id,
          'firstName': firstName,
          'lastName': 'Doe',
          'overdraft': 0,
          'status': true,
          'creationDate': '2020-02-02T00:00:00.00$id',
        },
        ignoreUnknownFields: true,
      );
  }

  setUpAll(() async {
    final db = await poolService.acquire();
    contactService = ContactService(
      poolService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.createCollection(FenceService.firmCollectionName);
    await db.collection(FenceService.firmCollectionName).deleteMany(
          where.eq('firmId', Dummy.firm.firmId),
        );
    await db.collection(FenceService.firmCollectionName).insertOne({
      'firmId': Dummy.firm.firmId,
      'licenses': <dynamic>[],
    });
    await db.collection(ContactService.collectionName).drop();
    await db.createCollection(ContactService.collectionName);
    poolService.release(db);
  });

  setUp(() async {
    final db = await poolService.acquire();
    await db.collection(ContactService.collectionName).deleteMany({});
    poolService.release(db);
  });

  tearDownAll(() async {
    final db = await poolService.acquire();
    await db.collection(ContactService.collectionName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    poolService.release(db);
  });

  test('deleteAll wipes contacts on the chain and leaves another chain',
      () async {
    await contactService.createOne(
      null,
      ContactRequest(chainId: chainId, contact: contact(1, 'John')),
    );
    await contactService.createOne(
      null,
      ContactRequest(chainId: chainId, contact: contact(2, 'Jane')),
    );
    await contactService.createOne(
      null,
      ContactRequest(chainId: 'other-chain', contact: contact(3, 'Other')),
    );

    final wiped = await contactService.deleteAll(
      null,
      DeleteAllContactsRequest(chainId: chainId),
    );
    expect(wiped.type, StatusResponse_Type.DELETED);
    expect(wiped.message, contains('deleted=2'));

    expect(
      (await contactService.readAll(
        null,
        ReadAllContactsRequest(chainId: chainId),
      ))
          .contacts,
      isEmpty,
    );
    expect(
      (await contactService.readAll(
        null,
        ReadAllContactsRequest(chainId: 'other-chain'),
      ))
          .contacts
          .length,
      1,
    );
  });

  test('deleteAll is idempotent when empty', () async {
    final wiped = await contactService.deleteAll(
      null,
      DeleteAllContactsRequest(chainId: chainId),
    );
    expect(wiped.type, StatusResponse_Type.DELETED);
    expect(wiped.message, contains('deleted=0'));
  });

  test('deleteAll rejects empty chainId', () async {
    try {
      await contactService.deleteAll(null, DeleteAllContactsRequest());
      fail('Expected invalidArgument');
    } on GrpcError catch (e) {
      expect(e.code, StatusCode.invalidArgument);
    }
  });

  test('deleteAll rejects missing delete right', () async {
    final noDelete = UserPermissions.create()
      ..mergeFromProto3Json(
        Dummy.adminPermission.toProto3Json()!,
        ignoreUnknownFields: true,
      )
      ..contactRights = ContactRights(rights: [Right.read]);
    final svc = ContactService(
      poolService,
      isTest: true,
      userPermissionIfTest: noDelete,
    );
    try {
      await svc.deleteAll(null, DeleteAllContactsRequest(chainId: chainId));
      fail('Expected permissionDenied');
    } on GrpcError catch (e) {
      expect(e.code, StatusCode.permissionDenied);
    }
  });
}
