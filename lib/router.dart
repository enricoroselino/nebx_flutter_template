import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nebx_flutter_template/pages/error_page.dart';
import 'package:nebx_flutter_template/pages/home.dart';
import 'package:nebx_flutter_template/pages/splash_page.dart';

final router = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(debugLabel: "root"),
  initialLocation: "/splash",
  routes: [
    GoRoute(
      path: "/splash",
      name: "Splash Page",
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: "/home",
      name: "Home Page",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/error",
      name: "Error Page",
      builder: (context, state) => const ErrorPage(),
    ),
  ],
);
