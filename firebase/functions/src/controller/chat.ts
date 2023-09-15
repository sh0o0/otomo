import { Metadata, ServiceError } from '@grpc/grpc-js';
import { config } from '../config/config';
import {
  ChatServiceClient,
  ChatService_AskToMessageRequest,
  ChatService_AskToMessageResponse,
} from '../protos/chat_service';

const basicAuthMd = new Metadata();
const auth = Buffer.from(
  `${config.basicAuthUsername}:${config.basicAuthPassword}`).toString('base64');
basicAuthMd.add('authorization', `basic ${auth}`);

export class ChatController {
  constructor(private _client: ChatServiceClient) { }

  async askToMessage(userId: string) {
    console.log('called ChatController.askToMessage');

    const request = new ChatService_AskToMessageRequest({
      user_id: userId,
    });

    this._client.askToMessage(
      request,
      basicAuthMd,
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
