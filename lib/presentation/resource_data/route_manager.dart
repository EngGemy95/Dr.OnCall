import 'package:Dr/presentation/pages/appointment/mobile/appointment_mobile.dart';
import 'package:Dr/presentation/pages/login/mobile/login_page.dart';
import 'package:Dr/presentation/pages/register/mobile/register_page.dart';
import 'package:Dr/presentation/pages/welcome/mobile/welcome_page.dart';
import 'package:flutter/material.dart';
import '../pages/home/mobile/navbar_roots.dart';
import '../resource_data/strings_manager.dart';

class Routes {
  static const String welcome = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String navBarRoots = "/navBarRoots";
  static const String appointment = "/appointment";
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
      case Routes.navBarRoots:
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (_) => NavBarRoots());
      case Routes.appointment:
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (_) => AppointmentMobilePage());

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
