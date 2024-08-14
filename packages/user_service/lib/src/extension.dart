import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

extension ObjectIdNastyBoogie on Map<String, dynamic> {
  /// protobuf's .mergeFromProto3Json() cannot interpret ObjectId value returned by mongo_dart (e.g. findOne())
  /// but mongodb objectIds are a goood fit and I do not want to handle ids
  /// so I will simply do a two steps hack :
  /// make a message ObjectIdPb {
  ///   string oid = 1 [json_name = 'oid'];
  /// }
  /// and put this in all models that "belong" to the server (firm, user) i.e.
  /// message Firm {
  ///   ObjectIdPb _id = 1 [json_name = 'oid'];
  /// }
  ///
  /// using a message here will allow us to use the same model on flutter app and backend app
  /// for insert the front should not pass any _id
  /// the server will this clear the _id field anyway
  /// for read or upsert operations the oid is contained in the request
  ///
  /// function below fix the protobuf incompatiblity and reformat ObjectIds so that they fit the model above
  /// Disclaimer it only covers x5 levels deep of embedded docs
  /// if more needed dig at your own risk
  /// see issue https://github.com/google/protobuf.dart/issues/940
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
