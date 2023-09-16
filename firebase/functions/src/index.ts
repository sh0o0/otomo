import {
  onDocumentCreated,
} from 'firebase-functions/v2/firestore';
import { Metadata, credentials } from '@grpc/grpc-js';
import { ChatController } from './controller/chat';
import { ChatServiceClient } from './protos/chat_service_grpc_pb';
import { defineSecret, defineString } from 'firebase-functions/params';

const isLocal = process.env.FUNCTIONS_EMULATOR === 'true';

// Environment variables
const otomoServerHost = defineString('OTOMO_SERVER_HOST');

// Secrets
const otomoBasicAuthUsername = defineSecret('OTOMO_BASIC_AUTH_USERNAME');
const otomoBasicAuthPassword = defineSecret('OTOMO_BASIC_AUTH_PASSWORD');


exports.reply = onDocumentCreated(
  {
    document: 'versions/1/chats/{userId}/messages/{messageId}',
    // TODO: asign otomoServerHost
    secrets: [otomoBasicAuthUsername, otomoBasicAuthPassword],
  },
  (event) => {
    const client: ChatServiceClient = new ChatServiceClient(
      otomoServerHost.value(),
      isLocal ? credentials.createInsecure() : credentials.createSsl(),
    );

    const metadata = new Metadata();
    const auth = Buffer.from(
      `${otomoBasicAuthUsername.value()}:${otomoBasicAuthPassword.value()}`
    ).toString('base64');
    metadata.add('authorization', `basic ${auth}`);

    const chatController = new ChatController(client, metadata);

    const snapshot = event.data;
    if (!snapshot) {
      console.log('No data associated with the event');
      return;
    }

    const data = snapshot.data();
    if (data.role !== 'user') return;

    chatController.askToMessage(event.params.userId);
  }
);

