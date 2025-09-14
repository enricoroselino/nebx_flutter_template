import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/security_check.dart';
import 'package:nebx_flutter_template/setup_dependencies.dart';

final securityServiceProvider = Provider<ISecurityCheck>(
  (ref) => locator.get<ISecurityCheck>(),
);

final securityCheckProvider = FutureProvider<bool>((ref) async {
  final security = ref.read(securityServiceProvider);

  final tasks = [security.isEnvironmentSecure(), security.isLocationSecure()];
  final results = await Future.wait(tasks);
  return results.every((result) => result);
});
