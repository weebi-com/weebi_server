import 'dart:convert';
import 'package:crypto/crypto.dart';

// tooLate to make this more robust with some salt, nevermind
class Encrypter {
  final String password;
  const Encrypter(this.password);
  String get encrypted => sha512.convert(utf8.encode(password)).toString();
}
