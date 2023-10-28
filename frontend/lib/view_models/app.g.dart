// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppStateImpl _$$AppStateImplFromJson(Map<String, dynamic> json) =>
    _$AppStateImpl(
      displayUpgrade: json['display_upgrade'] as bool? ?? false,
    );

Map<String, dynamic> _$$AppStateImplToJson(_$AppStateImpl instance) =>
    <String, dynamic>{
      'display_upgrade': instance.displayUpgrade,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appVMHash() => r'8e38e7da5f3c15b26a34187a18135069c44176da';

/// See also [AppVM].
@ProviderFor(AppVM)
final appVMProvider = NotifierProvider<AppVM, AppState>.internal(
  AppVM.new,
  name: r'appVMProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appVMHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppVM = Notifier<AppState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
