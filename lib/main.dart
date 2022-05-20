import 'package:camp_app/core/router.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const App());
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
      //home: const MyHomePage(title: 'Camp app'),
    );
  }
}
