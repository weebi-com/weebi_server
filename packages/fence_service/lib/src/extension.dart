//import 'dart:typed_data';
//import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

extension MakeId on DateTime {
  String get objectIdString {
    return millisecondsSinceEpoch.toString();
  }
}
