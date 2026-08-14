/// Shared DDL for Turso `evaluations` table.
const String kEvaluationsSchemaSql = '''
CREATE TABLE IF NOT EXISTS evaluations (
  evaluation_id TEXT PRIMARY KEY NOT NULL,
  created_at TEXT NOT NULL,
  campaign_id TEXT NOT NULL DEFAULT '',
  phone_country_code INTEGER NOT NULL DEFAULT 0,
  phone_number TEXT NOT NULL DEFAULT '',
  country_iso2 TEXT NOT NULL DEFAULT '',
  city TEXT NOT NULL DEFAULT '',
  merchant_name TEXT NOT NULL DEFAULT '',
  activity_isic_code TEXT NOT NULL DEFAULT '',
  activity_sub_code TEXT NOT NULL DEFAULT '',
  is_registered INTEGER NOT NULL DEFAULT 0,
  shop_tenure TEXT NOT NULL DEFAULT '',
  supplier_credit TEXT NOT NULL DEFAULT '',
  cash_separation TEXT NOT NULL DEFAULT '',
  customer_credit_tracking TEXT NOT NULL DEFAULT '',
  restock_frequency TEXT NOT NULL DEFAULT '',
  wants_loan INTEGER NOT NULL DEFAULT 0,
  loan_amount_minor INTEGER,
  loan_currency TEXT NOT NULL DEFAULT '',
  commercial_register_number TEXT NOT NULL DEFAULT '',
  legal_form TEXT NOT NULL DEFAULT '',
  client_extras TEXT NOT NULL DEFAULT '{}'
);
''';
