import 'package:camp_app/kid/widgets/kid_achivments.dart';
import 'package:flutter/material.dart';
import '../../widgets/crystals.dart';
import '../../widgets/kid_current_activity.dart';
import '../../widgets/kid_profile.dart';
import '../../widgets/lid_money_balance.dart';
import '../../widgets/my_shifts.dart';
import '../../widgets/sections.dart';
import '../../widgets/shift.dart';

class KidMainPage extends StatelessWidget {
  const KidMainPage({Key? key}) : super(key: key);

  Widget navbar() {
    return Row(
      children: [
        const Crystals(),
        Expanded(
          child: Column(
            children: const [
              Sections(),
              SizedBox(
                height: 10,
              ),
              MyShifts(),
            ],
          ),
        ),
      ],
    );
  }

  Widget balanceAndProfile() {
    return Row(
      children: const [
        KidMoneyBalance(),
        SizedBox(
          width: 10,
        ),
        KidProfile(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var cards = [
      balanceAndProfile(),
      const KidAchivments(),
      const CurrentActivity(),
      const Shift(),
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
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          bottom: 17,
                          right: 10,
                        ),
                        child: e,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
