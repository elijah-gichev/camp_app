import 'package:camp_app/core/router.dart';
import 'package:camp_app/onboarding/onboarding_page.dart';
import 'package:camp_app/splash/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  setup();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const App()),
    storage: storage,
  );
}

void setup() {
  WidgetsFlutterBinding.ensureInitialized();
  //getIt.registerSingleton<UserService>(UserService());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camp app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter().onGenerateRoute,
      home: const SplashScreen(),
    );
  }
}
