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
abstract class _$$_AccountDeletionStateCopyWith<$Res>
    implements $AccountDeletionStateCopyWith<$Res> {
  factory _$$_AccountDeletionStateCopyWith(_$_AccountDeletionState value,
          $Res Function(_$_AccountDeletionState) then) =
      __$$_AccountDeletionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool requiresRecentLogin});
}

/// @nodoc
class __$$_AccountDeletionStateCopyWithImpl<$Res>
    extends _$AccountDeletionStateCopyWithImpl<$Res, _$_AccountDeletionState>
    implements _$$_AccountDeletionStateCopyWith<$Res> {
  __$$_AccountDeletionStateCopyWithImpl(_$_AccountDeletionState _value,
      $Res Function(_$_AccountDeletionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiresRecentLogin = null,
  }) {
    return _then(_$_AccountDeletionState(
      requiresRecentLogin: null == requiresRecentLogin
          ? _value.requiresRecentLogin
          : requiresRecentLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AccountDeletionState implements _AccountDeletionState {
  const _$_AccountDeletionState({this.requiresRecentLogin = false});

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
            other is _$_AccountDeletionState &&
            (identical(other.requiresRecentLogin, requiresRecentLogin) ||
                other.requiresRecentLogin == requiresRecentLogin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requiresRecentLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountDeletionStateCopyWith<_$_AccountDeletionState> get copyWith =>
      __$$_AccountDeletionStateCopyWithImpl<_$_AccountDeletionState>(
          this, _$identity);
}

abstract class _AccountDeletionState implements AccountDeletionState {
  const factory _AccountDeletionState({final bool requiresRecentLogin}) =
      _$_AccountDeletionState;

  @override
  bool get requiresRecentLogin;
  @override
  @JsonKey(ignore: true)
  _$$_AccountDeletionStateCopyWith<_$_AccountDeletionState> get copyWith =>
      throw _privateConstructorUsedError;
}
