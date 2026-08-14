import 'dart:io';

import 'package:fixnum/fixnum.dart';
import 'package:protos_weebi/protos_weebi_io.dart' as pb;
import 'package:test/test.dart';

/// Round-trip: JS protobuf encode → Dart protobuf decode.
///
/// Always runs against the vendored encoder in this package (CI).
/// Also runs against a sibling `boutiquescore` checkout when present.
void main() {
  test('vendored grpc_web_submit.mjs encodes SubmitEvaluationRequest readable by Dart',
      () async {
    await _assertJsEncodeRoundtrip(_requireVendoredEncoder());
  });

  test('sibling boutiquescore encoder matches Dart protobuf (if checked out)',
      () async {
    final sibling = _siblingBoutiquescoreEncoder();
    if (sibling == null) {
      markTestSkipped('sibling boutiquescore not checked out');
      return;
    }
    await _assertJsEncodeRoundtrip(sibling);
  });
}

Future<void> _assertJsEncodeRoundtrip(_LocatedEncoder located) async {
  final node = await Process.run('node', ['--version']);
  if (node.exitCode != 0) {
    markTestSkipped('node not available');
    return;
  }

  final outFile = File(
      '${Directory.systemTemp.path}${Platform.pathSeparator}boutiquescore_submit_${located.label}.pb');

  final encode = await Process.run(
    'node',
    [located.script.path, outFile.path],
    workingDirectory: located.workingDirectory.path,
  );
  expect(encode.exitCode, 0,
      reason: 'Node process failed.\n'
          'Script: ${located.script.path}\n'
          'CWD: ${located.workingDirectory.path}\n'
          'stderr: ${encode.stderr}\n'
          'stdout: ${encode.stdout}');
  expect(outFile.existsSync(), isTrue,
      reason: 'Node exited with 0 but did not create the output file.\n'
          'Expected: ${outFile.path}\n'
          'Script: ${located.script.path}\n'
          'CWD: ${located.workingDirectory.path}\n'
          'stderr: ${encode.stderr}\n'
          'stdout: ${encode.stdout}');

  final bytes = await outFile.readAsBytes();
  expect(bytes, isNotEmpty);

  final req = pb.SubmitEvaluationRequest.fromBuffer(bytes);

  expect(req.contact.city, 'Douala');
  expect(req.contact.phone.countryCode, 237);
  expect(req.contact.phone.number, '690000000');
  expect(req.contact.country.code2Letters, 'CM');
  expect(req.contact.merchantName, 'Chez Test');
  expect(req.campaignId, 'encode_roundtrip_test');

  expect(req.diagnostic.activityIsicCode, '1071');
  expect(req.diagnostic.isRegistered, isTrue);
  expect(req.diagnostic.shopTenure, pb.ShopTenure.ONE_TO_THREE_YEARS);
  expect(req.diagnostic.supplierCredit, pb.SupplierCredit.SHORT_TERM);
  expect(req.diagnostic.cashSeparation,
      pb.CashSeparation.FIXED_SALARY_OR_LOGGED);
  expect(req.diagnostic.customerCreditTracking,
      pb.CustomerCreditTracking.PAPER_NOTEBOOK);
  expect(req.diagnostic.restockFrequency,
      pb.RestockFrequency.ONE_TO_TWO_PER_WEEK);
  expect(req.diagnostic.wantsLoan, isTrue);
  expect(req.diagnostic.requestedLoanAmount.amountMinor, Int64(250000));
  expect(req.diagnostic.requestedLoanAmount.currency, 'XAF');
  expect(req.diagnostic.registration.commercialRegisterNumber,
      'RC/DLA/2020/B/123');
  expect(req.diagnostic.registration.legalForm, pb.LegalForm.SARL);
}

class _LocatedEncoder {
  const _LocatedEncoder({
    required this.label,
    required this.script,
    required this.workingDirectory,
  });

  final String label;
  final File script;
  final Directory workingDirectory;
}

_LocatedEncoder _requireVendoredEncoder() {
  final sep = Platform.pathSeparator;
  final candidates = [
    File('${Directory.current.path}${sep}tool${sep}encode_sample_request.mjs'),
    File(
        '${Directory.current.path}${sep}packages${sep}evaluation_service${sep}tool${sep}encode_sample_request.mjs'),
  ];
  for (final script in candidates) {
    if (script.existsSync()) {
      return _LocatedEncoder(
        label: 'vendored',
        script: script,
        workingDirectory: script.parent,
      );
    }
  }
  fail(
    'Vendored encoder missing. Expected tool/encode_sample_request.mjs '
    'under packages/evaluation_service (cwd=${Directory.current.path})',
  );
}

_LocatedEncoder? _siblingBoutiquescoreEncoder() {
  final sep = Platform.pathSeparator;
  var dir = Directory.current;
  for (var i = 0; i < 8; i++) {
    final sibling = Directory('${dir.path}${sep}boutiquescore');
    final script =
        File('${sibling.path}${sep}tool${sep}encode_sample_request.mjs');
    if (script.existsSync() &&
        File('${sibling.path}${sep}site${sep}grpc_web_submit.mjs')
            .existsSync()) {
      return _LocatedEncoder(
        label: 'sibling',
        script: script,
        workingDirectory: script.parent,
      );
    }
    if (dir.parent.path == dir.path) break;
    dir = dir.parent;
  }
  return null;
}
