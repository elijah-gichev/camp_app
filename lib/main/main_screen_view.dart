import 'package:camp_app/cart/cart.dart';
import 'package:camp_app/cart/child_cart.dart';
import 'package:camp_app/money/money_screen.dart';
import 'package:camp_app/shifts/screens/shifts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return ShiftsScreen();
      case 2:
        // return ProfileScreen();

        //return CartPage();

        return ChildCartPage();
    }
    return Container();
  }
}
