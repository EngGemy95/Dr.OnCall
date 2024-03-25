import 'package:dr_on_call/presentation/pages/appointment/mobile/appointment_mobile.dart';
import 'package:dr_on_call/presentation/pages/change_password/mobile/change_password.dart';
import 'package:dr_on_call/presentation/pages/login/mobile/login_page.dart';
import 'package:dr_on_call/presentation/pages/profile/mobile/profile_page.dart';
import 'package:dr_on_call/presentation/pages/register/mobile/register_page.dart';
import 'package:dr_on_call/presentation/pages/welcome/mobile/welcome_page.dart';
import 'package:flutter/material.dart';
import '../pages/home/mobile/navbar_roots.dart';
import '../resource_data/strings_manager.dart';

class Routes {
  static const String welcome = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String navBarRoots = "/navBarRoots";
  static const String profile = "/profile";
  static const String appointment = "/appointment";
  static const String changePassword = "/changePassword";
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
      case Routes.register:
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (_) => const RegisterPage());
      case Routes.navBarRoots:
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (_) => const NavBarRoots());
      case Routes.profile:
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (_) => const ProfileMobilePage());
      case Routes.appointment:
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (_) => const AppointmentMobilePage());
      case Routes.changePassword:
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (_) => ChangePassword());

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
