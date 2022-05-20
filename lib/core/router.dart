import 'package:camp_app/auth/screens/login.dart';
import 'package:camp_app/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.auth:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: const [
              // BlocProvider.value(
              //   value: _phoneAuthBloc,
              // ),
              // BlocProvider(
              //   create: (context) => LoginCubit(),
              // ),
            ],
            child: LoginScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
