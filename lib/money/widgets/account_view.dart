import 'package:camp_app/core/constants/app_colors.dart';
import 'package:camp_app/core/constants/app_fonts.dart';
import 'package:camp_app/core/constants/app_strings.dart';
import 'package:camp_app/core/constants/routes.dart';
import 'package:camp_app/core/models/user.dart';
import 'package:camp_app/core/utils/format.dart';
import 'package:camp_app/core/widgets/button.dart';
import 'package:camp_app/money/money_screen.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  final User account;

  const AccountView({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      shadowColor: const Color(0x33000000),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.balance,
                      style: AppFonts.bold.copyWith(fontSize: 15),
                    ),
                    Text(
                      account.cash.formatMoney(),
                      style: AppFonts.regular.copyWith(
                        fontSize: 32,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ],
                ),
                Text(
                  account.name.split(" ")[1],
                  style: AppFonts.regular.copyWith(
                    fontSize: 28,
                    color: AppColors.darkBlue,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: Row(children: [
                Expanded(
                  child: Button(
                    text: AppStrings.refillAccount,
                    onPressed: () {},
                    bgColor: AppColors.greenLight,
                    textColor: AppColors.blue,
                  ),
                )
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Button(
                      text: AppStrings.operationHistory,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MoneyScreen(childId: account.id),
                          ),
                        );
                      },
                      bgColor: AppColors.violetLight,
                      textColor: AppColors.violet,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
