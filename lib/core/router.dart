import 'package:camp_app/auth/screens/login_screen.dart';
import 'package:camp_app/core/constants/routes.dart';
import 'package:camp_app/main/main_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case Routes.mainPage:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      // case Routes.splashScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => LoginScreen(),
      //   );
      default:
        return null;
    }
  }
}
