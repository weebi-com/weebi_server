import 'package:mongo_dart/mongo_dart.dart';

class TestHelper {
  static const String local = "mongodb://localhost:27017/local";
  static final localDb = Db("mongodb://localhost:27017/local");
}
