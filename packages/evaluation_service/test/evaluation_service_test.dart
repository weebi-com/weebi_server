import 'package:evaluation_service/evaluation_service.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:protos_weebi/protos_weebi_io.dart' as pb;
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

class _FakePipelineClient implements TursoPipelineClient {
  final List<List<TursoSqlStatement>> batches = [];
  Object? throwOnExecute;

  @override
  Future<void> execute(List<TursoSqlStatement> statements) async {
    if (throwOnExecute != null) {
      throw throwOnExecute!;
    }
    batches.add(List.of(statements));
  }
}

pb.SubmitEvaluationRequest _validRequest({
  String phone = '690000000',
  String city = 'Douala',
  String campaignId = 'cameroon_pilot_2026',
}) {
  return pb.SubmitEvaluationRequest(
    contact: pb.PhoneContact(
      phone: pb.Phone(countryCode: 237, number: phone),
      country: pb.Country(code2Letters: 'CM', namel10n: 'Cameroun'),
      city: city,
      merchantName: 'Chez Pierre',
    ),
    diagnostic: pb.BusinessDiagnostic(
      activityIsicCode: '1071',
      activitySubCode: '',
      isRegistered: true,
      shopTenure: pb.ShopTenure.ONE_TO_THREE_YEARS,
      supplierCredit: pb.SupplierCredit.SHORT_TERM,
      cashSeparation: pb.CashSeparation.FIXED_SALARY_OR_LOGGED,
      customerCreditTracking: pb.CustomerCreditTracking.PAPER_NOTEBOOK,
      restockFrequency: pb.RestockFrequency.ONE_TO_TWO_PER_WEEK,
      wantsLoan: true,
      requestedLoanAmount: pb.MoneyAmount(
        amountMinor: Int64(250000),
        currency: 'XAF',
      ),
      registration: pb.RegistrationDetails(
        commercialRegisterNumber: 'RC/DLA/2020/B/123',
        legalForm: pb.LegalForm.SARL,
      ),
    ),
    campaignId: campaignId,
  );
}

void main() {
  group('TursoHttpEvaluationStore', () {
    test('ensureSchema sends CREATE TABLE once', () async {
      final client = _FakePipelineClient();
      final store = TursoHttpEvaluationStore(client);

      await store.ensureSchema();
      await store.ensureSchema();

      expect(client.batches, hasLength(1));
      expect(client.batches.first.single.sql, contains('CREATE TABLE'));
      expect(client.batches.first.single.sql, contains('evaluations'));
    });

    test('insertEvaluation sends INSERT with key fields', () async {
      final client = _FakePipelineClient();
      final store = TursoHttpEvaluationStore(client);
      final createdAt = DateTime.utc(2026, 8, 9, 12, 0, 0);

      await store.insertEvaluation(
        evaluationId: 'eval-1',
        createdAt: createdAt,
        request: _validRequest(),
      );

      expect(client.batches, hasLength(2)); // schema + insert
      final insert = client.batches.last.single;
      expect(insert.sql, contains('INSERT INTO evaluations'));
      final values = insert.args.map((a) => a.value).toList();
      expect(values, contains('eval-1'));
      expect(values, contains('690000000'));
      expect(values, contains('Douala'));
      expect(values, contains('CM'));
      expect(values, contains('cameroon_pilot_2026'));
      expect(values, contains('ONE_TO_THREE_YEARS'));
      expect(values, contains('SARL'));
      expect(values, contains('XAF'));
      expect(values, contains(250000));
    });
  });

  group('EvaluationService.submitEvaluation', () {
    late _FakePipelineClient client;
    late EvaluationService service;

    setUp(() {
      client = _FakePipelineClient();
      service = EvaluationService(
        TursoHttpEvaluationStore(client),
        uuid: const Uuid(),
      );
    });

    test('persists valid request and returns id + createdAt', () async {
      final response = await service.submitEvaluation(null, _validRequest());

      expect(response.evaluationId, isNotEmpty);
      expect(response.hasCreatedAt(), isTrue);
      expect(client.batches.length, greaterThanOrEqualTo(2));
      final insertSql = client.batches.last.single.sql;
      expect(insertSql, contains('INSERT INTO evaluations'));
      expect(
        client.batches.last.single.args.map((a) => a.value),
        contains(response.evaluationId),
      );
    });

    test('rejects missing phone', () async {
      final request = _validRequest()
        ..contact.phone.number = '';

      expect(
        () => service.submitEvaluation(null, request),
        throwsA(
          isA<GrpcError>().having(
            (e) => e.code,
            'code',
            StatusCode.invalidArgument,
          ),
        ),
      );
      expect(client.batches, isEmpty);
    });

    test('rejects missing city', () async {
      final request = _validRequest()..contact.city = '  ';

      expect(
        () => service.submitEvaluation(null, request),
        throwsA(isA<GrpcError>()),
      );
    });

    test('rejects missing contact', () async {
      final request = pb.SubmitEvaluationRequest(
        diagnostic: _validRequest().diagnostic,
      );

      expect(
        () => service.submitEvaluation(null, request),
        throwsA(
          isA<GrpcError>().having(
            (e) => e.message,
            'message',
            contains('contact'),
          ),
        ),
      );
    });

    test('maps store failure to internal', () async {
      client.throwOnExecute = StateError('turso down');

      expect(
        () => service.submitEvaluation(null, _validRequest()),
        throwsA(
          isA<GrpcError>().having(
            (e) => e.code,
            'code',
            StatusCode.internal,
          ),
        ),
      );
    });
  });

  group('HttpTursoPipelineClient URI', () {
    test('appends /v2/pipeline when missing', () {
      expect(
        tursoPipelineUri('https://example.turso.io'),
        Uri.parse('https://example.turso.io/v2/pipeline'),
      );
      final stmt = TursoSqlStatement(
        'SELECT 1',
        args: [const TursoSqlArg.integer(1), const TursoSqlArg.text('x')],
      );
      final json = stmt.toJson();
      expect(json['sql'], 'SELECT 1');
      expect((json['args'] as List).first['type'], 'integer');
      expect((json['args'] as List).first['value'], '1');
    });

    test('converts libsql:// to https://', () {
      expect(
        tursoPipelineUri('libsql://my-db.turso.io'),
        Uri.parse('https://my-db.turso.io/v2/pipeline'),
      );
      expect(
        tursoPipelineUri('libsql://my-db.turso.io/v2/pipeline'),
        Uri.parse('https://my-db.turso.io/v2/pipeline'),
      );
    });
  });

  group('createEvaluationStore', () {
    test('without credentials is unconfigured', () {
      expect(
        createEvaluationStore(),
        isA<UnconfiguredEvaluationStore>(),
      );
    });

    test('submitEvaluation returns unavailable when store is unconfigured',
        () async {
      final service = EvaluationService(const UnconfiguredEvaluationStore());
      expect(
        () => service.submitEvaluation(null, _validRequest()),
        throwsA(
          isA<GrpcError>().having(
            (e) => e.code,
            'code',
            StatusCode.unavailable,
          ),
        ),
      );
    });
  });
}
