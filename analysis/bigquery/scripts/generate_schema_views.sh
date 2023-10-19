#!/bin/sh

### Reference
# https://github.com/firebase/extensions/blob/master/firestore-bigquery-export/guides/GENERATE_SCHEMA_VIEWS.md

PROJECT_ID=$1

cd $(dirname $0)

npx @firebaseextensions/fs-bq-schema-views \
    --non-interactive \
    --project=$PROJECT_ID \
    --dataset=firestore_export \
    --table-name-prefix=v1_messages \
    --schema-files=./../schema_views/v1_messages.json
