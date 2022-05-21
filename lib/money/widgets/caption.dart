import 'package:camp_app/core/constants/app_fonts.dart';
import 'package:flutter/cupertino.dart';

Widget caption(String text) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 16,
      top: 16,
      right: 16,
    ),
    child: Text(
      text,
      style: AppFonts.medium,
    ),
  );
}