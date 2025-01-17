import 'package:protos_weebi/encrypter.dart';

void main(List<String> args) {
  if (args.isEmpty) {
    throw 'please provide a password';
  }
  if (args.first.isEmpty || args.first.length < 3) {
    throw 'please provide a password with length >= 3';
  }
  print(Encrypter(args.first).encrypted);
}
