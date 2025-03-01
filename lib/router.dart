import 'package:crisis_app/common/bottom_bar.dart';
import 'package:crisis_app/features/home/home.dart';
import 'package:crisis_app/features/register/register.dart';
import 'package:flutter/material.dart';

import 'features/login/login.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginPage(),
      );
    case RegisterPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterPage(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Screen do not exist"),
          ),
        ),
      );
  }
}
