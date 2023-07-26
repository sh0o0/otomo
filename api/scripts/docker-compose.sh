#!/bin/sh

cd $(dirname $0)/..

direnv allow .

docker-compose -f docker/docker-compose.yaml "$@"
