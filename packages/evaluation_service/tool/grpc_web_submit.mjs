/**
 * Vendored copy of boutiquescore/site/grpc_web_submit.mjs for CI round-trip tests.
 * Keep in sync when the BoutiqueScore encoder changes.
 *
 * Minimal gRPC-Web unary client for EvaluationService.SubmitEvaluation.
 * Encodes boutiqueScore JSON payload → protobuf → gRPC-Web frame (no npm deps).
 */

const ENUMS = {
  shopTenure: {
    SHOP_TENURE_UNSPECIFIED: 0,
    UNDER_ONE_YEAR: 1,
    ONE_TO_THREE_YEARS: 2,
    OVER_THREE_YEARS: 3,
  },
  supplierCredit: {
    SUPPLIER_CREDIT_UNSPECIFIED: 0,
    CASH_ONLY: 1,
    SHORT_TERM: 2,
    REGULAR_CONSIGNMENT: 3,
  },
  cashSeparation: {
    CASH_SEPARATION_UNSPECIFIED: 0,
    MIXED_HOUSEHOLD: 1,
    FIXED_SALARY_OR_LOGGED: 2,
    FULLY_SEPARATED: 3,
  },
  customerCreditTracking: {
    CUSTOMER_CREDIT_TRACKING_UNSPECIFIED: 0,
    MEMORY_ONLY: 1,
    PAPER_NOTEBOOK: 2,
    DEDICATED_OR_APP: 3,
  },
  restockFrequency: {
    RESTOCK_FREQUENCY_UNSPECIFIED: 0,
    LESS_THAN_WEEKLY: 1,
    ONE_TO_TWO_PER_WEEK: 2,
    MORE_THAN_TWICE_WEEKLY: 3,
  },
  legalForm: {
    LEGAL_FORM_UNSPECIFIED: 0,
    EI: 1,
    ENTREPRENANT: 2,
    SARL: 3,
    SA: 4,
    SAS: 5,
    GIE: 6,
    OTHER: 7,
  },
};

function u8concat(chunks) {
  let len = 0;
  for (const c of chunks) len += c.length;
  const out = new Uint8Array(len);
  let o = 0;
  for (const c of chunks) {
    out.set(c, o);
    o += c.length;
  }
  return out;
}

function encodeVarint(n) {
  n = Number(n) >>> 0;
  const bytes = [];
  while (n > 0x7f) {
    bytes.push((n & 0x7f) | 0x80);
    n >>>= 7;
  }
  bytes.push(n);
  return Uint8Array.from(bytes);
}

/** ZigZag not needed; signed ints that fit in 32-bit use same varint for proto3. */
function encodeInt64Varint(n) {
  // Loan amounts fit JS safe integer; emit as unsigned-style 64-bit varint.
  let v = BigInt(n);
  if (v < 0n) v = 0n;
  const bytes = [];
  while (v > 0x7fn) {
    bytes.push(Number((v & 0x7fn) | 0x80n));
    v >>= 7n;
  }
  bytes.push(Number(v));
  return Uint8Array.from(bytes);
}

function tag(fieldNumber, wireType) {
  return encodeVarint((fieldNumber << 3) | wireType);
}

function encodeString(fieldNumber, value) {
  if (value == null || value === '') return new Uint8Array(0);
  const data = new TextEncoder().encode(String(value));
  return u8concat([tag(fieldNumber, 2), encodeVarint(data.length), data]);
}

function encodeBytes(fieldNumber, data) {
  if (!data || data.length === 0) return new Uint8Array(0);
  return u8concat([tag(fieldNumber, 2), encodeVarint(data.length), data]);
}

function encodeBool(fieldNumber, value) {
  if (!value) return new Uint8Array(0); // proto3 default false omitted
  return u8concat([tag(fieldNumber, 0), encodeVarint(1)]);
}

function encodeEnum(fieldNumber, name, table) {
  const n = table[name];
  if (n == null || n === 0) return new Uint8Array(0);
  return u8concat([tag(fieldNumber, 0), encodeVarint(n)]);
}

function encodeInt32(fieldNumber, value) {
  if (value == null || value === 0) return new Uint8Array(0);
  return u8concat([tag(fieldNumber, 0), encodeVarint(value)]);
}

function encodeInt64(fieldNumber, value) {
  if (value == null || value === 0) return new Uint8Array(0);
  return u8concat([tag(fieldNumber, 0), encodeInt64Varint(value)]);
}

function encodePhone(phone) {
  return u8concat([
    encodeInt32(1, phone.countryCode),
    encodeString(2, phone.number),
  ]);
}

