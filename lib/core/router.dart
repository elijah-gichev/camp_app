import 'package:camp_app/auth/screens/login_screen.dart';
import 'package:camp_app/core/constants/routes.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:camp_app/kid/adventure/adventure_page.dart';
import 'package:camp_app/kid/calendar/calendar_page.dart';
import 'package:camp_app/kid/main/ui/kid_main_page.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/kid/widgets/shift.dart';
import 'package:camp_app/main.dart';
import 'package:camp_app/main/main_screen.dart';
import 'package:camp_app/money/money_screen.dart';
import 'package:camp_app/money/payment_bloc/payment_bloc.dart';
import 'package:camp_app/money/qr_scanner.dart';
import 'package:camp_app/money/services/payment_service.dart';
import 'package:camp_app/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const KidShiftPage(),
        );
      case Routes.adventure:
        return MaterialPageRoute(
          builder: (context) => const AdventurePage(),
        );
      case Routes.calendar:
        return MaterialPageRoute(
          builder: (context) => const CalendarPage(),
        );
      case Routes.kidMain:
        return MaterialPageRoute(
          builder: (context) => const KidMainPage(),
        );
      case Routes.mainPage:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      // return MaterialPageRoute(
      //   builder: (_) => const MoneyScreen(),
      // );
      // return MaterialPageRoute(
      //   builder: (_) => const MainScreen(),
      // );
      case Routes.auth:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case Routes.qrScanner:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PaymentBloc(
              PaymentService(
                getIt<DioService>(),
              ),
              getIt<UserService>(),
            ),
            child: const QRScanner(),
          ),
        );
      default:
        return null;
    }
  }
}
