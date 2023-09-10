import 'package:grpc/grpc.dart';
import 'package:otomo/abstracts/controllers/id_token.dart';
import 'package:otomo/tools/logger.dart';

class InjectAuthHeaderClientInterceptor extends ClientInterceptor {
  InjectAuthHeaderClientInterceptor(this._idTokenController);

  final IdTokenController _idTokenController;

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final authCallOptions = _makeAuthCallOptions(options);
    return invoker(method, request, authCallOptions);
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    final authCallOptions = _makeAuthCallOptions(options);
    return invoker(method, requests, authCallOptions);
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
}
