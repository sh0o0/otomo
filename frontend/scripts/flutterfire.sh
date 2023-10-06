#!/bin/sh

FLAVOR=$1
case $FLAVOR in
"local")
    PACKAGE_SUFFIX='.local'
    ;;
"dev")
    PACKAGE_SUFFIX='.develop'
    ;;
*)
    printf '\033[31m%s\033[m: please give env arg\n' 'ERROR'
    exit 1
    ;;
esac

cd $(dirname $0)
cd ./..
rm ios/firebase_app_id_file.json
rm ios/Runner/GoogleService-Info.plist
rm android/app/google-services.json

flutterfire configure \
    --out=lib/configs/firebase_options/$FLAVOR.dart \
    --platforms=android,ios,web \
    --ios-bundle-id=com.nakar0.otomo$PACKAGE_SUFFIX \
    --android-package-name=com.nakar0.otomo$PACKAGE_SUFFIX

cp android/app/google-services.json android/app/src/${FLAVOR}/google-services.json
cp ios/firebase_app_id_file.json ios/flavor/${FLAVOR}/firebase_app_id_file.json
cp ios/Runner/GoogleService-Info.plist ios/flavor/${FLAVOR}/GoogleService-Info.plist
