import 'package:flutter/material.dart';

class KidCardProgressBar extends StatelessWidget {
  final int current;
  final int total;

  const KidCardProgressBar({
    Key? key,
    required this.current,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Color(0xffEDEFFF),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: LayoutBuilder(
          builder: (ctx, cst) => Container(
            height: 32,
            padding: const EdgeInsets.only(right: 100),
            width: cst.maxWidth * (current / total),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Color(0xffAAFF82),
            ),
          ),
        ),
      ),
    );
  }
}
