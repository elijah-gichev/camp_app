import 'package:camp_app/core/constants/app_colors.dart';
import 'package:camp_app/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ChildActivity extends StatelessWidget {
  final String activityName;
  final String userName;

  const ChildActivity({Key? key, required this.activityName, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('HH:mm');

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffEDFFF4),
        borderRadius: BorderRadius.circular(16.0.r),
      ),
      height: 70.h,
      width: 0.95.sw,
      child: Center(
        child: Column(
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
                          activityName + ' (' + userName + ')',
                          style: AppFonts.medium.copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Процедура',
                          style: AppFonts.regular.copyWith(
                            fontSize: 12,
                            color: const Color.fromRGBO(22, 22, 22, 0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '3/10',
                      style: AppFonts.semibold.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      formatter.format(DateTime.now()),
                      style: AppFonts.regular.copyWith(fontSize: 12, color: const Color.fromRGBO(22, 22, 22, 0.4)),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
