import 'package:grpc/grpc.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:otomo/tools/logger.dart';

class InjectAuthHeaderClientInterceptor extends ClientInterceptor {
  InjectAuthHeaderClientInterceptor(this._authController);

  final AuthController _authController;

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    return ResponseFuture.wrap(
      _authController.getIdToken(),
      clientCall: ClientCall(method, const Stream.empty(), options),
    ).then((idToken) {
      if (idToken == null || idToken.isEmpty) {
        return invoker(method, request, options);
      }

      final mergedOptions = options.mergedWith(
        CallOptions(metadata: {'authorization': 'bearer $idToken'}),
      );
      logger.info('added `authorization` header');

      return invoker(method, request, mergedOptions);
    });
  }
}
