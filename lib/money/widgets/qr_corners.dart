import 'dart:math';

import 'package:camp_app/money/widgets/border_corner_painter.dart';
import 'package:flutter/material.dart';

class Corners extends StatelessWidget {
  final int topPadding;

  const Corners({Key? key, required this.topPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final corner = CustomPaint(
      painter: BorderCornerPainter(),
    );

    return Stack(
      children: [
        corner,
        Padding(
          padding: EdgeInsets.only(left: topPadding.toDouble()),
          child: Transform.rotate(
            angle: pi / 2,
            child: corner,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: topPadding.toDouble(),
            top: topPadding.toDouble(),
          ),
          child: Transform.rotate(
            angle: pi,
            child: corner,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: topPadding.toDouble()),
          child: Transform.rotate(
            angle: 3 / 2 * pi,
            child: corner,
          ),
        ),
      ],
    );
  }
}
