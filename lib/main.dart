import 'package:camp_app/auth/service/auth_service.dart';
import 'package:camp_app/core/router.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  setup();
  runApp(App());
}

void setup() {
  WidgetsFlutterBinding.ensureInitialized();
  final dioService = DioService.baseClient();

  getIt.registerSingleton<DioService>(dioService);
  getIt.registerSingleton<AuthService>(AuthService(dioService));
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'Camp app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: router.onGenerateRoute,
      ),
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return child!;
      },
    );
  }
}
