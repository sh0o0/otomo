import 'package:grpc/grpc.dart';
import 'package:otomo/tools/logger.dart';

class LoggingClientInterceptor extends ClientInterceptor {
  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q request,
      CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    logger.debug(
        'Method: $method, Method Path: ${method.path}, Request: $request');
    final response = invoker(method, request, options);
    return response;
  }
}
