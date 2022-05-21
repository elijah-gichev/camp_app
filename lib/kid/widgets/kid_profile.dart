import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'kid_card.dart';

class KidProfile extends HookWidget {
  const KidProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rotationController = useAnimationController(
      duration: Duration(seconds: 15),
    )
      ..forward()
      ..repeat();
    useAnimation(rotationController);

    return Expanded(
      flex: 2,
      child: Center(
        child: KidCard(
          kidCardTransformer: KidCardTransformer(
            angle: rotationController.value * 2 * pi,
          ),
          edgeInsets: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 40,
          ),
          title: "Профиль",
          onTap: () {},
        ),
      ),
    );
  }
}
