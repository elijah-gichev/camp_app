import 'package:camp_app/core/widgets/animated_icon.dart';
import 'package:camp_app/core/constants/routes.dart';
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
            title: "Баланс кристаллов: 200",
            onTap: () {
              Navigator.pushNamed(context, Routes.kidCart);
            },
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

class CrystalsProvider extends StatefulWidget {
  final Widget child;

  const CrystalsProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<CrystalsProvider> createState() => _CrystalsProviderState();
}

class _CrystalsProviderState extends State<CrystalsProvider> {
  int count = 200;

  @override
  Widget build(BuildContext context) {
    return CrystalsInh(
      count: count,
      child: widget.child,
    );
  }
}

class CrystalsInh extends InheritedWidget {
  final int count;

  CrystalsInh({
    Key? key,
    required Widget child,
    required this.count,
  }) : super(key: key, child: child);

  static int of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CrystalsInh>()!.count;
  }

  static void changeToBlackTheme(BuildContext context, int count) {
    final state = context.findAncestorStateOfType<_CrystalsProviderState>()!;
    state.setState(() {
      state.count = state.count + count;
    });
  }

  @override
  bool updateShouldNotify(covariant CrystalsInh oldWidget) {
    return count != oldWidget.count;
  }
}
