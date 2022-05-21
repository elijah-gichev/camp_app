import 'dart:math';
import 'dart:ui';

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
    return Align(
      alignment: Alignment.centerLeft,
      child: Hero(
        tag: 'dinner',
        flightShuttleBuilder: (
          BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext,
        ) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
          );
        },
        child: KidCard(
          title: "13:15 Обед",
          kidCardTransformer: KidCardTransformer(
            shadowOffset: shadowOffseAnimation.value,
            shadowColor: _colorFromValue(shadowColorAnimation.value),
          ),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                reverseTransitionDuration: Duration(milliseconds: 500),
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) => TestPage(),
              ),
            );
          },
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

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'dinner',
      createRectTween: _createRectTween,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: const Center(
          child: Text(
            "Тут скоро появится крутое расписание!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Tween<Rect?> _createRectTween(Rect? begin, Rect? end) {
    return CircularRectTween(begin: begin, end: end);
  }
}
