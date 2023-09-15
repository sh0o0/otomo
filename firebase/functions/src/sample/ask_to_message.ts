import { Metadata, credentials } from '@grpc/grpc-js';
import { ChatController } from './../controller/chat';
import { ChatServiceClient } from '../protos/chat_service_grpc_pb';

const userId = 'user_id';
const metadata = new Metadata();
const auth = Buffer.from('root:pass').toString('base64');
metadata.add('authorization', `basic ${auth}`);


const client: ChatServiceClient = new ChatServiceClient(
  'localhost:50051',
  credentials.createInsecure(),
);

const chatController = new ChatController(client, metadata);

chatController.askToMessage(userId);

