/// Defines a contract for performing security validations
/// before allowing the app to run.
///
/// Implementations may include checks for:
/// - Rooted/jailbroken devices
/// - Emulator detection
/// - Mock location usage
abstract class ISecurityCheck {
  /// Verifies whether the current device/environment
  /// is safe to run the application.
  Future<bool> isEnvironmentSecure();

  /// Verifies whether the device's location settings
  /// and providers are trusted and not tampered with.
  Future<bool> isLocationSecure();
}
