import 'package:camp_app/kid/widgets/kid_card.dart';
import 'package:camp_app/kid/widgets/kid_card_active_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../widgets/kid_card_button.dart';
import '../../widgets/lid_card_progress_bar.dart';

class KidMainPage extends StatelessWidget {
  KidMainPage({Key? key}) : super(key: key);

  Widget navbar() {
    return Row(
      children: [
        Expanded(
          child: KidCard(
            title: "Баланс кристалов: 200",
            onTap: () {},
            action: const KidCardButton(
              title: "Потратить",
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              KidCard(
                edgeInsets: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 25,
                ),
                title: "Секции",
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              KidCard(
                edgeInsets: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 25,
                ),
                title: "Мои смены",
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget balanceAndProfile() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: KidCard(
            title: "Баланс монет: 1500",
            onTap: () {},
            action: const KidCardButton(
              title: "Потратить",
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: KidCard(
              edgeInsets: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 40,
              ),
              title: "Профиль",
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var children2 = [
      balanceAndProfile(),
      KidCard(
        title: "Уровень достижений: 5",
        onTap: () {},
        action: const KidCardProgressBar(
          current: 4,
          total: 5,
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: KidCard(
          title: "13:15 Обед",
          onTap: () {},
        ),
      ),
      Row(
        children: [
          Expanded(
            child: KidCard(
              title: "1 смена 2022",
              status: const KidCardActiveStatus(
                activeStatus: ActiveStatus.active,
              ),
              subtitle: "Заезд 1-3 июня",
              onTap: () {},
              action: const KidCardButton(
                title: "Смотреть всю активность",
              ),
            ),
          ),
        ],
      ),
      navbar(),
    ];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              children: children2
                  .map(
                    (e) => Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        // body: ListView.separated(
        //   padding: EdgeInsets.only(
        //     top: 30,
        //     bottom: 10,
        //     left: 10,
        //   ),
        //   itemBuilder: (_, index) => Container(child: children2[index]),
        //   separatorBuilder: (_, __) => const SizedBox(
        //     height: 10,
        //   ),
        //   itemCount: children2.length,
        // ),
      ),
    );
  }
}
