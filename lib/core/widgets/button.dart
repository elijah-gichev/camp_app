import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onPressed;

  const Button(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.bgColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: bgColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w600, color: textColor, fontSize: 15.0),
      ),
    );
  }
}
