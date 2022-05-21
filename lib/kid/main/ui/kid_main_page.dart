import 'dart:math';

import 'package:camp_app/kid/widgets/kid_achivments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../widgets/crystals.dart';
import '../../widgets/kid_current_activity.dart';
import '../../widgets/kid_profile.dart';
import '../../widgets/lid_money_balance.dart';
import '../../widgets/my_shifts.dart';
import '../../widgets/sections.dart';
import '../../widgets/shift.dart';

class KidMainPage extends StatelessWidget {
  const KidMainPage({Key? key}) : super(key: key);

  Widget navbar() {
    return Row(
      children: [
        const Crystals(),
        Expanded(
          child: Column(
            children: const [
              Sections(),
              SizedBox(
                height: 10,
              ),
              MyShifts(),
            ],
          ),
        ),
      ],
    );
  }

  Widget balanceAndProfile() {
    return Row(
      children: const [
        KidMoneyBalance(),
        SizedBox(
          width: 10,
        ),
        KidProfile(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var cards = [
      balanceAndProfile(),
      KidAchivments(),
      const CurrentActivity(),
      const Shift(),
      navbar(),
    ];

    return SafeArea(
      child: KidThemeProvider(
        child: _KidMainPage(cards: cards),
      ),
    );
  }
}

class _KidMainPage extends StatelessWidget {
  const _KidMainPage({
    Key? key,
    required this.cards,
  }) : super(key: key);

  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KidTheme.of(context).backgorundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: cards
                .map((e) => Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 17,
                        right: 10,
                      ),
                      child: e,
                    ))
                .map(
                  (e) => InitAnimationWrapper(
                    child: e,
                    left: Random().nextBool(),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class InitAnimationWrapper extends HookWidget {
  final Widget child;
  final bool left;

  const InitAnimationWrapper({
    Key? key,
    required this.child,
    this.left = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideController =
        useAnimationController(duration: Duration(milliseconds: 500));
    useAnimation(slideController);
    print(slideController.value);

    final offset =
        Tween<Offset>(begin: Offset(left ? -0.7 : 0.7, 0.0), end: Offset.zero)
            .animate(slideController);

    slideController.forward();
    return SlideTransition(
      position: offset,
      child: child,
    );
  }
}

class KidThemeProvider extends StatefulWidget {
  final Widget child;
  const KidThemeProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<KidThemeProvider> createState() => _KidThemeProviderState();
}

class _KidThemeProviderState extends State<KidThemeProvider> {
  KidThemeData kidThemeData = KidThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return KidTheme(
      kidThemeData: kidThemeData,
      child: widget.child,
    );
  }
}

class KidTheme extends InheritedWidget {
  final KidThemeData kidThemeData;

  KidTheme({
    Key? key,
    required Widget child,
    required this.kidThemeData,
  }) : super(key: key, child: child);

  static KidThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<KidTheme>()!.kidThemeData;
  }

  @override
  bool updateShouldNotify(covariant KidTheme oldWidget) {
    return kidThemeData.isLight != oldWidget.kidThemeData.isLight;
  }
}

class KidThemeData {
  final Color backgorundColor;
  final Color cardColor;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color cardTextColor;
  final bool isLight;

  KidThemeData._(
    this.backgorundColor,
    this.cardColor,
    this.buttonColor,
    this.buttonTextColor,
    this.cardTextColor,
    this.isLight,
  );

  KidThemeData.light()
      : isLight = true,
        backgorundColor = Color(0xffF9FAFC),
        cardColor = Colors.white,
        buttonColor = Color(0xffEDEFFF),
        buttonTextColor = Color(0xff4D5DFA),
        cardTextColor = Color(0xff03314B);

  KidThemeData.dark()
      : isLight = false,
        backgorundColor = Color(0xff121212),
        cardColor = Color(0xff1e1e1e),
        buttonTextColor = Colors.pink,
        buttonColor = Colors.pinkAccent.withOpacity(0.2),
        cardTextColor = Colors.white;
}
