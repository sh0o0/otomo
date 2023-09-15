import { Metadata, ServiceError } from '@grpc/grpc-js';
import {
  ChatServiceClient,
  ChatService_AskToMessageRequest,
  ChatService_AskToMessageResponse,
} from '../protos/chat_service';

export class ChatController {
  constructor(
    private _client: ChatServiceClient,
    private _metadata: Metadata,
  ) { }

  async askToMessage(userId: string) {
    console.log('called ChatController.askToMessage');

    const request = new ChatService_AskToMessageRequest({
      user_id: userId,
    });

    this._client.askToMessage(
      request,
      this._metadata,
      (err: ServiceError | null,
        response: ChatService_AskToMessageResponse) => {
        if (err) {
          console.warn(`error: ${err}`);
        } else {
          console.log(`response: ${response}`);
        }
      });
  }
}
