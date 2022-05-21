import 'dart:io';

import 'package:camp_app/auth/service/auth_service.dart';
import 'package:camp_app/core/router.dart';
import 'package:camp_app/core/services/laravel_pusher_service.dart';
import 'package:camp_app/core/services/local_user_service.dart';

import 'package:camp_app/core/services/dio_service.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/core/utils/bloc_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

final getIt = GetIt.instance;
late SharedPreferences prefs;

void main() async {
  await setup();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(App()),
    storage: storage,
    blocObserver: SimpleBlocObserver(),
  );
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (!kReleaseMode) {
    HttpOverrides.global = DebugHttpOverrides();
  }

  final dioService = DioService.baseClient();
  prefs = await SharedPreferences.getInstance();

  final localUserService = LocalUserService(prefs);
  final userService = UserService();

  if (localUserService.isUserSaved) {
    final user = localUserService.getLocalUser();
    userService.createUser(user);

    dioService.addIdInterceptor(user!.id);
  }

  getIt.registerSingleton<DioService>(dioService);
  getIt.registerSingleton<AuthService>(AuthService(dioService));
  getIt.registerSingleton<LocalUserService>(localUserService);
  getIt.registerSingleton<UserService>(userService);
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'Camp app',
        debugShowCheckedModeBanner: false,
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

class DebugHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
