import 'package:camp_app/core/constants/routes.dart';
import 'package:flutter/material.dart';

class MoneyScreen extends StatelessWidget {
  const MoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: ColoredBox(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.qrScanner,
          );
        },
      ),
    );
  }
}
