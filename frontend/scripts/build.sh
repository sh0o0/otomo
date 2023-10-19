#!/bin/sh

FLAVOR=$1

# ipa
fvm flutter build ipa \
    --release \
    --dart-define-from-file=flavor/$FLAVOR.json

printf '\033[32m%s\033[m\n\n\n' 'built ipa'


# App Bundle
fvm flutter build appbundle \
    --release \
    --dart-define-from-file=flavor/$FLAVOR.json

printf '\033[32m%s\033[m\n\n\n' 'built appbundle'

# apk
fvm flutter build apk \
    --release \
    --dart-define-from-file=flavor/$FLAVOR.json

printf '\033[32m%s\033[m\n\n\n' 'built apk'

