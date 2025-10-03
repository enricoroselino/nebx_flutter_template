import 'package:local_auth/local_auth.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/biometric.dart';

class BiometricImpl implements IBiometric {
  final LocalAuthentication _auth;

  BiometricImpl() : _auth = LocalAuthentication();

  static const AuthenticationOptions _authOptions = AuthenticationOptions(
    biometricOnly: true,
    stickyAuth: true,
    useErrorDialogs: true,
  );

  static const String defaultReason =
      'Please authenticate with your fingerprint or face';

  @override
  Future<bool> get canAuthenticate async =>
      await _auth.canCheckBiometrics && await _auth.isDeviceSupported();

  @override
  Future<bool> authenticate({String? reason}) async {
    if (await canAuthenticate == false) return false;

    return await _auth.authenticate(
      localizedReason: reason ?? defaultReason,
      options: _authOptions,
    );
  }
}
