import 'dart:io';
import 'package:detect_fake_location/detect_fake_location.dart';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/security_check.dart';

class SecurityCheckImpl implements ISecurityCheck {
  final JailbreakRootDetection _rootChecker;
  final DetectFakeLocation _locationChecker;

  SecurityCheckImpl()
    : _rootChecker = JailbreakRootDetection.instance,
      _locationChecker = DetectFakeLocation();

  @override
  Future<bool> isEnvironmentSecure() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final isRooted = await _rootChecker.isJailBroken;
      return !isRooted;
    }

    return true;
  }

  @override
  Future<bool> isLocationSecure() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final isFakeLocation = await _locationChecker.detectFakeLocation(
        ignoreExternalAccessory: true,
      );
      return !isFakeLocation;
    }

    return true;
  }
}
