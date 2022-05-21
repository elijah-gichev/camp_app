import 'package:camp_app/kid/main/ui/kid_main_page.dart';
import 'package:flutter/material.dart';

class KidCardButton extends StatelessWidget {
  final String title;

  const KidCardButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: KidTheme.of(context).buttonColor,
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: KidTheme.of(context).buttonTextColor,
          ),
        ),
      ),
    );
  }
}
