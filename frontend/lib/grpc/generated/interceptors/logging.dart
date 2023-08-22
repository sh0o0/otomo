import 'package:grpc/grpc.dart';
import 'package:otomo/tools/logger.dart';

// TODO: Add tests
class LoggingClientInterceptor extends ClientInterceptor {
  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    logger.debug(
        'Method: $method, Method Path: ${method.path}, Request: $request');
    return invoker(method, request, options);
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    logger.debug(
        'Method: $method, Method Path: ${method.path}, Requests: $requests');
    return invoker(method, requests, options);
  }
}
