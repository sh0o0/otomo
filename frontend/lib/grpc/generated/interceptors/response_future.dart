import 'dart:async';

import 'package:async/async.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

// This code reference: https://github.com/grpc/grpc-dart/issues/413#issuecomment-1277849117
class DelegatingResponseFuture<R> extends DelegatingFuture<R>
    implements ResponseFuture<R> {
  Response responseDelegate;

  DelegatingResponseFuture.split(
      this.responseDelegate, Future<R> futureDelegate)
      : super(futureDelegate);

  DelegatingResponseFuture(ResponseFuture<R> delegate)
      : this.split(delegate, delegate);

  @override
  ResponseFuture<R> catchError(Function onError,
          {bool Function(Object error)? test}) =>
      DelegatingResponseFuture.split(
          responseDelegate, super.catchError(onError, test: test));

  @override
  ResponseFuture<S> then<S>(FutureOr<S> Function(R) onValue,
          {Function? onError}) =>
      DelegatingResponseFuture.split(
          responseDelegate, super.then(onValue, onError: onError));

  @override
  ResponseFuture<R> whenComplete(FutureOr Function() action) =>
      DelegatingResponseFuture.split(
          responseDelegate, super.whenComplete(action));

  @override
  ResponseFuture<R> timeout(Duration timeLimit,
          {FutureOr<R> Function()? onTimeout}) =>
      DelegatingResponseFuture.split(
          responseDelegate, super.timeout(timeLimit, onTimeout: onTimeout));

  @override
  Future<void> cancel() {
    return responseDelegate.cancel();
  }

  @override
  Future<Map<String, String>> get headers => responseDelegate.headers;

  @override
  Future<Map<String, String>> get trailers => responseDelegate.trailers;
}
