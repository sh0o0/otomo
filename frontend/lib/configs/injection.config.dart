// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i7;
import 'package:grpc/grpc.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:otomo/configs/injection.dart' as _i13;
import 'package:otomo/controllers/auth.dart' as _i11;
import 'package:otomo/controllers/chat.dart' as _i12;
import 'package:otomo/controllers/sign_in.dart' as _i10;
import 'package:otomo/grpc/generated/chat_service_service.pbgrpc.dart' as _i3;
import 'package:otomo/grpc/generated/health.pbgrpc.dart' as _i8;
import 'package:otomo/grpc/generated/interceptors/auth.dart' as _i9;
import 'package:otomo/tools/global_state.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.singleton<_i3.ChatServiceClient>(injectableModule.chatServiceClient);
    gh.singleton<_i4.ClientChannel>(injectableModule.clientChannel);
    gh.singleton<_i5.FirebaseAuth>(injectableModule.firebaseAuth);
    gh.singleton<_i6.GlobalState>(injectableModule.globalState);
    gh.singleton<_i7.GoogleSignIn>(injectableModule.googleSignIn);
    gh.singleton<_i8.HealthServiceClient>(injectableModule.healthServiceClient);
    gh.singleton<_i9.IdTokenController>(injectableModule.idTokenController);
    gh.factory<_i10.SignInController>(() => _i10.SignInController(
          gh<_i5.FirebaseAuth>(),
          gh<_i7.GoogleSignIn>(),
        ));
    gh.factory<_i11.AuthController>(
        () => _i11.AuthController(gh<_i5.FirebaseAuth>()));
    gh.factory<_i12.ChatController>(
        () => _i12.ChatController(gh<_i3.ChatServiceClient>()));
    return this;
  }
}

class _$InjectableModule extends _i13.InjectableModule {}
