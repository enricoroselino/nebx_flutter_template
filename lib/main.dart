import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nebx_flutter_template/core/themes/app_theme.dart';
import 'package:nebx_flutter_template/core/providers/app_theme_provider.dart';
import 'package:nebx_flutter_template/infrastructure/providers/security_provider.dart';
import 'package:nebx_flutter_template/pages/error_page.dart';
import 'package:nebx_flutter_template/pages/insecure_environment_page.dart';
import 'package:nebx_flutter_template/router.dart';
import 'package:nebx_flutter_template/setup_dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Env.init(); // commented as the env is blank
  SetupDependencies.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final securityCheckAsyncValue = ref.watch(securityCheckProvider);
    final themeModeAsyncValue = ref.watch(appThemeProvider);

    return securityCheckAsyncValue.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => ErrorPage(),
      data: (isDeviceSecure) {
        final themeMode = themeModeAsyncValue.when(
          data: (data) => data,
          error: (_, __) => ThemeMode.system,
          loading: () => ThemeMode.system,
        );

        if (!isDeviceSecure) {
          return MaterialApp(
            theme: AppTheme.lightMode,
            darkTheme: AppTheme.darkMode,
            themeMode: themeMode,
            home: InsecureEnvironmentPage(),
            debugShowCheckedModeBanner: kDebugMode,
          );
        }

        return MaterialApp.router(
          routerConfig: router,
          theme: AppTheme.lightMode,
          darkTheme: AppTheme.darkMode,
          themeMode: themeMode,
          debugShowCheckedModeBanner: kDebugMode,
        );
      },
    );
  }
}
