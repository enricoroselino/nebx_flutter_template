import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nebx_flutter_template/env.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/security_check.dart';
import 'package:nebx_flutter_template/pages/insecure_environment_page.dart';
import 'package:nebx_flutter_template/router.dart';
import 'package:nebx_flutter_template/setup_dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Env.init(); // commented as the env is blank
  SetupDependencies.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final security = locator.get<ISecurityCheck>();

    return FutureBuilder(
      future: security.isEnvironmentSecure(),
      builder: (context, snapshot) {
        if (snapshot.data == false) {
          return const MaterialApp(
            home: InsecureEnvironmentPage(),
            debugShowCheckedModeBanner: kDebugMode,
          );
        }

        return MaterialApp.router(
          routerConfig: router,
          title: 'Nebx Flutter Template',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          debugShowCheckedModeBanner: kDebugMode,
        );
      },
    );
  }
}
