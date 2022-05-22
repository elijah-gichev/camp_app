import 'package:camp_app/auth/screens/login_screen.dart';
import 'package:camp_app/core/constants/routes.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:camp_app/kid/calendar/calendar_page.dart';
import 'package:camp_app/kid/main/ui/kid_main_page.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/kid/widgets/kid_achivments.dart';
import 'package:camp_app/kid/widgets/shift.dart';
import 'package:camp_app/main.dart';
import 'package:camp_app/main/main_screen.dart';
import 'package:camp_app/money/money_screen.dart';
import 'package:camp_app/money/payment_bloc/payment_bloc.dart';
import 'package:camp_app/money/qr_scanner.dart';
import 'package:camp_app/money/services/operation_service.dart';
import 'package:camp_app/money/services/payment_service.dart';
import 'package:camp_app/shifts/cubit/data_loading_cubit.dart';
import 'package:camp_app/shifts/models/shift.dart';
import 'package:camp_app/shifts/screens/shift_screen.dart';
import 'package:camp_app/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../kid/achivments/achivments_page.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.achivments:
        return PageRouteBuilder(
          reverseTransitionDuration: Duration(milliseconds: 500),
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => KidAchivmentsPage(),
        );
      case Routes.shift:
        return PageRouteBuilder(
          reverseTransitionDuration: Duration(milliseconds: 500),
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => KidShiftPage(),
        );
      // case Routes.calendar:
      case '/':
        return PageRouteBuilder(
          reverseTransitionDuration: Duration(milliseconds: 500),
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => CalendarPage(),
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

      // case Routes.shift:
      //   final Shift? shift = routeSettings.arguments != null ? routeSettings.arguments as Shift : null;
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => OperationLoadingCubit(OperationService(getIt<DioService>())),
      //       child: ShiftScreen(shift!),
      //     ),
      //   );
      default:
        return null;
    }
  }
}
