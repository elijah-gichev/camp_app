import 'package:camp_app/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

import 'kid_card.dart';
import 'kid_card_button.dart';

class KidMoneyBalance extends HookWidget {
  const KidMoneyBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final zRotationController = useAnimationController(
    //   duration: Duration(seconds: 1),
    //   reverseDuration: Duration(seconds: 1),
    // )..reverse();
    // useAnimation(zRotationController);

    // // zRotationController.reverse();
    // // .then((value) => zRotationController..reverse());

    // print(zRotationController.value);

    final width = 30.0;
    final height = 30.0;
    return Expanded(
      flex: 3,
      child: KidCard(
        kidCardTransformer: KidCardTransformer(
          angle: -0.1,
        ),
        title: "Баланс монет: 1500",
        onTap: () {
          Navigator.pushNamed(context, Routes.qrScanner);
        },
        action: const KidCardButton(
          title: "Потратить",
        ),
        // icon: Transform(
        //   transform: Matrix4.identity()
        //     ..setEntry(3, 2, 0.001)
        //     ..rotateY(zRotationController.value * 1),
        //   alignment: Alignment.center,
        //   child: Transform.rotate(
        //     angle: 100,
        //     child: Image.asset(
        //       'assets/ruble.png',
        //       width: width,
        //       height: height,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
