# Frontend

## Flavor

1. mkdir android/app/src/${FLAVOR}/
2. mkdir ios/flavor/${FLAVOR}/
4. touch flavor/${FLAVOR}.json

### flutterfire configure

1. flutterfire configure \
   --out=lib/configs/firebase_options/${FLAVOR}.dart \
    --platforms=android,ios,web \
    --ios-bundle-id=com.nakar0.otomo.${FLAVOR} \
   --android-package-name=com.nakar0.otomo.${FLAVOR}
2. mv android/app/google-services.json android/app/src/${FLAVOR}/
3. cp ios/firebase_app_id_file.json ios/flavor/${FLAVOR}/
4. mv ios/Runner/GoogleService-Info.plist ios/flavor/${FLAVOR}/
