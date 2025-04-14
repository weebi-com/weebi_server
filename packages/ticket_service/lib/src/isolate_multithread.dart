import 'dart:async' show Completer;
import 'dart:isolate'
    show SendPort, ReceivePort, RawReceivePort, Isolate, RemoteError;

/// keeping this code for archive in case we consider parallelizing request in isolates
/// need to adapt arguments to request etc
/// used this code initially to see if parsing mongoResponse in isolate increased perf, which it did not
Future<Object?> handleRequest(List<Map<String, dynamic>> dbResult) async {
  final worker = await TicketWorker.spawn();
  final list = await worker.parseDbResult(dbResult);
  worker.close();
  return list;
}

///
abstract class Worker {
  final SendPort _commands;
  final ReceivePort _responses;
  final Map<int, Completer<Object?>> _activeRequests = {};
  int _idCounter = 0;
  bool _closed = false;

  Worker(this._responses, this._commands) {
    _responses.listen(_handleResponsesFromIsolate);
  }

  Future<Object?> parseDbResult(List<Map<String, dynamic>> message) async {
    if (_closed) throw StateError('Closed');
    final completer = Completer<Object?>.sync();
    final id = _idCounter++;
    _activeRequests[id] = completer;
    _commands.send((id, message));
    return await completer.future;
  }

  void _handleResponsesFromIsolate(dynamic message) {}

  void close() {}

/*   static void _startRemoteIsolate(SendPort sendPort) {}

  static void _handleCommandsToIsolate(
      ReceivePort receivePort, SendPort sendPort) {} */
}

class TicketWorker extends Worker {
  TicketWorker(super.responses, super.commands);

  static Future<TicketWorker> spawn() async {
    final initPort = RawReceivePort();
    final connection = Completer<(ReceivePort, SendPort)>.sync();
    initPort.handler = (initialMessage) {
      final commandPort = initialMessage as SendPort;
      connection
          .complete((ReceivePort.fromRawReceivePort(initPort), commandPort));
    };

    try {
      await Isolate.spawn(_startRemoteIsolate, (initPort.sendPort));
    } on Object {
      initPort.close();
      rethrow;
    }

    final (ReceivePort receivePort, SendPort sendPort) =
        await connection.future;
    return TicketWorker(receivePort, sendPort);
  }

  @override
  void _handleResponsesFromIsolate(dynamic message) {
    final (int id, Object? response) = message as (int, Object?);
    final completer = _activeRequests.remove(id)!;

    if (response is RemoteError) {
      completer.completeError(response);
    } else {
      completer.complete(response);
    }

    if (_closed && _activeRequests.isEmpty) _responses.close();
  }

  @override
  void close() {
    if (!_closed) {
      _closed = true;
      _commands.send('shutdown');
      if (_activeRequests.isEmpty) _responses.close();
      print('--- port closed --- ');
    }
  }

  static void _startRemoteIsolate(SendPort sendPort) {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    _handleCommandsToIsolate(receivePort, sendPort);
  }

  static void _handleCommandsToIsolate(
      ReceivePort receivePort, SendPort sendPort) {
    receivePort.listen((message) {
      if (message == 'shutdown') {
        receivePort.close();
        return;
      }
      final (int id, List<Map<String, dynamic>> dbResult) =
          message as (int, List<Map<String, dynamic>>);
      try {
        final parsed = _handleIt(dbResult);
        sendPort.send((id, parsed));
      } catch (e) {
        sendPort.send((id, RemoteError(e.toString(), '')));
      }
    });
  }

  static List<Object> _handleIt(List<Map<String, dynamic>> dbResult) {
    return [true];
  }
}
