import 'package:camp_app/core/constants/app_colors.dart';
import 'package:camp_app/core/constants/app_dimens.dart';
import 'package:camp_app/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampAppBar extends StatelessWidget {
  final String text;

  final VoidCallback? onBackPressed;
  final Widget? trailing;

  const CampAppBar({
    Key? key,
    this.trailing,
    required this.text,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: AppDimens.cardRadius),
      elevation: 1,
      margin: const EdgeInsets.all(0),
      child: Container(
        // height: AppDimens.statusBarHeight + 64,
        decoration: const BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: AppDimens.cardRadius,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.0 + AppDimens.statusBarHeight, 20.w, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (onBackPressed != null) ...[
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: const Icon(Icons.arrow_back),
                )
              ],
              Text(
                text,
                style: AppFonts.semibold.copyWith(fontSize: 24),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
