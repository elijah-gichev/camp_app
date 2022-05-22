import 'package:camp_app/core/constants/app_colors.dart';
import 'package:camp_app/core/widgets/button.dart';
import 'package:camp_app/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onPressed;

  final bool isLoading;

  final String text;

  const LoginButton({
    Key? key,
    required this.onPressed,
    required this.isLoading,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.95.sw,
      height: 45.h,
      child: Button(
        text: text,
        onPressed: !isLoading ? onPressed! : () {},
        bgColor: AppColors.violetLight,
        textColor: AppColors.violet,
      ),
    );
  }
}
