<<<<<<< HEAD
import 'package:camp_app/core/widgets/animated_icon.dart';
=======
import 'package:camp_app/core/constants/routes.dart';
>>>>>>> 543faf76f7961faa8a73f18e61bfe978712b4128
import 'package:flutter/material.dart';

import 'kid_card.dart';
import 'kid_card_button.dart';

class Crystals extends StatelessWidget {
  const Crystals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          KidCard(
            kidCardTransformer: KidCardTransformer(
              angle: -0.03,
            ),
            title: "Баланс кристалов: 200",
            onTap: () {},
            action: const KidCardButton(
              title: "Потратить",
            ),
          ),
          Positioned(
            right: 0,
            child: BrilliantIcon(size: 50),
          ),
        ],
      ),
    );
  }
}
