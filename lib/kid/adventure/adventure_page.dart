import 'package:flutter/material.dart';

class AdventurePage extends StatelessWidget {
  const AdventurePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '13',
                style: TextStyle(fontSize: 60, shadows: [
                  Shadow(
                    color: Colors.red,
                    blurRadius: 14,
                  ),
                ]),
              ),
              Text(
                'метров до клада',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
