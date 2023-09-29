import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/controllers/converter.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/message_send_count.dart';
import 'package:otomo/grpc/generated/chat_service.pb.dart';
part 'chat.freezed.dart';

@freezed
class SendMessageOutput with _$SendMessageOutput {
  const factory SendMessageOutput({
    required TextMessage message,
    required RemainingMessageSendCount remainingMessageSendCount,
    required MessageSentCount messageSentCount,
  }) = _SendMessageOutput;

  factory SendMessageOutput.fromResponse(ChatService_SendMessageResponse resp) {
    return SendMessageOutput(
      message: ControllerConverter.I.message.grpcToEntity(resp.message),
      remainingMessageSendCount:
          ControllerConverter.I.remainingMessageSendCount.grpcToEntity(
        resp.remainingSendCount,
      ),
      messageSentCount:
          ControllerConverter.I.messageSentCount.grpcToEntity(resp.sentCount),
    );
  }
}

@freezed
class GetRemainingMessageSendCountOutput
    with _$GetRemainingMessageSendCountOutput {
  const factory GetRemainingMessageSendCountOutput({
    required RemainingMessageSendCount remainingMessageSendCount,
    required MessageSentCount messageSentCount,
  }) = _GetRemainingMessageSendCountOutput;

  factory GetRemainingMessageSendCountOutput.fromResponse(
      ChatService_GetRemainingSendCountResponse resp) {
    return GetRemainingMessageSendCountOutput(
      remainingMessageSendCount:
          ControllerConverter.I.remainingMessageSendCount.grpcToEntity(
        resp.remainingSendCount,
      ),
      messageSentCount: ControllerConverter.I.messageSentCount.grpcToEntity(
        resp.sentCount,
      ),
    );
  }
}
