import 'dart:math';

import 'package:camp_app/kid/widgets/kid_card.dart';
import 'package:camp_app/kid/widgets/kid_card_active_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../widgets/kid_card_button.dart';
import '../../widgets/lid_card_progress_bar.dart';

class KidMainPage extends StatelessWidget {
  const KidMainPage({Key? key}) : super(key: key);

  Widget navbar() {
    return Row(
      children: [
        const _Crystals(),
        Expanded(
          child: Column(
            children: const [
              _Sections(),
              SizedBox(
                height: 10,
              ),
              _MySmens(),
            ],
          ),
        ),
      ],
    );
  }

  Widget balanceAndProfile() {
    return Row(
      children: const [
        _BalanceMoneyWidget(),
        SizedBox(
          width: 10,
        ),
        _ProfileWidget(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var cards = [
      balanceAndProfile(),
      const _Achivments(),
      const _CurrentActivity(),
      const _Smena(),
      navbar(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF9FAFC),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: cards
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 17,
                        right: 10,
                      ),
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _MySmens extends StatelessWidget {
  const _MySmens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KidCard(
      kidCardTransformer: KidCardTransformer(
        angle: 0.05,
      ),
      edgeInsets: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 25,
      ),
      title: "Мои смены",
      onTap: () {},
    );
  }
}

class _Sections extends StatelessWidget {
  const _Sections({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KidCard(
      kidCardTransformer: KidCardTransformer(
        angle: -0.05,
      ),
      edgeInsets: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 25,
      ),
      title: "Секции",
      onTap: () {},
    );
  }
}

class _Crystals extends StatelessWidget {
  const _Crystals({
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

class _Smena extends StatelessWidget {
  const _Smena({
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
            subtitle: "Заезд 1-3 июня",
            onTap: () {},
            action: const KidCardButton(
              title: "Смотреть всю активность",
            ),
          ),
        ),
      ],
    );
  }
}

class _CurrentActivity extends StatelessWidget {
  const _CurrentActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: KidCard(
        title: "13:15 Обед",
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => TestPage()),
          );
        },
      ),
    );
  }
}

class _Achivments extends StatelessWidget {
  const _Achivments({
    Key? key,
  }) : super(key: key);

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

class _ProfileWidget extends HookWidget {
  const _ProfileWidget({
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

class _BalanceMoneyWidget extends StatelessWidget {
  const _BalanceMoneyWidget({
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

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'dinner',
      child: Scaffold(
        backgroundColor: Colors.yellow.withOpacity(0.2),
        body: const Center(
          child: Text("Обед"),
        ),
      ),
    );
  }
}
