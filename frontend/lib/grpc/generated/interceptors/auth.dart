import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc.dart';
import 'package:otomo/controllers/boundary/id_token.dart';
import 'package:otomo/grpc/generated/interceptors/response.dart';
import 'package:otomo/tools/logger.dart';

class AuthClientInterceptor extends ClientInterceptor {
  AuthClientInterceptor(this._idTokenController, this._firebaseAuth);

  final IdTokenController _idTokenController;
  final FirebaseAuth _firebaseAuth;

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final authCallOptions = _makeAuthCallOptions(options);

    return DelegatingResponseFuture<R>(
            invoker(method, request, authCallOptions))
        .catchError((Object e) {
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
    final authCallOptions = _makeAuthCallOptions(options);
    return DelegatingResponseStream<R>(
            invoker(method, requests, authCallOptions))
        .handleError((e) {
      _ifUnauthenticatedSignOut(e);
      throw e;
    });
  }

  CallOptions _makeAuthCallOptions<Q, R>(
    CallOptions options,
  ) {
    final idToken = _idTokenController.idToken;
    if (idToken == null || idToken.isEmpty) {
      return options;
    }

    final mergedOptions = options.mergedWith(
      CallOptions(metadata: {'authorization': 'bearer $idToken'}),
    );
    logger.info('added `authorization` header');
    return mergedOptions;
  }

  Future<void> _ifUnauthenticatedSignOut(Object e) async {
    if (e is GrpcError && e.code == StatusCode.unauthenticated) {
      logger.info('unauthenticated. sign out.');
      await _firebaseAuth.signOut();
    }
  }
}
