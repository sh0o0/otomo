#!/bin/sh

GCP_PROJECT_ID=$1
HASH=$(git rev-parse --short HEAD)-local
IMAGE_TAG="us.gcr.io/$GCP_PROJECT_ID/api"

cd "$(dirname "$0")" || exit
cd ./..

docker build -t api .

gcloud config set project "$GCP_PROJECT_ID"
gcloud auth configure-docker --quiet

docker tag api "$IMAGE_TAG:$HASH"
docker tag api "$IMAGE_TAG:latest"
docker push "$IMAGE_TAG:$HASH"
docker push "$IMAGE_TAG:latest"

gcloud beta run deploy api --image="us.gcr.io/$GCP_PROJECT_ID/api" --use-http2 --allow-unauthenticated --platform=managed --region=us-west1 --project="$GCP_PROJECT_ID"
