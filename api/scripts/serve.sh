#!/bin/sh

cd $(dirname $0)

direnv allow .

printf '\033[32m%s\033[m\n' 'Starting Firestore Emulator...'

. firestore_emulator.sh

printf '\033[32m%s\033[m\n' 'Started Firestore Emulator'

go run ../cmd/app/*
