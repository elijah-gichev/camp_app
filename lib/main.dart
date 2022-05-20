import 'package:camp_app/auth/service/auth_service.dart';
import 'package:camp_app/core/router.dart';
import 'package:camp_app/onboarding/onboarding_page.dart';
import 'package:camp_app/splash/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() async {
  setup();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(App()),
    storage: storage,
  );
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
