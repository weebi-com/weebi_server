import 'dart:convert';
import 'package:crypto/crypto.dart';

// TODO : make this a bit more robust with some salt or whatever
class Encrypter {
  final String password;
  const Encrypter(this.password);
  String get encrypted => sha512.convert(utf8.encode(password)).toString();
}
