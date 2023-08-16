#!/bin/sh

cd $(dirname $0)

# Set API_KEY, EMAIL, PASSWORD
. fetch_user_id_token_test.sh

curl "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$API_KEY" \
    -H 'Content-Type: application/json' \
    --data-binary "{\"email\":\"$EMAIL\",\"password\":\"$PASSWORD\",\"returnSecureToken\":true}"
