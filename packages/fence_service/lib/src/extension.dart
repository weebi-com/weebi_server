import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

extension MakeId on DateTime {
  String get objectIdString => ObjectId.createId(this.toUtc().second).hexString;
}
