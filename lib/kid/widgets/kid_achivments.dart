import 'dart:async';
import 'dart:math';

import 'package:camp_app/core/widgets/animated_icon.dart';
import 'package:camp_app/kid/main/ui/kid_main_page.dart';
import 'package:camp_app/kid/widgets/kid_current_activity.dart';
import 'package:camp_app/kid/widgets/shift.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide AnimatedIcon;
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'kid_card.dart';
import 'lid_card_progress_bar.dart';

class KidAchivments extends StatelessWidget {
  const KidAchivments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 5,
        left: 40,
      ),
      child: Hero(
        tag: 'achivments',
        child: KidCard(
          kidCardTransformer: KidCardTransformer(
            angle: 0.1,
          ),
          title: "Уровень достижений: 5",
          onTap: () {},
          action: const KidCardProgressBar(
            current: 4,
            total: 5,
          ),
        ),
      ),
    );
  }
}

class KidAchivmentsPage extends StatefulWidget {
  const KidAchivmentsPage({Key? key}) : super(key: key);

  @override
  State<KidAchivmentsPage> createState() => _KidAchivmentsPageState();
}

class _KidAchivmentsPageState extends State<KidAchivmentsPage> {
  late final AchivmentController achivmentController;

  @override
  void initState() {
    super.initState();
    achivmentController = AchivmentController();
    achivmentController.init();
    achivmentController.openCloseDialogController.stream.listen(
      (event) {
        if (event) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Подсказка'),
                content: Text(
                  'Для того чтобы открыть данный сундук вам необхадима помощь товарища',
                ),
              );
            },
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'achivments',
      createRectTween: createRectTween,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: KidTheme.of(context).backgorundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: MyBackButton(),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 19,
                    bottom: 19,
                  ),
                  child: Text(
                    'Ежедневное\nзадание:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: KidTheme.of(context).cardTextColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                stream: achivmentController.isEventExistController.stream,
                initialData: true,
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 19,
                      ),
                      child: TreasureCard(
                        achivmentController: achivmentController,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TreasureCard extends HookWidget {
  final AchivmentController achivmentController;

  TreasureCard({
    Key? key,
    required this.achivmentController,
  }) : super(key: key);
  TickerFuture? buttonPressedState;

  @override
  Widget build(BuildContext context) {
    final scaleController = useAnimationController(
      lowerBound: 0.9,
      upperBound: 1,
      initialValue: 1,
      duration: Duration(milliseconds: 100),
    );

    useEffect(() {
      achivmentController.buttonScaleController = scaleController;
    }, []);
    useAnimation(scaleController);

    return IntrinsicWidth(
      child: Transform.scale(
        scale: scaleController.value,
        child: Transform.rotate(
          angle: -0.05,
          child: GestureDetector(
            onTapDown: (_) {
              buttonPressedState = scaleController.reverse();
            },
            onTapUp: (_) async {
              await buttonPressedState;
              buttonPressedState = scaleController.forward();
            },
            onTap: () async {
              await buttonPressedState;
              showModalBottomSheet(
                context: context,
                builder: (_) => FlutterLogo(),
              );
            },
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: KidTheme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                          KidTheme.of(context).buttonTextColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset.zero,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Поиск сундука',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: KidTheme.of(context).cardTextColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            StreamBuilder(
                              stream:
                                  achivmentController.stepsController.stream,
                              initialData: 5,
                              builder: (context, snapshot) {
                                return Text(
                                  '${snapshot.data}м',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: KidTheme.of(context).cardTextColor,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Spacer(),
                        TreasureImage(
                          size: 77,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AchivmentButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TreasureImage extends HookWidget {
  final double size;

  const TreasureImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  Color _colorFromValue(double value) {
    return HSVColor.lerp(
      HSVColor.fromColor(Colors.redAccent),
      HSVColor.fromColor(Colors.deepPurpleAccent),
      value,
    )!
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final shadowColorAnimation = useAnimationController(
      duration: Duration(seconds: 3),
    );
    final shadowOffseAnimation = useAnimationController(
      duration: Duration(seconds: 6),
    );

    shadowColorAnimation
      ..forward()
      ..repeat();
    useAnimation(shadowColorAnimation);
    shadowOffseAnimation
      ..forward()
      ..repeat();
    useAnimation(shadowOffseAnimation);
    final transformer = KidCardTransformer(
      shadowOffset: shadowOffseAnimation.value,
      shadowColor: _colorFromValue(shadowColorAnimation.value),
    );

    final rotationController = useAnimationController(
      duration: Duration(seconds: 2),
    );
    useAnimation(rotationController);

    rotationController
      ..forward()
      ..repeat();

    return Transform.rotate(
      angle: 0.05 * cos(rotationController.value * 2 * pi),
      child: DecoratedBox(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: _colorFromValue(shadowColorAnimation.value),
            spreadRadius: -21,
            blurRadius: 25,
            offset: Offset(
              sin(4 * pi * shadowOffseAnimation.value) * 2,
              cos(6 * pi * shadowOffseAnimation.value) * 2,
            ),
          ),
        ]),
        child: AnimatedIcon(
          asset: 'assets/images/treasure.png',
          size: size,
        ),
      ),
    );
  }
}

class AchivmentButton extends StatelessWidget {
  const AchivmentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: KidTheme.of(context).achivmentGreenColor,
      ),
      child: Center(
        child: Text(
          "Раскопать",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: KidTheme.of(context).achivmentBlueColor,
          ),
        ),
      ),
    );
  }
}

class AchivmentController {
  final StreamController<bool> isEventExistController = StreamController();
  final StreamController<int> stepsController = StreamController.broadcast();
  final StreamController<bool> openCloseDialogController = StreamController();
  final StreamController<bool> startShow = StreamController();

  late final AnimationController buttonScaleController;

  void init() {
    final stepStream = Stream.periodic(Duration(seconds: 1), (i) => 2 - i);
    final stepSubs = stepStream.listen((event) {
      stepsController.add(event);
    });
    stepsController.stream.listen((event) async {
      if (event == 0) {
        stepSubs.cancel();

        // await buttonScaleController.reverse();
        // await Future.delayed(Duration(milliseconds: 50));
        // openCloseDialogController.add(true);
        // await Future.delayed(Duration(seconds: 3));
        // openCloseDialogController.add(false);
        // await Future.delayed(Duration(milliseconds: 50));
        // await buttonScaleController.forward();
        // await Future.delayed(Duration(seconds: 3));

        await buttonScaleController.reverse();
        await Future.delayed(Duration(milliseconds: 50));
        startShow.add(true);
      }
    });
  }
}
