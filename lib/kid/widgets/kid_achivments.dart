import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'kid_card.dart';
import 'lid_card_progress_bar.dart';

class KidAchivments extends StatelessWidget {
  const KidAchivments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 5,
        left: 40,
      ),
      child: KidCard(
        kidCardTransformer: KidCardTransformer(
          angle: 0.1,
        ),
        title: "Уровень достижений: 5",
        onTap: () {},
        action: const KidCardProgressBar(
          current: 4,
          total: 5,
        ),
      ),
    );
  }
}
