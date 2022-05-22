import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onPressed;

  const Button({Key? key, required this.text, required this.onPressed, required this.bgColor, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.0.r),
        // boxShadow: const [
        //   BoxShadow(
        //     color: Color.fromRGBO(70, 70, 70, 0.1),
        //     blurRadius: 5,
        //     blurStyle: BlurStyle.outer,
        //     //offset: Offset(0, 0),
        //   ),
        // ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600, color: textColor, fontSize: 15.0),
        ),
      ),
    );
  }
}
