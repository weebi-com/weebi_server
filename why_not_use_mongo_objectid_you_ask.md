import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

extension ObjectIdNastyBoogie on Map<String, dynamic> {
  /// protobuf's .mergeFromProto3Json() cannot interpret ObjectId value returned by mongo_dart (e.g. findOne())
  /// because ObjectId are stored like _id : ObjectId('xx') which is json for gRPC dart
  /// I tried the following :
  /// make a message ObjectIdPb {
  ///   string oid = 1 [json_name = 'oid'];
  /// }
  /// and put this in all models that "belong" to the server (firm, user) i.e.
  /// message Firm {
  ///   ObjectIdPb _id = 1 [json_name = 'oid'];
  /// }
  ///
  /// for insert the front should not pass any _id
  /// and the server should  this clear the _id field anyway
  /// for read or upsert operations the oid is contained in the request
  ///
  /// function below reformat Mongo ObjectIds so that they fit the model above
  /// Problem is that it only covers x5 levels deep of embedded docs
  /// Many other problems so easier not to use _id anywhere
  /// see issue https://github.com/google/protobuf.dart/issues/940

message Testing {
  ObjectIdProto _id = 1;
  string name = 2;
}

message ObjectIdProto{
  string oid = 1 [json_name = 'oid'];
}

//DEPRECATED
  @Deprecated()
  Map<String, dynamic> get properOid {
    for (final entry in entries) {
      if (entry.key == '_id') {
        this['_id'] = <String, String>{
          'oid': (entry.value as ObjectId).oid,
        };
      }
      if (entry.value is Map<String, dynamic>) {
        for (final entrySub in (entry.value as Map<String, dynamic>).entries) {
          if (entrySub.key == '_id') {
            entry.value['_id'] = <String, String>{
              'oid': (entrySub.value as ObjectId).oid,
            };
          }
          if (entrySub.value is Map<String, dynamic>) {
            for (final entrySubSub
                in (entrySub.value as Map<String, dynamic>).entries) {
              if (entrySubSub.key == '_id') {
                entrySub.value['_id'] = <String, String>{
                  'oid': (entrySubSub.value as ObjectId).oid,
                };
              }
              if (entrySubSub.value is Map<String, dynamic>) {
                for (final entrySubSubSub
                    in (entrySubSub.value as Map<String, dynamic>).entries) {
                  if (entrySubSubSub.key == '_id') {
                    entrySubSub.value['_id'] = <String, String>{
                      'oid': (entrySubSubSub.value as ObjectId).oid,
                    };
                  }
                  if (entrySubSubSub.value is Map<String, dynamic>) {
                    for (final entrySubSubSubSub
                        in (entrySubSubSub.value as Map<String, dynamic>)
                            .entries) {
                      if (entrySubSubSubSub.key == '_id') {
                        entrySubSubSub.value['_id'] = <String, String>{
                          'oid': (entrySubSubSubSub.value as ObjectId).oid,
                        };
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    return this;
  }
}


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
