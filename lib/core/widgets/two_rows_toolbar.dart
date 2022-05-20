import 'package:camp_app/core/constants/app_colors.dart';
import 'package:camp_app/core/constants/app_fonts.dart';
import 'package:camp_app/core/utils/format.dart';
import 'package:flutter/material.dart';

class TwoRowsToolbar extends StatelessWidget {
  final double balance;

  const TwoRowsToolbar({Key? key, required this.balance}) : super(key: key);

  static const statusBarHeight = 36;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(0),
      child: Container(
        height: statusBarHeight + 56,
        decoration: const BoxDecoration(
          color: AppColors.mainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8.0 + statusBarHeight, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Баланс',
                    style: AppFonts.extraBold.copyWith(fontSize: 16),
                  ),
                  Text(
                    balance.formatMoney(),
                    style: AppFonts.regular.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
