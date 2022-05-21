import 'package:camp_app/core/constants/app_colors.dart';
import 'package:camp_app/core/constants/app_fonts.dart';
import 'package:camp_app/core/constants/app_strings.dart';
import 'package:camp_app/core/models/operation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OperationView extends StatelessWidget {
  final Operation operation;
  const OperationView({Key? key, required this.operation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    String value = "";
    final DateFormat formatter = DateFormat('HH:mm');
    String time = formatter.format(operation.created_at);
    if (operation.sum < 0) {
      value = "${operation.sum}";
      color = AppColors.red;
    } else {
      value = "+${operation.sum}";
      color = AppColors.green;
    }
    String title = "";
    String subtitle = "";
    if (operation.sum > 0) {
      title = AppStrings.parent;
      subtitle = AppStrings.refill;
    } else {
      title = operation.shop.title;
      subtitle = operation.shop.category;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: AppColors.iconBg,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: const Icon(
                Icons.ac_unit,
                size: 20,
                color: AppColors.darkBlue,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppFonts.medium.copyWith(fontSize: 14),
                    ),
                    Text(subtitle,
                        style: AppFonts.regular.copyWith(fontSize: 12)),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$value₽',
                  style: AppFonts.semibold.copyWith(
                    fontSize: 14,
                    color: color,
                  ),
                ),
                Text(
                  time,
                  style: AppFonts.regular.copyWith(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
