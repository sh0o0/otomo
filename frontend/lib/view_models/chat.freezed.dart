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
mixin _$ChatState {
  Pagination<TextMessageData> get messages =>
      throw _privateConstructorUsedError;
  RemainingMessageSendCount get remainingMessageSendCount =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {Pagination<TextMessageData> messages,
      RemainingMessageSendCount remainingMessageSendCount});

  $PaginationCopyWith<TextMessageData, $Res> get messages;
  $RemainingMessageSendCountCopyWith<$Res> get remainingMessageSendCount;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? remainingMessageSendCount = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Pagination<TextMessageData>,
      remainingMessageSendCount: null == remainingMessageSendCount
          ? _value.remainingMessageSendCount
          : remainingMessageSendCount // ignore: cast_nullable_to_non_nullable
              as RemainingMessageSendCount,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<TextMessageData, $Res> get messages {
    return $PaginationCopyWith<TextMessageData, $Res>(_value.messages, (value) {
      return _then(_value.copyWith(messages: value) as $Val);
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
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
          _$ChatStateImpl value, $Res Function(_$ChatStateImpl) then) =
      __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Pagination<TextMessageData> messages,
      RemainingMessageSendCount remainingMessageSendCount});

  @override
  $PaginationCopyWith<TextMessageData, $Res> get messages;
  @override
  $RemainingMessageSendCountCopyWith<$Res> get remainingMessageSendCount;
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
      _$ChatStateImpl _value, $Res Function(_$ChatStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? remainingMessageSendCount = null,
  }) {
    return _then(_$ChatStateImpl(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Pagination<TextMessageData>,
      remainingMessageSendCount: null == remainingMessageSendCount
          ? _value.remainingMessageSendCount
          : remainingMessageSendCount // ignore: cast_nullable_to_non_nullable
              as RemainingMessageSendCount,
    ));
  }
}

/// @nodoc

class _$ChatStateImpl extends _ChatState {
  const _$ChatStateImpl(
      {required this.messages, required this.remainingMessageSendCount})
      : super._();

  @override
  final Pagination<TextMessageData> messages;
  @override
  final RemainingMessageSendCount remainingMessageSendCount;

  @override
  String toString() {
    return 'ChatState(messages: $messages, remainingMessageSendCount: $remainingMessageSendCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            (identical(other.messages, messages) ||
                other.messages == messages) &&
            (identical(other.remainingMessageSendCount,
                    remainingMessageSendCount) ||
                other.remainingMessageSendCount == remainingMessageSendCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, messages, remainingMessageSendCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState extends ChatState {
  const factory _ChatState(
          {required final Pagination<TextMessageData> messages,
          required final RemainingMessageSendCount remainingMessageSendCount}) =
      _$ChatStateImpl;
  const _ChatState._() : super._();

  @override
  Pagination<TextMessageData> get messages;
  @override
  RemainingMessageSendCount get remainingMessageSendCount;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
