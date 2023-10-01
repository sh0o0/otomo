// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:grpc/grpc.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:otomo/configs/injection.dart' as _i13;
import 'package:otomo/controllers/auth.dart' as _i3;
import 'package:otomo/controllers/chat.dart' as _i12;
import 'package:otomo/controllers/location.dart' as _i10;
import 'package:otomo/controllers/place.dart' as _i11;
import 'package:otomo/grpc/generated/chat_service.pbgrpc.dart' as _i4;
import 'package:otomo/grpc/generated/health.pbgrpc.dart' as _i9;

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
    gh.singleton<_i8.FirebaseFirestore>(injectableModule.firebaseFirestore);
    gh.singleton<_i9.HealthServiceClient>(injectableModule.healthServiceClient);
    gh.factory<_i10.LocationControllerImpl>(
        () => _i10.LocationControllerImpl());
    gh.factory<_i11.PlaceControllerImpl>(
        () => _i11.PlaceControllerImpl(gh<String>()));
    gh.factory<_i12.ChatControllerImpl>(
        () => _i12.ChatControllerImpl(gh<_i4.ChatServiceClient>()));
    return this;
  }
}

class _$InjectableModule extends _i13.InjectableModule {}
