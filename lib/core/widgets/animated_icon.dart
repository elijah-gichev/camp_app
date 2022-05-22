import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedIcon extends HookWidget {
  final String asset;
  final double size;

  const AnimatedIcon({
    required this.asset,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bounceAnimation = useAnimationController(
      duration: Duration(seconds: 2),
    );
    useAnimation(bounceAnimation);

    bounceAnimation
      ..forward()
      ..repeat();

    return Transform.scale(
      scale: 1 + cos(bounceAnimation.value * 2 * pi) * 0.05,
      child: Image.asset(
        asset,
        height: size,
        width: size,
      ),
    );
  }
}

class BrilliantIcon extends StatelessWidget {
  final double size;

  const BrilliantIcon({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedIcon(
      asset: 'assets/images/diamond.png',
      size: size,
    );
  }
}

class RaitingIcon extends StatelessWidget {
  final double size;
  final int raiting;
  final bool animated;

  const RaitingIcon({
    Key? key,
    required this.size,
    required this.raiting,
    this.animated = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!animated) {
      return Image.asset(
        'assets/images/rating/$raiting.png',
        width: size,
        height: size,
      );
    } else {
      return AnimatedIcon(
        asset: 'assets/images/diamond.png',
        size: size,
      );
    }
  }
}
