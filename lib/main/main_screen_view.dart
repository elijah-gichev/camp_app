import 'package:camp_app/cart/child_cart.dart';
import 'package:camp_app/shifts/screens/shifts_screen.dart';
import 'package:camp_app/money/accounts_screen.dart';
import 'package:flutter/material.dart';

import '../cart/cart.dart';

class MainScreenView extends StatelessWidget {
  final int page;

  const MainScreenView({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case 0:
        return const AccountsScreen();
      case 1:
        return const ShiftsScreen();
      case 2:
        return CartPage();
    }
    return Container();
  }
}
