import 'package:grpc/grpc.dart';
import 'package:otomo/tools/logger.dart';

// TODO: Add tests
abstract class IdTokenController {
  String? get idToken;
}

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
    final idToken = _idTokenController.idToken;
    if (idToken == null || idToken.isEmpty) {
      return invoker(method, request, options);
    }

    final mergedOptions = options.mergedWith(
      CallOptions(metadata: {'authorization': 'bearer $idToken'}),
    );
    logger.info('added `authorization` header');

    return invoker(method, request, mergedOptions);
  }
}
