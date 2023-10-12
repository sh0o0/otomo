class TestConfig {
  static const googleMapApiKey = String.fromEnvironment('GOOGLE_MAP_API_KEY');
  static const firestoreHost = String.fromEnvironment('FIRESTORE_HOST');
  static const firestorePort = int.fromEnvironment('FIRESTORE_PORT');
}
