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
      child: KidCard(
        kidCardTransformer: KidCardTransformer(
          angle: -0.03,
        ),
        title: "Баланс кристалов: 200",
        onTap: () {},
        action: const KidCardButton(
          title: "Потратить",
        ),
      ),
    );
  }
}
