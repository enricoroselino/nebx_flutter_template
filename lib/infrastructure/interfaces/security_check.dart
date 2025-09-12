abstract class ISecurityCheck {
  Future<bool> isEnvironmentSecure();
  Future<bool> isLocationSecure();
}
