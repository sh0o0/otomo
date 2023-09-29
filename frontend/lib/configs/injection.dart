import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:otomo/configs/app_config.dart';
import 'package:otomo/configs/injection.config.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:otomo/grpc/generated/chat_service.pbgrpc.dart';
import 'package:otomo/grpc/generated/health.pbgrpc.dart';
import 'package:otomo/grpc/generated/interceptors/auth.dart';
import 'package:otomo/grpc/generated/interceptors/logging.dart';
import 'package:otomo/grpc/generated/interceptors/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@module
abstract class InjectableModule {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  // Must set before calling `getIt.init()`
  static late final SharedPreferences _sharedPreferences;

  final _clientChannel = ClientChannel(
    appConfig.otomoServerHost,
    port: appConfig.otomoServerPort,
    options: ChannelOptions(
      credentials: appConfig.isSecureConnectionToOtomoServer
          ? const ChannelCredentials.secure()
          : const ChannelCredentials.insecure(),
      connectTimeout: const Duration(seconds: 10),
    ),
  );

  List<ClientInterceptor> get _clientInterceptors => [
        _loggingClientInterceptor,
        _retryClientInterceptor,
        _injectAuthHeaderClientInterceptor,
      ];

  LoggingClientInterceptor get _loggingClientInterceptor =>
      LoggingClientInterceptor();
  RetryOnUnavailableErrorClientInterceptor get _retryClientInterceptor =>
      RetryOnUnavailableErrorClientInterceptor(retries: 1);
  AuthClientInterceptor get _injectAuthHeaderClientInterceptor =>
      AuthClientInterceptor(authController);

  @singleton
  ClientChannel get clientChannel => _clientChannel;

  @singleton
  HealthServiceClient get healthServiceClient =>
      HealthServiceClient(clientChannel, interceptors: _clientInterceptors);

  @singleton
  ChatServiceClient get chatServiceClient =>
      ChatServiceClient(clientChannel, interceptors: _clientInterceptors);

  @singleton
  FirebaseAuth get firebaseAuth => _firebaseAuth;

  @singleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @singleton
  FirebaseCrashlytics get firebaseCrashlytics => FirebaseCrashlytics.instance;

  @singleton
  FirebaseDynamicLinks get firebaseDynamicLinks =>
      FirebaseDynamicLinks.instance;

  @singleton
  AuthControllerImpl get authController =>
      AuthControllerImpl(_firebaseAuth, _googleSignIn, _sharedPreferences);

  @singleton
  SharedPreferences get sharedPreferences => _sharedPreferences;
}

@InjectableInit()
Future<void> configureInjection() async {
  InjectableModule._sharedPreferences = await SharedPreferences.getInstance();
  getIt.init();
}
