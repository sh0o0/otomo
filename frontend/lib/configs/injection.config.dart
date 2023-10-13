// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i7;
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:grpc/grpc.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:otomo/configs/injection.dart' as _i18;
import 'package:otomo/controllers/auth.dart' as _i3;
import 'package:otomo/controllers/chat.dart' as _i16;
import 'package:otomo/controllers/location.dart' as _i11;
import 'package:otomo/controllers/place.dart' as _i12;
import 'package:otomo/controllers/policies_agreement.dart' as _i17;
import 'package:otomo/grpc/generated/chat_service.pbgrpc.dart' as _i4;
import 'package:otomo/grpc/generated/health.pbgrpc.dart' as _i10;
import 'package:otomo/repositories/policies_agreements.dart' as _i13;
import 'package:otomo/repositories/user.dart' as _i15;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

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
    gh.singleton<_i3.AuthControllerImpl>(injectableModule.authController);
    gh.singleton<_i4.ChatServiceClient>(injectableModule.chatServiceClient);
    gh.singleton<_i5.ClientChannel>(injectableModule.clientChannel);
    gh.singleton<_i6.FirebaseAuth>(injectableModule.firebaseAuth);
    gh.singleton<_i7.FirebaseCrashlytics>(injectableModule.firebaseCrashlytics);
    gh.singleton<_i8.FirebaseDynamicLinks>(
        injectableModule.firebaseDynamicLinks);
    gh.singleton<_i9.FirebaseFirestore>(injectableModule.firebaseFirestore);
    gh.singleton<_i10.HealthServiceClient>(
        injectableModule.healthServiceClient);
    gh.factory<_i11.LocationControllerImpl>(
        () => _i11.LocationControllerImpl());
    gh.factory<_i12.PlaceControllerImpl>(
        () => injectableModule.placeController);
    gh.factory<_i13.PoliciesAgreementsRepositoryImpl>(() =>
        _i13.PoliciesAgreementsRepositoryImpl(gh<_i9.FirebaseFirestore>()));
    gh.singleton<_i14.SharedPreferences>(injectableModule.sharedPreferences);
    gh.factory<_i15.UserRepositoryImpl>(
        () => _i15.UserRepositoryImpl(gh<_i9.FirebaseFirestore>()));
    gh.factory<_i16.ChatControllerImpl>(() => _i16.ChatControllerImpl(
          gh<_i4.ChatServiceClient>(),
          gh<_i9.FirebaseFirestore>(),
        ));
    gh.factory<_i17.PoliciesAgreementControllerImpl>(
        () => _i17.PoliciesAgreementControllerImpl(
              gh<_i13.PoliciesAgreementsRepositoryImpl>(),
              gh<_i15.UserRepositoryImpl>(),
            ));
    return this;
  }
}

class _$InjectableModule extends _i18.InjectableModule {}
