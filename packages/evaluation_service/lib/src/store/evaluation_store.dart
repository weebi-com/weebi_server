import 'package:protos_weebi/protos_weebi_io.dart' as pb;

/// Persistence for BoutiqueScore evaluations (Turso).
abstract class EvaluationStore {
  Future<void> ensureSchema();

  Future<void> insertEvaluation({
    required String evaluationId,
    required DateTime createdAt,
    required pb.SubmitEvaluationRequest request,
  });
}
