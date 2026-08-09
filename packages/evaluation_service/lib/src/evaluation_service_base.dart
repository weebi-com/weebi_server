import 'package:fence_service/grpc.dart';
import 'package:fence_service/logging.dart';
import 'package:protos_weebi/protos_weebi_io.dart' as pb;
import 'package:uuid/uuid.dart';

import 'store/evaluation_store.dart';

class EvaluationService extends pb.EvaluationServiceBase {
  EvaluationService(
    this._store, {
    Uuid? uuid,
  }) : _uuid = uuid ?? const Uuid();

  final EvaluationStore _store;
  final Uuid _uuid;
  final WeebiLogger _logger = WeebiLogger.forService('evaluation_service');

  @override
  Future<pb.SubmitEvaluationResponse> submitEvaluation(
    ServiceCall? call,
    pb.SubmitEvaluationRequest request,
  ) async {
    final log = _logger.withContext(call);
    log.logRpcEntry('submitEvaluation', requestData: {
      'campaignId': request.campaignId,
      'country': request.hasContact()
          ? request.contact.country.code2Letters
          : '',
      'city': request.hasContact() ? request.contact.city : '',
    });

    _validate(request);

    final evaluationId = _uuid.v4();
    final createdAt = DateTime.now().toUtc();

    try {
      await _store.insertEvaluation(
        evaluationId: evaluationId,
        createdAt: createdAt,
        request: request,
      );
    } catch (e, st) {
      log.error('submitEvaluation persistence failed', error: e, stackTrace: st);
      throw GrpcError.internal('failed to persist evaluation');
    }

    return pb.SubmitEvaluationResponse(
      evaluationId: evaluationId,
      createdAt: pb.Timestamp.fromDateTime(createdAt),
    );
  }

  void _validate(pb.SubmitEvaluationRequest request) {
    if (!request.hasContact()) {
      throw GrpcError.invalidArgument('contact is required');
    }
    final contact = request.contact;
    if (!contact.hasPhone() || contact.phone.number.trim().isEmpty) {
      throw GrpcError.invalidArgument('contact.phone is required');
    }
    if (!contact.hasCountry() ||
        contact.country.code2Letters.trim().isEmpty) {
      throw GrpcError.invalidArgument('contact.country is required');
    }
    if (contact.city.trim().isEmpty) {
      throw GrpcError.invalidArgument('contact.city is required');
    }
    if (!request.hasDiagnostic()) {
      throw GrpcError.invalidArgument('diagnostic is required');
    }
  }
}
