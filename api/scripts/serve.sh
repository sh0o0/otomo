#!/bin/sh

cd $(dirname $0)

direnv allow .

. firestore_emulator.sh

go run ../cmd/app/*
