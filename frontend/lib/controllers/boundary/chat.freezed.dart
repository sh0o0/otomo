// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SendMessageOutput {
  TextMessage get message => throw _privateConstructorUsedError;
  RemainingMessageSendCount get remainingMessageSendCount =>
      throw _privateConstructorUsedError;
  MessageSentCount get messageSentCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendMessageOutputCopyWith<SendMessageOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageOutputCopyWith<$Res> {
  factory $SendMessageOutputCopyWith(
          SendMessageOutput value, $Res Function(SendMessageOutput) then) =
      _$SendMessageOutputCopyWithImpl<$Res, SendMessageOutput>;
  @useResult
  $Res call(
      {TextMessage message,
      RemainingMessageSendCount remainingMessageSendCount,
      MessageSentCount messageSentCount});

  $TextMessageCopyWith<$Res> get message;
  $RemainingMessageSendCountCopyWith<$Res> get remainingMessageSendCount;
  $MessageSentCountCopyWith<$Res> get messageSentCount;
}

/// @nodoc
class _$SendMessageOutputCopyWithImpl<$Res, $Val extends SendMessageOutput>
    implements $SendMessageOutputCopyWith<$Res> {
  _$SendMessageOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? remainingMessageSendCount = null,
    Object? messageSentCount = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as TextMessage,
      remainingMessageSendCount: null == remainingMessageSendCount
          ? _value.remainingMessageSendCount
          : remainingMessageSendCount // ignore: cast_nullable_to_non_nullable
              as RemainingMessageSendCount,
      messageSentCount: null == messageSentCount
          ? _value.messageSentCount
          : messageSentCount // ignore: cast_nullable_to_non_nullable
              as MessageSentCount,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TextMessageCopyWith<$Res> get message {
    return $TextMessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RemainingMessageSendCountCopyWith<$Res> get remainingMessageSendCount {
    return $RemainingMessageSendCountCopyWith<$Res>(
        _value.remainingMessageSendCount, (value) {
      return _then(_value.copyWith(remainingMessageSendCount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageSentCountCopyWith<$Res> get messageSentCount {
    return $MessageSentCountCopyWith<$Res>(_value.messageSentCount, (value) {
      return _then(_value.copyWith(messageSentCount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SendMessageOutputCopyWith<$Res>
    implements $SendMessageOutputCopyWith<$Res> {
  factory _$$_SendMessageOutputCopyWith(_$_SendMessageOutput value,
          $Res Function(_$_SendMessageOutput) then) =
      __$$_SendMessageOutputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextMessage message,
      RemainingMessageSendCount remainingMessageSendCount,
      MessageSentCount messageSentCount});

  @override
  $TextMessageCopyWith<$Res> get message;
  @override
  $RemainingMessageSendCountCopyWith<$Res> get remainingMessageSendCount;
  @override
  $MessageSentCountCopyWith<$Res> get messageSentCount;
}

/// @nodoc
class __$$_SendMessageOutputCopyWithImpl<$Res>
    extends _$SendMessageOutputCopyWithImpl<$Res, _$_SendMessageOutput>
    implements _$$_SendMessageOutputCopyWith<$Res> {
  __$$_SendMessageOutputCopyWithImpl(
      _$_SendMessageOutput _value, $Res Function(_$_SendMessageOutput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? remainingMessageSendCount = null,
    Object? messageSentCount = null,
  }) {
    return _then(_$_SendMessageOutput(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as TextMessage,
      remainingMessageSendCount: null == remainingMessageSendCount
          ? _value.remainingMessageSendCount
          : remainingMessageSendCount // ignore: cast_nullable_to_non_nullable
              as RemainingMessageSendCount,
      messageSentCount: null == messageSentCount
          ? _value.messageSentCount
          : messageSentCount // ignore: cast_nullable_to_non_nullable
              as MessageSentCount,
    ));
  }
}

/// @nodoc

class _$_SendMessageOutput implements _SendMessageOutput {
  const _$_SendMessageOutput(
      {required this.message,
      required this.remainingMessageSendCount,
      required this.messageSentCount});

  @override
  final TextMessage message;
  @override
  final RemainingMessageSendCount remainingMessageSendCount;
  @override
  final MessageSentCount messageSentCount;

  @override
  String toString() {
    return 'SendMessageOutput(message: $message, remainingMessageSendCount: $remainingMessageSendCount, messageSentCount: $messageSentCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendMessageOutput &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.remainingMessageSendCount,
                    remainingMessageSendCount) ||
                other.remainingMessageSendCount == remainingMessageSendCount) &&
            (identical(other.messageSentCount, messageSentCount) ||
                other.messageSentCount == messageSentCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, remainingMessageSendCount, messageSentCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendMessageOutputCopyWith<_$_SendMessageOutput> get copyWith =>
      __$$_SendMessageOutputCopyWithImpl<_$_SendMessageOutput>(
          this, _$identity);
}

abstract class _SendMessageOutput implements SendMessageOutput {
  const factory _SendMessageOutput(
      {required final TextMessage message,
      required final RemainingMessageSendCount remainingMessageSendCount,
      required final MessageSentCount messageSentCount}) = _$_SendMessageOutput;

  @override
  TextMessage get message;
  @override
  RemainingMessageSendCount get remainingMessageSendCount;
  @override
  MessageSentCount get messageSentCount;
  @override
  @JsonKey(ignore: true)
  _$$_SendMessageOutputCopyWith<_$_SendMessageOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetRemainingMessageSendCountOutput {
  RemainingMessageSendCount get remainingMessageSendCount =>
      throw _privateConstructorUsedError;
  MessageSentCount get messageSentCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetRemainingMessageSendCountOutputCopyWith<
          GetRemainingMessageSendCountOutput>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRemainingMessageSendCountOutputCopyWith<$Res> {
  factory $GetRemainingMessageSendCountOutputCopyWith(
          GetRemainingMessageSendCountOutput value,
          $Res Function(GetRemainingMessageSendCountOutput) then) =
      _$GetRemainingMessageSendCountOutputCopyWithImpl<$Res,
          GetRemainingMessageSendCountOutput>;
  @useResult
  $Res call(
      {RemainingMessageSendCount remainingMessageSendCount,
      MessageSentCount messageSentCount});

  $RemainingMessageSendCountCopyWith<$Res> get remainingMessageSendCount;
  $MessageSentCountCopyWith<$Res> get messageSentCount;
}

/// @nodoc
class _$GetRemainingMessageSendCountOutputCopyWithImpl<$Res,
        $Val extends GetRemainingMessageSendCountOutput>
    implements $GetRemainingMessageSendCountOutputCopyWith<$Res> {
  _$GetRemainingMessageSendCountOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainingMessageSendCount = null,
    Object? messageSentCount = null,
  }) {
    return _then(_value.copyWith(
      remainingMessageSendCount: null == remainingMessageSendCount
          ? _value.remainingMessageSendCount
          : remainingMessageSendCount // ignore: cast_nullable_to_non_nullable
              as RemainingMessageSendCount,
      messageSentCount: null == messageSentCount
          ? _value.messageSentCount
          : messageSentCount // ignore: cast_nullable_to_non_nullable
              as MessageSentCount,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RemainingMessageSendCountCopyWith<$Res> get remainingMessageSendCount {
    return $RemainingMessageSendCountCopyWith<$Res>(
        _value.remainingMessageSendCount, (value) {
      return _then(_value.copyWith(remainingMessageSendCount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageSentCountCopyWith<$Res> get messageSentCount {
    return $MessageSentCountCopyWith<$Res>(_value.messageSentCount, (value) {
      return _then(_value.copyWith(messageSentCount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GetRemainingMessageSendCountOutputCopyWith<$Res>
    implements $GetRemainingMessageSendCountOutputCopyWith<$Res> {
  factory _$$_GetRemainingMessageSendCountOutputCopyWith(
          _$_GetRemainingMessageSendCountOutput value,
          $Res Function(_$_GetRemainingMessageSendCountOutput) then) =
      __$$_GetRemainingMessageSendCountOutputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RemainingMessageSendCount remainingMessageSendCount,
      MessageSentCount messageSentCount});

  @override
  $RemainingMessageSendCountCopyWith<$Res> get remainingMessageSendCount;
  @override
  $MessageSentCountCopyWith<$Res> get messageSentCount;
}

/// @nodoc
class __$$_GetRemainingMessageSendCountOutputCopyWithImpl<$Res>
    extends _$GetRemainingMessageSendCountOutputCopyWithImpl<$Res,
        _$_GetRemainingMessageSendCountOutput>
    implements _$$_GetRemainingMessageSendCountOutputCopyWith<$Res> {
  __$$_GetRemainingMessageSendCountOutputCopyWithImpl(
      _$_GetRemainingMessageSendCountOutput _value,
      $Res Function(_$_GetRemainingMessageSendCountOutput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainingMessageSendCount = null,
    Object? messageSentCount = null,
  }) {
    return _then(_$_GetRemainingMessageSendCountOutput(
      remainingMessageSendCount: null == remainingMessageSendCount
          ? _value.remainingMessageSendCount
          : remainingMessageSendCount // ignore: cast_nullable_to_non_nullable
              as RemainingMessageSendCount,
      messageSentCount: null == messageSentCount
          ? _value.messageSentCount
          : messageSentCount // ignore: cast_nullable_to_non_nullable
              as MessageSentCount,
    ));
  }
}

/// @nodoc

class _$_GetRemainingMessageSendCountOutput
    implements _GetRemainingMessageSendCountOutput {
  const _$_GetRemainingMessageSendCountOutput(
      {required this.remainingMessageSendCount,
      required this.messageSentCount});

  @override
  final RemainingMessageSendCount remainingMessageSendCount;
  @override
  final MessageSentCount messageSentCount;

  @override
  String toString() {
    return 'GetRemainingMessageSendCountOutput(remainingMessageSendCount: $remainingMessageSendCount, messageSentCount: $messageSentCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetRemainingMessageSendCountOutput &&
            (identical(other.remainingMessageSendCount,
                    remainingMessageSendCount) ||
                other.remainingMessageSendCount == remainingMessageSendCount) &&
            (identical(other.messageSentCount, messageSentCount) ||
                other.messageSentCount == messageSentCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, remainingMessageSendCount, messageSentCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetRemainingMessageSendCountOutputCopyWith<
          _$_GetRemainingMessageSendCountOutput>
      get copyWith => __$$_GetRemainingMessageSendCountOutputCopyWithImpl<
          _$_GetRemainingMessageSendCountOutput>(this, _$identity);
}

abstract class _GetRemainingMessageSendCountOutput
    implements GetRemainingMessageSendCountOutput {
  const factory _GetRemainingMessageSendCountOutput(
          {required final RemainingMessageSendCount remainingMessageSendCount,
          required final MessageSentCount messageSentCount}) =
      _$_GetRemainingMessageSendCountOutput;

  @override
  RemainingMessageSendCount get remainingMessageSendCount;
  @override
  MessageSentCount get messageSentCount;
  @override
  @JsonKey(ignore: true)
  _$$_GetRemainingMessageSendCountOutputCopyWith<
          _$_GetRemainingMessageSendCountOutput>
      get copyWith => throw _privateConstructorUsedError;
}