function encodeCountry(country) {
  return u8concat([
    encodeString(1, country.code2Letters),
    encodeString(2, country.namel10n),
  ]);
}

function encodeContact(contact) {
  return u8concat([
    encodeBytes(1, encodePhone(contact.phone || {})),
    encodeBytes(2, encodeCountry(contact.country || {})),
    encodeString(3, contact.city),
    encodeString(4, contact.merchantName),
  ]);
}

function encodeMoney(money) {
  if (!money) return new Uint8Array(0);
  return u8concat([
    encodeInt64(1, money.amountMinor),
    encodeString(2, money.currency),
  ]);
}

function encodeRegistration(reg) {
  if (!reg) return new Uint8Array(0);
  return u8concat([
    encodeString(1, reg.commercialRegisterNumber),
    encodeEnum(2, reg.legalForm, ENUMS.legalForm),
  ]);
}

function encodeDiagnostic(d) {
  const parts = [
    encodeString(1, d.activityIsicCode),
    encodeString(2, d.activitySubCode),
    encodeBool(3, d.isRegistered),
    encodeEnum(4, d.shopTenure, ENUMS.shopTenure),
    encodeEnum(5, d.supplierCredit, ENUMS.supplierCredit),
    encodeEnum(6, d.cashSeparation, ENUMS.cashSeparation),
    encodeEnum(7, d.customerCreditTracking, ENUMS.customerCreditTracking),
    encodeEnum(8, d.restockFrequency, ENUMS.restockFrequency),
    encodeBool(9, d.wantsLoan),
    encodeBytes(10, encodeMoney(d.requestedLoanAmount)),
    encodeBytes(11, encodeRegistration(d.registration)),
  ];
  // clientExtras map<string,string> field 12 — omit for now (empty in funnel)
  return u8concat(parts);
}

/** SubmitEvaluationRequest protobuf bytes from boutiquescore payload JSON. */
export function encodeSubmitEvaluationRequest(payload) {
  return u8concat([
    encodeBytes(1, encodeContact(payload.contact || {})),
    encodeBytes(2, encodeDiagnostic(payload.diagnostic || {})),
    encodeString(3, payload.campaignId),
  ]);
}

/** 5-byte gRPC-Web data frame (uncompressed). */
export function grpcWebFrame(protoBytes) {
  const frame = new Uint8Array(5 + protoBytes.length);
  frame[0] = 0;
  new DataView(frame.buffer).setUint32(1, protoBytes.length, false);
  frame.set(protoBytes, 5);
  return frame;
}

function parseGrpcWebStatus(buffer) {
  const bytes = new Uint8Array(buffer);
  let i = 0;
  let status = '0';
  let message = '';
  while (i + 5 <= bytes.length) {
    const flags = bytes[i];
    const len = new DataView(bytes.buffer, bytes.byteOffset + i + 1, 4).getUint32(0, false);
    const start = i + 5;
    const end = start + len;
    if (end > bytes.length) break;
    const chunk = bytes.subarray(start, end);
    if (flags & 0x80) {
      // Trailers: "grpc-status:0\r\ngrpc-message:...\r\n"
      const text = new TextDecoder().decode(chunk);
      const sm = text.match(/grpc-status:\s*(\d+)/i);
      const mm = text.match(/grpc-message:\s*([^\r\n]*)/i);
      if (sm) status = sm[1];
      if (mm) message = decodeURIComponent(mm[1].trim());
    }
    i = end;
  }
  // Also check headers fallback (some proxies)
  return { status, message };
}

/**
 * POST SubmitEvaluation via gRPC-Web to Envoy (public RPC, no auth headers).
 * @param {string} url full path URL
 * @param {object} payload buildSubmitPayload JSON
 */
export async function submitEvaluationGrpcWeb(url, payload) {
  const proto = encodeSubmitEvaluationRequest(payload);
  const body = grpcWebFrame(proto);
  const res = await fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/grpc-web+proto',
      Accept: 'application/grpc-web+proto',
      'X-Grpc-Web': '1',
      'X-User-Agent': 'boutiquescore-grpc-web',
    },
    body,
  });

  if (!res.ok) {
    throw new Error('HTTP ' + res.status);
  }

  const headerStatus = res.headers.get('grpc-status');
  if (headerStatus != null && headerStatus !== '0') {
    throw new Error(
      'gRPC ' + headerStatus + ': ' + (res.headers.get('grpc-message') || '')
    );
  }

  const buf = await res.arrayBuffer();
  const { status, message } = parseGrpcWebStatus(buf);
  if (status !== '0') {
    throw new Error('gRPC ' + status + (message ? ': ' + message : ''));
  }
  return true;
}
