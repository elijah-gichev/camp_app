import 'dart:async';
import 'dart:math';

import 'package:camp_app/core/widgets/animated_icon.dart';
import 'package:camp_app/kid/main/ui/kid_main_page.dart';
import 'package:camp_app/kid/widgets/kid_current_activity.dart';
import 'package:camp_app/kid/widgets/shift.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide AnimatedIcon;
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/routes.dart';
import '../achivments/confetti.dart';
import 'kid_card.dart';
import 'lid_card_progress_bar.dart';

class KidAchivments extends StatelessWidget {
  const KidAchivments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final KidCardTransformer kidCardTransformer = KidCardTransformer(
      angle: 0.1,
    );
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 5,
        left: 40,
      ),
      child: Hero(
        tag: 'achivments',
        flightShuttleBuilder: (
          _,
          __,
          ___,
          ____,
          ______,
        ) =>
            FlightShuttleBuilder(
          kidCardTransformer: kidCardTransformer,
        ),
        child: KidCard(
          kidCardTransformer: kidCardTransformer,
          title: "Уровень достижений: 5",
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.achivments,
            );
          },
          action: const KidCardProgressBar(
            current: 4,
            total: 5,
          ),
        ),
      ),
    );
  }
}

class ShowDialog extends HookWidget {
  const ShowDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final duration = Duration(seconds: 1);
    final showController = useAnimationController(duration: duration);
    useAnimation(showController);

    showController.forward();

    return Opacity(
      opacity: showController.value,
      child: AlertDialog(
        backgroundColor: KidTheme.of(context).backgorundColor,
        title: Text(
          'Поздравляем!',
          style: TextStyle(
            color: KidTheme.of(context).cardTextColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UnconstrainedBox(
              child: TreasureImageDialog(
                size: 130,
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Text(
              'Вы получили 100 кристаллов!',
              style: TextStyle(
                color: KidTheme.of(context).cardTextColor,
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class TreasureImageDialog extends HookWidget {
  final double size;

  const TreasureImageDialog({
    Key? key,
    required this.size,
  }) : super(key: key);

  Color _colorFromValue(double value) {
    return HSVColor.lerp(
      HSVColor.fromColor(Colors.lightGreenAccent),
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

    final scaleController = useAnimationController(
      lowerBound: 0,
      upperBound: pi,
      duration: Duration(seconds: 2),
    );

    useAnimation(scaleController);

    scaleController.forward();

    return Transform.rotate(
      angle: 0.05 * cos(rotationController.value * 2 * pi),
      child: Transform.scale(
        scale: 1.5 * sin(scaleController.value) + 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: _colorFromValue(shadowColorAnimation.value),
                spreadRadius: -5,
                blurRadius: 30,
                offset: Offset(
                  sin(4 * pi * shadowOffseAnimation.value) * 2,
                  cos(6 * pi * shadowOffseAnimation.value) * 2,
                ),
              ),
            ],
          ),
          child: Stack(
            children: [
              Confetti(),
              Image.asset(
                'assets/images/diamond.png',
                width: size,
                height: size,
              ),
            ],
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
