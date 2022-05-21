import 'package:flutter/material.dart';

import 'kid_card.dart';
import 'kid_card_active_status.dart';
import 'kid_card_button.dart';

class Shift extends StatelessWidget {
  const Shift({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: KidCard(
            kidCardTransformer: KidCardTransformer(
              angle: -0.05,
            ),
            title: "1 смена 2022",
            status: const KidCardActiveStatus(
              activeStatus: ActiveStatus.active,
            ),
            subtitle: "Корпус №3 Отряд №2",
            onTap: () {},
            action: const KidCardButton(
              title: "Смотреть активность",
            ),
          ),
        ),
      ],
    );
  }
}
