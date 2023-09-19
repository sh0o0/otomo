import 'package:grpc/grpc.dart';
import 'package:otomo/grpc/generated/interceptors/response.dart';
import 'package:otomo/tools/logger.dart';

// TODO: Add tests
class RetryOnUnavailableErrorClientInterceptor extends ClientInterceptor {
  RetryOnUnavailableErrorClientInterceptor({
    required this.retries,
  });

  final int retries;

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    return _interceptUnaryForRetry(
      method,
      request,
      options,
      invoker,
      retries,
    );
  }

  // TODO: Add interceptStreaming

  bool _isShouldRetryError(Object e) {
    if (e is! GrpcError) return false;
    return e.code == StatusCode.unavailable;
  }

  ResponseFuture<R> _interceptUnaryForRetry<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
    int countdown,
  ) {
    ResponseFuture<R> retry(Exception retryCause) {
      if (countdown <= 0) {
        logger.info(
          'not retry grpc request because countdown is lower 0.\n'
          'error: ${retryCause.toString()}',
        );
        throw retryCause;
      }

      logger.warn('retry grpc request. error: ${retryCause.toString()}');
      return _interceptUnaryForRetry(
        method,
        request,
        options,
        invoker,
        countdown - 1,
      );
    }

    return DelegatingResponseFuture<R>(invoker(method, request, options))
        .catchError((Object e) {
      return retry(e as Exception);
    }, test: _isShouldRetryError);
  }
}
