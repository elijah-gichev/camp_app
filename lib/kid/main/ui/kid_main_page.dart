import 'package:camp_app/kid/widgets/kid_card.dart';
import 'package:camp_app/kid/widgets/kid_card_active_status.dart';
import 'package:flutter/material.dart';

import '../../widgets/kid_card_button.dart';
import '../../widgets/lid_card_progress_bar.dart';

class KidMainPage extends StatelessWidget {
  const KidMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            KidCard(
              title: "Баланс монет: 1500",
              onTap: () {},
              action: const KidCardButton(
                title: "Потратить",
              ),
            ),
            KidCard(
              title: "Уровень достижений: 5",
              onTap: () {},
              action: const KidCardProgressBar(
                current: 4,
                total: 5,
              ),
            ),
            KidCard(
              title: "1 смена 2022",
              status: const KidCardActiveStatus(
                activeStatus: ActiveStatus.active,
              ),
              subtitle: "Заезд 1-3 июня",
              onTap: () {},
              action: const KidCardButton(
                title: "Потратить",
              ),
            ),
            KidCard(
              title: "Профиль",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
