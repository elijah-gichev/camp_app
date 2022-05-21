import 'package:camp_app/cart/cart.dart';
import 'package:camp_app/cart/cart_bloc/cart_bloc.dart';
import 'package:camp_app/money/money_screen.dart';
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
      case 2:
        // return ProfileScreen();
        return BlocProvider(
          create: (context) => CartBloc(),
          child: const CartPage(),
        );
    }
    return Container();
  }
}
