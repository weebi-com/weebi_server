import 'dart:io';

import 'package:fixnum/fixnum.dart';
import 'package:protos_weebi/protos_weebi_io.dart' as pb;
import 'package:test/test.dart';

/// Round-trip: boutiquescore/site/grpc_web_submit.js encode → Dart protobuf decode.
/// Requires Node on PATH. Skips if node is missing.
void main() {
  test('grpc_web_submit.mjs encodes SubmitEvaluationRequest readable by Dart',
      () async {
    final node = await Process.run('node', ['--version']);
    if (node.exitCode != 0) {
      markTestSkipped('node not available');
      return;
    }

    // packages/evaluation_service → packages → weebi_server → git_weebi/boutiquescore
    final gitWeebi = Directory.current.parent.parent.parent;
    final boutiquescore = Directory('${gitWeebi.path}${Platform.pathSeparator}boutiquescore');
    final script = File(
        '${boutiquescore.path}${Platform.pathSeparator}tool${Platform.pathSeparator}encode_sample_request.mjs');
    final outFile = File(
        '${Directory.systemTemp.path}${Platform.pathSeparator}boutiquescore_submit.pb');

    expect(script.existsSync(), isTrue, reason: 'Expected ${script.path}');

    final encode = await Process.run(
      'node',
      [script.path, outFile.path],
      workingDirectory: boutiquescore.path,
    );
    expect(encode.exitCode, 0,
        reason: 'stderr: ${encode.stderr}\nstdout: ${encode.stdout}');
    expect(outFile.existsSync(), isTrue);

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
  });
}
