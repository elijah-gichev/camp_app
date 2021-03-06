import 'dart:math';

import 'package:camp_app/boom/boom_bloc.dart';
import 'package:camp_app/boom/boom_event.dart';
import 'package:camp_app/boom/boom_service.dart';
import 'package:camp_app/boom/boom_state.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:camp_app/kid/widgets/kid_achivments.dart';
import 'package:camp_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../widgets/crystals.dart';
import '../../widgets/kid_current_activity.dart';
import '../../widgets/kid_profile.dart';
import '../../widgets/lid_money_balance.dart';
import '../../widgets/my_shifts.dart';
import '../../widgets/chat.dart';
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
      child: _KidMainPage(cards: cards),
    );
  }
}

class _KidMainPage extends StatelessWidget {
  _KidMainPage({
    Key? key,
    required this.cards,
  }) : super(key: key);

  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoomBloc(BoomService(getIt<DioService>())),
      child: BlocListener<BoomBloc, BoomState>(
        listener: (context, state) {
          if (state is BoomShow) {
            _showBoom(context);
          } else {
            _hideBoom();
          }
        },
        child: Scaffold(
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
        ),
      ),
    );
  }

  OverlayEntry? overlayEntry;

  void _showBoom(BuildContext parentContext) {
    var size = MediaQuery.of(parentContext).size;
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return GestureDetector(
            child: Center(
              child: Stack(children: [
                // Image.asset(
                //   "boom_bg.gif",
                //   height: size.height,
                //   fit: BoxFit.cover,
                // ),
                Image.asset("boom.gif"),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "child1.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipOval(
                        child: Image.asset(
                          "child2.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            onTap: () {
              parentContext.read<BoomBloc>().add(BoomClicked());
            });
      },
    );
    Overlay.of(parentContext)?.insert(overlayEntry!);
  }

  void _hideBoom() {
    overlayEntry?.remove();
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
    final slideController = useAnimationController(duration: Duration(milliseconds: 500));
    useAnimation(slideController);
    print(slideController.value);

    final offset = Tween<Offset>(begin: Offset(left ? -0.7 : 0.7, 0.0), end: Offset.zero).animate(slideController);

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
  KidThemeData kidThemeData = KidThemeData.light();

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

  static void changeToBlackTheme(BuildContext context) {
    final state = context.findAncestorStateOfType<_KidThemeProviderState>()!;
    //state.kidThemeData = KidThemeData.dark();
    state.setState(() {
      state.kidThemeData = KidThemeData.dark();
    });
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
  final Color eventRedColor;
  final Color eventDarkRedColor;
  final Color eventGreenColor;
  final Color eventDarkBlue;
  final Color eventIconBackground;
  final Color eventCategory;
  final Color achivmentGreenColor;
  final Color achivmentBlueColor;

  // ???????? ????????????????????
  final Color activeSelectorColor;
  final Color notActiveSelectorColor;
  final Color themeCardColor;
  final Color themeButtonColor;
  final Color themeBackgroundColor;
  final Color activeSubtitleColor;
  final Color bottomNavbarColor;

  KidThemeData._(
    this.backgorundColor,
    this.cardColor,
    this.buttonColor,
    this.buttonTextColor,
    this.cardTextColor,
    this.isLight,
    this.eventRedColor,
    this.eventGreenColor,
    this.eventDarkBlue,
    this.eventIconBackground,
    this.eventCategory,
    this.eventDarkRedColor,
    this.achivmentGreenColor,
    this.achivmentBlueColor,
// ???????? ????????????????????
    this.activeSelectorColor,
    this.notActiveSelectorColor,
    this.themeCardColor,
    this.themeButtonColor,
    this.themeBackgroundColor,
    this.activeSubtitleColor,
    this.bottomNavbarColor,
  );

  KidThemeData.light()
      : isLight = true,
        backgorundColor = Color(0xffF9FAFC),
        cardColor = Colors.white,
        buttonColor = Color(0xffEDEFFF),
        buttonTextColor = Color(0xff4D5DFA),
        cardTextColor = Color(0xff03314B),
        eventRedColor = Color(0xffFFECEB),
        eventGreenColor = Color(0xffEDFFF4),
        eventDarkBlue = Color(0xff03314B),
        eventIconBackground = Color(0xff031A6E).withOpacity(0.1),
        eventCategory = Color(0xff222222),
        eventDarkRedColor = Color(0xffE6492D),
        achivmentGreenColor = Color(0xffEDFFF4),
        achivmentBlueColor = Color(0xff4DA7FA),
        // ???????? ????????????????????
        activeSelectorColor = Color(0xff98D2F5),
        notActiveSelectorColor = Colors.grey[300]!,
        themeCardColor = Colors.white,
        themeBackgroundColor = Color(0xffF5F5F5),
        themeButtonColor = Color(0xffA3AEB2),
        activeSubtitleColor = Colors.black,
        bottomNavbarColor = Colors.white;

  KidThemeData.dark()
      : isLight = false,
        backgorundColor = Color(0xff121212),
        cardColor = Color(0xff1e1e1e),
        buttonTextColor = Colors.pink,
        buttonColor = Colors.pinkAccent.withOpacity(0.2),
        cardTextColor = Colors.white,
        eventRedColor = Color(0xffFFECEB),
        eventGreenColor = Color(0xffEDFFF4),
        eventDarkBlue = Color(0xff03314B),
        eventIconBackground = Color(0xff031A6E).withOpacity(0.1),
        eventCategory = Color(0xff222222),
        eventDarkRedColor = Color(0xffE6492D),
        achivmentGreenColor = Color(0xffEDFFF4),
        achivmentBlueColor = Color(0xff4DA7FA),
        // ???????? ????????????????????
        activeSelectorColor = Colors.grey[300]!,
        notActiveSelectorColor = Color(0xff98D2F5),
        themeCardColor = Colors.grey[300]!,
        themeBackgroundColor = Color(0xff666666),
        themeButtonColor = Color(0xff4D5DFA),
        activeSubtitleColor = Colors.white,
        bottomNavbarColor = Color(0xffD9D9D9);
}
