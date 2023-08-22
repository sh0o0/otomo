import 'package:grpc/grpc.dart';
import 'package:otomo/tools/logger.dart';

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

    try {
      // catchErrorに統一したい。
      // テストではtry catchしか行えない、アプリ実行時はcatchErrorしか行えないため、try catch, catchError両方実装している。
      return invoker(method, request, options).catchError((Object e) {
        return retry(e as Exception);
      }, test: _isShouldRetryError) as ResponseFuture<R>;
    } on Exception catch (e) {
      if (!_isShouldRetryError(e)) rethrow;
      return retry(e);
    }
  }
}
