import 'package:flutter/material.dart';

import 'kid_card.dart';
import 'kid_card_button.dart';

class KidMoneyBalance extends StatelessWidget {
  const KidMoneyBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: KidCard(
        kidCardTransformer: KidCardTransformer(
          angle: -0.1,
        ),
        title: "Баланс монет: 1500",
        onTap: () {},
        action: const KidCardButton(
          title: "Потратить",
        ),
      ),
    );
  }
}
