import {
  onDocumentCreated,
} from 'firebase-functions/v2/firestore';
import { credentials } from '@grpc/grpc-js';
import { config } from './config/config';
import { ChatController } from './controller/chat';
import { ChatServiceClient } from './protos/chat_service';

const client: ChatServiceClient = new ChatServiceClient(
  config.otomoServerHost,
  credentials.createSsl(),
);

const chatController = new ChatController(client);

exports.reply = onDocumentCreated(
  'versions/1/chats/{userId}/messages/{messageId}',
  async (event) => {
    const snapshot = event.data;
    if (!snapshot) {
      console.log('No data associated with the event');
      return;
    }

    const data = snapshot.data();
    if (data.role !== 'user') return;

    await chatController.askToMessage(data.user_id);
  }
);

