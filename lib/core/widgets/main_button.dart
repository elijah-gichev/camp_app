import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final LinearGradient linearGradient;
  final Size minimumSize;
  final double fontSize;
  final String text;
  final void Function()? onPressed;

  final Color? textColor;

  final bool _isLoading;

  const MainButton({
    Key? key,
    required this.linearGradient,
    required this.minimumSize,
    required this.text,
    required this.fontSize,
    required this.onPressed,
    this.textColor,
    bool? isLoading,
  })  : _isLoading = isLoading ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: linearGradient,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: minimumSize,
              padding: const EdgeInsets.all(10.0),
              primary: Colors.white,
              textStyle: TextStyle(fontSize: fontSize),
            ),
            onPressed: onPressed,
            child: _isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: TextStyle(color: textColor),
                  ),
          ),
        ],
      ),
    );
  }
}
