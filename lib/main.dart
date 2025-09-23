import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nebx_flutter_template/core/blocs/theme_bloc.dart';
import 'package:nebx_flutter_template/core/blocs/theme_state.dart';
import 'package:nebx_flutter_template/core/themes/app_theme.dart';
import 'package:nebx_flutter_template/router.dart';
import 'package:nebx_flutter_template/setup_dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Env.init(); // commented as the env is blank
  SetupDependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: state.themeMode,
            debugShowCheckedModeBanner: kDebugMode,
          );
        },
      ),
    );
  }
}
