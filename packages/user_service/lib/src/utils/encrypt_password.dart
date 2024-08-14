import 'dart:convert';
import 'package:crypto/crypto.dart';

void main(List<String> args) {
  final encryptedPassword = sha512.convert(utf8.encode(args.first)).toString();
  print(encryptedPassword);
}
