import 'package:logging/logging.dart';
import 'package:protos_weebi/grpc.dart';

final logger = Logger('LoggingInterceptor');
Future<GrpcError?> loggingInterceptor(
  ServiceCall call,
  ServiceMethod method,
) async {
  final dateTime = DateTime.now();
  final clientMetadata = call.clientMetadata ?? {};
  final authority = clientMetadata[':authority'];
  final methodName = clientMetadata[':path'];
  final method = clientMetadata[':method'];
  final userAgent = clientMetadata['user-agent'];

  logger.info('$authority - - [$dateTime] $method $methodName $userAgent');
  return null;
}
