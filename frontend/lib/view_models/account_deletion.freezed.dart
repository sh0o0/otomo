// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_deletion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountDeletionState {
  bool get requiresRecentLogin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountDeletionStateCopyWith<AccountDeletionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDeletionStateCopyWith<$Res> {
  factory $AccountDeletionStateCopyWith(AccountDeletionState value,
          $Res Function(AccountDeletionState) then) =
      _$AccountDeletionStateCopyWithImpl<$Res, AccountDeletionState>;
  @useResult
  $Res call({bool requiresRecentLogin});
}

/// @nodoc
class _$AccountDeletionStateCopyWithImpl<$Res,
        $Val extends AccountDeletionState>
    implements $AccountDeletionStateCopyWith<$Res> {
  _$AccountDeletionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiresRecentLogin = null,
  }) {
    return _then(_value.copyWith(
      requiresRecentLogin: null == requiresRecentLogin
          ? _value.requiresRecentLogin
          : requiresRecentLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountDeletionStateImplCopyWith<$Res>
    implements $AccountDeletionStateCopyWith<$Res> {
  factory _$$AccountDeletionStateImplCopyWith(_$AccountDeletionStateImpl value,
          $Res Function(_$AccountDeletionStateImpl) then) =
      __$$AccountDeletionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool requiresRecentLogin});
}

/// @nodoc
class __$$AccountDeletionStateImplCopyWithImpl<$Res>
    extends _$AccountDeletionStateCopyWithImpl<$Res, _$AccountDeletionStateImpl>
    implements _$$AccountDeletionStateImplCopyWith<$Res> {
  __$$AccountDeletionStateImplCopyWithImpl(_$AccountDeletionStateImpl _value,
      $Res Function(_$AccountDeletionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiresRecentLogin = null,
  }) {
    return _then(_$AccountDeletionStateImpl(
      requiresRecentLogin: null == requiresRecentLogin
          ? _value.requiresRecentLogin
          : requiresRecentLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AccountDeletionStateImpl implements _AccountDeletionState {
  const _$AccountDeletionStateImpl({this.requiresRecentLogin = false});

  @override
  @JsonKey()
  final bool requiresRecentLogin;

  @override
  String toString() {
    return 'AccountDeletionState(requiresRecentLogin: $requiresRecentLogin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDeletionStateImpl &&
            (identical(other.requiresRecentLogin, requiresRecentLogin) ||
                other.requiresRecentLogin == requiresRecentLogin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requiresRecentLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDeletionStateImplCopyWith<_$AccountDeletionStateImpl>
      get copyWith =>
          __$$AccountDeletionStateImplCopyWithImpl<_$AccountDeletionStateImpl>(
              this, _$identity);
}

abstract class _AccountDeletionState implements AccountDeletionState {
  const factory _AccountDeletionState({final bool requiresRecentLogin}) =
      _$AccountDeletionStateImpl;

  @override
  bool get requiresRecentLogin;
  @override
  @JsonKey(ignore: true)
  _$$AccountDeletionStateImplCopyWith<_$AccountDeletionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
