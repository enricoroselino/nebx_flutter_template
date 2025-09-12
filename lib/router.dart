import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nebx_flutter_template/pages/my_home_page.dart';

final router = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(debugLabel: "root"),
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: "/",
      builder: (context, state) => const MyHomePage(title: "My Home Page"),
    ),
  ],
);
