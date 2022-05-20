import 'package:camp_app/core/constants/app_colors.dart';
import 'package:camp_app/core/constants/app_fonts.dart';
import 'package:camp_app/core/constants/app_strings.dart';
import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/core/utils/date.dart';
import 'package:camp_app/money/bloc/day_entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayOfOperationsItem extends StatelessWidget {
  const DayOfOperationsItem({Key? key, required this.dayEntry})
      : super(key: key);

  final DayEntry dayEntry;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      shadowColor: const Color(0x33000000),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dayEntry.date.formatDate(),
              style: AppFonts.bold.copyWith(fontSize: 12),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: dayEntry.operations.length,
                itemBuilder: (c, i) => operation(dayEntry.operations[i]),
                separatorBuilder: (c, i) => divider,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget operation(Operation operation) {
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

  static const Divider divider = Divider(
    height: 24,
    thickness: .5,
    color: Color(0xFFEFEFEF),
  );
}
