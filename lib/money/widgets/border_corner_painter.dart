import 'package:flutter/material.dart';

class BorderCornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.deepPurpleAccent;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5.0;

    final path = Path();
    path.moveTo(0, 30);
    path.quadraticBezierTo(
      -5,
      -5,
      30,
      0,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
