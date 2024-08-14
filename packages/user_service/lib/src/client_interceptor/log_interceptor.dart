import 'package:logging/logging.dart';
import 'package:protos_weebi/grpc.dart';

class RequestLogInterceptor extends ClientInterceptor {
  late Logger logger;

  RequestLogInterceptor() {
    logger = Logger('RequestLoggingInterceptor');
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    logger.info(method.path);
    return super.interceptStreaming(method, requests, options, invoker);
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    logger.info(method.path);
    logger.info(options.metadata);
    return super.interceptUnary(method, request, options, invoker);
  }
}
