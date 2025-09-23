import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nebx_flutter_template/pages.dart';
import 'package:nebx_flutter_template/pages/home.dart';
import 'package:nebx_flutter_template/pages/splash_page.dart';

final router = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(debugLabel: "root"),
  initialLocation: Pages.splash.path,
  routes: [
    GoRoute(
      path: Pages.splash.path,
      name: Pages.splash.name,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: Pages.home.path,
      name: Pages.home.name,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
