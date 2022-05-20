import 'package:camp_app/money/money_screen.dart';
import 'package:flutter/material.dart';

class MainScreenView extends StatelessWidget {
  final int page;

  const MainScreenView({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case 0:
        return const MoneyScreen();
      case 1:
        // return ShiftsScreen();
      case 2:
        // return ProfileScreen();
    }
    return Container();
  }
}
