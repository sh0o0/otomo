// TODO: Add tests


abstract class IdTokenController {
  String? get idToken;
  Future<void> setupIdToken([bool forceRefresh = false]);
}
