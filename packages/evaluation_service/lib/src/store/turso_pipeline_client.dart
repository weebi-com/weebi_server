import 'dart:convert';

import 'package:http/http.dart' as http;

/// One SQL statement for Turso Hrana `/v2/pipeline`.
class TursoSqlStatement {
  const TursoSqlStatement(this.sql, {this.args = const []});

  final String sql;
  final List<TursoSqlArg> args;

  Map<String, Object?> toJson() => {
        'sql': sql,
        if (args.isNotEmpty) 'args': [for (final a in args) a.toJson()],
      };
}

class TursoSqlArg {
  const TursoSqlArg.integer(this.value) : type = 'integer';
  const TursoSqlArg.text(this.value) : type = 'text';
  const TursoSqlArg.null_()
      : type = 'null',
        value = null;

  final String type;
  final Object? value;

  Map<String, Object?> toJson() {
    if (type == 'null') return {'type': 'null'};
    return {
      'type': type,
      // Turso expects integer values as strings in JSON.
      'value': value is int ? '$value' : value,
    };
  }
}

/// Executes SQL against Turso via HTTP pipeline.
abstract class TursoPipelineClient {
  Future<void> execute(List<TursoSqlStatement> statements);
}

class HttpTursoPipelineClient implements TursoPipelineClient {
  HttpTursoPipelineClient({
    required String databaseUrl,
    required String authToken,
    http.Client? httpClient,
  })  : _authToken = authToken,
        _httpClient = httpClient ?? http.Client(),
        _pipelineUri = _pipelineUriFrom(databaseUrl);

  final String _authToken;
  final http.Client _httpClient;
  final Uri _pipelineUri;

  static Uri _pipelineUriFrom(String databaseUrl) {
    final base = databaseUrl.trim().replaceAll(RegExp(r'/+$'), '');
    if (base.endsWith('/v2/pipeline')) return Uri.parse(base);
    return Uri.parse('$base/v2/pipeline');
  }

  @override
  Future<void> execute(List<TursoSqlStatement> statements) async {
    final body = jsonEncode({
      'requests': [
        for (final stmt in statements)
          {
            'type': 'execute',
            'stmt': stmt.toJson(),
          },
        {'type': 'close'},
      ],
    });

    final response = await _httpClient.post(
      _pipelineUri,
      headers: {
        'Authorization': 'Bearer $_authToken',
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw StateError(
        'Turso pipeline HTTP ${response.statusCode}: ${response.body}',
      );
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw StateError('Turso pipeline: unexpected response shape');
    }
    final results = decoded['results'];
    if (results is! List) {
      throw StateError('Turso pipeline: missing results');
    }
    for (final item in results) {
      if (item is Map && item['type'] == 'error') {
        throw StateError('Turso pipeline error: ${item['error']}');
      }
    }
  }

  void close() => _httpClient.close();
}
