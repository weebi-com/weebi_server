import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';
import 'package:user_service/src/extension.dart';
import 'package:user_service/user_testing.dart';

void main() async {
  test('objectids', () async {
    final collectionName = 'testing_objectids';
    final db = TestHelper.localDb;
    final connection = Connection(ConnectionManager(db));
    await db.open();
    await connection.connect();
    await db.createCollection(collectionName);

    final document = Testing.create();
    document.name = 'test1';

    await db
        .collection(collectionName)
        .insertOne(document.toProto3Json() as Map<String, dynamic>);

    final doc =
        await db.collection(collectionName).findOne(where.eq('name', 'test1'));

    if (doc == null) {
      throw 'doc is null';
    }

    final dd = Testing.create()
      ..mergeFromProto3Json(
        doc, // here is the little hack
        ignoreUnknownFields: true,
      );

    print(dd.toString());
    expect(dd.isInitialized(), isTrue);
    await db.collection(collectionName).drop();
    await connection.close();
    //exit(exitCode);
  });
}
