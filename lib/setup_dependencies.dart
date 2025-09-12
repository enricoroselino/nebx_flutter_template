import 'package:get_it/get_it.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/logger.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/security_check.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/shared_preferences.dart';
import 'package:nebx_flutter_template/infrastructure/services/logger_impl.dart';
import 'package:nebx_flutter_template/infrastructure/services/security_check_impl.dart';
import 'package:nebx_flutter_template/infrastructure/services/shared_preferences_impl.dart';

final locator = GetIt.instance;

class SetupDependencies {
  SetupDependencies._();

  static init() async {
    locator.registerSingleton<ILogger>(LoggerImpl());
    locator.registerSingleton<ISecurityCheck>(SecurityCheckImpl());
    locator.registerSingleton<ISharedPreferences>(SharedPreferencesImpl());

    await locator.allReady();
  }
}
