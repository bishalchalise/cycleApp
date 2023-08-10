import 'package:cyclego/features/auth/presentation/pages/auth/login_page.dart';
import 'package:cyclego/features/auth/presentation/pages/auth/register_page.dart';
import 'package:cyclego/features/auth/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
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
    case HomePage.routeName:
      var uid = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => HomePage(uid: uid));
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Text("The screen doesn't exists"),
        ),
      );
  }
}
