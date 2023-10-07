# Firebase

## Functions

### Deploy

1. Set firebase secrets. Reference index.ts.
2. Set .env file at functions/.
3. firebase functions:secrets:set OTOMO_BASIC_AUTH_USERNAME
4. firebase functions:secrets:set OTOMO_BASIC_AUTH_PASSWORD
5. firebase deploy --only functions
