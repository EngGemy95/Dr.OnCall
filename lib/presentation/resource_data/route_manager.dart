import 'package:blood_donation/presentation/pages/login/login_page.dart';
import 'package:blood_donation/presentation/pages/register/register_page.dart';
import 'package:blood_donation/presentation/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import '../resource_data/strings_manager.dart';

class Routes {
  static const String welcome = "/";
  static const String login = "/login";
  static const String register = "/register";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (_) => const WelcomePage());

      case Routes.login:
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (_) => const LoginPage());
      // builder: (_) => const LoginPage());
      case Routes.register:
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (_) => const RegisterPage());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      );
    });
  }
}
