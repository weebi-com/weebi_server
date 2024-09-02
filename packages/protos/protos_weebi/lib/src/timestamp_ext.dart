import 'package:fixnum/fixnum.dart';

import 'package:protos_weebi/src/generated/common/g_timestamp.pb.dart';

extension DateTimeExt on DateTime {
  Timestamp get timestampProto {
    final millis = millisecondsSinceEpoch;
    final timestamp = Timestamp()
      ..seconds = Int64((millis / 1000).round())
      ..nanos = (millis % 1000) * 1000000;
    return timestamp;
  }
}
