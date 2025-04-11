import 'package:fence_service/grpc.dart';
import 'package:logging/logging.dart';

final logger = Logger('LoggingInterceptor');
Future<GrpcError?> loggingInterceptor(
  ServiceCall call,
  ServiceMethod serviceMethod,
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
