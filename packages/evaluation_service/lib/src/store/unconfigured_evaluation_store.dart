import 'package:protos_weebi/protos_weebi_io.dart' as pb;

import 'evaluation_store.dart';

/// Thrown when SubmitEvaluation is called but Turso env is not set.
class EvaluationStoreNotConfigured implements Exception {
  const EvaluationStoreNotConfigured();

  @override
  String toString() =>
      'Evaluation store is not configured (TURSO_DATABASE_URL / TURSO_AUTH_TOKEN)';
}

/// Lets the gRPC process start without Turso; inserts fail explicitly.
class UnconfiguredEvaluationStore implements EvaluationStore {
  const UnconfiguredEvaluationStore();

  @override
  Future<void> ensureSchema() async {}

  @override
  Future<void> insertEvaluation({
    required String evaluationId,
    required DateTime createdAt,
    required pb.SubmitEvaluationRequest request,
  }) async {
    throw const EvaluationStoreNotConfigured();
  }
}
