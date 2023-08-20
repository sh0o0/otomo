// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:otomo/controllers/sign_in.dart' as _i6;
import 'package:otomo/injection.dart' as _i7;
import 'package:otomo/tools/global_state.dart' as _i4;

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
    gh.singleton<_i3.FirebaseAuth>(injectableModule.firebaseAuth);
    gh.singleton<_i4.GlobalState>(injectableModule.globalState);
    gh.singleton<_i5.GoogleSignIn>(injectableModule.googleSignIn);
    gh.factory<_i6.SignInController>(() => _i6.SignInController(
          gh<_i3.FirebaseAuth>(),
          gh<_i5.GoogleSignIn>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i7.InjectableModule {}
