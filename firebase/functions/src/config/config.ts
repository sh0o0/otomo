import * as functions from 'firebase-functions';

interface IConfig {
  databaseURL: string
  storageBucket: string
  projectId: string
  otomoServerHost: string
  basicAuthUsername: string
  basicAuthPassword: string
  isLocal: boolean
}

const firebaseConfig = JSON.parse(process.env.FIREBASE_CONFIG as string);

const conf: IConfig = firebaseConfig;
conf.otomoServerHost = functions.config()['otomo']['server-host'];
conf.basicAuthUsername = functions.config()['otomo']['basic-auth-username'];
conf.basicAuthPassword = functions.config()['otomo']['basic-auth-password'];
conf.isLocal = process.env.FUNCTIONS_EMULATOR === 'true';

export const config = conf;
