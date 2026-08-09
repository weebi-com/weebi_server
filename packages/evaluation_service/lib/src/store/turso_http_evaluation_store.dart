import 'dart:convert';

import 'package:protos_weebi/protos_weebi_io.dart' as pb;

import '../schema/evaluations_schema.dart';
import 'evaluation_store.dart';
import 'turso_pipeline_client.dart';

class TursoHttpEvaluationStore implements EvaluationStore {
  TursoHttpEvaluationStore(this._client);

  final TursoPipelineClient _client;
  bool _schemaReady = false;

  @override
  Future<void> ensureSchema() async {
    if (_schemaReady) return;
    await _client.execute([TursoSqlStatement(kEvaluationsSchemaSql)]);
    _schemaReady = true;
  }

  @override
  Future<void> insertEvaluation({
    required String evaluationId,
    required DateTime createdAt,
    required pb.SubmitEvaluationRequest request,
  }) async {
    await ensureSchema();

    final contact = request.contact;
    final d = request.diagnostic;
    final extrasJson = jsonEncode(d.clientExtras);

    final hasLoan = d.hasRequestedLoanAmount();
    final loanMinor = hasLoan ? d.requestedLoanAmount.amountMinor.toInt() : null;
    final loanCurrency = hasLoan ? d.requestedLoanAmount.currency : '';

    final reg = d.hasRegistration() ? d.registration : null;
    final rccm = reg?.commercialRegisterNumber ?? '';
    final legalForm = reg != null ? reg.legalForm.name : '';

    await _client.execute([
      TursoSqlStatement(
        '''
INSERT INTO evaluations (
  evaluation_id, created_at, campaign_id,
  phone_country_code, phone_number, country_iso2, city, merchant_name,
  activity_isic_code, activity_sub_code, is_registered,
  shop_tenure, supplier_credit, cash_separation,
  customer_credit_tracking, restock_frequency,
  wants_loan, loan_amount_minor, loan_currency,
  commercial_register_number, legal_form, client_extras
) VALUES (
  ?, ?, ?,
  ?, ?, ?, ?, ?,
  ?, ?, ?,
  ?, ?, ?,
  ?, ?,
  ?, ?, ?,
  ?, ?, ?
)
''',
        args: [
          TursoSqlArg.text(evaluationId),
          TursoSqlArg.text(createdAt.toUtc().toIso8601String()),
          TursoSqlArg.text(request.campaignId),
          TursoSqlArg.integer(contact.phone.countryCode),
          TursoSqlArg.text(contact.phone.number),
          TursoSqlArg.text(contact.country.code2Letters),
          TursoSqlArg.text(contact.city),
          TursoSqlArg.text(contact.merchantName),
          TursoSqlArg.text(d.activityIsicCode),
          TursoSqlArg.text(d.activitySubCode),
          TursoSqlArg.integer(d.isRegistered ? 1 : 0),
          TursoSqlArg.text(d.shopTenure.name),
          TursoSqlArg.text(d.supplierCredit.name),
          TursoSqlArg.text(d.cashSeparation.name),
          TursoSqlArg.text(d.customerCreditTracking.name),
          TursoSqlArg.text(d.restockFrequency.name),
          TursoSqlArg.integer(d.wantsLoan ? 1 : 0),
          loanMinor == null
              ? const TursoSqlArg.null_()
              : TursoSqlArg.integer(loanMinor),
          TursoSqlArg.text(loanCurrency),
          TursoSqlArg.text(rccm),
          TursoSqlArg.text(legalForm),
          TursoSqlArg.text(extrasJson),
        ],
      ),
    ]);
  }
}
