import 'package:camp_app/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onPressed;

  final bool isLoading;

  const LoginButton({
    Key? key,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainButton(
      linearGradient: const LinearGradient(
        colors: [
          Colors.black,
          Colors.tealAccent,
        ],
      ),
      minimumSize: Size(double.infinity, 65.h),
      text: 'Login',
      fontSize: 20.sp,
      onPressed: !isLoading ? onPressed : () {},
      isLoading: isLoading,
    );
  }
}
