import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:otomo/grpc/generated/interceptors/response.dart';
import 'package:otomo/tools/logger.dart';

class AuthClientInterceptor extends ClientInterceptor {
  AuthClientInterceptor(this._authController);

  final AuthControllerImpl _authController;

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    return DelegatingResponseFuture<R>(invoker(
      method,
      request,
      options.mergedWith(CallOptions(providers: [_provideAuthHeader])),
    )).catchError((Object e) {
      _ifUnauthenticatedSignOut(e);
      throw e;
    });
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    return DelegatingResponseStream<R>(invoker(
      method,
      requests,
      options.mergedWith(CallOptions(providers: [_provideAuthHeader])),
    )).handleError((e) {
      _ifUnauthenticatedSignOut(e);
      throw e;
    });
  }

  FutureOr<void> _provideAuthHeader(
    Map<String, String> metadata,
    String uri,
  ) async {
    final idToken = await _authController.getIdToken();
    if (idToken == null || idToken.isEmpty) return;
    metadata['authorization'] = 'bearer $idToken';
    logger.info('added `authorization` header');
  }

  Future<void> _ifUnauthenticatedSignOut(Object e) async {
    if (e is GrpcError && e.code == StatusCode.unauthenticated) {
      logger.info('unauthenticated. sign out.');
      await _authController.signOut();
    }
  }
}
