import 'package:flutter/material.dart';

import 'kid_card.dart';

class MyShifts extends StatelessWidget {
  const MyShifts({
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
