import 'evaluation_store.dart';
import 'turso_http_evaluation_store.dart';
import 'turso_pipeline_client.dart';
import 'unconfigured_evaluation_store.dart';

/// Turso when [databaseUrl] and [authToken] are set; otherwise a no-op store
/// that fails inserts with [EvaluationStoreNotConfigured].
EvaluationStore createEvaluationStore({
  String? databaseUrl,
  String? authToken,
}) {
  final url = databaseUrl?.trim() ?? '';
  final token = authToken?.trim() ?? '';
  if (url.isEmpty || token.isEmpty) {
    return const UnconfiguredEvaluationStore();
  }
  return TursoHttpEvaluationStore(
    HttpTursoPipelineClient(databaseUrl: url, authToken: token),
  );
}
