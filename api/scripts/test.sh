#!/bin/sh

cd $(dirname $0)

. firestore_emulator.sh

. test_env.sh

gotest ./../...
