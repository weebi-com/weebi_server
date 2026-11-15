import 'dart:math';

import 'package:fence_service/grpc.dart';
import 'package:fence_service/mongo_dart.dart' hide Timestamp;

/// Mongo collection that holds the firm-id sequence.
/// The sequence number lives only here. `firm.firmId` stores its digits as a string.
const String firmIdCounterCollectionName = 'counters';

/// `_id` of the single firm-id counter document.
const String firmIdCounterDocumentId = 'firmId';

/// How many times [createFirm] retries an insert that hits a duplicate key.
const int firmIdInsertAttempts = 5;

/// Crockford-like alphabet: no 0, O, 1, or I. Letters are required so the
/// code cannot equal a short integer firm id.
const String referralCodeAlphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';

const String _referralLetters = 'ABCDEFGHJKLMNPQRSTUVWXYZ';

final RegExp _legacyEpochFirmId = RegExp(r'^\d{13}$');
final RegExp _wholeNumberFirmId = RegExp(r'^[1-9]\d*$');

/// Millisecond firm ids assigned before the counter (`DateTime.now().objectIdString`).
bool isLegacyEpochFirmId(String value) => _legacyEpochFirmId.hasMatch(value);

/// Whole number written in base 10 with no leading zeros: `"1"`, `"184"`.
bool isWholeNumberFirmId(String value) {
  if (!_wholeNumberFirmId.hasMatch(value)) return false;
  return int.tryParse(value)?.toString() == value;
}

/// 8-character referral code that always contains a letter.
String generateReferralCode(Random random) {
  final units = List<int>.generate(
    8,
    (_) => referralCodeAlphabet.codeUnitAt(
      random.nextInt(referralCodeAlphabet.length),
    ),
  );
  final hasLetter = units.any((unit) => unit >= 65 && unit <= 90);
  if (!hasLetter) {
    final at = random.nextInt(units.length);
    units[at] =
        _referralLetters.codeUnitAt(random.nextInt(_referralLetters.length));
  }
  return String.fromCharCodes(units);
}

/// Allocates the next firm id. `counters.seq` is the only BSON number.
/// The returned value is that integer's digits, for example `"1"` then `"2"`.
Future<String> allocateFirmId(Db db) async {
  final doc = await db.collection(firmIdCounterCollectionName).findAndModify(
        query: where.eq('_id', firmIdCounterDocumentId),
        update: ModifierBuilder().inc('seq', 1),
        returnNew: true,
        upsert: true,
      );
  final seq = _readSeq(doc?['seq']);
  if (seq < 1) {
    throw GrpcError.internal('firmId counter returned $seq');
  }
  return seq.toString();
}

int _readSeq(Object? seq) {
  if (seq is int) return seq;
  if (seq is num) return seq.toInt();
  if (seq == null) {
    throw GrpcError.internal('firmId counter returned no seq');
  }
  try {
    final dynamic value = seq;
    final parsed = value.toInt();
    if (parsed is int) return parsed;
  } catch (_) {
    // Fall through to the typed error below.
  }
  throw GrpcError.internal('firmId counter seq is ${seq.runtimeType}');
}

/// Source of new firm ids and referral codes. Tests can subclass
/// [nextReferralCode] to force a duplicate-key retry.
class FirmIdAllocator {
  FirmIdAllocator({Random? random}) : _random = random ?? Random.secure();

  final Random _random;

  Future<String> nextFirmId(Db db) => allocateFirmId(db);

  String nextReferralCode() => generateReferralCode(_random);
}

/// `'firmId'`, `'referralCode'`, or `''` when the write is a duplicate key
/// whose index cannot be told apart. `null` when the write is not a duplicate.
String? duplicateKeyIndexToken(WriteResult result) {
  if (!result.hasWriteErrors) return null;
  final code = result.writeError?.code;
  final message = result.writeError?.errmsg ?? '';
  final duplicate = code == 11000 ||
      message.contains('E11000') ||
      message.toLowerCase().contains('duplicate');
  if (!duplicate) return null;
  return _indexToken(message);
}

/// Same classification for a thrown driver error.
String? duplicateKeyIndexTokenFromMessage(String message) {
  final duplicate = message.contains('E11000') ||
      message.toLowerCase().contains('duplicate key');
  if (!duplicate) return null;
  return _indexToken(message);
}

String _indexToken(String message) {
  if (message.contains('referralCode')) return 'referralCode';
  if (message.contains('firmId')) return 'firmId';
  return '';
}
