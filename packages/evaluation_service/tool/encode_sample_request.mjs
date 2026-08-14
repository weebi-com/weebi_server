/**
 * Writes a sample SubmitEvaluationRequest protobuf (no gRPC-Web frame).
 * Usage: node encode_sample_request.mjs [out.pb]
 *
 * Keep payload in sync with test/grpc_web_js_encode_roundtrip_test.dart.
 */
import { writeFileSync } from 'fs';
import { encodeSubmitEvaluationRequest } from './grpc_web_submit.mjs';

const payload = {
  contact: {
    phone: { countryCode: 237, number: '690000000' },
    country: { code2Letters: 'CM', namel10n: 'Cameroun' },
    city: 'Douala',
    merchantName: 'Chez Test',
  },
  diagnostic: {
    activityIsicCode: '1071',
    activitySubCode: '',
    isRegistered: true,
    shopTenure: 'ONE_TO_THREE_YEARS',
    supplierCredit: 'SHORT_TERM',
    cashSeparation: 'FIXED_SALARY_OR_LOGGED',
    customerCreditTracking: 'PAPER_NOTEBOOK',
    restockFrequency: 'ONE_TO_TWO_PER_WEEK',
    wantsLoan: true,
    requestedLoanAmount: { amountMinor: 250000, currency: 'XAF' },
    registration: {
      commercialRegisterNumber: 'RC/DLA/2020/B/123',
      legalForm: 'SARL',
    },
  },
  campaignId: 'encode_roundtrip_test',
};

const outPath = process.argv[2];
const bytes = encodeSubmitEvaluationRequest(payload);
if (outPath) {
  writeFileSync(outPath, bytes);
  console.error(`Wrote ${bytes.length} bytes to ${outPath}`);
} else {
  process.stdout.write(Buffer.from(bytes));
}
