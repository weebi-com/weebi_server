import 'package:mongo_dart/mongo_dart.dart';

class TestHelper {
  static final localDb = Db("mongodb://localhost:27017/local");
}
