import 'dart:math';

import 'package:fence_service/fence_service.dart';
import 'package:test/test.dart';

void main() {
  test('legacy epoch firm ids are exactly 13 digits', () {
    expect(isLegacyEpochFirmId('1700000000000'), isTrue);
    expect(isLegacyEpochFirmId('123456789'), isFalse);
    expect(isLegacyEpochFirmId('1'), isFalse);
    expect(isLegacyEpochFirmId('184'), isFalse);
    expect(isLegacyEpochFirmId('17000000000000'), isFalse);
    expect(isLegacyEpochFirmId('170000000000a'), isFalse);
    expect(isLegacyEpochFirmId(''), isFalse);
  });

  test('whole-number firm ids are digits with no leading zero', () {
    expect(isWholeNumberFirmId('1'), isTrue);
    expect(isWholeNumberFirmId('184'), isTrue);
    expect(isWholeNumberFirmId('1700000000000'), isTrue);
    expect(isWholeNumberFirmId('0'), isFalse);
    expect(isWholeNumberFirmId('01'), isFalse);
    expect(isWholeNumberFirmId('1.0'), isFalse);
    expect(isWholeNumberFirmId('firm-1'), isFalse);
    expect(isWholeNumberFirmId(''), isFalse);
  });

  test('referral codes are 8 alphabet characters and contain a letter', () {
    final random = Random(7);
    final seen = <String>{};
    for (var i = 0; i < 200; i++) {
      final code = generateReferralCode(random);
      expect(code.length, 8);
      expect(code, matches(RegExp('^[$referralCodeAlphabet]+\$')));
      expect(code, matches(RegExp(r'[A-Z]')));
      expect(code, isNot(matches(RegExp(r'^\d+$'))));
      expect(isLegacyEpochFirmId(code), isFalse);
      expect(isWholeNumberFirmId(code), isFalse);
      seen.add(code);
    }
    expect(seen.length, greaterThan(1));
  });

  test('an all-digit draw is rewritten so the code contains a letter', () {
    final code = generateReferralCode(_DigitsThenZeroRandom());
    expect(code, matches(RegExp(r'[A-Z]')));
    expect(code.length, 8);
  });
}

/// First eight draws land on the digit half of [referralCodeAlphabet]
/// (indexes 24..31). The following draw is 0 so the forced letter is 'A'.
class _DigitsThenZeroRandom implements Random {
  var _calls = 0;

  @override
  bool nextBool() => false;

  @override
  double nextDouble() => 0;

  @override
  int nextInt(int max) {
    final call = _calls++;
    if (call < 8) {
      // Alphabet is 24 letters then 8 digits. Pick a digit.
      return 24 + (call % 8);
    }
    return 0;
  }
}
