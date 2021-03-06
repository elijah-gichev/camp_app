import 'dart:math';
import 'dart:ui';

import 'package:camp_app/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../main/ui/kid_main_page.dart';
import 'kid_card.dart';

class CurrentActivity extends HookWidget {
  const CurrentActivity({
    Key? key,
  }) : super(key: key);

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
    return Align(
      alignment: Alignment.centerLeft,
      child: Hero(
        tag: 'calendar',
        flightShuttleBuilder: (
          _,
          __,
          ___,
          ____,
          ______,
        ) =>
            FlightShuttleBuilder(
          kidCardTransformer: transformer,
        ),
        child: KidCard(
          title: "13:15 Обед",
          kidCardTransformer: transformer,
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.calendar,
            );
          },
          icon: Container(
            width: 100,
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_right_alt,
                size: 26,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _colorFromValue(double value) {
    return HSVColor.lerp(
      HSVColor.fromColor(Colors.redAccent),
      HSVColor.fromColor(Colors.deepPurpleAccent),
      value,
    )!
        .toColor();
  }
}

class FlightShuttleBuilder extends StatelessWidget {
  final KidCardTransformer kidCardTransformer;

  const FlightShuttleBuilder({
    Key? key,
    required this.kidCardTransformer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: kidCardTransformer.shadowColor ??
                KidTheme.of(context).buttonTextColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: kidCardTransformer.shadowOffset == null
                ? Offset.zero
                : Offset(
                    sin(4 * pi * kidCardTransformer.shadowOffset!) * 2,
                    cos(6 * pi * kidCardTransformer.shadowOffset!) * 2,
                  ),
          ),
        ],
      ),
    );
  }
}

class CircularRectTween extends Tween<Rect?> {
  CircularRectTween({required Rect? begin, required Rect? end})
      : super(begin: begin, end: end) {}

  @override
  Rect lerp(double t) {
    final left = lerpDouble(begin!.left, end!.left, t)!;
    final right = lerpDouble(begin!.right, end!.right, t)!;
    final top = lerpDouble(begin!.top, end!.top, t)!;
    final bottom = lerpDouble(begin!.bottom, end!.bottom, t)!;
    return Rect.fromLTRB(left, top, right, bottom);
  }
}

Tween<Rect?> createRectTween(Rect? begin, Rect? end) {
  return CircularRectTween(begin: begin, end: end);
}
